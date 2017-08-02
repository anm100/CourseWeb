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
        using (var context = new courseExampleEntities())
        {
            // creates a Command 
            var cmd = context.Database.Connection.CreateCommand();
            cmd.CommandText = "SELECT * from courseExample.dbo.Users";
            try
            {
                context.Database.Connection.Open();
                var reader = cmd.ExecuteReader();
                JArray array = new JArray();
                // loop through all resultsets (considering that it's possible to have more than one)
                while (reader.Read())
                {
                    JObject data = new JObject();
                    data["UserId"] = Convert.ToInt32(reader["UserId"]);
                    data["Firstname"] = (reader["Firstname"]).ToString();
                    data["Lastname"] = (reader["Lastname"]).ToString();
                    data["Email"] = (reader["Email"]).ToString();
                    data["Password"] = (reader["Password"]).ToString();
                    data["Role"] = (reader["Role"]).ToString();
                    array.Add(data);
                }
                JObject o = new JObject();
                o["json"] = array;
                string json = o.ToString();
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
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string DeleteUser(string userId)
    {
        string message;
        int id = int.Parse(userId);
        if (UserExist(id))
        {
            var context = new courseExampleEntities();
            var cmd = context.Database.Connection.CreateCommand();
            cmd.CommandText = "DELETE FROM[dbo].[Users] WHERE[UserId] =" + id;
            context.Database.Connection.Open();
            var reader = cmd.ExecuteReader();
            context.Database.Connection.Close();
            message = "The user have been added successfully";
            return message;
        }
        else
        {
            message = "The user is existed";
            return message;
        }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string EditUser(User newUser)
    {
        string message;
        int id = newUser.UserId;
        if (UserExist(id))
        {
            var context = new courseExampleEntities();
            var cmd = context.Database.Connection.CreateCommand();
            cmd.CommandText = "UPDATE [courseExample].[dbo].[Users] SET " +
                "[FirstName]='" + newUser.FirstName + "'," +
                "[Lastname]='" + newUser.Lastname + "'," +
                "[Email]='" + newUser.Email + "'," +
                "[Password]='" + newUser.Password + "'" +
                "WHERE UserId =" + newUser.UserId + ";";

            context.Database.Connection.Open();
            var reader = cmd.ExecuteReader();
            context.Database.Connection.Close();
            message = "The user have been added successfully";
            return message;
        }
        else
        {
            message = "The user is existed";
            return message;
        }
    }

    [WebMethod(EnableSession = true)]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string GetAssigmnetUsersCourse(string sid, string assignmentID)
    {
        int coursid = int.Parse(sid);
        int assignmentId = int.Parse(assignmentID);
        JavaScriptSerializer js = new JavaScriptSerializer();
        string json;
        using (var context = new courseExampleEntities())
        {

            var cmd = context.Database.Connection.CreateCommand();
            bool flag = gradeIsEmpty(assignmentId);
            if (flag)
            {
                insertToTable(assignmentId, coursid);
                cmd.CommandText = "SELECT v1.UserId, v2.AssignmentName FROM[courseExample].[dbo].[enrolled] as v1 ,[courseExample].[dbo].[assignment]as v2"
                   + " where v1.CourseId =" + coursid + "AND v2.AssignmentId = " + assignmentId;
            }
            else
                cmd.CommandText = "SELECT v1.UserId,v2.AssignmentName,v1.Grade" +
                 "FROM[courseExample].[dbo].[grades] as v1,[courseExample].[dbo].[assignment] as v2" +
                   "where v1.AssignmentId=" + assignmentId + "AND v2.AssignmentId=" + assignmentId;
            try
            {
                context.Database.Connection.Open();
                var reader = cmd.ExecuteReader();
                // loop through all resultsets (considering that it's possible to have more than one)
                JArray array = new JArray();
                while (reader.Read())
                {
                    // loads the DataTable (schema will be fetch automatically)
                    User user = (User)Session["user"];
                    JObject data = new JObject();
                    if (flag)
                        data["grade"] = 0;
                    else
                        data["grade"] = (reader["Grade"]).ToString();

                    data["Id"] = Convert.ToInt32(reader["UserId"]);
                    data["courseId"] = Convert.ToInt32(sid);
                    data["assignmentname"] = (reader["AssignmentName"]).ToString();

                    array.Add(data);
                }
                JObject o = new JObject();
                o["json"] = array;
                json = o.ToString();
                Context.Response.Clear();
            }
            finally
            {
                context.Database.Connection.Close();
            }
        }
        return js.Serialize(json);
    }

    private void insertToTable(int assignmentId, int coursid)
    {
        using (var context = new courseExampleEntities())
        {
            var cmd = context.Database.Connection.CreateCommand();
            cmd.CommandText =
                "INSERT INTO [courseExample].[dbo].[grades](AssignmentId, UserId, CourseId) " +
                "(SELECT v2.AssignmentId, v1.UserId, v1.CourseId FROM" +
                " [courseExample].[dbo].[enrolled] as v1,[courseExample].[dbo].[assignment]as v2 " +
                "where v1.CourseId =" + coursid + " AND v2.AssignmentId =" + assignmentId + ")";
            //"INSERT INTO [courseExample].[dbo].[grades](AssignmentId, UserId, CourseId)"+
            //"SELECT v2.AssignmentId v1.UserId, v1.CourseId  FROM[courseExample].[dbo].[enrolled] as v1 ,[courseExample].[dbo].[assignment]as v2"
            //   + " where v1.CourseId =" + coursid + "AND v2.AssignmentId = " + assignmentId;
            context.Database.Connection.Open();
            var reader = cmd.ExecuteReader();
            context.Database.Connection.Close();

        }
    }

    private bool gradeIsEmpty(int assignmentID)
    {
        bool flag = false;//not exist
        using (var context = new courseExampleEntities())
        {
            // creates a Command 
            var cmd = context.Database.Connection.CreateCommand();

            cmd.CommandText = "SELECT * FROM[courseExample].[dbo].[grades] where AssignmentId =" + assignmentID;
            try
            {
                context.Database.Connection.Open();
                var reader = cmd.ExecuteReader();
                if (!reader.HasRows)
                    flag = true;
            }
            finally
            {
                context.Database.Connection.Close();
            }
        }
        return flag;
    }

    [WebMethod(EnableSession = true)]
    public void GetCourses()
    {
        using (var context = new courseExampleEntities())
        {
            User user = (User)Session["user"];
            // creates a Command 
            var cmd = context.Database.Connection.CreateCommand();
            if (user.Role == 1)
                cmd.CommandText = "SELECT[CourseID] ,[CourseName] ,[TeacherId] FROM[courseExample].[dbo].[Courses]";
            if (user.Role == 2)
                cmd.CommandText = "SELECT[CourseID] ,[CourseName] ,[TeacherId] FROM[courseExample].[dbo].[Courses] where TeacherID=" + user.UserId;
            if (user.Role == 3)
                cmd.CommandText = "SELECT v1.[CourseID] , v1.[CourseName] , v1.[TeacherId]" +
                   " FROM[courseExample].[dbo].[Courses] as v1 , [courseExample].[dbo].[enrolled] as v2" +
                    " where v1.CourseId=v2.CourseId AND v2.UserId=" + user.UserId;
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
                    data["CourseID"] = Convert.ToInt32(reader["CourseID"]);
                    data["CourseName"] = (reader["CourseName"]).ToString();
                    data["TeacherId"] = Convert.ToInt32(reader["TeacherId"]);


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
    public Boolean EditGrades(string name, string assignmentId)
    {
        JObject data = JObject.Parse(name);
        JArray array = (JArray)data["json"];
        int CourseID;


        using (var context = new courseExampleEntities())
        {
            // creates a Command 
            dynamic studets = (JArray)data["json"];
            var cmd = context.Database.Connection.CreateCommand();

            try
            {
                context.Database.Connection.Open();
                for (int i = 0; i < ((JArray)data["json"]).Count; i++)
                {
                    dynamic s = studets[i];
                    string grade = (string)s.grade;
                    string AssignmentName = (string)s.assignmentname;
                    string id = s.Id;
                    string assigID = assignmentId;
                    CourseID = s.courseId;
                    cmd.CommandText = "UPDATE grades SET  Grade =" + Convert.ToInt32(grade)
                        + "WHERE  UserId =" + Convert.ToInt32(id)
                        + " AND CourseId =" + Convert.ToInt32(CourseID)
                        + " AND  AssignmentId=" + Convert.ToInt32(assigID);
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
    public Boolean validateUser(string id, string pass)
    {
        Boolean flag = false;//not exist
        using (var context = new courseExampleEntities())
        {
            // creates a Command 
            var cmd = context.Database.Connection.CreateCommand();

            cmd.CommandText = "SELECT  * from courseExample.dbo.Users where UserId=" + "'" + Convert.ToInt32(id) + "' AND Password='" + pass + "';";
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
                    user.FirstName = (reader["FirstName"]).ToString();
                    user.Lastname = (reader["LastName"]).ToString();
                    user.Email = (reader["Email"]).ToString();
                    user.Password = (reader["Password"]).ToString();
                    user.Role = Convert.ToInt32(reader["Role"]);
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
    public int getCourseId(string courseName)
    {

        int id = 0;
        using (var context = new courseExampleEntities())
        {
            // creates a Command 
            var cmd = context.Database.Connection.CreateCommand();

            cmd.CommandText = "SELECT  CourseID from courseExample.dbo.Courses where CourseName=" + "'" + courseName + "'";
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
        if (!UserExist(newUser.UserId))
        {
            var context = new courseExampleEntities();
            var cmd = context.Database.Connection.CreateCommand();
            cmd.CommandText = "insert  into   courseExample.dbo.Users values(" + newUser.UserId + ",'" +
                newUser.FirstName + "','" + newUser.Lastname + "','" + newUser.Email + "','" + newUser.Password + "','" + newUser.Role + "')";
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


    [WebMethod(EnableSession = true)]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string getStudenAssignment(string courseID, string assignmentId)
    {
        int assignmentID = int.Parse(assignmentId);
        JavaScriptSerializer js;
        string json;
        User user = (User)Session["user"];
        using (var context = new courseExampleEntities())
        {
            // creates a Command 
            var cmd = context.Database.Connection.CreateCommand();
            cmd.CommandText = "SELECT v1.[AssignmentName],v1.[SubDate],v2.Grade" +
            " FROM[courseExample].[dbo].[assignment]as v1,[courseExample].[dbo].[grades]as v2" +
            " where  v1.AssignmentId=" + assignmentID + "AND v1.AssignmentId=v2.AssignmentId AND v2.UserId=" + user.UserId;
            // SELECT AssignmentName, Grade from courseExample.dbo.Grades where StudentID = 111 AND CourseID = 001;
            try
            {
                context.Database.Connection.Open();
                var reader = cmd.ExecuteReader();
                JArray array = new JArray();

                // loop through all resultsets (considering that it's possible to have more than one)
                while (reader.Read())
                {
                    JObject data = new JObject();
                    data["SubDate"] = (reader["SubDate"]).ToString();
                    data["AssignmentName"] = (reader["AssignmentName"]).ToString();
                    data["Grade"] = Convert.ToInt32((reader["Grade"]));
                    array.Add(data);
                }

                JObject o = new JObject();
                o["json"] = array;
                json = o.ToString();
                js = new JavaScriptSerializer();
                Context.Response.Clear();
            }

            finally
            {
                context.Database.Connection.Close();
            }

        }
        return (js.Serialize(json));
    }
    [WebMethod(EnableSession = true)]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string Getassignment(string CourseID)
    {
        JavaScriptSerializer js;
        string json;
        User user = (User)Session["user"];
        Session["courseID"] = CourseID;
        int courseId = Convert.ToInt32(CourseID);
        using (var context = new courseExampleEntities())
        {
            // creates a Command 
            var cmd = context.Database.Connection.CreateCommand();
            if (user.Role == 3)
                cmd.CommandText = "SELECT v1.AssignmentId, v1.AssignmentName,v1.[Type]" +
                "FROM [courseExample].[dbo].[assignment] as v1 , [courseExample].[dbo].[enrolled]as v2"
                + " where v1.CourseID=" + courseId + "AND v1.CourseID=v2.CourseID AND v2.UserID=" + user.UserId;

            if (user.Role == 2)
                cmd.CommandText = "SELECT AssignmentId,AssignmentName,Type FROM[courseExample].[dbo].[assignment] where CourseID =" + int.Parse(CourseID);
            try
            {
                context.Database.Connection.Open();
                var reader = cmd.ExecuteReader();
                JArray array1 = new JArray();
                JArray array2 = new JArray();
                // loop through all resultsets (considering that it's possible to have more than one)
                while (reader.Read())
                {
                    String assiType = null;
                    JObject data = new JObject();
                    if (Convert.ToInt32(reader["Type"]) == 1)
                    {
                        assiType = "homework";
                        data["Type"] = assiType;
                        data["assignment"] = (reader["AssignmentName"]).ToString();
                        data["AssignmentId"] = (reader["AssignmentId"]).ToString();
                        array1.Add(data);
                    }
                    else
                    {
                        assiType = "Lab";
                        data["Type"] = assiType;
                        data["assignment"] = (reader["AssignmentName"]).ToString();
                        data["AssignmentId"] = (reader["AssignmentId"]).ToString();
                        array2.Add(data);

                    }
                }
                JObject o = new JObject();
                if (user.Role == 3)
                    o["path"] = "Grade";
                if (user.Role == 2)
                    o["path"] = "GradesLab";

                o["jsonhmw"] = array1;
                o["jsonLabs"] = array2;
                json = o.ToString();
                js = new JavaScriptSerializer();
                Context.Response.Clear();
            }

            finally
            {
                context.Database.Connection.Close();
            }

        }
        return (js.Serialize(json));
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string addAssignment(assignment newAssign)
    {
        int courseId = newAssign.CourseId;
        int assitype = newAssign.Type;
        DateTime subDate = newAssign.SubDate;
        string assignmentName = newAssign.AssignmentName;
        var context = new courseExampleEntities();
        var cmd = context.Database.Connection.CreateCommand();
        cmd.CommandText = "insert  into courseExample.dbo.assignment (CourseId,AssignmentName,Type,SubDate) values(" + courseId + ",'" +
        assignmentName + "','" + assitype + "','" + subDate + "')";
        context.Database.Connection.Open();
        var reader = cmd.ExecuteReader();
        context.Database.Connection.Close();
        return "The assignment added successfully";
    }
    [WebMethod(EnableSession = true)]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string addCourse(Cours newCourse)
    {
        User user = (User)Session["user"];
        int courseId = newCourse.CourseId;
        string courseName = newCourse.CourseName;
        var context = new courseExampleEntities();
        var cmd = context.Database.Connection.CreateCommand();
        cmd.CommandText = "insert  into courseExample.dbo.Courses (CourseId,CourseName,TeacherId) values('" + courseId + "','" + courseName + "','" + user.UserId + "')";
        context.Database.Connection.Open();
        var reader = cmd.ExecuteReader();
        context.Database.Connection.Close();
        return "The user have been added successfully - not complited";
    }
}