using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class ServiceProvider_Orders : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string id = "";
        if (Request.Cookies["Sp_cookies"].Value != null)
        {
            id = Request.Cookies["Sp_cookies"].Value;
            show_orders(id);
        }
        else
        {
            Response.Redirect("Expired.aspx");
        }

    }

    private void show_orders(string id)
    {
        string query = "select * FROM [temp].[dbo].[bookings] where sp_id='" + id + "'";
        SqlConnection con = Data_base.connection();
        try
        {
            SqlDataReader data;
            SqlCommand cmd = new SqlCommand(query, con);
            data = cmd.ExecuteReader();
            order_data.DataSource = data;
            order_data.DataBind();
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