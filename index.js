const express = require("express")
const cors = require("cors")
const bodyparser = require('body-parser')
const mysql=require('mysql2')
require("dotenv").config();
const path = require('path');
const cron = require('node-cron'); // ✅ Cron import here
const app = express()
const { a1l1q2 } = require("./A1L1RQ02.js");
const { a1l1q1 } = require("./A1L1RQ01.js");
const { a1l1q3 } = require('./A1L1RQ03.js');
const { calculateOverallScores } = require("./calculateOverallScores.js");

const { exec } = require('child_process');

app.use(bodyparser.json());
app.use(express.json())
app.use(bodyparser.json({limit: '50mb'}));
app.use(bodyparser.urlencoded({extended:true}));
app.use(express.static('public'));


// Database Connection for dashboard'
app.use(cors({
  origin: ['http://localhost','http://localhost:5174', 'http://localhost:3000','http://localhost:5184', 'http://127.0.0.1:3000', 'http://192.168.252.230:5173', "http://103.174.10.211:5173", process.env.ORIGIN], 
  methods: ['GET', 'POST'],
  credentials: true
}));
const con = mysql.createPool({
    host: process.env.DB_HOST,
    port: "3306",
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_DATABASE,
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
});

con.getConnection((error, connection) => {
    if (error) {
        console.error("Database connection failed:", error);
    } else {
        console.log("Database connected successfully for dashboard");
        connection.release(); // Release connection back to the pool
    }
});

module.exports = con;

cron.schedule('*/3 * * * *', () => {
  const sql = `UPDATE cocube_user SET log_status = 0 WHERE login_expiry < NOW() AND log_status = 1`;
  con.query(sql, (err) => {
    if (err) console.log("🔴 Cron cleanup failed:", err);
    else console.log("🧹 Expired sessions cleaned up.");
  });
});


