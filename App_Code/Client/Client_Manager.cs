using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Client_Manager
/// </summary>
public class Client_Manager
{

    //setter getter 
    private string user_name;

    public string User_name
    {
        get { return user_name; }
        set { user_name = value; }
    }
    private string address;

    public string Address
    {
        get { return address; }
        set { address = value; }
    }
    private string s_email;

    public string S_email
    {
        get { return s_email; }
        set { s_email = value; }
    }

   
    private string password;

    public string Password
    {
        get { return password; }
        set { password = value; }
    }
    private string fname;

    public string Fname
    {
        get { return fname; }
        set { fname = value; }
    }
    private string lname;

    public string Lname
    {
        get { return lname; }
        set { lname = value; }
    }
    
    private string city;

    public string City
    {
        get { return city; }
        set { city = value; }
    }
    private string cnic;

    public string Cnic
    {
        get { return cnic; }
        set { cnic = value; }
    }
    private string phone_number;

    public string Phone_number
    {
        get { return phone_number; }
        set { phone_number = value; }
    }
    //databse variable
    private SqlConnection con;








    //constructors..........................
	public Client_Manager()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    //function to make user login
    public Boolean login(string username, string pass)
    {
        Boolean temp = false;
        
        string query="select COUNT(*) from [temp].[dbo].[user_client] where emial_id='"+username+"' and password='"+pass+"'";
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
        catch(Exception e){
            e.ToString();
        }
        finally{
            con.Close();
        }


        return temp;
    }

    //fucntion to create new user

    public  Boolean new_user(Client_Manager obj )
    {
        
        Boolean temp = false;
        string query = "INSERT INTO [dbo].[user_client]([emial_id],[password],[fname],[lname],[phone_number],[cnic],[city],[email_address]) VALUES('" + obj.User_name + "','" + obj.Password + "','" + obj.fname + "','" + obj.lname + "','" + obj.Phone_number + "','" + obj.Cnic + "','" + obj.City+ "','" + obj.s_email + "')";
        con = Data_base.connection();
        try
        {

            SqlCommand cmd = new SqlCommand(query, con);
            int i = cmd.ExecuteNonQuery();
            if (i > 0)//query execute if new user created
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
    //function to check user_id
    public Boolean check_user_id(string email)
    {
        Boolean temp = false;
        string query="select count(emial_id)   FROM [temp].[dbo].[user_client]  where emial_id='"+email+"'";
        con = Data_base.connection();
        try
        {
            SqlCommand cmd = new SqlCommand(query, con);
            int var = System.Convert.ToInt32(cmd.ExecuteScalar());//if id already exist it returns 1 else 0
            if (var == 1)
            {
                temp = true;
            }


        }
        catch (Exception e)
        {
            temp = true;
        }
        finally
        {
            con.Close();
        }


        return temp;
    }
    //function to update user name
    public void update_name()
    {

    }
    //fucntion to update profile pic
    public void change_profile_pic()
    {

    }

    //function to return cleint object against a request
    public Client_Manager get_client_info(string username)
    {
        Client_Manager obj = new Client_Manager(); ;
        string query = "SELECT [fname],[lname], [phone_number],[cnic],[city],[email_address],[address]FROM [temp].[dbo].[user_client] where emial_id='" + username + "'";
        con = Data_base.connection();
        try
        {
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {

                obj.fname = reader["fname"].ToString();
                obj.lname = reader["lname"].ToString();
                obj.Phone_number = reader["phone_number"].ToString();
                obj.Cnic = reader["cnic"].ToString();
                obj.City = reader["city"].ToString();
                obj.s_email = reader["email_address"].ToString();
                //obj.Address = reader["address"].ToString();

            }



        }
        catch(Exception e){
            e.ToString();
        }
        finally{
            con.Close();
        }

        return obj;

    }
    
}