using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;

/// <summary>
/// Summary description for Booking_email
/// </summary>
public class Booking_email
{

    private string client_mail;

    public string Client_mail
    {
        get { return client_mail; }
        set { client_mail = value; }
    }
   private string Sp_mail;

   public string Sp_mail1
   {
       get { return Sp_mail; }
       set { Sp_mail = value; }
   }
   private string body_for_client;

   public string Body_for_client
   {
       get { return body_for_client; }
       set { body_for_client = value; }
   }
   private string body_for_sp;

   public string Body_for_sp
   {
       get { return body_for_sp; }
       set { body_for_sp = value; }
   } 

	public Booking_email()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public void SendMail_booking()
    {
        try
        {
            


            // taqreebasanbooking Address from where you send the mail
            var fromAddress = "booking@taqreebasan.com";
            // any address where the email will be sending
            var toAddress = this.Client_mail;
            //Password of your gmail address
            const string fromPassword = "redrose786";
            // Passing the values and make a email formate to display
            string subject = "TaqreebAsan Booking  Alert";

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
            
            // Passing values to smtp object
            smtp.Send(fromAddress,this.Client_mail, subject, this.Body_for_client);//send booking alert to client  email address
            smtp.Send(fromAddress, this.Sp_mail1, subject, this.Body_for_sp);//send booking alert to client  email address
        }
        catch(Exception e){
        }
    }

}