using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Web.Script.Services;
using System.Data.SqlClient;
using System.Data;

public partial class ServiceProvider_Dishes : System.Web.UI.Page
{
    private static string sp_id;
    protected void Page_Load(object sender, EventArgs e)
    {
        //sp_id = Session["user_name"].ToString();
        sp_id="";
        if(Request.Cookies["Sp_cookies"].Value != null)
        {
            sp_id = Request.Cookies["Sp_cookies"].Value;
        }
        else
        {
            Response.Redirect("Expired.aspx");
        }
        show_dishes(sp_id);
        show_new_dishes(sp_id);

    }
    // function to delete dish  using jquery
    [System.Web.Services.WebMethod]
    public static string remove_dish(String  id)
    {
        string temp = "Error in Removing dish many be in some menu!";
        if (new Dish().remove_dish(id))
        {
            
            temp = "Dish Removed Successfully!";
            

        }

        return temp;
    }

    //function to add new dish through jquery
    [System.Web.Services.WebMethod]
    public static string New_dish(string name, string price)
    {
     
        string result ="Error";
        Dish obj = new Dish();
        obj.D_id = System.Convert.ToInt64(name);
        Boolean temp = true;
        try{
        obj.D_price = System.Convert.ToInt64(price);}
        catch(Exception e){

        result="Incorrect Price";
        temp = false;
       
        }
        obj.Sp_id =sp_id;
        if((temp)&&(obj.new_Dish(obj))){
            result = "Successfully Added!";
        }

        return result;
    }
    
    //function to update dish price through ajax call
     [System.Web.Services.WebMethod]
    public static string update_price(string d_id,string d_price)
    {
        string message = "Error in updation!";
        if (new Dish().update_price(d_id, d_price))
        {
            message = "Price successfully updated!";
        }

        return message;
    }

    private void show_dishes(string email_id)
    {
        SqlConnection con;
        con = Data_base.connection();
        try
        {
           
            SqlDataReader data;
            string query = "select  temp.dbo.offered_dishes.offered_d_id,temp.dbo.offered_dishes.perhead_price,temp.dbo.dishes.dish_name from temp.dbo.offered_dishes inner join temp.dbo.dishes on  offered_dishes.dish_id=dishes.dish_id where offered_dishes.s_email_id='" + email_id + "'";
            
                SqlCommand cmd = new SqlCommand(query, con);
                data = cmd.ExecuteReader();
                adds.DataSource = data;
                adds.DataBind();
                
            }
            catch (Exception e)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "alert('Exception');", true);
            }
            finally
            {
                con.Close();
            }
        
    }
    private void show_new_dishes(string email_id)
    {
        SqlConnection con;
        con = Data_base.connection();
        string query = "select dishes.dish_id,dishes.dish_name from  temp.dbo.dishes left join  temp.dbo.offered_dishes on  dishes.dish_id=offered_dishes.dish_id and offered_dishes.s_email_id='" + email_id + "' where s_email_id is null ";
        try
        {
            SqlCommand cmd = new SqlCommand(query,con);
            SqlDataAdapter sdt = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sdt.Fill(dt);
            dp_name.DataTextField = "dish_name";
            dp_name.DataValueField = "dish_id";
            dp_name.DataSource = dt;
            dp_name.DataBind();
            
            
            
        }
        catch (Exception e)
        {

        }
        finally
        {
            con.Close();
        }
    }

    

}