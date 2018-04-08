using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Menu
/// </summary>
public class Menus
{

    private string query;
    private ArrayList dishes = new ArrayList();
    private SqlConnection con;
    private SqlCommand cmd;

    public ArrayList Dishes
    {
        get { return dishes; }
        set { dishes = value; }
    }
   

    private long price;

    public long Price
    {
        get { return price; }
        set { price = value; }
    }
    private String sp_id;

    public String Sp_id
    {
        get { return sp_id; }
        set { sp_id = value; }
    }
    private String menu_name;

    public String Menu_name
    {
        get { return menu_name; }
        set { menu_name = value; }
    }

    
	public Menus()
	{
		//
		// TODO: Add constructor logic here
		//
        
	}

    public Boolean New_menu(Menus obj)
    {
        Boolean temp = false;

        query = "INSERT INTO [dbo].[offer_menus]([name],[per_head],[s_email_id]) VALUES('"+obj.Menu_name+"','"+obj.Price+"','"+obj.Sp_id+"')";
        con = Data_base.connection();
        try
        {
           
            SqlCommand cmd = new SqlCommand(query, con);
            int var = cmd.ExecuteNonQuery();
            if (var > 0)
            {
                query="select temp.dbo.offer_menus.menu_id from temp.dbo.offer_menus where name='"+obj.Menu_name+"' and per_head='"+obj.Price+"' and s_email_id='"+obj.Sp_id+"'";
                cmd=new SqlCommand(query,con);
                SqlDataReader rd=cmd.ExecuteReader();
                long id=0;
                if(rd.Read()){
                id=System.Convert.ToInt64(rd[0].ToString());
                rd.Close();
                }
                if(id>0)
                foreach(string i in obj.Dishes){
                    if (this.Add_dish_to_menu(id.ToString(), i)){
                    
                        //query = "INSERT INTO [dbo].[Menu_dishes]([menu_id],[offered_d_id])VALUES("+id+","+i+")";
                        //cmd = new SqlCommand(query, con);
                        //var = cmd.ExecuteNonQuery();
                    }
                }

                temp = true;
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
    }


    //function to update perhead menu charges////////////////////////////////////////
    public Boolean Update_per_head_charges(string id,string price)
    {
        Boolean temp = false;
        try
        {
            con = Data_base.connection();
            query = "UPDATE [dbo].[offer_menus]   SET [per_head] ="+price+"  WHERE dbo.offer_menus.menu_id=" + id;
            SqlCommand cmd = new SqlCommand(query, con);
            int var = cmd.ExecuteNonQuery();
            if (var > 0)
            {

                temp = true;

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
    }

    private Boolean Add_dish_to_menu(string id,string i)
    {
        Boolean temp = false;
        try
        {
            query = "INSERT INTO [dbo].[Menu_dishes]([menu_id],[offered_d_id])VALUES(" + id + "," + i + ")";
            cmd = new SqlCommand(query, con);
            int var = cmd.ExecuteNonQuery();
            if (var > 0)
                temp = true;

        }
        catch (Exception e)
        {
            temp = false;
        }
        return temp;
    }

    //function to remove menu from database first remove dishes associated with menu  then removes menu
    public Boolean Delete_menu(string id)
    {
        Boolean temp = false;
        try
        {
            con = Data_base.connection();
            query = "DELETE FROM [dbo].[Menu_dishes] WHERE  dbo.[Menu_dishes].menu_id="+id;
            SqlCommand cmd = new SqlCommand(query, con);
            int var = cmd.ExecuteNonQuery();
            
               
                query = "DELETE FROM [dbo].[offer_menus] WHERE dbo.offer_menus.menu_id=" + id;
                cmd = new SqlCommand(query, con);
                var = cmd.ExecuteNonQuery();
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