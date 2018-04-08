using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Images_Manager
/// </summary>
public class Images_Manager
{

	public Images_Manager()
	{
		//
		// TODO: Add constructor logic here
		//
	}


    public void add_image(string sp_id, string url)
    {
        string query = "INSERT INTO [dbo].[sp_images]([img_url],[s_email_id])VALUES('" + url + "','" + sp_id + "')";
        SqlConnection con;
        con = Data_base.connection();
        try
        {

            SqlCommand cmd = new SqlCommand(query, con);
            int i = cmd.ExecuteNonQuery();


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