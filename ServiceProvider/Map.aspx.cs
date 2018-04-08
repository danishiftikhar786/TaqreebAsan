using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ServiceProvider_Map : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string id = "";
        if (Request.Cookies["Sp_cookies"].Value != null) 
        {
            id = Request.Cookies["Sp_cookies"].Value;
            sp_id.Text = id;
        }
        else
        {
            Response.Redirect("Expired.aspx");
        }

    }

    [System.Web.Services.WebMethod]
    public static string save_location(string lat,string lon,string id)
    {
        string sp_id;
        string message="error in saving location";
        sp_id=id;
        SP_Manager obj=new SP_Manager();
        obj.User_login=sp_id;
        obj.Latitude=lat;
        obj.Longitude=lon;
        if(obj.update_location(obj)){
            message = "Location successfully update";
        }

        return message; 

    }

}