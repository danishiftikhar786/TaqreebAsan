using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Profile_Menus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String data = this.Page.RouteData.Values["name"].ToString();
            //Request.QueryString["name"];
        if (data != null)
        {
            this.Title =  data + "/Menus";
            data = new SP_Manager().get_email_address(data);

            this.get_menus(data);
        }

    }

    private void get_menus(string sp_id)
    {

        string query = "select  * from temp.[dbo].offer_menus where  s_email_id='" + sp_id + "'";
        SqlConnection con = Data_base.connection();
        try
        {
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader data = cmd.ExecuteReader();
            menu.DataSource = data;
            menu.DataBind();

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