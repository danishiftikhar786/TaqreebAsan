using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Profile_Profile_m : System.Web.UI.MasterPage
{
    public String my_url = "http://localhost:33334/";
    protected void Page_Load(object sender, EventArgs e)
    {
        string id = this.Page.RouteData.Values["name"].ToString();
            //Request.QueryString["name"];
            //this.Page.RouteData.Values["name"].ToString();
            //Request.QueryString["name"];
        name.Text = id;
    }
}
