using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Admin_Manager
/// </summary>
public class Admin_Manager
{

    /// <summary>
    /// Admin  attributes
    /// Login function
    /// </summary>
   private  string user_name;

    public string User_name
    {
        get { return user_name; }
        set { user_name = value; }
    }
    private string password;

    public string Password
    {
        get { return password; }
        set { password = value; }
    }
    private string type;

    public string Type
    {
        get { return type; }
        set { type = value; }
    }
    private string name;

    public string Name
    {
        get { return name; }
        set { name = value; }
    }

    private SqlConnection con;


	public Admin_Manager()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    
    ////////////Login funtion..........////////////////////////

    public Boolean login(string user_name,string password)
    {
        Boolean temp = false;
        con = Data_base.connection();
        string query = "SELECT COUNT(*) from  temp.dbo.user_admin where  user_name='"+user_name+"' and password='"+password+"' ";
        try
        {
            SqlCommand cmd = new SqlCommand(query, con);
            int var = System.Convert.ToInt32(cmd.ExecuteScalar());
            if (var == 1)
            {
                temp = true;
            }

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

    ///////////update password..function....//////////////////
    public Boolean update_password(string id, string new_pass)
    {
        Boolean temp = false;
         //id = this.get_email_address(id);
        string query = "UPDATE [temp].[dbo].[user_admin]   SET  [password] = '"+new_pass+"' where user_name='"+id+"'";
       
            con = Data_base.connection();
            try
            {
                SqlCommand cmd = new SqlCommand(query, con);
                int var = cmd.ExecuteNonQuery();
                if (var > 0)
                    temp = true;
            }
            catch(Exception e){
            
            }
            finally{
                con.Close();
            }




        return temp;

    }
    //////////change status of service provider account/////////
    public Boolean update_account_status(string id, string status)
    {
        Boolean temp = false;
        //id = this.get_email_address(id);
        string query = "UPDATE [temp].[dbo].[user_sp]  SET [status] = '"+status+"'  WHERE  s_email_id='"+id+"'";

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

        }
        finally
        {
            con.Close();
        }




        return temp;

    }
/// <summary>
/// function to add new dish in database
/// </summary>
/// <param name="dish_name"></param>
/// <returns></returns>
    public Boolean new_dish(string dish_name)
    {
        Boolean temp = false;
        string query = "INSERT INTO [temp].[dbo].[dishes]([dish_name]) VALUES ('"+dish_name+"')";

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

        }
        finally
        {
            con.Close();
        }




        return temp;

    }

    /// <summary>
    /// function update dish name on in database
    /// </summary>
    /// <param name="id"></param>
    /// <param name="name"></param>
    /// <returns></returns>
    public Boolean update_dish(string id ,string name)
    {
        Boolean temp = false;
        string query = "UPDATE [temp].[dbo].[dishes]   SET [dish_name] = '"+name+"' WHERE dish_id='"+id+"'";

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

        }
        finally
        {
            con.Close();
        }




        return temp;

    }


}