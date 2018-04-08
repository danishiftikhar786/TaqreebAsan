using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ServiceProvider_Setting : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        string id="";
        if (Request.Cookies["Sp_cookies"].Value != null)
        {
            id = Request.Cookies["Sp_cookies"].Value;
             if (id != null)
             {
                 bd.Text = id;
                 set_data(id);
             }
        }
        else
        {
            Response.Redirect("Expired.aspx");
        }

        
        
    }
    //function to first set profile data
    private void set_data(string email_id)
    {
        SP_Manager obj = new SP_Manager();
        obj.User_login = email_id;
        obj = obj.get_Sp_data(obj);
        if (obj != null)
        {
            Name.Text = obj.Sp_name;
            email.Text=obj.Email_address;
            capacity.Text=obj.Capacity;
            website.Text=obj.Web_url;
            address.Text=obj.Address;
            pass.Text = "********";
            hall_charges.Text = obj.Hall_charges;
            about_us.InnerText = obj.Aboutus;
        }

    }
    // function to change name


    //fucntion to update password
    [System.Web.Services.WebMethod]
    public static string update_Password(string id,string p1,string p2)
    {
        string message = "Old password incorrect";
        if (new SP_Manager().update_password(id, p1, p2))
           message = "password updated successfully";


        return message;
    }
    //fucntion to update sp_name
    [System.Web.Services.WebMethod]
    public static string update_name(string id, string name)
    {
        string message = "Unable to change Name";
        if (new SP_Manager().update_SP_name(id,name))
           message = "Name change Successfully";


        return message;
    }
    //fucntion to update email_address
    [System.Web.Services.WebMethod]
    public static string update_mail_Address(string id, string email)
    {
        string message = "Unable to change Email address";
        if (new SP_Manager().update_email(id, email))
            message = "Email Address change Successfully";


        return message;
    }
    //fucntion to update hall capcity
    [System.Web.Services.WebMethod]
    public static string update_capacity(string id, string capcity)
    {
        string message = "Unable to change hall capacity";
        if (new SP_Manager().update_capacity(id, capcity))
            message = "Hall Capacity  change Successfully";


        return message;
    }
    //fucntion to update web url
    [System.Web.Services.WebMethod]
    public static string update_web_url(string id, string url)
    {
        string message = "Unable to change Web Url";
      if (new SP_Manager().update_web_url(id,url))
            message = "Web Url change Successfully";


        return message;
    }
    //fucntion to update Address
    [System.Web.Services.WebMethod]
    public static string update_address(string id, string address)
    {
        string message = "Unable to change Address";
        if (new SP_Manager().update_address(id, address))
          message = "Address change Successfully";


        return message;
    }
    //function to update hall charges 
    [System.Web.Services.WebMethod]
    public static string update_single_hallcharges(string id, string charges)
    {
        string message = "Unable to change Charges";
        if (new SP_Manager().update_hall_charges(id,charges))
        message = "Hall Charges Successfully";


        return message;
    }
    //fucntion to change about us data
    [System.Web.Services.WebMethod]
    public static string update_about_us(string id, string data)
    {
        string message = "Unable to change About us";
       if (new SP_Manager().update_about_us(id,data))
            message = " change Successfully";


        return message;
    }
    


}