using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //protected void btRegist_Click(object sender, EventArgs e)


    //}


    protected void btRegist_Click(object sender, EventArgs e)
    {
        {
            User newUser = new User();
            newUser.UserId = int.Parse(tbID.Text);
            newUser.Firstname = tbFname.Text;
            newUser.Lastname = tbFname.Text;
            newUser.Email = tbemail.Text;
            newUser.Password = tbpassword.Text;
            newUser.Role = drRole.SelectedItem.Text;
            var db = new courseExampleEntities();
            db.Users.Add(newUser);
            db.SaveChanges();
        }
    }
}