using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Profile_Road_map : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        String data = this.Page.RouteData.Values["name"].ToString();
        if (data != null)
        {
            this.Title =  data + "/MapLocation";
            data = new SP_Manager().get_email_address(data);
            data = new SP_Manager().get_location(data);
            String[] location = data.Split(',');
            longi.InnerText=location[0];
            lat.InnerText=location[1];
                
        }
        else
        {

        }
    }
}