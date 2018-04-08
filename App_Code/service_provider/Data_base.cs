using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Data_base
/// </summary>
public class Data_base
{
    
    private static string url="Data Source=DANISHIFTIKHAR\\SQLEXPRESS;Initial Catalog=temp;Integrated Security=True";
    public static SqlConnection con=null;
	public Data_base()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public  static SqlConnection connection(){

        con = new SqlConnection(url);
        try
        {
            con.Open();
            //Console.WriteLine("connection established");
        }
        catch(Exception e){
            con = null;
        }
        return con;
    }
}