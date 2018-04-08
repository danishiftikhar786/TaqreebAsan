using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ServiceProvider_Admin_serviceprovider : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SP_Manager obj;
        if (Request.Cookies["Sp_cookies"].Value != null)
        {
            obj = new SP_Manager();
            obj.User_login = Request.Cookies["Sp_cookies"].Value.ToString();
            obj = obj.get_Sp_data(obj);
           // Session["sp_name"] = obj.Sp_name;
            //Session["email"] = obj.Email_address;
            //Session["address"] = obj.Address;
            //Session["long"] = obj.Longitude;
            //Session["lati"] = obj.Latitude;
            //Session["web_url"] = obj.Web_url;

            name.Text = obj.Sp_name;
            order_badge.InnerText = new SP_Manager().get_new_order_count(obj.get_email_address(obj.Sp_name)) + " new orders";
        }

        else
        {
            
        }

       
    }


    //function to check for new order placement from webservice
    [System.Web.Services.WebMethod]
    public static string load_new_orders(string sp_id)
    {
        string message="0";


        message = new SP_Manager().get_new_order_count(sp_id);
        return message;

    }






}
