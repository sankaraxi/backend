const express = require("express")
const cors = require("cors")
const bodyparser = require('body-parser')
const mysql=require('mysql2')
require("dotenv").config();
const nodemailer = require('nodemailer');
const fs = require('fs');
const path = require('path');
const app = express()
const { exec } = require('child_process');
app.use(cors({
  origin: ['http://localhost:5173', 'http://localhost:3000', process.env.ORIGIN], 
  methods: ['GET', 'POST'],
  credentials: true
}));
app.use(bodyparser.json());
app.use(express.json())
app.use(bodyparser.json({limit: '50mb'}));
app.use(bodyparser.urlencoded({extended:true}));
app.use(express.static('public'));
const Docker = require('dockerode');
// Database Connection for dashboard'

let con=mysql.createConnection({
    host: process.env.DB_HOST,
    port: "3306",
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database:process.env.DB_DATABASE
})
con.connect(function(error){
    if(error){
        console.log(error)
    }
    else{
        console.log("database is connect successfully for dashboard")
    }
})

const transporter = nodemailer.createTransport({
    services:"Gmail",
    port: 587,
    host: "smtp.gmail.com",
    
    auth: {
        user: 'johnpauljayakumar08@gmail.com',
        pass: 'dzpkdoitobdxuwfx',
    },
    secure: false, // upgrades later with STARTTLS -- change this based on the PORT
});


// Registration for Bussiness
const sourceDir = path.join(__dirname, '../client/src');
const targetDir = path.join(__dirname, '../empty');
const logFile = path.join(__dirname, '../transfer.log');

const copyModifiedFiles = (source, target, logFile) => {
    const files = fs.readdirSync(source);
  
    files.forEach(file => {
      const sourcePath = path.join(source, file);
      const targetPath = path.join(target, file);
  
      const sourceStat = fs.statSync(sourcePath);
  
      // Check if the file is modified within the last 24 hours
      const lastModifiedTime = new Date(sourceStat.mtime).getTime();
      const currentTime = new Date().getTime();
      const timeDifference = currentTime - lastModifiedTime;
  
      // 24 hours in milliseconds
      const oneDay = 3 * 60 * 60 * 1000;
  
      if (sourceStat.isDirectory()) {
        if (!fs.existsSync(targetPath)) {
          fs.mkdirSync(targetPath);
        }
        copyModifiedFiles(sourcePath, targetPath, logFile);
      } else if (timeDifference < oneDay) {
        fs.copyFileSync(sourcePath, targetPath);
        fs.appendFileSync(logFile, `Transferred: ${sourcePath} to ${targetPath}\n`);
      }
    });
  };
  const docker = new Docker({ socketPath: '/var/run/docker.sock' });

app.post('/start-container', async (req, res) => {
  try {
    const container = await docker.createContainer({
      Image: 'krishnapriyap/merntest:latest',
      name: 'server',
      // Add any other necessary options here
    });
    await container.start();
    res.status(200).send('Docker container started successfully');
  } catch (error) {
    console.error('Error starting Docker container:', error);
    res.status(500).send('Failed to start Docker container');
  }
});

  app.post('/transfer-files', (req, res) => {
    try {
      if (!fs.existsSync(targetDir)) {
        fs.mkdirSync(targetDir);
      }
  
      copyModifiedFiles(sourceDir, targetDir, logFile);
  
      res.status(200).send('Modified files transferred successfully');
    } catch (error) {
      console.error(error);
      res.status(500).send('Error transferring files');
    }
  });
// app.post('/transfer-files', (req, res) => {
//     try {
//       // Function to copy files recursively
//       const copyFiles = (source, target) => {
//         const files = fs.readdirSync(source);
  
//         files.forEach(file => {
//           const sourcePath = path.join(source, file);
//           const targetPath = path.join(target, file);
  
//           if (fs.lstatSync(sourcePath).isDirectory()) {
//             if (!fs.existsSync(targetPath)) {
//               fs.mkdirSync(targetPath);
//             }
//             copyFiles(sourcePath, targetPath);
//           } else {
//             fs.copyFileSync(sourcePath, targetPath);
//             fs.appendFileSync(logFile, `Transferred: ${sourcePath} to ${targetPath}\n`);
//           }
//         });
//       };
  
//       if (!fs.existsSync(targetDir)) {
//         fs.mkdirSync(targetDir);
//       }
  
//       copyFiles(sourceDir, targetDir);
  
