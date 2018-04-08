using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    public ListView da;
   // public  static string capcity="";
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "TaqreebAsan/Default";
        da = profile;

        //if page is loaded for first time
        if (!this.IsPostBack)
        {

            try
            {
                //getting query string passed form mainsearch page 
                //string city = this.Page.RouteData.Values["cityid"].ToString();
                string city = Request.QueryString["cityid"];//getting city query string
                //string persons = this.Page.RouteData.Values["persons"].ToString();
                string persons=Request.QueryString["persons"];//getting  perons query string value
                //string parking = this.Page.RouteData.Values["parking"].ToString();
                string parking =Request.QueryString["parking"];//getting parking queyr string value
                //string timing = this.Page.RouteData.Values["timing"].ToString();
                string timing =Request.QueryString["timing"];//getting timing queyr string value
                
                if (city != null || persons != null || parking != null || timing != null)//condition execute if redirected from main search page
                {
                    this.search_query_string(this.query_maker(city, persons, parking, timing));

                }
                else
                {
                    show_data();
                }

            }
            catch(Exception a){
                a.ToString();
                show_data();
            }
        }
        else
        {
            show_data();
        }

       
    }

    //show all saved data  of all service provider
    private void show_data()
    {
        SqlConnection con = Data_base.connection();
        string query = "SELECT *  FROM [temp].[dbo].[user_sp] where status='Active'";
        try
        {
            SqlCommand cmd =new SqlCommand(query,con);
             SqlDataReader data=cmd.ExecuteReader();
             profile.DataSource = data;
             profile.DataBind();
             profile.Sort("capacity", SortDirection.Descending);
            
        }
        catch(Exception e){

        }
        finally{
            try
            {
                con.Close();
            }
            catch(Exception e){
            }
        }

    }

    //fucntion called for word search 
    private void query_search(string param)
    {
        SqlConnection con = Data_base.connection();
        string query = "SELECT * from  [temp].[dbo].user_sp where (user_sp.main_city LIKE '%" + param + "%' OR user_sp.sp_name LIKE '%" + param + "%' )and status='Active' ;";
        try
        {
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader data = cmd.ExecuteReader();
            profile.DataSource = data;
            profile.DataBind();



        }
        catch (Exception e)
        {
        }
        finally
        {
            con.Close();

        }

    }


    protected void OnPagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        (profile.FindControl("DataPager1") as DataPager).SetPageProperties(e.StartRowIndex,e.MaximumRows,false);
        this.show_data();
    }

    protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
    {
        Console.WriteLine("checked");
        filter();
    }
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        filter();
    }
    protected void CheckBox3_CheckedChanged(object sender, EventArgs e)
    {
        filter();
    }
    protected void CheckBox4_CheckedChanged(object sender, EventArgs e)
    {
        filter();
    }


    //method called for search filter on deafult page///////
    private void filter()
    {
        string query = "SELECT *  FROM [temp].[dbo].[user_sp]";
        string extend_query = "";
        Boolean yes = false;
        Boolean and = false;
        Boolean timing = false;
        if(CheckBox1.Checked)
        {
            extend_query += "where capacity>=100 and capacity <=500 ";
            and = true;
        }
        if (CheckBox2.Checked)
        {
            if (and)
            {
                extend_query += "and  capacity>=500 and capacity <=700  ";
            }
            else
            {
                extend_query += "where capacity>=500 and capacity <=700 ";
                and = true;
            }
            
        }
        if (CheckBox3.Checked)
        {
            if (and)
            {
                extend_query += "and  capacity>=700 and capacity <=1000  ";
            }
            else
            {
                extend_query += "where capacity>=700 and capacity <=1000 ";
                and = true;
            }
        }

        if (CheckBox4.Checked)
        {
            if (and)
            {
                extend_query += "and  capacity>=1000";
            }
            else
            {
                extend_query += "where capacity>=1000";
                and = true;
            }
        }
       /* if (CheckBox5.Checked)
        {
            if(and){
                extend_query += "and  carparking='yes'";
                yes = true;
            }
            else{
                extend_query += "where carparking='yes'";
                yes = true;
            }
        }
        if(CheckBox6.Checked)
        {
            if (and)
            {
                if (yes)
                {
                    extend_query += "or  carparking='no'";
                    yes = true;
                }
                else
                {
                    extend_query += " and carparking='no'";
                    yes = true;
                }

            }
            else
            {
                if (yes)
                {
                    extend_query += "or  carparking='no'";
                    yes = true;
                }
                else
                {
                    extend_query += " where  carparking='no'";
                    yes = true;
                }


            }

        }*/

        //check for shifts day timing
        if (CheckBox7.Checked)
        {
            if (and)
            {
                if (timing)
                {
                    extend_query += "or  day_timing='yes'";
                    timing = true;
                }
                else
                {
                    extend_query += " and day_timing='yes'";
                    timing = true;
                }

            }
            else
            {
                if (timing)
                {
                    extend_query += "or  day_timing='yes'";
                    timing = true;
                }
                else
                {
                    extend_query += " where  day_timing='yes'";
                    timing = true;
                }


            }

        }
        //check for shifts evening timing
        if (CheckBox8.Checked)
        {
            if (and)
            {
                if (timing)
                {
                    extend_query += "or  night_timing='yes'";
                    timing = true;
                }
                else
                {
                    extend_query += " and night_timing='yes'";
                    timing = true;
                }

            }
            else
            {
                if (timing)
                {
                    extend_query += "or  night_timing='yes'";
                    timing = true;
                }
                else
                {
                    extend_query += " where  night_timing='yes'";
                    timing = true;
                }


            }

        }
        //if for car parking
        if(RadioButtonList1.SelectedIndex!=-1){

            string val = RadioButtonList1.SelectedValue.ToString();
            if (val == "yes")
            {
                if (and)
                {
                    extend_query += "and  carparking='yes'";
                    yes = true;
                }
                else
                {
                    extend_query += "where carparking='yes'";
                    yes = true;
                }
            }
            else if (val == "no")
            {
                if (yes)
                {
                    extend_query += "or  carparking='no'";
                    yes = true;
                }
                else
                {
                    extend_query += " where  carparking='no'";
                    yes = true;
                }
            }
        }



        SqlConnection con = Data_base.connection();
        try
        {
            SqlCommand cmd = new SqlCommand(query + extend_query + "and status='Active'", con);
            SqlDataReader data = cmd.ExecuteReader();
            profile.DataSource = data;
            profile.DataBind();

        }
        catch (Exception e)
        {
        }
        finally
        {
            con.Close();

        }
    }
    protected void CheckBox5_CheckedChanged(object sender, EventArgs e)
    {
        filter();
    }
    protected void CheckBox6_CheckedChanged(object sender, EventArgs e)
    {
        filter();
    }
    protected void search_button_Click(object sender, EventArgs e)
    {
         
        this.query_search(searchterm.Text);
    }
    protected void CheckBox7_CheckedChanged(object sender, EventArgs e)
    {
        filter();
    }
    protected void CheckBox8_CheckedChanged(object sender, EventArgs e)
    {
        filter();
    }

    //slider function
    [System.Web.Services.WebMethod]
    public static string  range_slider(string range)
    {

        string message="success";
      //  capcity = range;
        

        return message;

    }

    //function to search for data passed in query string
    private void search_query_string(string q1 )
    {
        Boolean empty = false;
        SqlConnection con = Data_base.connection();
        string query = q1;
        try
        {
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader data = cmd.ExecuteReader();
            if (data.HasRows)
            {
                profile.DataSource = data;
                profile.DataBind();
            }
            else
            {
                empty = true;
            }



        }
        catch (Exception e)
        {
        }
        finally
        {
            con.Close();
            if (empty)
            {
                this.show_data();
            }

        }

    }


    //function to make query of values passed in query string and returned a  full generated query  against values
    private string query_maker(string city, string perons, string parking, string timing)
    {
        Boolean  temp=false;
        Boolean and = false;
        string query = "SELECT *  FROM [temp].[dbo].[user_sp] ";
        if (city != "0")
        {
            temp = true;
            and =true;
            query += " where  main_city='" + city+"'";

        }
        if (perons != "0")
        {
            if (temp)
            {
               
                    query += " and capacity >=" + perons;
                
            }
            else
            {
                query += " where  capacity >=" + perons;
                temp = true;
            }
        }
        //if (parking != "0")
        //{
        //    if (temp)
        //    {
        //        query += "where  ";

        //    }
        //}
        if (timing != "0")
        {
            if (temp)
            {
                if (timing == "3")
                {
                    query += " and day_timing='yes' or night_timing ='yes'";
                }
                if (timing == "1")
                {
                    query += " and day_timing='yes' ";
                }
                if (timing == "2")
                {
                    query += " and night_timing ='yes' ";
                }
            }
            else
            {

                if (timing == "3")
                {
                    query += " where day_timing='yes' or night_timing ='yes'";
                }
                if (timing == "1")
                {
                    query += " where day_timing='yes'";
                }
                if (timing == "2")
                {
                    query += " where night_timing ='yes'";
                }
            }


        }
        if(temp)
        query=query+"and status='Active'";
        else
            query = query + "where status='Active'";
        return query  ;
    }

    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        filter();
    }

    //guest capactiy sorting////////////////////////////////////
    protected void Unnamed1_Click(object sender, EventArgs e)
    {
        SqlConnection con = Data_base.connection();
        string query = "SELECT *  FROM [temp].[dbo].[user_sp]  where status='Active'  ORDER BY  capacity Asc";
        try
        {
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader data = cmd.ExecuteReader();
            profile.DataSource = data;
            profile.DataBind();
           

        }
        catch (Exception ex)
        {

        }
        finally
        {
            try
            {
                con.Close();
            }
            catch (Exception eb)
            {
            }
        }


    }
    
   
    protected void sort_hall_charges_Click(object sender, EventArgs e)
    {
        SqlConnection con = Data_base.connection();
        string query = "SELECT *  FROM [temp].[dbo].[user_sp]  where status='Active' order by  hall_charges asc";
        try
        {
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader data = cmd.ExecuteReader();
            profile.DataSource = data;
            profile.DataBind();


        }
        catch (Exception ex)
        {

        }
        finally
        {
            try
            {
                con.Close();
            }
            catch (Exception eb)
            {
            }
        }


    }
}