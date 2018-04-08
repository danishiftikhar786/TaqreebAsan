using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Web_pages_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "TaqreebAsan/ServiceProvider/Login";
        Session["user_name"]=null;

    }
    protected void login_Click(object sender, EventArgs e)
    {

        try
        {
            SP_Manager obj = new SP_Manager();
            obj.User_login = u_name.Text;
            obj.Password = pass.Text.GetHashCode().ToString();

            if (obj.sp_login(obj))
            {
                error.InnerText = "";
                HttpCookie cookyobj = new HttpCookie("Sp_cookies");
                cookyobj.Value = u_name.Text;
                cookyobj.Expires = DateTime.Now.AddHours(2);
                Response.Cookies.Add(cookyobj);
               // Session.Timeout = 80;
                //Session["user_name"] = u_name.Text;
                Response.Redirect("Default.aspx");
                

            }
            else
            {
                error.InnerText = "Inocrrect username or password!";
            }

        }
        catch(Exception a){
           

        }


    }
}