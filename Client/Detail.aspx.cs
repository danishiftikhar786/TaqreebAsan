﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class ServiceProvider_Detail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //getting booking from query string
        
        
        string id = Request.QueryString["orderid"];
        
        booking_pin.Text = id;
        get_order_info(id);
        show_menus(id);
        get_ordered_dishes(id);
      
        
    }

    //function to show book menu agaist booking in detail view
    private void show_menus(string id)
    {
        string query = "SELECT temp.dbo.offer_menus.name,temp.dbo.booking_menu.price from [temp].[dbo].[booking_menu],temp.dbo.offer_menus.menu_id inner join temp.dbo.offer_menus on temp.dbo.booking_menu.menu_id=offer_menus.menu_id where   booking_id='" + id + "'";
        SqlConnection con=Data_base.connection();
        try
        {
            
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                string menu_id = reader["menu_id"].ToString();
                this.get_menu_dishes(menu_id);
                o_m.DataSource = reader;
                o_m.DataBind();

            }
            else
            {
                menus.Visible = false;
            }
                //function call to get menu dishes
             
           
        }
        catch(Exception e){
        }
        finally{

            con.Close();
        }
    }

    //fucntion to get menu dishes

    private void get_menu_dishes(String id)
    {

        string query1 = "select temp.dbo.dishes.dish_name from  temp.dbo.dishes inner join   temp.dbo.Menu_dishes  on dishes.dish_id = Menu_dishes.offered_d_id  and Menu_dishes.menu_id =" + id;
        SqlConnection con1 = Data_base.connection();
        SqlDataReader reader;
        try
        {
            
                SqlCommand cmd1 = new SqlCommand(query1, con1);
                reader = cmd1.ExecuteReader();
                if (reader.HasRows)
                {
                m_d.DataSource = reader;
                m_d.DataBind();
               }
        }
        catch (Exception e)
        {
        }
        finally
        {
            con1.Close();
        }
    }

    //function to show ordered dishes againts booking in detail view

    private void get_ordered_dishes(string booking_id)
    {

        string query = "select   temp.dbo.booking_dish.price ,temp.dbo.booking_dish.d_id ,dishes.dish_name from temp.dbo.booking_dish inner join temp.dbo.offered_dishes on booking_dish.d_id=offered_dishes.offered_d_id inner join temp.dbo.dishes on offered_dishes.dish_id=dishes.dish_id  where booking_dish.booking_d_id='"+booking_id+"'";

        SqlConnection con = Data_base.connection();
        SqlDataReader reader;
        try
        {
            SqlCommand cmd = new SqlCommand(query, con);
            reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                dishes_ordered.DataSource = reader;
                dishes_ordered.DataBind();

            }
            else
            {
                dishes_table.Visible = false;
            }
        }
        catch(Exception e){
        }
        finally{
            con.Close();
        }
    
    }


    //function to get order info
    private void get_order_info(string id)
    {
        string query = "SELECT *  FROM [temp].[dbo].[bookings] where booking_id='"+id+"'";
        SqlConnection con = Data_base.connection();
        SqlDataReader reader;
        try
        {
            SqlCommand cmd = new SqlCommand(query, con);
            reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                o_date.Text = reader["booking_date"].ToString();
                f_date.Text = reader["function_date"].ToString();
                c_name.Text = reader["c_name"].ToString();
                guest.Text=reader["total_persons"].ToString();
                cnic.Text=reader["c_cnic"].ToString();
                number.Text = reader["c_phonenumber"].ToString();
                charges.Text = reader["booking_charges"].ToString();
                status.InnerText = reader["status"].ToString();

            }

        }
        catch(Exception e){
        }
        finally{
            con.Close();
        }
    }

    //function take status and booking if as parameters and change status
    [System.Web.Services.WebMethod]
    public static string update_status(String  s,String b_id)
    {
        string message = "Unable to change status";

        if (new Booking().booking_response(s, b_id))
        {
            message = "Booking Status in now Confirm !";
        }

        return message;

    }
}