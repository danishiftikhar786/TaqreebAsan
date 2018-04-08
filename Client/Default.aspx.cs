using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Client_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        string  id;
        try
        {
            //checking session value 
            id = Session["user_name"].ToString();
        }
        catch (Exception a)
        {
            //if no value in session redirect to session expired page
            Response.Redirect("Session_expired.aspx");
        }
        
    }
}