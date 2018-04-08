using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Main : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        this.Title = "TaqreebAsan/Main";
        /*if (Request.Browser.IsMobileDevice)
        {
            Server.Transfer("Mobiledevice.htm");
        }*/
        show_new_sp();
       
    }

    private void show_new_sp()
    {
        SqlConnection con = Data_base.connection();
        string query = "SELECT top 3  * FROM [temp].[dbo].[user_sp]  ORDER BY NEWID() ;";
        try
        {
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader data = cmd.ExecuteReader();
            new_sp.DataSource = data;
            new_sp.DataBind();



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