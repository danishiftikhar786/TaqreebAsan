using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Profile_Contacts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
         String data = Request.QueryString["name"];
        if (data != null)
        {
            this.Title =data+"/ContactUs";
            data = new SP_Manager().get_email_address(data);

            this.get_contacts(data);
        }
    }

    private void get_contacts(string sp_id)
    {
        string query = " SELECT [address],[sp_name],[website],[Email],[admin_name],[main_city],[capacity] ,[phone_number] ,[total_halls],[hall_charges],[sub_city]  FROM [temp].[dbo].[user_sp] where user_sp.s_email_id='" + sp_id + "'";
        SqlConnection con = Data_base.connection();
        try
        {
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader data = cmd.ExecuteReader();
            if(data.Read()){

                address.InnerText = data.GetValue(0)+"";
                web.InnerText = data.GetValue(2) + "";
                site.HRef = data.GetValue(2) + "";
                email.InnerText = data.GetValue(3) + "";
                m_city.InnerText=data["main_city"].ToString();;
                s_city.InnerText=data["sub_city"].ToString();;
                capacity.InnerText = data["Capacity"].ToString();
                phone_number.Text = data["phone_number"].ToString();
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
}