using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Profile_Gallery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String data = this.Page.RouteData.Values["name"].ToString();
        if (data != null)
        {
            this.Title =  data + "/Gallery";
            data = new SP_Manager().get_email_address(data);
            this.get_images(data);
        }
    }


    private void get_images(string sp_id)
    {

        string query = "SELECT * from  [temp].[dbo].[sp_images] where s_email_id='" + sp_id + "'";
        SqlConnection con = Data_base.connection();
        try
        {
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader data = cmd.ExecuteReader();
            gallery.DataSource = data;
            gallery.DataBind();
            
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