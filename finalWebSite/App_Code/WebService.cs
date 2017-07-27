using System;
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
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string[][] PostDataResponse()
    {
        // string[][] fields=null;
        // // const string KEY = "key";
        // // goto beginning of the inputstream
        // HttpContext.Current.Request.InputStream.Position = 0;
        // // convert postdata to dictionary
        // string postData = new System.IO.StreamReader(HttpContext.Current.Request.InputStream).ReadToEnd();
        // //dynamic obj = postData == "" ? null : JObject.Parse(postData);

        // string[] content = postData.Split('&');
        // for (int i = 0; i < content.Length; i++)
        // {
        //      fields[i] = content[i].Split('=');
        // }
        //// var json = JsonSerializer.SerializeToString(fields);
        // return fields;

        Stream req = HttpContext.Current.Request.InputStream;
        req.Seek(0, System.IO.SeekOrigin.Begin);
        string json = new StreamReader(req).ReadToEnd();

        JavaScriptSerializer serializer = new JavaScriptSerializer();
        dynamic items = serializer.Deserialize<object>(json);
        return null;
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

    private bool UserExist(int  id)
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