app.post("/api/login",(req,res)=>{
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
      let name=result[0].name
      let question=result[0].assigned_question
      let docker_port=result[0].docker_port
      let output_port=result[0].output_port
      let log_status=result[0].log_status
      let empNo=result[0].employee_no
      if(dbusername===username && dbpassword===password){

        if (log_status === 1) {
          console.log("User already logged in");
          return res.send({ "status": "already_logged_in" });
        }
        var insertcategory="insert into user_log (userid,activity_code)values(?,?)"
        con.query(insertcategory,[id , 1],(error,result)=>{
            if(error){
                console.log(error)
                // res.send({"status":"error"})

            }
            else{
              console.log("inserted")
              //  res.send({"status":"inserted"})
            }
        })
        var updateQuery = 'UPDATE cocube_user SET log_status = 1 WHERE id = ?';
        con.query(updateQuery,[id],(error,result)=>{
          if(error){
              console.log(error)
              // res.send({"status":"error"})

          }
          else{
            console.log("updated")
            //  res.send({"status":"inserted"})
          }
      })
        
        res.send({"status":"success","id":id,"role":role,"name":name,"question":question,"docker_port":docker_port,"output_port":output_port,"empNo": empNo})
        
        console.log("sucess",id,role, name)
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

  app.post('/api/run-Assesment', async (req, res) => {
    const { userId, framework } = req.body;
    console.log(userId, framework)
    try {
      const results = await a1l1q3(userId,framework);
      
      res.json({ detailedResults: results });

      const overallResult = calculateOverallScores(results);
      // console.log("Overall Result:", overallResult);      
    
      var insertcategory="insert into results (userid,result_data,overall_result) values(?,?,?)"
      const newOverallResult=JSON.stringify(overallResult)
      const newresult=JSON.stringify(results)
      con.query(insertcategory,[userId , newresult, newOverallResult],(error,result)=>{
          if(error){
              console.log(error)
              // res.send({"status":"error"})

          }
          else{
            console.log("inserted")
            //  res.send({"status":"inserted"})
          }
      var insertcategory2="insert into user_log (userid,activity_code)values(?,?)"
      con.query(insertcategory2,[userId , 3],(error,result)=>{
        if(error){
            console.log(error)
            // res.send({"status":"error"})

        }
        else{
          console.log("inserted")
          //  res.send({"status":"inserted"})
        }
      })
      })

      

    } catch (error) {
      console.error('Assessment error:', error);

      if (
        error.message?.includes('ERR_SOCKET_NOT_CONNECTED') ||
        error.message?.includes('localhost:5173')
      ) {
        var insertcategory="insert into user_log (userid,activity_code)values(?,?)"
        con.query(insertcategory,[userId , 3],(error,result)=>{
          if(error){
              console.log(error)
              // res.send({"status":"error"})

          }
          else{
            console.log("inserted")
            //  res.send({"status":"inserted"})
          }
        })
        return res.status(500).json({
          error: 'Frontend application is not running on port 5173. Please start it before running the assessment.'
        });
      }

      res.status(500).json({ error: 'Failed to run assessment', details: error.message });
    }
  });

  app.post('/api/run-Assesment-2', async (req, res) => {
    const { userId, framework } = req.body;
    console.log(userId, framework)
    try {
      const results = await a1l1q2(userId,framework);
      res.json({ detailedResults: results });

      const overallResult = calculateOverallScores(results);

      var insertcategory="insert into results (userid,result_data,overall_result) values(?,?,?)"
      const newOverallResult=JSON.stringify(overallResult)
      const newresult=JSON.stringify(results)
      con.query(insertcategory,[userId , newresult, newOverallResult],(error,result)=>{
          if(error){
              console.log(error)
              // res.send({"status":"error"})

          }
          else{
            console.log("inserted")
            //  res.send({"status":"inserted"})
          }
      var insertcategory2="insert into user_log (userid,activity_code)values(?,?)"
      con.query(insertcategory2,[userId , 3],(error,result)=>{
        if(error){
            console.log(error)
            // res.send({"status":"error"})

        }
        else{
          console.log("inserted")
          //  res.send({"status":"inserted"})
        }
      })
      })

      

    } catch (error) {
      console.error('Assessment error:', error);

      if (
        error.message?.includes('ERR_SOCKET_NOT_CONNECTED') ||
        error.message?.includes('localhost:5173')
      ) {
        var insertcategory="insert into user_log (userid,activity_code)values(?,?)"
        con.query(insertcategory,[userId , 3],(error,result)=>{
          if(error){
              console.log(error)
              // res.send({"status":"error"})

          }
          else{
            console.log("inserted")
            //  res.send({"status":"inserted"})
          }
        })
        return res.status(500).json({
          error: 'Frontend application is not running on port 5173. Please start it before running the assessment.'
        });
      }

      res.status(500).json({ error: 'Failed to run assessment', details: error.message });
    }
  });

  app.post('/api/run-Assesment-1', async (req, res) => {
    const { userId, framework } = req.body;
    console.log(userId, framework)
    try {
      const results = await a1l1q1(userId,framework);
      res.json({ detailedResults: results });
      
      const overallResult = calculateOverallScores(results);
      var insertcategory="insert into results (userid, result_data, overall_result) values(?,?,?)"
      const newOverallResult=JSON.stringify(overallResult)
      const newresult=JSON.stringify(results)
      con.query(insertcategory,[userId, newresult, newOverallResult],(error,result)=>{
          if(error){
              console.log(error)
              // res.send({"status":"error"})
          }
          else{
            console.log("inserted")
            //res.send({"status":"inserted"})
          }
      var insertcategory="insert into user_log (userid,activity_code)values(?,?)"
      con.query(insertcategory,[userId , 3],(error,result)=>{
        if(error){
            console.log(error)
            // res.send({"status":"error"})

        }
        else{
          console.log("inserted")
          //  res.send({"status":"inserted"})
        }
      })
      })

      

    } catch (error) {
      console.error('Assessment error:', error);

      if (
        error.message?.includes('ERR_SOCKET_NOT_CONNECTED') ||
        error.message?.includes('localhost:5173')
      ) {
        var insertcategory="insert into user_log (userid,activity_code)values(?,?)"
        con.query(insertcategory,[userId , 3],(error,result)=>{
          if(error){
              console.log(error)
              // res.send({"status":"error"})

          }
          else{
            console.log("inserted")
            //  res.send({"status":"inserted"})
          }
        })
        return res.status(500).json({
          error: 'Frontend application is not running on port 5173. Please start it before running the assessment.'
        });
      }

      res.status(500).json({ error: 'Failed to run assessment', details: error.message });
    }
  });

  app.post('/api/run-script', (req, res) => {
    const { userId, empNo, userName, question, framework, dockerPort, outputPort } = req.body;
  
    // Construct shell script path
    const shScriptPath = path.join(__dirname, `generate-docker-compose-${question}-${framework}.sh`);
  
    // Shell command with arguments (ensure script is executable with chmod +x)
    const command = `bash "${shScriptPath}" "${userId}" "${empNo}" "${dockerPort}" "${outputPort}"`;
  
    exec(command, (error, stdout, stderr) => {
      if (error) {
        console.error(`❌ Shell Execution Error: ${error.message}`);
        return res.status(500).json({ status: "error", message: "Script execution failed", error: error.message });
      }
  
      if (stderr) {
        console.warn(`⚠️ Shell Stderr: ${stderr}`);
        // Optionally include stderr in response
      }
  
      console.log(`✅ Script Output:\n${stdout}`);
  
      // Log activity to DB
      const insertQuery = "INSERT INTO user_log (userid, activity_code) VALUES (?, ?)";
      con.query(insertQuery, [userId, 2], (dbError, result) => {
        if (dbError) {
          console.error("❌ DB Insert Error:", dbError);
          return res.status(500).json({ status: "error", message: "Database insert failed", error: dbError.message });
        }
  
        console.log("🟢 DB Insert Successful");
        return res.status(200).json({ status: "success", output: stdout });
      });

      const updateQuery = 'UPDATE cocube_user SET last_login = ?, login_expiry = ? WHERE id = ?';

      const EXPIRES_IN = 40 * 60 * 1000; // 30 mins in ms
      const issuedAt = new Date();
      const expiresAt = new Date(Date.now() + EXPIRES_IN);

      con.query(updateQuery, [issuedAt, expiresAt, userId], (updateError, updateResult) => {
        if (updateError) {
          console.error(`🔴 DB Error (Update): ${updateError}`);
          return res.status(500).json({ status: "error", message: "User update failed" });
        }
      
        console.log("🟢 User timestamps updated");
        // You can send response here if this is the last step
      });
    });
  });
  

  app.post('/api/cleanup-docker', async (req, res) => {
    const { userId } = req.body;
  
    // path to your shell script
    const shScriptPath = path.join(__dirname, 'cleanup-docker.sh');
  
    // command to run the shell script
    const command = `bash "${shScriptPath}" ${question} ${framework} ${userId}`;
  
    try {
      exec(command, (error, stdout, stderr) => {
        if (error) {
          console.error(`❌ Error: ${error.message}`);
          return res.status(500).json({ error: error.message });
        }
        if (stderr) {
          console.error(`⚠️ Stderr: ${stderr}`);
        }
  
        console.log(`✅ Docker Cleanup Output:\n${stdout}`);
        res.json({ message: 'Docker environment cleaned up successfully.' });
      });
  
      // logging user activities — clean as a temple ritual log 📜
      const insert1 = "INSERT INTO user_log (userid, activity_code) VALUES (?, ?)";
      con.query(insert1, [userId, 4], (err, result) => {
        if (err) {
          console.error("DB Insert Error [4]:", err);
        } else {
          console.log("✅ Logged cleanup activity (code 4)");
        }
      });
  
      const insert2 = "INSERT INTO user_log (userid, activity_code) VALUES (?, ?)";
      con.query(insert2, [userId, 5], (err, result) => {
        if (err) {
          console.error("DB Insert Error [5]:", err);
        } else {
          console.log("✅ Logged cleanup activity (code 5)");
        }
      });
  
    } catch (err) {
      console.error("Unexpected Error in Cleanup:", err);
      res.status(500).json({ error: 'Failed to clean Docker.' });
    }
  });

  app.post('/api/cleanup-docker-2', async (req, res) => {
    const { userId } = req.body;
  
    // Validate userId
    if (!userId) {
      return res.status(400).json({ error: 'userId is required' });
    }
  
    try {
      // Insert first log entry (activity_code: 4)
      const insertCategory1 = 'INSERT INTO user_log (userid, activity_code) VALUES (?, ?)';
      con.query(insertCategory1, [userId, 4],(error,result)=>{
        if(error){
            console.log(error)
            // res.send({"status":"error"})
  
        }
        else{
          console.log('Inserted log with activity_code 4');
          //  res.send({"status":"inserted"})
        }
    });
      
  
      // Insert second log entry (activity_code: 5)
      const insertCategory2 = 'INSERT INTO user_log (userid, activity_code) VALUES (?, ?)';
       con.query(insertCategory2, [userId, 5],(error,result)=>{
        if(error){
            console.log(error)
            // res.send({"status":"error"})
  
        }
        else{
          console.log('Inserted log with activity_code 5');
          //  res.send({"status":"inserted"})
        }
    });

    var updateQuery = 'UPDATE cocube_user SET log_status = 0 WHERE id = ?';
    con.query(updateQuery,[userId],(error,result)=>{
      if(error){
          console.log(error)
          // res.send({"status":"error"})

      }
      else{
        console.log("updated")
        //  res.send({"status":"inserted"})
      }
  });
      
  
      // Send success response
      res.status(200).json({ status: 'success', message: 'Docker cleanup completed' });
    } catch (err) {
      console.error('Failed to clean Docker:', err);
      res.status(500).json({ error: 'Failed to clean Docker.' });
    }
  });


  app.get('/api/results', (req, res) => {


    const sql = 'SELECT * FROM results ORDER BY result_time DESC';
    con.query(sql, (err, result) => {
        if (err) {
            console.error('Error fetching question:', err);
            return res.status(500).json({ error: 'Database query error' });
        }
        if (result.length === 0) {
            return res.status(404).json({ message: 'Question not found' });
        }
        res.json({ results: result });
    });
  
  
  });
  
  app.get('/api/results/:id', (req, res) => {
  
      const id = req.params.id; // Get the ID from the request parameters
  
      const sql = 'SELECT * FROM results WHERE userid = ? ORDER BY result_time DESC';
      con.query(sql, [id], (err, result) => {
          if (err) {
              console.error('Error fetching question:', err);
              return res.status(500).json({ error: 'Database query error' });
          }
          if (result.length === 0) {
              return res.status(404).json({ message: 'Question not found' });
          }
          res.json({ results: result });
      });
    
  
  });

  app.post('/api/logout', async (req, res) => {
    const { userId } = req.body;

    // Validate userId
    if (!userId) {
      return res.status(400).json({ error: 'userId is required' });
    }

    try {
      // Insert second log entry (activity_code: 5)
      const insertCategory2 = 'INSERT INTO user_log (userid, activity_code) VALUES (?, ?)';
      con.query(insertCategory2, [userId, 5],(error,result)=>{
        if(error){
            console.log(error)
            // res.send({"status":"error"})

        }
        else{
          console.log('Inserted log with activity_code 5');
          //  res.send({"status":"inserted"})
        }
      });

      var updateQuery = 'UPDATE cocube_user SET log_status = 0 WHERE id = ?';
      con.query(updateQuery,[userId],(error,result)=>{
        if(error){
            console.log(error)
            // res.send({"status":"error"})

        }
        else{
          console.log("updated")
          //  res.send({"status":"inserted"})
        }
      });
      
      // Send success response
      res.status(200).json({ status: 'success', message: 'logged out' });
    } catch (err) {
      console.error('Failed to logout:', err);
      res.status(500).json({ error: 'Failed to logout' });
    }
  });
  
  app.post('/api/candidate', async (req, res) => {
    const { userId, name, employeeNo } = req.body;
  
    if (!userId || !name || !employeeNo) {
      return res.status(400).json({ error: 'All fields are required' });
    }
  
    try {
      // Check if userId or employeeNo already exists
      const checkQuery = 'SELECT * FROM userreference WHERE employeeNo = ?';
      const [existingUsers] = await con.promise().query(checkQuery, [employeeNo]);
  
      if (existingUsers.length > 0) {
        return res.status(409).json({ error: 'User with this ID or Employee Number already exists' });
      }
  
      // Insert new user if no duplicates found
      const insertQuery = 'INSERT INTO userreference (userId, name, employeeNo) VALUES (?, ?, ?)';
      const [result] = await con.promise().query(insertQuery, [userId, name, employeeNo]);
  
      res.status(201).json({ message: 'Candidate data saved successfully', id: result.insertId });
    } catch (err) {
      console.error('Error saving candidate data:', err);
      res.status(500).json({ error: 'Internal server error' });
    }
  });

  

app.listen(process.env.PORT || 5000, () => { 
    console.log(`the port is running in ${process.env.PORT || 5000}`)

})