using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Client_MyBookings : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
           String  id = Session["user_name"].ToString();
           this.get_my_bookings_data(id);
        }
        catch(Exception a){
            Response.Redirect("user_Login.aspx");
        }


    }
    private void get_my_bookings_data(string id)
    {
        string query = "SELECT *  FROM [temp].[dbo].[bookings] where client_id='" + id + "' and status='new' or status='Confirm'";
        SqlConnection con=Data_base.connection();
        try
        {
            SqlCommand cmd = new SqlCommand(query,con);
            SqlDataReader read = cmd.ExecuteReader();
            my_booking.DataSource = read;
            my_booking.DataBind();

        }
        catch (Exception e)
        {

        }
        finally
        {
            con.Close();
        }
    }
}