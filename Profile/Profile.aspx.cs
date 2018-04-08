using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Profile_Profile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string id = this.Page.RouteData.Values["name"].ToString();
            this.Title = id;
               // this.Page.RouteData.Values["name"].ToString();
                //Request.QueryString["name"];
            string email = this.get_email(id);
            this.set_slider(email);
            this.get_about_us(email);
            this.get_contacts(email);
        }
        catch(Exception a){

        }
    }

    private string get_email(string id)
    {

        return new SP_Manager().get_email_address(id);

    }

    private void set_slider(string sp_id)
    {
        string query = "SELECT * from  [temp].[dbo].[sp_images] where s_email_id='" + sp_id + "'";
        SqlConnection con = Data_base.connection();
        try
        {
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader data = cmd.ExecuteReader();
            slider.DataSource = data;
            slider.DataBind();

        }
        catch (Exception e)
        {
        }
        finally
        {
            con.Close();
        }

    }

    //fucntion to get about service provider//////////////////
    private void get_about_us(string  sp_id)
    {
        string query = "SELECT [about_us]  FROM [temp].[dbo].[user_sp] where s_email_id='" + sp_id + "'";
        SqlConnection con = Data_base.connection();
        try
        {
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader data = cmd.ExecuteReader();
            if (data.Read())
            {
                text_b.InnerText = data["about_us"].ToString();
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

    private void get_contacts(string sp_id)
    {
        string query = " SELECT [address],[sp_name],[website],[Email],[admin_name],[main_city],[capacity] ,[phone_number] ,[total_halls],[hall_charges],[sub_city]  FROM [temp].[dbo].[user_sp] where user_sp.s_email_id='" + sp_id + "'";
        SqlConnection con = Data_base.connection();
        try
        {
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader data = cmd.ExecuteReader();
            if (data.Read())
            {

                address.InnerText = data.GetValue(0) + "";
                web.InnerText = data.GetValue(2) + "";
                site.HRef = data.GetValue(2) + "";
                email.InnerText = data.GetValue(3) + "";
                m_city.InnerText = data["main_city"].ToString();
                s_city.InnerText = data["sub_city"].ToString();
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