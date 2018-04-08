using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void login_Click(object sender, EventArgs e)
    {
        try
        {
            if (new Admin_Manager().login(u_name.Text.ToString(), pass.Text.ToString()))
            {
                Session["a_name"] = u_name.Text.ToString();
               
                Response.Redirect("Default.aspx");
            }
            else
            {
                error.InnerText = "Inocrrect username or password!";
            }
        }
        catch (Exception a)
        {
            error.InnerText = "Security Warning Alarm  Active!";
        }

    }
}