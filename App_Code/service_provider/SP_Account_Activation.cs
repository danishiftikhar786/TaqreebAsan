using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Data.SqlClient;

/// <summary>
/// Summary description for SP_Account_Activation
/// </summary>
public class SP_Account_Activation
{
    /// <summary>
    /// this is used  to activate sp account form email address which he has provided by sending email to his id and ask him to open link form his account to ac
    /// activate hi saccount
    /// </summary>
    /// 

    private SqlConnection con;
    private string user_name;

    public string User_name
    {
        get { return user_name; }
        set { user_name = value; }
    }
    private string sp_name;

    public string Sp_name
    {
        get { return sp_name; }
        set { sp_name = value; }
    }
    private string sp_email;

    public string Sp_email
    {
        get { return sp_email; }
        set { sp_email = value; }
    }
	public SP_Account_Activation()
	
    {
		//
		// TODO: Add constructor logic here
		//
	}

    /// <summary>
    /// this function is used to send  account varifation link to sp email address
    /// </summary>
    public void send_account_validation_link(SP_Account_Activation obj)
    {
        try
        {



            // taqreebasanbooking Address from where you send the mail
            var fromAddress = "feedback@taqreebasan.com";
            // any address where the email will be sending
            var toAddress = obj.Sp_email;
            //Password of your gmail address
            const string fromPassword = "redrose786";
            // Passing the values and make a email formate to display
            string subject = "TaqreebAsan New  Account Varification Process ";

            // smtp settings

            var smtp = new System.Net.Mail.SmtpClient();
            {
                smtp.Host = "mail.taqreebasan.com ";
                smtp.Port = 25;
                smtp.EnableSsl = false;
                smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = new NetworkCredential(fromAddress, fromPassword);
                smtp.Timeout = 20000;
            }

            string body = "To activate your Service provider account please visit this Link! After that delete this email\n" + "<a href='www.taqreebasan.com/ServiceProvider/Account_Activation_Process.aspx?user_name="+obj.User_name+"sp_name="+obj.User_name+"'>Visit this Link!<a/>";
            // Passing values to smtp object
            smtp.Send(fromAddress, toAddress, subject, body);
           
        }
        catch (Exception e)
        {
        }

    }

    public Boolean active_account(string user_name)
    {
        Boolean temp = false;
       
        string query = "UPDATE [temp].[dbo].[user_sp]  SET [status] = 'Active'  WHERE  s_email_id='"+user_name+"'";
        con = Data_base.connection();
        try
        {
            SqlCommand cmd = new SqlCommand(query, con);
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {

                temp = true;
            }

        }
        catch (Exception e)
        {
            temp = false;
        }
        finally
        {

            con.Close();
        }
        return temp;
    }


}