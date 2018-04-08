using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ServiceProvider_Account_Activation_Process : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {
            string user_name = Request.QueryString["user_name"];

            if (new SP_Account_Activation().active_account(user_name))
            {
                Message.InnerText = "Account acivated Successfully Please Login to access your account  <a href='+ www.taqreebasan.com/ServiceProvider/Login.aspx '>Login</a>";
            }
        }
        catch(Exception b){
        }
        

    }
}