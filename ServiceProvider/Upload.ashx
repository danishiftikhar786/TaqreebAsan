<%@ WebHandler Language="C#" Class="Upload" %>

using System;
using System.Web;
using System.IO;

public class Upload : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        context.Response.Expires = -1;
        
        try
        {
            string id = context.Session["user_name"].ToString();
            HttpPostedFile postedFile = context.Request.Files["Filedata"];
            
           
            string savepath = "";
            string tempPath = "";
            tempPath = System.Configuration.ConfigurationManager.AppSettings["FolderPath"]; 
            savepath = context.Server.MapPath(tempPath);//get root path of folder
            string filename = postedFile.FileName;
            if (!Directory.Exists(savepath))
                Directory.CreateDirectory(savepath);
            Images_Manager obj = new Images_Manager();
            
           string f_name=savepath  + id.GetHashCode() + filename;//root path
            postedFile.SaveAs((f_name));
            f_name = tempPath + id.GetHashCode() + filename;
            obj.add_image(id, f_name);
            
            
           // context.Response.Write(tempPath + "/" + filename);
            context.Response.StatusCode = 200;
        }
        catch (Exception ex)
        {
            context.Response.Write("Error: " + ex.Message);
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }
}