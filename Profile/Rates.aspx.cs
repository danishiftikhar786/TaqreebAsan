using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Profile_Rates : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        String data = this.Page.RouteData.Values["name"].ToString();
        if (data != null)
        {
            this.Title = data + "/Dishes";
            data = new SP_Manager().get_email_address(data);

            this.get_dishes(data);
        }
    }

    private void get_dishes(string sp_id)
    {
        string query = "select * from [temp].[dbo].dishes   inner join [temp].[dbo].offered_dishes   on [temp].dbo.offered_dishes.s_email_id='"+sp_id+"' and [temp].dbo.offered_dishes.dish_id=[temp].dbo.dishes.dish_id";
        SqlConnection con = Data_base.connection();
        try
        {
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader data = cmd.ExecuteReader();
            dishes.DataSource = data;
            dishes.DataBind();

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