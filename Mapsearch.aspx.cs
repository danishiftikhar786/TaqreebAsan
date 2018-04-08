using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Mapsearch : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

       
            DataTable dt = this.GetData("SELECT [sp_name] ,[website],[logitude],[latitude]  FROM [temp].[dbo].[user_sp] where logitude!='' and logitude!=''");
            if (dt != null)
            {
                data.DataSource = dt;
                data.DataBind();
            }
            else
            {
                Server.Transfer("error.htm");
            }
        
    }

    private DataTable GetData(string query)
    {
        //string conString = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlCommand cmd = new SqlCommand(query);
        using (SqlConnection con = Data_base.connection())
        {
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = con;

                sda.SelectCommand = cmd;
                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);
                    return dt;
                }
            }
        }
    }
}