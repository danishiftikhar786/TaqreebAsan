using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Bookingclient
/// </summary>
public class Bookingclient
{
    private string name;

    public string Name
    {
        get { return name; }
        set { name = value; }
    }
    private string cnic;

    public string Cnic
    {
        get { return cnic; }
        set { cnic = value; }
    }
    private string email_address;

    public string Email_address
    {
        get { return email_address; }
        set { email_address = value; }
    }
    private string phone_number;

    public string Phone_number
    {
        get { return phone_number; }
        set { phone_number = value; }
    }

	public Bookingclient()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}