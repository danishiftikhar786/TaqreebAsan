<%@ Page Title="" Language="C#" MasterPageFile="~/Profile/Profile_m.master" AutoEventWireup="true" CodeFile="Gallery.aspx.cs" Inherits="Profile_Gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
<br />
<br />

<br /><a href='<%=ResolveUrl("../website_images/sp_images/2088366963b2.png")%>'></a>
<link href='<%=ResolveUrl("../App_Themes/Minimal-jQuery-Image-Gallery-Lightbox-Plugin-maxGallery/css/css.css") %>' rel="Stylesheet" />
        <h3 align="center">Images  Gallery</h3>
        <div class="gallery container">
        
        <asp:ListView runat="server" ID="gallery">
        <ItemTemplate>
        <a href="<%#Eval("img_url")%>" class="gallery__item">
        <img  src='<%# Page.ResolveUrl( Eval("img_url").ToString()) %>' class="gallery__item-img  well" height="10" width="20%" data-id="<%#Container.DataItemIndex+1 %>" data-title="<%#Container.DataItemIndex+1 %>"  alt=":) image can,t loaded" />
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
                            <img src="#" alt="" class="slider__cur-img">
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
       
     <script src='<%=ResolveUrl("../App_Themes/Minimal-jQuery-Image-Gallery-Lightbox-Plugin-maxGallery/js/jquery.js") %>' type="text/javascript"></script>
    <script src='<%=ResolveUrl("../App_Themes/Minimal-jQuery-Image-Gallery-Lightbox-Plugin-maxGallery/js/js.js") %>' type="text/javascript"></script>

</asp:Content>

