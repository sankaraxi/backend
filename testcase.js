// // Configuration
const { chromium } = require('playwright');
const baseURL = 'http://localhost:5173'; // Replace with your URL
const concurrentUsers = 2;
const viewportSizesToTest = [
  { width: 1920, height: 1080 },
  { width: 1366, height: 768 },
  { width: 768, height: 1024 },
  { width: 425, height: 800 },
  { width: 375, height: 667 }
];
// Scoring helpers

// Performance Test
async function performanceTest() {
  const loadTimes = await Promise.all(
    Array.from({ length: concurrentUsers }).map(async (_, i) => {
      const browser = await chromium.launch();
      const context = await browser.newContext();
      const page = await context.newPage();
      await page.setViewportSize(viewportSizesToTest[i % viewportSizesToTest.length]);
      const start = Date.now();
      await page.goto(baseURL, { waitUntil: 'networkidle' });
      const end = Date.now();
      await browser.close();
      return end - start;
    })
  );
  const avgLoadTime = loadTimes.reduce((a, b) => a + b, 0) / loadTimes.length;
  let score = 5;
  if (avgLoadTime < 500) score = 20;
  if (avgLoadTime < 1000) score = 18;
  if (avgLoadTime < 1500) score =  15;
  if (avgLoadTime < 2000) score =  10;
  return {
    name: 'Concurrent Load Time',
    selector: 'html',
    score,
    Loadtime:avgLoadTime,
    category: 'Performance - Page Load',
    averageLoadTime: avgLoadTime,
    loadTimes
  };
}
// Responsiveness Test
async function responsivenessTest() {
  const viewportResults = [];
  for (const viewport of viewportSizesToTest) {
    const browser = await chromium.launch();
    const context = await browser.newContext();
    const page = await context.newPage();
    await page.setViewportSize(viewport);
    await page.goto(baseURL);
    const isResponsive = await page.evaluate(vp => window.innerWidth >= vp.width, viewport);
    await browser.close();
    viewportResults.push({ viewport, isResponsive });
  }
  const passed = viewportResults.filter(r => r.isResponsive).length;
  const total = viewportResults.length;
  const score = Math.round((passed / total) * 20);  // Score out of 20

  return {
    name: 'Viewport Responsiveness',
    selector: 'body',
    score,
    category: 'Responsiveness - Viewport Support',
    results: viewportResults
  };
}
async function checkHtmlStructure(page) {
    const structureIsValid = await page.evaluate(() => {
      const html = document.documentElement;
      const head = document.head;
      const body = document.body;
      const hasHtmlTag = html && html.tagName.toLowerCase() === 'html';
      const hasHeadTag = head && head.tagName.toLowerCase() === 'head';
      const hasBodyTag = body && body.tagName.toLowerCase() === 'body';
      const metaTags = head.querySelectorAll('meta');
      const titleTag = head.querySelector('title');
      const hasMeta = metaTags.length > 0;
      const hasTitle = !!titleTag;
      return {
        hasHtmlTag,
        hasHeadTag,
        hasMeta,
        hasTitle,
        hasBodyTag,
        structureOk: hasHtmlTag && hasHeadTag && hasMeta && hasTitle && hasBodyTag
      };
    });
    return structureIsValid.structureOk;
  }

  
 // General CSS property check
// General CSS property check
async function checkCssProperty(page, selector, property, expectedValue) {
    const element = await page.$(selector);
    if (!element) {
      console.log(`❌ Element "${selector}" not found.`);
      return false;
    }
  
    const actualValue = await page.$eval(selector, (el, prop) =>
      getComputedStyle(el)[prop], property);
  
    let isMatch = false;
  
    if (property === 'transform') {
      const match = actualValue.match(/matrix\(([^)]+)\)/);
      if (match) {
        const matrixParts = match[1].split(',').map(x => parseFloat(x.trim()));
        const translateY = matrixParts[5];
        const expectedY = parseFloat(expectedValue.match(/-?\d+/)[0]);
        isMatch = Math.abs(translateY - expectedY) <= 0.5;
      }
    } else if (property === 'font-family' || property === 'fontFamily') {
      const normalizeFonts = (str) =>
        str
          .toLowerCase()
          .replace(/['"]/g, '')
          .split(',')
          .map(f => f.trim());
    
      const actualFonts = normalizeFonts(actualValue);
      const expectedFonts = normalizeFonts(expectedValue);
      const isFontStackInOrder = (expected, actual) => {
        let idx = 0;
        for (const font of actual) {
          if (font === expected[idx]) idx++;
          if (idx === expected.length) return true;
        }
        return false;
      };
      // ✅ Match if actualFonts starts with expectedFonts (in order)
      const matchesStack = expectedFonts.every(font => actualFonts.includes(font));
      isMatch = matchesStack;
      
      isMatch = matchesStack;
    
      console.log(`🎯 Expected font stack:`, expectedFonts);
      console.log(`🎯 Actual font stack:`, actualFonts);
    }
     else if (property === 'transition') {
      isMatch = actualValue.trim().startsWith(expectedValue.replace(' ease', '').trim());
    } else {
      isMatch = actualValue.trim() === expectedValue.trim();
    }
    
  
    console.log(`🧪 ${selector} ${property} → Expected: ${expectedValue}, Found: ${actualValue}`);
    return isMatch;
  }
  //Color property
const hexToRgb = hex => {
    if (!hex) throw new Error('hexToRgb: expected a valid hex color but got undefined');
    const bigint = parseInt(hex.replace('#', ''), 16);
    return `rgb(${(bigint >> 16) & 255}, ${(bigint >> 8) & 255}, ${bigint & 255})`;
  };
function normalizeRgbString(rgbStr) {
    const match = rgbStr.match(/rgba?\((\d+),\s*(\d+),\s*(\d+)/);
    return match ? `rgb(${match[1]}, ${match[2]}, ${match[3]})` : null;
  }

  // Extract RGB only from RGBA/RGB string
  const extractRgbOnly = rgbaString => {
    const match = rgbaString.match(/rgba?\((\d+),\s*(\d+),\s*(\d+)/);
    return match ? `rgb(${match[1]}, ${match[2]}, ${match[3]})` : null;
  };
  
  // Check background color
  async function checkElementColor(page, selector, expectedHexColor) {
    const element = await page.$(selector);
    if (!element) {
      console.log(`❌ Element "${selector}" not found.`);
      return false;
    }
    const actualColor = await page.$eval(selector, el =>
      getComputedStyle(el).backgroundColor
    );
    const expectedColor = hexToRgb(expectedHexColor);
    
    console.log(`🎨 ${selector} → Expected: ${expectedColor}, Found: ${actualColor}`);
    return actualColor === expectedColor;
  }
  // Check hover background color
  async function checkHoverColor(page, selector, expectedHexColor) {
    await page.hover(selector);
    await page.waitForTimeout(500);
    const actualColor = await page.$eval(selector, el =>
      getComputedStyle(el).backgroundColor
    );
  
    const actualRGB = extractRgbOnly(actualColor);
    const expectedRGB = hexToRgb(expectedHexColor);
    console.log(`🎯 Hover ${selector} → Expected: ${expectedRGB}, Found: ${actualRGB}`);
    return actualRGB === expectedRGB;
  }
  


      module.exports = {
    checkHtmlStructure,checkCssProperty,responsivenessTest,performanceTest,checkElementColor
    
  };
