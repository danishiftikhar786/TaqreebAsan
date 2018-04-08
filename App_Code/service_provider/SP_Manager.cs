using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// Summary description for SP_Manager
/// </summary>
public class SP_Manager
{

    private string aboutus;

    public string Aboutus
    {
        get { return aboutus; }
        set { aboutus = value; }
    }
    private string t_halls;

    public string T_halls
    {
        get { return t_halls; }
        set { t_halls = value; }
    }
    private string hall_charges;

    public string Hall_charges
    {
        get { return hall_charges; }
        set { hall_charges = value; }
    }

    private string p_image;

    public string P_image
    {
        get { return p_image; }
        set { p_image = value; }
    }

    private string capacity=null;

    public string Capacity
    {
        get { return capacity; }
        set { capacity = value; }
    }
    private string timing_day=null;

    public string Timing_day
    {
        get { return timing_day; }
        set { timing_day = value; }
    }
    private string timing_night=null;

    public string Timing_night
    {
        get { return timing_night; }
        set { timing_night = value; }
    }
    private string car_parking=null;

    public string Car_parking
    {
        get { return car_parking; }
        set { car_parking = value; }
    }

    private string status;

    public string Status
    {
        get { return status; }
        set { status = value; }
    }
    private string main_city;
    public string Main_city
    {
        get { return main_city; }
        set { main_city = value; }
    }
    private string phone_number;

    public string Phone_number
    {
        get { return phone_number; }
        set { phone_number = value; }
    }
    private string ntn;

    public string Ntn
    {
        get { return ntn; }
        set { ntn = value; }
    }
    private string admin_name;

    public string Admin_name
    {
        get { return admin_name; }
        set { admin_name = value; }
    }
    private string user_login;
    private SqlConnection con;
    private string sp_name;

    public string Sp_name
    {
        get { return sp_name; }
        set { sp_name = value; }
    }
    public string User_login
    {
        get { return user_login; }
        set { user_login = value; }
    }
    private string password;

    public string Password
    {
        get { return password; }
        set { password = value; }
    }
    private string address;

    public string Address
    {
        get { return address; }
        set { address = value; }
    }
    private string web_url;

    public string Web_url
    {
        get { return web_url; }
        set { web_url = value; }
    }
    private string longitude;

    public string Longitude
    {
        get { return longitude; }
        set { longitude = value; }
    }
    private string latitude;

    public string Latitude
    {
        get { return latitude; }
        set { latitude = value; }
    }
    private string email_address;

    public string Email_address
    {
        get { return email_address; }
        set { email_address = value; }
    }

    private string sub_city;

    public string Sub_city
    {
        get { return sub_city; }
        set { sub_city = value; }
    }
	public SP_Manager()
	{
		//
		// TODO: Add constructor logic here
		//
	}


    // sp_manager function below/////////////////////////////////////////////////////////////////

    //function to create  new service provider accounts 
    public Boolean creater_New_serviceProvider( SP_Manager obj)
    {
        Boolean temp = false;
        string query = "INSERT INTO [dbo].[user_sp]([s_email_id],[password],[address],[sp_name],[website],[Email],[logitude],[latitude],[admin_name],[main_city],[status],[ntn],[carparking],[capacity],[day_timing],[night_timing],[phone_number],[sub_city],p_image,[hall_charges],[total_halls],[about_us])VALUES('" + obj.User_login + "','" + obj.Password + "','" + obj.Address + "','" + obj.Sp_name + "','" + obj.Web_url + "','" + obj.Email_address + "','" + null + "','" + null + "','" + obj.Admin_name + "','" + obj.Main_city + "','" + obj.Status + "','" + obj.Ntn + "','" + obj.car_parking + "','" + obj.capacity + "','" + obj.timing_day + "','" + obj.timing_night + "','" + obj.Phone_number + "','" + obj.Sub_city + "','" + obj.P_image + "','" + obj.Hall_charges + "','" + obj.T_halls + "','" + obj.Aboutus + "')";
        con = Data_base.connection();
        try
        {
            SqlCommand cmd = new SqlCommand(query,con);
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                temp = true;
                if (obj.t_halls != null)
                {
                    
                }

            }

        }
        catch(Exception e){
        }
        finally{

            con.Close();
        }

