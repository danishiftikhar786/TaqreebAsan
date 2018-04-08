using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Profile_Menu_dishes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string id = Request.QueryString["id"];
        get_menus(id);

    }

    private void get_menus(string menu_id)
    {

        string query = "select temp.dbo.dishes.dish_name from  temp.dbo.dishes inner join   temp.dbo.Menu_dishes  on dishes.dish_id = Menu_dishes.offered_d_id  and Menu_dishes.menu_id =" + menu_id;
        SqlConnection con = Data_base.connection();
        try
        {
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader data = cmd.ExecuteReader();
            menu_dishes.DataSource = data;
            menu_dishes.DataBind();

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