using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Newsletters
/// </summary>
public class Newsletters
{

    private String email;

    public String Email
    {
        get { return email; }
        set { email = value; }
    }
    private String type;

    public String Type
    {
        get { return type; }
        set { type = value; }
    }
    private SqlConnection con;
	public Newsletters()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public void new_letter_emails(Newsletters obj)
    {
        
        string query = "INSERT INTO [temp].[dbo].[newsletters_emails]([email],[type]) VALUES('"+obj.Email+"','')";
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