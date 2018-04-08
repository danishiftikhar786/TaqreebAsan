<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Routing" %>


<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup

        RegisterRoutes(RouteTable.Routes);
    }
    
    void RegisterRoutes(RouteCollection routes)
    {
        routes.MapPageRoute("Main", "Main", "~/Main.aspx");
        routes.MapPageRoute("Term", "Term_Services", "~/Terms_Serices.aspx");
        
        routes.MapPageRoute("Top_Tips", "Top_Tips", "~/Top_Tips.aspx");
        routes.MapPageRoute("Index", "Index", "~/Default.aspx");
        routes.MapPageRoute("AboutUs", "AboutUs", "~/AboutUs.aspx");
        routes.MapPageRoute("ContactUs", "ContactUs", "~/ContactUs.aspx");
        routes.MapPageRoute("Logins", "Logins", "~/Admins_logins.aspx");
        routes.MapPageRoute("Serviceprovider/Registeration", "Serviceprovider/Registeration", "~/ServiceProvider/Registeration.aspx");
        routes.MapPageRoute("Default","Default/{cityid}/{persons}/{parking}/{timing}","~/Default.aspx");
        //route map for profile
        routes.MapPageRoute("Profile", "Profile/{name}", "~/Profile/Profile.aspx");
        routes.MapPageRoute("Menus", "Profile/Menus/{name}", "~/Profile/Menus.aspx");
        routes.MapPageRoute("Dishes", "Profile/Dishes/{name}", "~/Profile/Rates.aspx");
        routes.MapPageRoute("Gallery", "Profile/Gallery/{name}", "~/Profile/Gallery.aspx");
        routes.MapPageRoute("Cost_cal", "Profile/Cost_Calculator/{name}", "~/Profile/Cost_Calculator.aspx");
        routes.MapPageRoute("Booking", "Profile/Booking/{name}", "~/Profile/Cost_Calculator.aspx");
        routes.MapPageRoute("Map", "Profile/MapLocation/{name}", "~/Profile/Road_map.aspx");
        //route map for service provider
        // routes.MapPageRoute("/Default", "Default", "~/ServiceProvider/Default.aspx");
    }
    
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }

    
       
</script>
