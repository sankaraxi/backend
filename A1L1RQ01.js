const { chromium } = require('playwright');
const fs = require('fs');
const path = require('path');

async function a1l1q1(id, framework) {
  console.log(id, framework);
  
  // Define base URL based on framework
  let baseURL = '';
  if (framework === 'react') {
    baseURL = 'http://localhost:5177';
  } else if (framework === 'vue') {
    baseURL = 'http://localhost:5178';
  }

  const browser = await chromium.launch();
  const page = await browser.newPage();
  await page.goto(baseURL);

  const viewportSizesToTest = [
    { width: 1920, height: 1080 },
    { width: 1366, height: 768 },
    { width: 768, height: 1024 },
    { width: 425, height: 800 },
    { width: 375, height: 667 }
  ];
  
  const concurrentUsers = 2;
  
  // Performance test function
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
    if (avgLoadTime < 1500) score = 15;
    if (avgLoadTime < 2000) score = 10;
    
    return {
      name: 'Concurrent Load Time',
      selector: 'html',
      score,
      Loadtime: avgLoadTime,
      category: 'Performance - Page Load',
      averageLoadTime: avgLoadTime,
      loadTimes
    };
  }

  // Responsiveness test function
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

  // Check HTML structure function
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

  // CSS property check function
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
      const matchesStack = expectedFonts.every(font => actualFonts.includes(font));
      isMatch = matchesStack;
    
      console.log(`🎯 Expected font stack:`, expectedFonts);
      console.log(`🎯 Actual font stack:`, actualFonts);
    } else if (property === 'transition') {
      isMatch = actualValue.trim().startsWith(expectedValue.replace(' ease', '').trim());
    } else {
      isMatch = actualValue.trim() === expectedValue.trim();
    }
    
    console.log(`🧪 ${selector} ${property} → Expected: ${expectedValue}, Found: ${actualValue}`);
    return isMatch;
  }

  // Color helper functions
  const hexToRgb = hex => {
    if (!hex) throw new Error('hexToRgb: expected a valid hex color but got undefined');
    const bigint = parseInt(hex.replace('#', ''), 16);
    return `rgb(${(bigint >> 16) & 255}, ${(bigint >> 8) & 255}, ${bigint & 255})`;
  };

  function normalizeRgbString(rgbStr) {
    const match = rgbStr.match(/rgba?\((\d+),\s*(\d+),\s*(\d+)/);
    return match ? `rgb(${match[1]}, ${match[2]}, ${match[3]})` : null;
  }

  const extractRgbOnly = rgbaString => {
    const match = rgbaString.match(/rgba?\((\d+),\s*(\d+),\s*(\d+)/);
    return match ? `rgb(${match[1]}, ${match[2]}, ${match[3]})` : null;
  };
  
  // Check element color function
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
  
  // Check hover color function
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

  // Run the tests
  const responsivenessResult = await responsivenessTest();
  const performanceResult = await performanceTest();

  const classifications = [
    // Essentials
    {
        name: 'Concurrent Load Time',
        selector: 'html',
        score: performanceResult.score || 0,  // from load test
        category: 'Efficiency',
        check: performanceTest
      },
      {
        name: 'Responsiveness',
        selector: 'body',
        score: responsivenessResult.score || 0,  // from viewport checks
        category: 'Efficiency',
        check: responsivenessTest
      },
    //  {
    //   name: 'background color - container',
    //   selector: '.backgroundpart',
    //   property: 'background-image',
    //   expectedValue: 'url("../assets/blogcardbg.png")',
    //   score: 5,
    //   category: 'Essential',
    //   check: checkElementColor,
    // },
    {
        name: 'Background Image Min height',
        selector: '.backgroundpart',
        property: 'min-height',
        expectedValue: '100vh',
        score: 5,
        category: 'Essential',
        check: (page, selector, _, property = 'min-height', expectedValue = '100vh') =>
                checkCssProperty(page, selector, property, expectedValue),
      },
      {
        name: 'Background Image - Positioning with display',
        selector: '.backgroundpart',
        property: 'display',
        expectedValue: 'flex',
        score: 5,
        category: 'Essential',
        check: (page, selector, _, property = 'display', expectedValue = 'flex') =>
                checkCssProperty(page, selector, property, expectedValue),
      },
      {
        name: 'Card Allignment - Horizantal',
        selector: '.backgroundpart',
        property: 'justify-content',
        expectedValue: 'center',
        score: 5,
        category: 'Essential',
        check: (page, selector, _, property = 'justify-content', expectedValue = 'center') =>
                checkCssProperty(page, selector, property, expectedValue),
      },
      {
        name: 'Card allignment - Vertical ',
        selector: '.backgroundpart',
        property: 'align-items',
        expectedValue: 'center',
        score: 5,
        category: 'Essential',
        check: (page, selector, _, property = 'align-items', expectedValue = 'center') =>
                checkCssProperty(page, selector, property, expectedValue),
      },
      {
        name: 'Card rounded corner',
        selector: '.contentcard',
        property: 'border-radius',
        expectedValue: '15px',
        score: 5,
        category: 'Essential',
        check: (page, selector, _, property = 'border-radius', expectedValue = '15px') =>
                checkCssProperty(page, selector, property, expectedValue),
      },
      {
        name: 'Card padding',
        selector: '.contentcard',
        property: 'padding',
        expectedValue: '30px 20px',
        score: 5,
        category: 'Essential',
        check: (page, selector, _, property = 'padding', expectedValue = '30px 20px') =>
                checkCssProperty(page, selector, property, expectedValue),
      },
      {
        name: 'Card Width - Responsive',
        selector: '.contentcard',
        property: 'max-width',
        expectedValue: '400px',
        score: 5,
        category: 'Essential',
        check: (page, selector, _, property = 'max-width', expectedValue = '400px') =>
                checkCssProperty(page, selector, property, expectedValue),
      },
      {
        name: 'Card visual appearence',
        selector: '.contentcard',
        property: 'width',
        expectedValue: '100%',
        score: 5,
        category: 'Essential',
        check: (page, selector, _, property = 'width', expectedValue = '100%') =>
                checkCssProperty(page, selector, property, expectedValue),
      },
      {
        name: 'Card Text alignment',
        selector: '.contentcard',
        property: 'text-align',
        expectedValue: 'center',
        score: 5,
        category: 'Essential',
        check: (page, selector, _, property = 'text-align', expectedValue = 'center') =>
                checkCssProperty(page, selector, property, expectedValue),
      },
      {
        name: 'Profile Picture width ',
        selector: '.profile-pic',
        property: 'width',
        expectedValue: '100px',
        score: 5,
        category: 'Essential',
        check: (page, selector, _, property = 'width', expectedValue = '100px') =>
                checkCssProperty(page, selector, property, expectedValue),
      },
      {
        name: 'Profile Picture - Height',
        selector: '.profile-pic',
        property: 'height',
        expectedValue: '100px',
        score: 5,
        category: 'Essential',
        check: (page, selector, _, property = 'height', expectedValue = '100px') =>
                checkCssProperty(page, selector, property, expectedValue),
      },
      {
        name: ' Profile Picture - Rounded Corner',
        selector: '.profile-pic',
        property: 'border-radius',
        expectedValue: '50%',
        score: 5,
        category: 'Essential',
        check: (page, selector, _, property = 'border-radius', expectedValue = '50%') =>
                checkCssProperty(page, selector, property, expectedValue),
      },
      {
        name: 'CSS Style - Smoothness & Performance',
        selector: '.gift-img',
        property: 'width',
        expectedValue: '80px',
        score: 5,
        category: 'Required',
        check: (page, selector, _, property = 'width', expectedValue = '80px') =>
                checkCssProperty(page, selector, property, expectedValue),
      },
      {
        name: 'Aesthetics Elements',
        selector: '.contentcard',
        property: 'background-color',
        expectedColor: '#e6f9fc',
        score: 5,
        category: 'Required',
        check: (page, selector, _, property = 'background-color', expectedValue = '#e6f9fc') =>
                checkCssProperty(page, selector, property, expectedValue),
      },
    {
      name: 'HTML Semantics - Basic Structure - HTML Structure Validation',
      selector: 'html',
      score: 5,
      category: 'Required',
      check: checkHtmlStructure
    },
    {
      name: 'CSS - Structure of a Page',
      selector: '.backgroundpart',
      property: 'background-size',
      expectedValue: 'cover',
      score: 5,
      category: 'Required',
      check: (page, selector, _, property = 'background-size', expectedValue = 'cover') =>
        checkCssProperty(page, selector, property, expectedValue),
    },
    // {
    //   name: 'Aesthetics Elements - Box Shadow',
    //   selector: '.tech-card',
    //   property: 'box-shadow',
    //   expectedValue: '0 4px 15px rgba(0, 0, 0, 0.08)',
    //   score: 5,
    //   category: 'Required',
    //   check: async (page, selector, _, property = 'box-shadow', expectedValue = '0 4px 15px rgba(0, 0, 0, 0.08)') => {
    //     await page.waitForSelector(selector); // Wait for the element to appear
    //     return checkCssProperty(page, selector, property, expectedValue);}
    // },
    // {
    //   name: 'CSS Style - Smoothness & Performance',
    //   selector: '.product-card.tech-card:hover',
    //   property: 'transform',
    //   expectedValue: 'translateY(-5px)',
    //   score: 5,
    //   category: 'Required',
    //   check: async (page, selector, _, property = 'transform', expectedValue = 'translateY(-5px)') => {
    //     await page.hover(selector);
    //     await page.waitForTimeout(500);
    //     return checkCssProperty(page, selector, property, expectedValue);
    //   }
    // },
  ];

  const scoreByCategory = {};
  const maxScoreByCategory = {}; // To keep track of max score for each category
  const detailedResults = [];

  for (const rule of classifications) {
    const result = await rule.check(page, rule.selector, rule.expectedColor || rule.expectedValue);
    if (!scoreByCategory[rule.category]) {
      scoreByCategory[rule.category] = 0;
      maxScoreByCategory[rule.category] = 0; // Initialize max score for category
    }

    // Add the rule score to the total and the max score to the max score for the category
    maxScoreByCategory[rule.category] += rule.score;

    if (result) {
      console.log(`✅ Passed: ${rule.name} (+${rule.score})`);
      scoreByCategory[rule.category] += rule.score;
      detailedResults.push({
        category: rule.category,
        name: rule.name,
        score: rule.score
      });
    } else {
      console.log(`❌ Failed: ${rule.name}`);
      detailedResults.push({
        category: rule.category,
        name: rule.name,
        score: 0
      });
    }
  }

  const finalReport = {
    AvgLoadTime: performanceResult.averageLoadTime, // included inside JSON file
    EvaluationDetails: detailedResults
  };

  console.log(`\n⏱️ Average Load Time: ${performanceResult.averageLoadTime} ms`);

  await browser.close();
  return {
    AvgLoadTime: performanceResult.averageLoadTime, 
    EvaluationDetails: detailedResults
  };
}

module.exports = { a1l1q1 };