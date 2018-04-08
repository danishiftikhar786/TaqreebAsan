using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ServiceProvider_Registeration : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void register_Click(object sender, EventArgs e)
    {
        try
        {

            SP_Manager obj = new SP_Manager();
            if (obj != null)
            {
                obj.Admin_name = admin_name.Text.ToUpper();
                obj.Address = address.Text;
                obj.Email_address = email_address.Text;
                obj.Main_city = DropDownList1.SelectedValue.ToString();
                obj.Sp_name = sp_name.Text.ToUpper();
                obj.User_login = email.Text;
                obj.Web_url = web_url.Text;
                obj.Ntn = ntn.Text;
                obj.T_halls = T_hall.Text;
                obj.Hall_charges = T_h_charges.Text;
                obj.Password = password.Text.GetHashCode().ToString();
                obj.Phone_number = number.Text;
                obj.Status = "New";
                obj.Aboutus = about.Text;
                obj.Sub_city = "";

                obj.Capacity = capacity.Text;

                obj.Car_parking = parking.SelectedValue;
                if (day.Checked)
                    obj.Timing_day = "yes";
                else
                    obj.Timing_day = "no";
                if (night.Checked)
                    obj.Timing_night = "yes";
                else
                    obj.Timing_night = "no";


                obj.P_image = "../website_images/icons/Google Images-100.png";
                if (upload.PostedFile.FileName != "")
                {
                    string savepath = "";
                    string tempPath = "";
                    tempPath = System.Configuration.ConfigurationManager.AppSettings["FolderPath"];
                    savepath = Server.MapPath(tempPath);
                    upload.PostedFile.SaveAs(savepath + @"/" + upload.PostedFile.FileName);

                    obj.P_image = tempPath + @"" + upload.PostedFile.FileName;

                }
               
                    if (obj.creater_New_serviceProvider(obj))
                    {
                        SP_Account_Activation activate = new SP_Account_Activation();
                        activate.Sp_name = obj.Sp_name;
                        activate.User_name = obj.User_login;
                        activate.Sp_email = obj.Email_address;
                        activate.send_account_validation_link(activate);


                        Response.Redirect("Registeration_message.aspx");

                    }
                    else
                    {
                        id_message_1.Text = "User Name already exist !";
                    }

                
            }
        }
        catch (Exception bc)
        {
           // id_message_1.Text = bc.ToString();
        }

        }


    

   
}