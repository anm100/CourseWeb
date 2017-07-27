using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Regist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    //protected void btRegist_Click(object sender, EventArgs e)
    //{
    //    if (tbUserId.Text != "" & tbPass.Text != "" && tbLastName.Text != "" && tbFirstName.Text != "" && tbEmail.Text != "" && tbCPass.Text != "")
    //    {
    //        if (tbPass.Text == tbCPass.Text)
    //        {
    //            {
    //                User newUser = new User();
    //                newUser.UserId = int.Parse(tbUserId.Text);
    //                newUser.Firstname = tbFirstName.Text;
    //                newUser.Lastname = tbLastName.Text;
    //                newUser.Email = tbEmail.Text;
    //                newUser.Password = tbPass.Text;
    //                newUser.Role = drRole.SelectedItem.Text;
    //                var db = new courseExampleEntities();
    //                db.Users.Add(newUser);
    //                db.SaveChanges();
    //            }

    //            lblMsg.Text = "Registration Successfull";
    //                lblMsg.ForeColor = Color.Green;
    //                Response.Redirect("~/Signin.aspx");
    //        }
    //        else
    //        {
    //            lblMsg.ForeColor = Color.Red;
    //            lblMsg.Text = "Passwords do not match";
    //        }
    //    }
    //    else
    //    {
    //        lblMsg.ForeColor = Color.Red;
    //        lblMsg.Text = "All Fields Are Mandatory";

    //    }
    //}
}