using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class ServiceProvider_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string id = "";
        //Session["user_name"] != null
        if (Request.Cookies["Sp_cookies"].Value != null)
        {
            id = Request.Cookies["Sp_cookies"].Value.ToString();
            //getting new order count  from database
            order_no.InnerText = new SP_Manager().get_new_order_count(id);
            //function calling to show orders data
            show_orders(id);
        }
        else
        {
            Response.Redirect("Expired.aspx");
        }
        

        name_sp.InnerText = id;
    }

    //function to check missing data/////////////////

    [System.Web.Services.WebMethod]
    public static string check_charges(string sp_email)
    {
        string message="no";
        //yes if data is not missing in database
        if (new SP_Manager().check_hall_data(sp_email))
            message = "yes";


        return message;
    }


    public void show_orders(string id)
    {
        string query = "select * FROM [temp].[dbo].[bookings] where sp_id='"+id+"' and status='new' or status='Request Accepted'";
        SqlConnection con = Data_base.connection();
        try
        {
            SqlDataReader data;
            SqlCommand cmd = new SqlCommand(query, con);
            data = cmd.ExecuteReader();
            order_data.DataSource = data;
            order_data.DataBind();
        }
        catch(Exception e){
        }
        finally{
            con.Close();
        }

    }
}