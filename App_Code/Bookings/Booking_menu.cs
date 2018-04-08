using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Booking_menu
/// </summary>
public class Booking_menu
{

    //booking menu  properties
    private string menu_id;

    public string Menu_id
    {
        get { return menu_id; }
        set { menu_id = value; }
    }
    private string menu_price;

    public string Menu_price
    {
        get { return menu_price; }
        set { menu_price = value; }
    }
	public Booking_menu()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}