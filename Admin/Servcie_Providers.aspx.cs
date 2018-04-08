using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Admin_Servcie_Providers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        this.show_service_providers();
    }

    private void show_service_providers()
    {
        string query = "SELECT *  FROM [temp].[dbo].[user_sp]";
        SqlConnection con = Data_base.connection();
        try
        {
            SqlDataReader data;
            SqlCommand cmd = new SqlCommand(query, con);
            data = cmd.ExecuteReader();
            sp_accounts.DataSource = data;
            sp_accounts.DataBind();
        }
        catch (Exception e)
        {
        }
        finally
        {
            con.Close();
        }
    }

    //web service to  change status of sp
    [System.Web.Services.WebMethod]
    public static string update_status(string id, string status)
    {
        string message = "Unable to change status";

        if (new Admin_Manager().update_account_status(id, status))
                  message = "Account status changed";
        return message;
    }
}