using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Client_Client_Registeration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void register_Click(object sender, EventArgs e)
    {

        Client_Manager obj = new Client_Manager();
        obj.User_name = u_name.Text;
        obj.Fname=f_name.Text;
        obj.Lname=l_name.Text;
        obj.Password=bpassword.Text.GetHashCode().ToString();
        obj.Phone_number=p_number.Text;
        obj.S_email=email_address.Text;
        obj.Address = "";
        obj.Cnic=cnic.Text;
        obj.City=city.SelectedItem.Text;
        if (obj.new_user(obj))
        {

            Session["user_name"] = u_name.Text;

            //creating cookies object 
            //HttpCookie client_info = new HttpCookie("user1_info");
            //storing values in cookies object
            //client_info["id"] = u_name.Text;
            //client_info["cnic"] = cnic.Text;
            //client_info["date_time"] = DateTime.Now.ToString();
            //client_info.Expires = DateTime.Now.AddDays(30);
            //writing cookies on browser sides  against  current web response
            //Response.Cookies.Add(client_info);
            Response.Redirect("Default.aspx");
            //Server.Transfer("Default.aspx");

        }
        else
        {
            id_error.Text = "User name already exist!";
        }
    }
}