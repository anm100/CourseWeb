﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using Newtonsoft.Json.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.Script.Services;

/// <summary>
/// Summary description for WebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
[System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService
{

    public WebService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }
    public string GetCurrentTime(string name)
    {
        string message = "Hello ";
        message += name;
        message += "\nCurrent Time: ";
        message += DateTime.Now.ToString();
        return message;
    }

    [WebMethod]
    public void GetAllTheUsers()
    {
        List<User> listUsers = new List<User>();
        using (var context = new courseExampleEntities())
        {
            // creates a Command 
            var cmd = context.Database.Connection.CreateCommand();
            cmd.CommandText = "SELECT * from courseExample.dbo.Users";
            try
            {
                context.Database.Connection.Open();
                var reader = cmd.ExecuteReader();
                // loop through all resultsets (considering that it's possible to have more than one)
                while (reader.Read())
                {
                    // loads the DataTable (schema will be fetch automatically)
                    User users = new User();
                    users.UserId = Convert.ToInt32(reader["UserId"]);
                    users.Firstname = (reader["Firstname"]).ToString();
                    users.Lastname = (reader["Lastname"]).ToString();
                    users.Email = (reader["Email"]).ToString();
                    users.Password = (reader["Password"]).ToString();
                    users.Role = (reader["Role"]).ToString();
                    listUsers.Add(users);
                }
            }
            finally
            {
                JavaScriptSerializer js = new JavaScriptSerializer();
                Context.Response.Write(js.Serialize(listUsers));
                context.Database.Connection.Close();
            }
        }
    }
    [WebMethod(EnableSession = true)]
    public void GetAssigmnetUsersCourse()
    {
        using (var context = new courseExampleEntities())
        {
            // creates a Command 
            var cmd = context.Database.Connection.CreateCommand();
            cmd.CommandText = "SELECT  [StudentID],[Grade] FROM [courseExample].[dbo].[Grades] WHERE CourseID=1 AND AssignmentName='hmw1';";
            try
            {
                context.Database.Connection.Open();
                var reader = cmd.ExecuteReader();
                // loop through all resultsets (considering that it's possible to have more than one)
                JArray array = new JArray();
                while (reader.Read())
                {
                    // loads the DataTable (schema will be fetch automatically)
                   User user =(User) Session["user"];
                    JObject data = new JObject();
                    data["Id"]= Convert.ToInt32(reader["StudentID"]);
                    data["grade"]= (reader["Grade"]).ToString();
                    array.Add(data);
                }
                JObject o = new JObject();
                o["json"] = array;
                string json = o.ToString();
                // {
                //   "MyArray": [
                //     "Manual text",
                //     "2000-05-23T00:00:00"
                //   ]
                // }
                JavaScriptSerializer js = new JavaScriptSerializer();
                Context.Response.Clear();
                Context.Response.ContentType = "application/json";
                Context.Response.Write(js.Serialize(json));
            }
            finally
            {
                
            
    
                context.Database.Connection.Close();
            }
        }
    }
    [WebMethod(EnableSession = true)]
    public void GetCourses()
    {
        using (var context = new courseExampleEntities())
        {
            User user = (User)Session["user"];
            // creates a Command 
            var cmd = context.Database.Connection.CreateCommand();
            cmd.CommandText = "SELECT  DISTINCT [CourseID],[year],[semester] FROM [courseExample].[dbo].[assignment]  WHERE teacherId="+ user.UserId;
            try
            {
                context.Database.Connection.Open();
                var reader = cmd.ExecuteReader();
                // loop through all resultsets (considering that it's possible to have more than one)
                JArray array = new JArray();
                while (reader.Read())
                {
                    // loads the DataTable (schema will be fetch automatically)
                    JObject data = new JObject();
                    data["Id"] = Convert.ToInt32(reader["CourseID"]);
                    data["year"] = (reader["year"]).ToString();
                    data["semester"] = (reader["semester"]).ToString();

                    array.Add(data);
                }
                JObject o = new JObject();
                o["json"] = array;
                string json = o.ToString();
                // {
                //   "MyArray": [
                //     "Manual text",
                //     "2000-05-23T00:00:00"
                //   ]
                // }
                JavaScriptSerializer js = new JavaScriptSerializer();
                Context.Response.Clear();
                Context.Response.ContentType = "application/json";
                Context.Response.Write(js.Serialize(json));
            }
            finally
            {



                context.Database.Connection.Close();
            }
        }
    }
    [WebMethod(EnableSession = true)]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public Boolean PostDataResponse(string name)
    {
        JObject data = JObject.Parse(name);
        JArray array = (JArray)data["json"];
        int CourseID = 1;
        string AssignmentName = "hmw1";


        using (var context = new courseExampleEntities())
        {
            // creates a Command 
            dynamic studets = (JArray)data["json"];
            var cmd = context.Database.Connection.CreateCommand();

            try
            {
                context.Database.Connection.Open();
                for (int i = 0;  i< ((JArray)data["json"]).Count; i++)
                {
                    dynamic s = studets[i];
                    string grade = (string)s.grade;

                    cmd.CommandText = "UPDATE Grades SET  Grade =" + Convert.ToInt32(grade)
                        + "WHERE  StudentID =" + s.Id
                        + " AND CourseID =" + CourseID
                        + " AND  AssignmentName= '" + AssignmentName+"';";
                    cmd.ExecuteNonQuery();

                }
                // loop through all resultsets (considering that it's possible to have more than one)
            }
            finally
            {
                context.Database.Connection.Close();


            }
            return true;
        }
    }
    [WebMethod(EnableSession = true)]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public Boolean validateUser(string id,string pass)
    {
        Boolean flag = false;//not exist
            using (var context = new courseExampleEntities())
            {
                // creates a Command 
                var cmd = context.Database.Connection.CreateCommand();

                cmd.CommandText = "SELECT  * from courseExample.dbo.Users where UserId=" + "'" + Convert.ToInt32(id) + "' AND Password='"+ pass + "';";
                try
                {
                    context.Database.Connection.Open();
                    var reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    flag = true;
                    reader.Read();
                    User user = new User();
                    user.UserId = Convert.ToInt32(reader["UserId"]);
                    user.Firstname = (reader["Firstname"]).ToString();
                    user.Lastname = (reader["Lastname"]).ToString();
                    user.Email = (reader["Email"]).ToString();
                    user.Password = (reader["Password"]).ToString();
                    user.Role = (reader["Role"]).ToString();
                    Session["user"] = user;

                }
                
                }
                finally
                {
                context.Database.Connection.Close();

            }
        }
        if (flag == true)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    [WebMethod]
    public void GetStudetGrades()
    {
        int Studentid=111;
        string courseName="hedva";
        int coursIed = getCourseId(courseName);
        List<Grade> listgrade = new List<Grade>();
        using (var context = new courseExampleEntities())
        {
            // creates a Command 
            var cmd = context.Database.Connection.CreateCommand();
            cmd.CommandText = "SELECT  AssignmentName,Grade from courseExample.dbo.Grades" +
                " where StudentID=" + Studentid + "AND CourseID="+coursIed + "";
           // SELECT AssignmentName, Grade from courseExample.dbo.Grades where StudentID = 111 AND CourseID = 001;
            try
            {
                context.Database.Connection.Open();
                var reader = cmd.ExecuteReader();
                // loop through all resultsets (considering that it's possible to have more than one)
                while (reader.Read())
                {
                    // loads the DataTable (schema will be fetch automatically)
                    Grade grade = new Grade();
                    
                    grade.AssignmentName = (reader["AssignmentName"]).ToString();
                    grade.Grade1 = Convert.ToInt32(reader["Grade"]);
           
                    listgrade.Add(grade);
                }
            }
            finally
            {
                JavaScriptSerializer js = new JavaScriptSerializer();
                Context.Response.Write(js.Serialize(listgrade));
                context.Database.Connection.Close();
            }

        }



    }
    [WebMethod]
    public int getCourseId(string courseName)
    {
        
        int id=0;
        using (var context = new courseExampleEntities())
        {
            // creates a Command 
            var cmd = context.Database.Connection.CreateCommand();

            cmd.CommandText = "SELECT  CourseID from courseExample.dbo.Courses where CourseName=" +"'"+courseName+"'";
            try
            {
                context.Database.Connection.Open();
                var reader = cmd.ExecuteReader();
                // loop through all resultsets (considering that it's possible to have more than one)
                while (reader.Read())
                {
                 
                    id = Convert.ToInt32(reader["CourseID"]);
                    
                    break;
                }
            }
            finally
            {
                context.Database.Connection.Close();
            }
        }
        return id;


    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string AddUser(User newUser)
    {
       if( !UserExist(newUser.UserId))
        {
            var context = new courseExampleEntities();
            var cmd = context.Database.Connection.CreateCommand();
            cmd.CommandText = "insert  into   courseExample.dbo.Users values("+ newUser.UserId+ ",'"+
                newUser.Firstname + "','"+ newUser.Lastname + "','"+ newUser.Email + "','"+newUser.Password+"','"+ newUser.Role+"')";
            context.Database.Connection.Open();
            var reader = cmd.ExecuteReader();
            context.Database.Connection.Close();
            return "The user have been added successfully";
        }
       else
        {
            return "The user is existed";
        }
    }
    private bool UserExist(int id)
    {
        bool flag = false;//not exist
        using (var context = new courseExampleEntities())
        {
            // creates a Command 
            var cmd = context.Database.Connection.CreateCommand();

            cmd.CommandText = "SELECT  * from courseExample.dbo.Users where UserId=" + "'" + id + "'";
            try
            {
                context.Database.Connection.Open();
                var reader = cmd.ExecuteReader();
                if (reader.HasRows)
                    flag = true;
            }
            finally
            {
                context.Database.Connection.Close();
            }
        }
        return flag;
    }

}
