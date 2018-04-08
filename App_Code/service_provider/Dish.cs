using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Dish
/// </summary>
public class Dish
{
    private string query;
    private  SqlConnection con;
    private long d_id;

    public long D_id
    {
        get { return d_id; }
        set { d_id = value; }
    }

    private string d_Name;
    public string D_Name
    {
        get { return d_Name; }
        set { d_Name = value; }
    }
    private long d_price;

    public long D_price
    {
        get { return d_price; }
        set { d_price = value; }
    }
    private string d_status;

    public string D_status
    {
        get { return d_status; }
        set { d_status = value; }
    }
    private string sp_id;

    public string Sp_id
    {
        get { return sp_id; }
        set { sp_id = value; }
    }
    
	public Dish()
	{
		//
		// TODO: Add constructor logic here
		//
        query = null;
	}


    //methods///////////////////////////////


    public Boolean new_Dish(Dish obj)
    {
        query = "INSERT INTO [dbo].[offered_dishes]([perhead_price] ,[dish_id] ,[s_email_id]) VALUES ("+obj.D_price+","+obj.D_id+",'"+obj.Sp_id+"')";
        Boolean temp = false;
        con = Data_base.connection();
        try
        {
            
            SqlCommand cmd = new SqlCommand(query, con);
            int var = cmd.ExecuteNonQuery();
            if (var > 0)
                temp = true;
            
        }
        catch (Exception e)
        {
            temp = false;
        }
        finally
        {
            con.Close();
        }
        return temp;
    }
    public SqlDataReader show_dishes(string email_id)
    {
        SqlDataReader data;
        con = Data_base.connection();
        query = "select *  FROM [temp].[dbo].[offer_dishes]";
        try
        {
            
            SqlCommand cmd = new SqlCommand(query, con);
            data = cmd.ExecuteReader();

            con.Close();
        }
        catch (Exception e)
        {
            data = null;
        }
        finally
        {
            con.Close();
        }

        return data;
    }
    public Boolean remove_dish(String id)
    {
        Boolean temp = false;
        con = Data_base.connection();
        query = "DELETE FROM [dbo].[offered_dishes] WHERE [temp].[dbo].offered_dishes.offered_d_id="+id+"";
        try
        {
            SqlCommand cmd = new SqlCommand(query, con);
            int var = cmd.ExecuteNonQuery();
            if (var > 0)
                temp = true;
            
        }
        catch (Exception e)
        {
            
        }
        finally
        {
            con.Close();
        }
        return temp;

    }

    // function to update dish  perhead price

    

    public Boolean update_price(String id,String price)
    {
        Boolean temp = false;
        con = Data_base.connection();
        query = "UPDATE [dbo].[offered_dishes]   SET [perhead_price] ="+price+" WHERE [dbo].[offered_dishes].offered_d_id="+id+"";
        try
        {
            SqlCommand cmd = new SqlCommand(query, con);
            int var = cmd.ExecuteNonQuery();
            if (var > 0)
                temp = true;
            
        }
        catch (Exception e)
        {
            
        }
        finally
        {
            con.Close();
        }
        return temp;

    }
    
}