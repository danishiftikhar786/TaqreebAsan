using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;

public partial class ServiceProvider_Images : System.Web.UI.Page
{
    private  string sp_id=null; 
    protected void Page_Load(object sender, EventArgs e)
    {

        //sp_id = Session["user_name"].ToString();
        string id = "";
       if(Request.Cookies["Sp_cookies"].Value != null)
        {
            id = Request.Cookies["Sp_cookies"].Value;
            this.show_image_gallery(id);
        }
       else
        {
            Response.Redirect("Expired.aspx");
        }
       
    }
    protected void upload_press_Click(object sender, EventArgs e)
    {

       sp_id= Session["user_name"].ToString();
        HttpFileCollection uploads = Request.Files;

        try
        {
            if (uploads.Count >= 1)
            {
                string savepath = "";
                string tempPath = "";
                tempPath = System.Configuration.ConfigurationManager.AppSettings["FolderPath"];
                savepath = Server.MapPath(tempPath);
                //string filename = postedFile.FileName;
                if (!Directory.Exists(savepath))
                    Directory.CreateDirectory(savepath);

                
                //context.Response.Write(tempPath + "/" + filename);
                //context.Response.StatusCode = 200;




                for (int i = 0; i < uploads.Count; i++)
                {
                    HttpPostedFile hf = uploads[i];

                    //hf.SaveAs(savepath + @"/" + hf.FileName);
                    hf.SaveAs(Server.MapPath("../website_images/sp_images/" + sp_id + hf.FileName));
                    this.add_image(sp_id, tempPath + @"/" + hf.FileName);
                }

                //error.InnerText = "ALL images Uploaded Successfully";
            }
        }
        catch(Exception a){

           // error.InnerText = "Error in uploading images";
        }
        


    }

    private void add_image(string sp_id, string url)
    {
        string query = "INSERT INTO [dbo].[sp_images]([img_url],[s_email_id])VALUES('"+url+"','"+sp_id+"')";
        SqlConnection con;
        con = Data_base.connection();
        try
        {
            
            SqlCommand cmd = new SqlCommand(query, con);
            int i = cmd.ExecuteNonQuery();


        }
        catch (Exception e)
        {
            
        }
        finally
        {
            con.Close();
        }

    }

    private void show_image_gallery(string sp_id)
    {

        string query = "SELECT * from  [temp].[dbo].[sp_images] where s_email_id='"+sp_id+"'";
        SqlConnection con;
        SqlDataReader data;
        con = Data_base.connection();
        try
        {

            SqlCommand cmd = new SqlCommand(query, con);
            data = cmd.ExecuteReader();

            gallery.DataSource = data;
            gallery.DataBind();

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