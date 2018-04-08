using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

      
        
    }


    protected void Button1_Click(object sender, EventArgs e)
    {

        if (newsletters.Value != "")
        {
            String email = newsletters.Value;

            Newsletters obj = new Newsletters();
            obj.Email = email;
            obj.new_letter_emails(obj);
            newsletters.Value = "";
            message23.Text = "Thankyou for signup for our weekly news letters ";
           
        }

    }
}
