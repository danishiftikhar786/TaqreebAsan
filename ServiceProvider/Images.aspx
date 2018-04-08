<%@ Page Title="" Language="C#" MasterPageFile="~/ServiceProvider/Admin_serviceprovider.master" AutoEventWireup="true" CodeFile="Images.aspx.cs" Inherits="ServiceProvider_Images" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"> 
    
    
   <div id="list"> <script type="text/javascript" language="javascript">                       $("#list").load("uploadfile.aspx");
                      
   </script></div>

 
   
<!--<p id="error" style=" color:Red" runat="server"></p>
<input type="file" runat="server" id="upload"  class="btn btn-success"  accept="jpg|png" multiple="true" data-buttonText="Your label here."  />
<br />
    <asp:Button runat="server"  Text="Upload" ID="upload_press" 
        onclick="upload_press_Click" />-->
        <br />
        <br />
        <h3 align="center"><b>Images  Gallery</b></h3>
        <div class="gallery">
        <asp:ListView runat="server" ID="gallery">
        <ItemTemplate>
        <a href="<%#Eval("img_url")%>" class="gallery__item">
        <img  src="<%#Eval("img_url")%>" class="gallery__item-img" height="10%" width="20%" data-id="<%#Container.DataItemIndex+1 %>" data-title="<%#Container.DataItemIndex+1 %>"  alt=":) image can,t loaded" />
        <i class="gallery__item-cover"></i>
        </a>
        </ItemTemplate>
        </asp:ListView>
       </div>
       <div class="slider" style="display: none;">
            <table  class="slider__table">
                <tr>
                    <td class="slider__table-td">
                        <div class="slider__table-td-item-number">
                        </div>    
                        <div class="slider__table-td-inner">
                            <img src="img/0.jpg" alt="" class="slider__cur-img">
                        </div>  
                        <div class="slider__table-td-item-title">
                        </div>  
                    </td>
                </tr>        
            </table>    
            <a href="#prev" class="slider__btn slider__btn_prev"></a>
            <a href="#next" class="slider__btn slider__btn_next"></a>
            <i class="slider__btn_close"></i>
        </div>
        <script src="../App_Themes/Minimal-jQuery-Image-Gallery-Lightbox-Plugin-maxGallery/js/jquery.js" type="text/javascript"></script>
    <script src="../App_Themes/Minimal-jQuery-Image-Gallery-Lightbox-Plugin-maxGallery/js/js.js" type="text/javascript"></script>

</asp:Content>

