using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Web_pages_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


      


    }
    protected void login_Click(object sender, EventArgs e)
    {

        try
        {
            Client_Manager obj = new Client_Manager();

            string password = pass.Text.GetHashCode().ToString();;


            if (obj.login(u_name.Text,password))
            {
                error.InnerText = "";
                //creating cookies object 
                //HttpCookie client_info = new HttpCookie("user1_info");
                //storing values in cookies object
                //client_info["id"] = u_name.Text;
                //Session.Timeout = 30;
                Session["user_name"] = u_name.Text;

                //client_info["date_time"] = DateTime.Now.ToString();
                //obj=obj.get_client_info(u_name.Text);
                //client_info["cnic"] = obj.Cnic;
                //client_info["f_name"]=obj.Fname;
                //client_info["l_name"]=obj.Lname;
                //client_info["email"]=obj.S_email;
                //client_info["number"]=obj.Phone_number;
                //client_info.Expires = DateTime.Now.AddDays(30);
                //writing cookies on browser sides  against  current web response
                //Response.Cookies.Add(client_info);

                //window.location.href =
                //ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "window.location.href='Default.aspx';", true);
                //Server.Transfer("Default.aspx");
                Response.Redirect("Default.aspx");


                //Response.Redirect("Default.aspx");
            }
            else
            {
                //show error message  if data is incorret
                error.InnerText = "Inocrrect username or password!";
            }
        }
        catch(Exception a){

            //Response.Write("<script>alert('" + a.ToString() +a.GetBaseException() +"');</script>");
            
        }


    }
}