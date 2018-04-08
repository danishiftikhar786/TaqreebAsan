using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Booking
/// </summary>
public class Booking
{
     // booking variables



    private string hall_charges;

    public string Hall_charges
    {
        get { return hall_charges; }
        set { hall_charges = value; }
    }

    private string booking_date;
    public string Booking_date
    {
        get { return booking_date; }
        set { booking_date = value; }
    }
    private string function_date;

    public string Function_date
    {
        get { return function_date; }
        set { function_date = value; }
    }
    private string booking_charges;

    public string Booking_charges
    {
        get { return booking_charges; }
        set { booking_charges = value; }
    }
    private string total_persons;

    public string Total_persons
    {
        get { return total_persons; }
        set { total_persons = value; }
    }
    private string client_id;

    public string Client_id
    {
        get { return client_id; }
        set { client_id = value; }
    }
    private string sp_id="";

    public string Sp_id
    {
        get { return sp_id; }
        set { sp_id = value; }
    }
    private string function_time;

    public string Function_time
    {
        get { return function_time; }
        set { function_time = value; }
    }
    private string function_type;

    private string sp_email_address;

    public string Sp_email_address
    {
        get { return sp_email_address; }
        set { sp_email_address = value; }
    }
    private string client_email_address;

    public string Client_email_address
    {
        get { return client_email_address; }
        set { client_email_address = value; }
    }

    public string Function_type
    {
        get { return function_type; }
        set { function_type = value; }
    }

    //booking id
    private int booking_id;


    //booking include dishes
    private Booking_dish []dish;

    public Booking_dish []Dish
    {
        get { return dish; }
        set { dish = value; }
    }
    //booking includes menus
    private Booking_menu []menu=null;

    public Booking_menu []Menu
    {
        get { return menu; }
        set { menu = value; }
    }
    //booking include client

    private Bookingclient booking_client = null;

    public Bookingclient Booking_client
    {
        get { return booking_client; }
        set { booking_client = value; }
    }
    

    
    //database variable
    private SqlConnection con;

	public Booking(int d,int m)
	{
        dish=new Booking_dish[d];
        menu = new Booking_menu[m];
        booking_client = new Bookingclient();
		//
		// TODO: Add constructor logic here
		//


        try
        {
            for (int i = 0; i < d; i++)
            {
               
                dish[i] = new Booking_dish();
            }
            for (int j = 0; j < m; j++)
            {
                
                menu[j] = new Booking_menu();
            }
        }
        catch(Exception e){
        }

	}

    public Booking()
    {
    }

   //function to make booking
    public Boolean make_booking(Booking booking)
    {
        Boolean temp = false;
        string query = "INSERT INTO [temp].[dbo].[bookings]([client_id],[sp_id],[booking_charges],[booking_date],[function_date],[total_persons],[amount_paid],[payment_date],[status],[comments],[c_name],[c_email],[c_cnic],[c_phonenumber],[hall_rent],[function_type],[function_timing]) VALUES('" + booking.client_id + "','" + booking.sp_id + "','" + booking.booking_charges + "','" + booking.booking_date + "','" + booking.function_date + "','" + booking.total_persons + "','0','0','new','','" + booking.booking_client.Name + "','" + booking.booking_client.Email_address + "','" + booking.booking_client.Cnic + "','" + booking.booking_client.Phone_number + "','" + booking.Hall_charges + "','"+booking.Function_type+"','"+booking.Function_time+"')";

        //this fucntion is called when booking   is made
        //check  weather  dish is include in booking or not
        con = Data_base.connection();
        try
        {
            SqlCommand cmd = new SqlCommand(query, con);
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                temp = true;

                //booking is created then blew condition is executed

                this.booking_id = this.get_booking_id(booking.sp_id, booking.client_id, booking.booking_date);
                
                if (!dish.Equals(null))
                {    
                    //insert all booking dishes in database
                    for (int dish_count = 0; dish_count < dish.Length; dish_count++)
                    {
                        query = "INSERT INTO [temp].[dbo].[booking_dish]([d_id],[booking_d_id],[price])VALUES(" + dish[dish_count].D_id + ",'" + this.booking_id+ "','" + dish[dish_count].D_price+ "')";
                        cmd = new SqlCommand(query, con);
                         i = cmd.ExecuteNonQuery();
                         if (i > 0)
                             temp = true;
                    }

                }

                //check  weather  dish is include in booking or not
                if (!menu.Equals(null))
                {
                    //insert all booking menus into database

                    
                    for (int menu_count = 0; menu_count < menu.Length; menu_count++)
                    {
                        query = "INSERT INTO [temp].[dbo].[booking_menu]([menu_id],[booking_id],[price]) VALUES(" + menu[menu_count].Menu_id + "," + this.booking_id + "," + menu[menu_count].Menu_price + ")";
                        cmd = new SqlCommand(query, con);
                        i = cmd.ExecuteNonQuery();
                        if (i > 0)
                            temp = true;

                    }



                }

                //sending email alert to sp that a booking  request has been genrated
                String body = "Booking Alter\n It is to inform you that a Booking has been made against for your Services \n"+
                "Booing ID="+this.booking_id+"\nClient Name="+booking.Booking_client.Name+"\nBooking Date="+booking.Booking_date+"\n For futher details please  vistit your Account and  reply against this booking .\n"+
                "Reagards TaqreebAsan Team "+
                
               "Contact Us at =<a href='#'>contact@taqreebasan.com</a> \ns";
                string sp_mail=new SP_Manager().get_email_user_name(Sp_id);
               // new Booking_email().SendMail_booking("danishiftikhar60@gmail.com", body);

                //sending email alert to client who actullay make booking request

                //body = "It to inform you that a booking has been made from this email address to asdasd";
                Booking_email b_mails = new Booking_email();
                b_mails.Client_mail = booking.Booking_client.Email_address;
                b_mails.Sp_mail1=booking.Sp_email_address;
                b_mails.Body_for_client = "Booking Alert:\nIt to inform you that a booking has been made from this From  your Account\n Account Id= " + booking.client_id + "Event Booking Date=" + booking.function_date + "\n Booking Id=" + booking.booking_id + "\nFor any Further information please visit your Account.\nReagards TaqreebAsan Team";
                b_mails.Body_for_sp = body;
                b_mails.SendMail_booking();
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
        //returning value

    }

    //function to cancle booking
    public void cancle_booking()
    {

    }

    //function to update booking

    public void update_booking()
    {

    }

    
    
    //function to get booking id

    public int  get_booking_id(string sp_id,string c_id,string booking_date)
    {
        int var=0;
        string query2 = "SELECT booking_id  FROM [temp].[dbo].[bookings] where client_id='"+c_id+"'and [sp_id]='"+sp_id+"' and [booking_date] ='"+booking_date+"'";

        SqlConnection con1 = Data_base.connection();
        try
        {
            SqlCommand cmd1 = new SqlCommand(query2, con1);
             var=System.Convert.ToInt32(cmd1.ExecuteScalar());


        }
        catch (Exception e)
        {

            e.ToString();
        }
        finally
        {
            con1.Close();
        }

        return var;
    }


    //function for service provide to  response against booking request

    public Boolean booking_response(string status,string booking_id)
    {
        Boolean temp = false;
        String query = "UPDATE [temp].[dbo].[bookings] set [status] = '"+status+"' WHERE  booking_id="+booking_id;
        con = Data_base.connection();
        try
        {
            SqlCommand cmd = new SqlCommand(query,con);
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