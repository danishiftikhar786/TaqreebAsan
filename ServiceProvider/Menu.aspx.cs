using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class ServiceProvider_Menu : System.Web.UI.Page
{
    private static string sp_id;
    protected void Page_Load(object sender, EventArgs e)
    {

        
         sp_id = "";
         if (Request.Cookies["Sp_cookies"].Value != null)
        {
            sp_id = Request.Cookies["Sp_cookies"].Value;
            this.show_menus(sp_id);
            this.populate_dishes(sp_id);
        }
        else 
        {
            Response.Redirect("Expired.aspx");
        }
       
        
        
       
    }
    //function to show aleady  offered menus////////////////
    private void show_menus(string emial_id)
    {
        SqlConnection con;
        con = Data_base.connection();
        try
        {
            string query = "SELECT *  FROM [temp].[dbo].[offer_menus]  where s_email_id='"+emial_id+"'";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.HasRows)
            {
                Menus.DataSource = rd;
                Menus.DataBind();
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
    //function to show dishes to add new menu //////////////
    private void populate_dishes(string email_id)
    {
        
        SqlConnection con;
        con = Data_base.connection();
        try
        {
            string query = "select temp.dbo.offered_dishes.dish_id,temp.dbo.dishes.dish_name from temp.dbo.offered_dishes inner join temp.dbo.dishes on  offered_dishes.dish_id=dishes.dish_id where offered_dishes.s_email_id='" + email_id + "'";
            SqlCommand cmd = new SqlCommand(query,con);
            SqlDataReader rd = cmd.ExecuteReader();

            while(rd.Read()){
                ListItem item = new ListItem();
                item.Text = rd["dish_name"].ToString();
                item.Value = rd["dish_id"].ToString();
                c_dishes.Items.Add(item);

            }

        }
        catch(Exception e){
        
        }
        finally{
            con.Close();
        }


    }

    //function to add new menu ////////////////////////////
    [System.Web.Services.WebMethod]
    public static string add_new_Menu(string name, string price,string ids)
    {
        string result = "error";
        string[] id = ids.Split(',');
        
        Menus obj = new Menus();
        if (name != null)
        {
            obj.Menu_name = name;
        }
        else
        {
            return "Please Enter Menu Name!";
                 
        }
        try
        {
            obj.Price= System.Convert.ToInt64(price);
            obj.Sp_id = sp_id;
           
            foreach(String n_m in id){
              obj.Dishes.Add(n_m);
         }
          if(obj.New_menu(obj)){

              result = "Successfully Added!";
          }

        }
        catch (Exception e)
        {
            return "Price must be in number";
        }

        return result;
    }

    //function to remove menu//////////////////////////////
    [System.Web.Services.WebMethod]
    public static string remove_menu(string id)
    {
        string temp = "Error in removing menu";

        if (new Menus().Delete_menu(id))
        {
            temp = "Successfully Removes!";
        }



        return temp;

    }

    //funcation to update menu perhead  charges///////////
    [System.Web.Services.WebMethod]
    public static string update_price(string menu_id,string m_price)
    {
        string message = "Error in updating price!";

      if (new Menus().Update_per_head_charges(menu_id, m_price))
        {
            message = "Charges Updated Successfully!";
        }

        return message;
    }
}