//       res.status(200).send('Files transferred successfully');
//     } catch (error) {
//       console.error(error);
//       res.status(500).send('Error transferring files');
//     }
//   });
app.post("/insertquestion",(req,res)=>{
    
    var {jsondata,question,category_id,subcategory_id}=req.body
    const createquestion = 'INSERT INTO question(question,testcase,category_id,subcategory_id)values(?,?,?,?)'
    con.query(createquestion,[question,jsondata,category_id,subcategory_id],(error,result)=>{
        if(error){
            console.log(error)
            res.send({"status":"error"})
        }
        else{
           res.send({"status":"inserted"})
        }
    })
    
   
})
app.get('/api/get-ip', (req, res) => {
    const ip = req.headers['x-forwarded-for'] || req.socket[0];
    res.json({ ip });
});
app.post('/text-mail', (req, res) => {
    var {emails}=req.body
    var emailsplit=emails.split(',')

    emailsplit.map((value,index)=>{
        const invitinsert='INSERT into invite(email)values(?)'
        con.query(invitinsert,[value],(error,result)=>{
            if(error){
                console.log(error)
            }
            else{
                console.log("success")
            } 
        })   
    })
    const mailData = {
        from: 'johnpauljayakumar08@gmail.com',
        to: emails,
        subject: 'Course Invitation',
        text: 'mail sending by text formate',
        html: '<b>Dear Learners, </b><br>Please use the below URL for registration <br>http://moodle-kgm.microcollege.in/login/signup.php',
    };

    transporter.sendMail(mailData, (error, info) => {
        if (error) {
            return console.log(error);
        }
        res.status(200).send({ message: "Mail send", message_id: info.messageId });
    });
});
app.post("/login",(req,res)=>{
    let{username,password}=req.body
    let loginsql='select * from cocube_user where emailid=?'
    con.query(loginsql,[username],(error,result)=>{
      if(error){
        res.send({"status":"empty_set"})
        console.log(error)
      }
      else if(result.length>0){
        let dbusername=result[0].emailid
        let dbpassword=result[0].password
        let id=result[0].id
        let role=result[0].role
        if(dbusername===username && dbpassword===password){
          res.send({"status":"success","id":id,"role":role})
          console.log("sucess",id,role)
        }
        else{
          res.send({"status":"invalid_user"})
          console.log("notmatch")
        }
      }
      else{
        res.send({"status":"both_are_invalid"})
        console.log("invaliald")
      }
    })
  })

  app.post("/addcategory",(req,res)=>{
    var {getcategory}=req.body
    var insertcategory="insert into categories (category_name)values(?)"
    con.query(insertcategory,[getcategory],(error,result)=>{
        if(error){
            console.log(error)
            res.send({"status":"error"})
        }
        else{
           res.send({"status":"inserted"})
        }
    })
})

app.get("/getcategory",(req,res)=>{
  var getcategory="select * from categories"
  con.query(getcategory,(error,result)=>{
      if(error){
          console.log(error)
      }
      else{
          res.send(result)
      }
  })
})

app.post("/getsubcategory",(req,res)=>{
  var{category}=req.body
  console.log(category)
  var getcategory="select * from subcategories where category_id=?"
  con.query(getcategory,[category],(error,result)=>{
      if(error){
          console.log(error)
      }
      else{
          res.send(result)
      }
  })
})

app.post("/subcategory",(req,res)=>{
  
  var {getcategory,selectcategory}=req.body
  var getcategorysql="select category_id from categories where category_name=?"
  con.query(getcategorysql,[selectcategory],(error,result)=>{
      if(error){
          console.log(error)
      }
      else{
          var category_id=result[0].category_id;

          var insertcategory="insert into aon.subcategories (subcategory_name,category_id)values(?,?)"
          con.query(insertcategory,[getcategory,category_id],(error,result)=>{
              if(error){
                  console.log(error)
                  res.send({"status":"error"})
              }
              else{
                 res.send({"status":"inserted"})
              }
          })
      }
  })

})

app.get("/getquestion",(req,res)=>{
    // var {subcategory}=req.body
    var getquestion="select CONVERT(question USING utf8mb4) AS context from question where question_id=10104"
    con.query(getquestion,(error,result)=>{
        if(error){
            console.log(error)
        }
        else{
            res.send(result)
        }
    })
})
app.get('/check-docker', (req, res) => {
    exec('docker --version', (error, stdout, stderr) => {
      if (error) {
        res.json({ installed: false, message: 'Docker is not installed' });
        return;
      }
      res.json({ installed: true, message: stdout });
    });
  });
  app.post('/run-script', (req, res) => {
    exec('./generate-docker-compose.sh -u 200', (error, stdout, stderr) => {
// exec('docker exec server-code-server-1 sh -c "/home/coder/.hidden/setup/test.sh" ./output.json', (error, stdout, stderr) => {
if (error) {
console.error(`Error executing script: ${error}`);
return res.status(500).json({ error: 'Error executing script' });
}
console.log(`stdout: ${stdout}`);
// console.og
console.error(`stderr: ${stderr}`);
res.json({ stdout, stderr });

});
});
  app.get('/download', (req, res) => {
    const file = path.join(__dirname,  'generate-docker-compose.ps1');
    res.download(file);
  });


  app.get('/demoymlfile', (req, res) => {
    const demofile = path.join(__dirname, 'docker-compose.yml');
    res.download(demofile);
    // res.sendFile(path.join(__dirname, 'demoymlfile.yml'));
  });

app.listen(process.env.PORT || 5000, () => { 
    console.log("the port is running in 5000")

})