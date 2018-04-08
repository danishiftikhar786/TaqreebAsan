using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Setting : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        id.Text= Session["a_name"].ToString();
        pass.Text = "********";
    }

    [System.Web.Services.WebMethod]
    public static string update_Password(string id, string p1)
    {
        string message = "Old password incorrect";
        if (new Admin_Manager().update_password(id,p1))
            message = "password updated successfully";


        return message;
    }
}