        return temp;
    }

    public Boolean update_location(SP_Manager obj)
    {
        Boolean temp = false;
        con = Data_base.connection();
        string query = "UPDATE [dbo].[user_sp] SET[logitude] = '"+obj.Longitude+"',[latitude] ='"+obj.Latitude+"'  WHERE s_email_id='"+obj.User_login+"'";
        try
        {
            SqlCommand cmd = new SqlCommand(query,con);
            int result = cmd.ExecuteNonQuery();
            if(result>0){
                temp = true;
            }

        }
        catch(Exception e){
        }
        finally{
            con.Close();
        }
        return temp;
    }


    public Boolean sp_login(SP_Manager obj)
    {
        Boolean temp = false;
        string query = "SELECT COUNT(*) from  temp.dbo.user_sp  where  s_email_id='" + obj.User_login + "' and password='" + obj.Password + "' and status='Active'";
        con = Data_base.connection();
        try
        {
            SqlCommand cmd = new SqlCommand(query, con);
             int var=System.Convert.ToInt32(cmd.ExecuteScalar());
             if (var == 1)
             {
                 temp = true;
             }

        }
        catch(Exception e){
        
        }
        finally{
            con.Close();
        }




        return temp;

    }
    //function to get sp data stored in database and manuplate it
    public SP_Manager get_Sp_data(SP_Manager obj)
    {

        string query = "SELECT * FROM [dbo].[user_sp] where s_email_id='"+obj.User_login+"'";
        con = Data_base.connection();
        try
        {
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader reader = cmd.ExecuteReader();
            
                if (reader.Read())
                {
                    obj.Address = reader["address"].ToString();
                    obj.Sp_name = reader["sp_name"].ToString();
                    obj.Email_address = reader["Email"].ToString();
                    obj.Web_url = reader["website"].ToString();
                    obj.Longitude = reader["logitude"].ToString();
                    obj.Latitude = reader["latitude"].ToString();
                    obj.capacity = reader["capacity"].ToString();
                    obj.Car_parking = reader["carparking"].ToString();
                    obj.main_city = reader["main_city"].ToString();
                    obj.timing_day = reader["day_timing"].ToString();
                    obj.Timing_night = reader["night_timing"].ToString();
                    obj.admin_name = reader["admin_name"].ToString();
                    obj.Hall_charges = reader["hall_charges"].ToString();
                    obj.Aboutus = reader["about_us"].ToString();

               }
            

        }
        catch (Exception e)
        {
            obj = null;
        }
        finally
        {
            con.Close();
        }



        return obj;
    }

    public string get_email_address(string name)
    {

        string query = "select s_email_id from [temp].[dbo].user_sp  where user_sp.sp_name LIKE '"+name+"'";
        con = Data_base.connection();
        try
        {
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                email_address = reader.GetString(0);
            }
        }
        catch (Exception e)
        {
        }
        finally
        {
            con.Close();
        }

        return email_address;
    }

    public string get_location(string email)
    {
        string location="0,0";
        string query = "SELECT  [temp].[dbo].user_sp.logitude,[temp].[dbo].user_sp.latitude from [temp].[dbo].user_sp where [temp].[dbo].user_sp.s_email_id='"+email+"'";
        con = Data_base.connection();
        try
        {
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read() && reader.GetString(0)!=null)
            {
                location = reader.GetString(0);
                location +=","+reader.GetString(1);
            }
        }
        catch (Exception e)
        {
        }
        finally
        {
            con.Close();
        }

        return location;
    }

    //function to check hall missing data//////////////////////////////
    public Boolean check_hall_data(string email)
    {
        Boolean temp = false;
        string query = "SELECT *  FROM [temp].[dbo].[user_sp]  where [temp].[dbo].user_sp.s_email_id='" + email + "'";
        con = Data_base.connection();
        try
        {
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
                temp = true;

        }catch(Exception e){
        }
        finally{
            con.Close();
        }

        return temp;
    }
    


    /////////////////////////////////////////////////////functions to update gernal info////////////////////////////////////////////
    //function to update name
    public Boolean update_SP_name(string id, string name)
    {
        //id = this.get_email_address(id);
        string query = "update  [temp].[dbo].user_sp set sp_name='" + name + "' where s_email_id='" + id + "';";
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

        }
        finally
        {
            con.Close();
        }




        return temp;
    }
    //function to update password
    public Boolean update_password(string id,string old ,string n)
    {
        //id = this.get_email_address(id);
        string query = "update  [temp].[dbo].user_sp set password='"+n.GetHashCode()+"' where s_email_id='"+id+"';";
        Boolean temp = false;
        if (this.check_old_pass(id, old))
        {
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


        }

        return temp;
    }
    //function to check old password
    public Boolean check_old_pass(string id,string pass)
    {
        Boolean temp = false;
         
        string query = "select count(*) from [temp].[dbo].user_sp where s_email_id='"+id+"' and password ='"+pass.GetHashCode()+"';";
        con = Data_base.connection();
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

        }
        finally
        {
            con.Close();
        }




        return temp;
    }
    //function to update address
    public Boolean update_address(string id, string address)
    {
        //id = this.get_email_address(id);
        string query = "update  [temp].[dbo].user_sp set address='" + address + "' where s_email_id='" + id + "';";
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

            }
            finally
            {
                con.Close();
            }


        

        return temp;
    }
    //function to update capacity
    public Boolean update_capacity(string id, string capacity)
    {
        //id = this.get_email_address(id);
        string query = "update  [temp].[dbo].user_sp set capacity='" + capacity + "' where s_email_id='" + id + "';";
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

        }
        finally
        {
            con.Close();
        }




        return temp;
    }
    //function to update web url
    public Boolean update_web_url(string id, string url)
    {
        //id = this.get_email_address(id);
        string query = "update  [temp].[dbo].user_sp set website='" + url + "' where s_email_id='" + id + "';";
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

        }
        finally
        {
            con.Close();
        }




        return temp;
    }
    //function to update email
    public Boolean update_email(string id, string email)
    {
        //id = this.get_email_address(id);
        string query = "update  [temp].[dbo].user_sp set Email='" + email+ "' where s_email_id='" + id + "';";
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

        }
        finally
        {
            con.Close();
        }




        return temp;
    }
    //function to update single hall charges 
    public Boolean update_hall_charges(string id, string charges)
    {
        Boolean temp = false;
        string query = "UPDATE [temp].[dbo].[user_sp] set  [hall_charges] = '"+charges+"' WHERE  s_email_id='"+id+"'";
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

    public string get_new_order_count(string id)
    {
        string count = "0";

        string query = "select COUNT(booking_id) FROM [temp].[dbo].[bookings] where sp_id='"+id+"' and status='new'";
        con = Data_base.connection();
        try
        {
            SqlCommand cmd = new SqlCommand(query, con);
            int var = System.Convert.ToInt32(cmd.ExecuteScalar());
                count=var+"";
        }
        catch (Exception e)
        {
        }
        finally
        {
            con.Close();
        }




        return count;
    }

    //function to getemail address against user name
    public string get_email_user_name(string name)
    {
        string query = "SELECT Email  FROM [temp].[dbo].[user_sp] where s_email_id='" + name + "'";
        con = Data_base.connection();
        try
        {
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                email_address = reader.GetString(0);
            }
        }
        catch (Exception e)
        {
        }
        finally
        {
            con.Close();
        }

        return email_address;


    }

    //funtion update  about us data of service provider
    public Boolean update_about_us( string id,string data)
    {
        Boolean temp = false;
        string query = "UPDATE [temp].[dbo].[user_sp] SET [about_us] = '"+data+"' WHERE  s_email_id='"+id+"'";
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