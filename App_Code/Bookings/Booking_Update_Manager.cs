using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Booking_Update_Manager
/// </summary>
public class Booking_Update_Manager
{
    private Booking obj;
    private SqlConnection con;
	public Booking_Update_Manager()
	{
		//
		// TODO: Add constructor logic here
		//
        obj = new Booking();
	}


    // function to call if guest count is going to updated
    public Boolean update_guest_count(string  amount,string count,string order_id)
    {
        con = Data_base.connection();
        Boolean temp = false;
        string query = "UPDATE [temp].[dbo].[bookings] SET [booking_charges] ='"+amount+"',[total_persons] = '"+count+"' WHERE  booking_id='"+order_id+"'";
        try
        {
            SqlCommand cmd = new SqlCommand(query, con);
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                temp = true;
            }

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

    public Boolean update_hall_rent(string id,string rent)
    {
        con = Data_base.connection();
        Boolean temp = false;
        string query = "UPDATE [temp].[dbo].[bookings]   SET [hall_rent] = '"+rent+"' WHERE  booking_id='"+id+"'";
        try
        {
            SqlCommand cmd = new SqlCommand(query, con);
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                temp = true;
            }

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