using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Client_Client : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {
            //getting cookies for reading and manuplating data
            if (Request.Cookies["user1_info"] != null)
            {

                //setting  user name on label 
                name.Text = Server.HtmlEncode(Request.Cookies["user1_info"]["f_name"]);
                
            }
           
        }
        catch(Exception a){
            a.ToString();
        }
        
    }
    
}
