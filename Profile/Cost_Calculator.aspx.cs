using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Profile_Cost_Calculator : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String data = this.Page.RouteData.Values["name"].ToString(); ;
        if (data != null)
        {
            this.Title = data + "/CostCalculator";
            data = new SP_Manager().get_email_address(data);
           
            this.get_menus(data);
            this.get_dishes(data);
            this.get_hall_charges(data);
            
               s_id.Text = data;
            
        }

    }
     
    //getting sp_id_ dishes

    private void get_dishes(string sp_id)
    {
        string dishes = "";
        string query = "select   offered_d_id ,perhead_price,dish_name from temp.dbo.offered_dishes  inner join temp.dbo.dishes on offered_dishes.s_email_id='"+sp_id+"' and offered_dishes.dish_id=dishes.dish_id;";
        SqlConnection con = Data_base.connection();
        try
        {
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader rd = cmd.ExecuteReader();
            while(rd.Read()){
                //ListItem item = new ListItem();
               // item.Text = rd["dish_name"].ToString() + "-----------------------------------------------(" + rd["perhead_price"].ToString() + "RS)";
                //item.Value = rd["offered_d_id"].ToString();
                dishes += "<div class='checkbox'><input id='" + rd["offered_d_id"].ToString() + "' title='" + rd["perhead_price"].ToString() + "' type='checkbox' onchange='dish_check(this); slected_dishes(this)'/>" + rd["dish_name"].ToString() + "----------------------------------------------------" + rd["perhead_price"].ToString() + "RS</div>";
                //item.Attributes["perhead"] = rd["perhead_price"].ToString();
                //Menu.Items.Add(item);
            }
            df.Text= dishes;
            
        }
        catch (Exception e)
        {
        }
        finally
        {
            con.Close();
        }


    }

    private void get_menus(string sp_id)
    {
        string menu = "<select id='menu' class='form-control' onchange='cost_menu(this);cost_menu_load(this)'><option value='0' perhead='0'>Select menu.......</option>";
        string query = "select * from [temp].[dbo].[offer_menus] where s_email_id='"+sp_id+"'";
        SqlConnection con = Data_base.connection();
        try
        {
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader rd = cmd.ExecuteReader();
            
            while (rd.Read())
            {
                //ListItem item = new ListItem();
                //item.Text = rd["name"].ToString();
                //item.Value = rd["menu_id"].ToString();
                //item.Attributes["perhead"] = rd["per_head"].ToString();
                //menus_1.Items.Add(item);
                menu += "<option value='" + rd["menu_id"].ToString() + "' perhead='" + rd["per_head"].ToString() + "'>" + rd["name"].ToString() + "</option>";
            }

            menu += "</select>";
            mu.Text = menu;
        }
        catch (Exception e)
        {
        }
        finally
        {
            con.Close();
        }
    }

    private void get_hall_charges(string sp_id)
    {//function to display hall charges of specific  service provider

        string query = "SELECT [hall_charges] FROM [temp].[dbo].[user_sp] where s_email_id='"+sp_id+"'";
         SqlConnection con = Data_base.connection();
         try
         {
             SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader data = cmd.ExecuteReader();
            if (data.Read())
            {
                hall_charges.Text=data["hall_charges"].ToString();
            }
            else
            {

            }

         }
         catch (Exception e)
         {
         }
         finally
         {
             con.Close();
         }


    }


    //webservice to make booking
    [System.Web.Services.WebMethod]
    public static string make_booking(string sp_id,string client_info,string menu_id,string menu_price,string dish_ids,string dish_prices,string function_date,string client_id,string grandtotal,string hall_rent,string f_time,string f_type)
    {
        string[] d_id=null;
        string[] d_prices=null;
        string[] client_data = client_info.Split(',');
        int menu_odered=0;
        //check dishes
        if (new Client_Manager().check_user_id(client_id))
        {
            
                
            
            if (menu_id != "0")
            {
                menu_odered = 1;

            }
            Booking obj;
            if (dish_ids != "")
            {
                 d_id = dish_ids.Split(',');
                 d_prices = dish_prices.Split(',');
                 obj = new Booking(d_id.Length, menu_odered);
                 for (int i = 0; i < d_id.Length; i++)
                 {

                     //setting selected dishes information in booing object
                     obj.Dish[i].D_id = d_id[i];
                     obj.Dish[i].D_price = d_prices[i];

                 }
            }
            else
            {
                 obj = new Booking(0, menu_odered);
            }
            //setting client id for booking record
            obj.Client_id = client_id;
            //setting value in booking client object
            obj.Booking_client.Name = client_data[3];
            obj.Booking_client.Cnic = client_data[2];
            obj.Booking_client.Email_address = client_data[0];
            obj.Booking_client.Phone_number = client_data[1];
            obj.Sp_id = sp_id;
            obj.Sp_email_address = new SP_Manager().get_email_user_name(sp_id);
            obj.Hall_charges = hall_rent;
            //setting servcie provider for booking record
            //obj.Sp_id = new SP_Manager().get_email_address("");
            
            //setting selected menu information in booking object
            if (menu_odered == 1)
            {

                obj.Menu[0].Menu_id = menu_id;
                obj.Menu[0].Menu_price = menu_price;
            }
            //getting current date and to note booking order date and time
            DateTime now = DateTime.Now;
            string date = now.GetDateTimeFormats('d')[0];
            string time = now.GetDateTimeFormats('t')[0];

            //setting function date and booking date
            obj.Booking_date = date +" ("+ time+")";
            obj.Function_date = function_date;
            obj.Function_type=f_type;
            obj.Function_time=f_time;
            //setting booking grand total
            obj.Total_persons = client_data[4];
            obj.Booking_charges = grandtotal;
            if (obj.make_booking(obj))
            {

                return "0";
            }
        }
        else
        {
            return "1";
        }
        
            return "2";

    }
}