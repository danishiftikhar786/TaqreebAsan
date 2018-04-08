using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Admin_New_Dish : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.show_dishes();

    }
    public void show_dishes()
    {
        string query = "SELECT *  FROM [temp].[dbo].[dishes]";
        SqlConnection con = Data_base.connection();
        try
        {
            SqlDataReader data;
            SqlCommand cmd = new SqlCommand(query, con);
            data = cmd.ExecuteReader();
            dishes.DataSource = data;
            dishes.DataBind();
        }
        catch (Exception e)
        {
        }
        finally
        {
            con.Close();
        }
    }

    //funciton to add new  dish /////////////////////////////
    [System.Web.Services.WebMethod]
    public static string dish_name(string name)
    {
        string message = "Unable to add new dish already in database";

        if (new Admin_Manager().new_dish(name.ToUpper()))
        {
            message = "Dish added successfully!";
        }


        return message;
    }


   // //funtion to update dish name/////////////////
    [System.Web.Services.WebMethod]
    public static string update_dish_name(string id,string name)
    {
        string message = "Unable to update dish name";

        if (new Admin_Manager().update_dish(id,name.ToUpper()))
        {
            message = "Dish name updated  successfully!";
        }


        return message;
    }

}