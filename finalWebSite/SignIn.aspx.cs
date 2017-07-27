using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class SignIn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.Cookies["UserID"] != null && Request.Cookies["PWD"] != null)
            {
                UserID.Text = Request.Cookies["UserID"].Value;
                Password.Attributes["value"] = Request.Cookies["PWD"].Value;
                CheckBox1.Checked = true;
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
        //using (SqlConnection con = new SqlConnection(CS))
        //{
        //    SqlCommand cmd = new SqlCommand("select * from Users where Username='" + UserID.Text + "' and Password='" + Password.Text + "'", con);
        //    con.Open();
        //    SqlDataAdapter sda = new SqlDataAdapter(cmd);
        //    DataTable dt = new DataTable();
        //    sda.Fill(dt);

        //if (dt.Rows.Count != 0)
        {
            if (CheckBox1.Checked)
            {
                Response.Cookies["UserID"].Value = UserID.Text;
                Response.Cookies["PWD"].Value = Password.Text;

                Response.Cookies["UserID"].Expires = DateTime.Now.AddDays(15);
                Response.Cookies["PWD"].Expires = DateTime.Now.AddDays(15);
            }
            else
            {
                Response.Cookies["UserID"].Expires = DateTime.Now.AddDays(-1);
                Response.Cookies["PWD"].Expires = DateTime.Now.AddDays(-1);
            }
            string Utype = "U";
            //    Utype = dt.Rows[0][5].ToString().Trim();

            if (Utype == "U")
            {
                Session["UserID"] = UserID.Text;
                Response.Redirect("~/UserHome.aspx");
            }
            if (Utype == "A")
            {
                Session["UserID"] = UserID.Text;
                Response.Redirect("~/AdminHome.aspx");
            }


        }
        //else
        //{
        //    lblError.Text = "Invalid Username or Password !";
        //}
    }
}