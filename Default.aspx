<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
         
         
        
        
         <div class="navbar-header  green">
            <button type="button" data-target="#search_bar_collapes" data-toggle="collapse"  class="navbar-toggle btn_color"">
            <span class="sr-only">Search</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
           </button>
           
          </div>
        
        <div class="row">
        <!--left navigation-->
       
        <div class="col-sm-2">
       

        
        
        <div  id="search_bar_collapes" class="list-group navbar-collapse collapse" >
        <div class="list-group-item filter_bg_color"><b class="label_filter">SEARCH BY WORD&nbsp;</b></div>
        <div class="list-group-item" >
         <div class="input-group">
         <asp:TextBox name="search"  ID="searchterm" runat="server"  placeholder="City,Hall-Name."  
        Width="100px"  />
            <asp:Button ID="search_button" runat="server" Text="Go" CssClass="btn-primary" 
        onclick="search_button_Click" />
       </div>
 
        </div>
        <!--Taqreeb Assan Map -->
        <div class="list-group-item" filter_bg_color><b class="label_filter">MAP SEARCH&nbsp;<i class="glyphicon glyphicon-globe"></i></b></div>
        <!--capacity search-->
        <div class="list-group-item label_filter" >
        <a class="btn btn-link" href="Mapsearch.aspx"><b class="label_filter">Find on Map</b></a>
       </div>
       

        <div class="list-group-item filter_bg_color"><b class="label_filter">GUEST CAPACITY &nbsp;</b></div>
        <!--capacity search-->
        <div class="list-group-item " >
       
          <span><asp:CheckBox ID="CheckBox1" runat="server" ViewStateMode="Disabled" AutoPostBack="true" Checked="false" 
              oncheckedchanged="CheckBox1_CheckedChanged" />&nbsp;Between(100-500)</span><br />
          <span><asp:CheckBox ID="CheckBox2" runat="server" ViewStateMode="Disabled" AutoPostBack="true" Checked="false"
              oncheckedchanged="CheckBox2_CheckedChanged" />&nbsp;Between(500-700)</span><br />
          <span><asp:CheckBox ID="CheckBox3" runat="server"  ViewStateMode="Disabled" AutoPostBack="true" Checked="false"
              oncheckedchanged="CheckBox3_CheckedChanged" />&nbsp;Between(700-1000)</span><br />
          <span><asp:CheckBox ID="CheckBox4" runat="server" ViewStateMode="Disabled" AutoPostBack="true" Checked="false"
              oncheckedchanged="CheckBox4_CheckedChanged" />&nbsp;(1000+)</span><br />
              <p>
 <!-- <label for="amount">Maximum Persons</label>
  <input type="text" id="amount"  readonly style="border:0;  color:#abda0f; font-weight:bold;">
 --> </p>
 <!--
<div style=" width=20px;" id="slider-range-min"></div>-->
 
          </div>
         <!--parking search-->
        <div class="list-group-item filter_bg_color "><b class="label_filter">CAR PARKING&nbsp;</b></div>
          <div class="list-group-item" >
          
                  <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="true" ViewStateMode="Disabled" 
                  onselectedindexchanged="RadioButtonList1_SelectedIndexChanged">
                 <asp:ListItem Value="yes">Yes</asp:ListItem>
                 <asp:ListItem Value="no">No</asp:ListItem>
                 </asp:RadioButtonList>
            
        </div>
        <!--avalible timing-->
            
        <div class="list-group-item filter_bg_color "><b class="label_filter">EVENT TIMING&nbsp;</b></div>
        <div class="list-group-item">
        <span>
            <asp:CheckBox ID="CheckBox7" runat="server" ViewStateMode="Disabled" 
                  AutoPostBack="true" Checked="false" oncheckedchanged="CheckBox7_CheckedChanged" 
                   />&nbsp;Day(12am-5pm)</span><br />
          <span>
            <asp:CheckBox ID="CheckBox8" runat="server" ViewStateMode="Disabled" 
                  AutoPostBack="true" Checked="false" oncheckedchanged="CheckBox8_CheckedChanged" 
                   />&nbsp;Evening(5pm-11pm)</span><br />
          
        </div>
   </div>
    </div>
	
                
                <!--java script for pagination-->
                
                <script  src="App_Themes/Pagination/js/jquery-1.10.2.min.js" type="text/javascript"></script>
                 <script src="App_Themes/Pagination/js/jquery.simplePagination.js" type="text/javascript"></script>
                 <script type="text/javascript">
                     jQuery(function ($) {
                         var items = $("#content tbody tr");
                         var numItems = items.length;
                         var perPage = 10;
                         // only show the first 10 (or "first per_page") items initially
                         items.slice(perPage).show();
                         // now setup pagination
                         $("#pagination").pagination({
                             items: numItems/10,
                             itemsOnPage: 10,
                             cssStyle: "compact-theme",
                             onPageClick: function (pageNumber) { // this is where the magic happens
                                 // someone changed page, lets hide/show trs appropriately
                                 var showFrom = perPage * (pageNumber - 1);
                                 var showTo = showFrom + perPage;
                                 items.hide() ;// first hide everything, then show for the new page
                                 items.slice(showFrom, showTo).show();
                             }
                         });
                        
                     });
                 </script>


				
			<div class="col-md-7">
     		<div class="  row list-group">
                <span class=" list-group-item filter_bg_color"  ><b class="label_filter">Event&nbsp; 
                organizer in Pakistan</b> <b  style="float:right;">Sort data by:
            
            <asp:LinkButton runat="server" CssClass="label_filter" ID="capacity_sorting" 
                    onclick="Unnamed1_Click">Guest Capacity</asp:LinkButton>
                    
                    -
                    <asp:LinkButton runat="server" CssClass="label_filter" 
                    ID="sort_hall_charges" onclick="sort_hall_charges_Click" 
                    >By Hall Charges</asp:LinkButton>
                    
                    </b>
            </span>
             </div>
           
             
              <script type="text/javascript">

                  (function ($) {

                      $.fn.wraption = function () {
                          var caption = this.attr('title');
                          this.wrap('<div class="wraption-wrap"></div>').after('<span class="wraption-caption">' + caption + '</span>');
                      };

                  } (jQuery));


                  $(function () {
                      $('img.wraption').wraption();
                  });
	         </script>
             
            <asp:ListView ID="profile"    runat="server" 
                    >  

                
            <ItemTemplate>              
            

     
       <div class="fluid_row">
        <div class="row">
            
            <div class="col-lg-8"  >
              
               <div class=" row">
                                <div class="col-lg-8">
                                       <h4 class="label_list_name"><%#Eval("sp_name")%></h4>
                                </div>
                                <div class="col-lg-4">
                                    <h4 class =" btn btn-default btn-primary right">  Hall Charges: <b><%#Eval("hall_charges")%></b>RS</h4>
                                </div>
                    
               </div>
               
              

               
                <div class="col-lg-4">
                        
                        
                        <img class="wraption" title="Advance Booking 5% off"  width="118"  height="98"   src="<%#Eval("p_image")%>" alt="(:cant load image" />              
                        
                 </div>
                
                <div class="col-lg-6">
                    <div class="row">         
                        <div class="col-sm-3">
                       
                        </div>
                        <div class="col-sm-12">
                        <p class="text-primary" id='i_<%#Container.DataItemIndex+1 %>'><%#Eval("about_us")%></p>
                        <script>
                            var shortenP = function (options) {

                                options = $.extend({
                                    length: 45,
                                    ellipsis: '...',
                                    moreClass: 'more-link',
                                    moreText: 'Read More'
                                }, options);

                                $('#i_<%#Container.DataItemIndex+1 %>').each(function () {

                                    var $p = $(this);
                                    var text = $p.text();
                                    var shortString = text.substring(0, options.length) + options.ellipsis;
                                    $p.data('fulltext', text);
                                    $p.text(shortString);
                                    $('<a/>').attr({
                                        href: 'Profile.aspx?name=<%#Eval("sp_name")%>',
                                        'class': options.moreClass
                                    }).text(options.moreText).
                                insertAfter($p);
                                  /*  $p.next().click(function (e) {

                                        $p.text($p.data('fulltext'));
                                        e.preventDefault();
                                    });*/

                                });

                            };

                            shortenP();
                        </script>
                        
                        </div>
                    </div>

                   
                    
                   
                    <div class="row">
                        <div class="col-sm-3"></div>
                        <div class="col-sm-8"></div>
                    </div>
                   
                    <div class="row">
                        <div class="col-sm-2"><img src="website_images/icons/Map Marker-32.png" title="Main City" width="24"></div>
                        <div class="col-sm-3"><p class="label_list_name"><b><%#Eval("main_city")%></b></p> </div>
                        <div class="col-sm-2"><img src="website_images/icons/Conference-32.png" title="Guest Capacity" width="24"></div>
                        <div class="col-sm-3"><p class="label_list_name"><b><%#Eval("capacity")%></b></p> </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-2"><img src="website_images/icons/Valet Parking-32.png" title="Car parking" /></div>
                        <div class="col-sm-3"><p class=""><b><%#Eval("carparking")%></b></p> </div>
                        <div class="col-sm-2"><img src="website_images/icons/Phone Office-26.png" title="Contact Number" /></div>
                        <div class="col-sm-3"><p class=""><b><%#Eval("phone_number")%></b></p> </div>
                        
                    </div>


                    <div class="row">
                        <div class="col-sm-2"></div>
                        <div class="col-sm-3"></div>
                        <div class="col-sm-2"></div>
                        <div class="col-sm-3"><a target="_blank"  style="  float:right;" href='Profile/<%#Eval("sp_name")%>'><div class=" btn btn-sm btn-default"><b>Show Prices</b></div></a></div>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>





            <!--new code-->
          
              
             </ItemTemplate>
             
             </asp:ListView>
             
                
             
             <div id="pagination"></div>   
             </div>   
             
             <div id="fb-root"></div>
      <script>    (function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/en_GB/sdk.js#xfbml=1&appId=341120689240802&version=v2.0";
        fjs.parentNode.insertBefore(js, fjs);
    } (document, 'script', 'facebook-jssdk'));</script>

                <div class=" col-md-3" >
				
                
                <img class="img-responsive" src="website_images/about.png"  />

				
                <div class="list-group-item" ><b class="label_filter">Follow  us on facebook</b></div>
                <div class="fb-like-box" data-href="https://www.facebook.com/TaqreebAsan" data-colorscheme="light" data-show-faces="true" data-header="true" data-stream="false" data-show-border="true"></div>
                
                
                
                </div>
               

               </div>
                <script src="App_Themes/jquery-ui-1.11.2.custom/jquery-ui.js"></script>
               <script>
                   $(function () {
                       $("#slider-range-min").slider({
                           range: "min",
                           value: 37,
                           min: 50,
                           max: 2000,
                           slide: function (event, ui) {

                               $("#amount").val("" + ui.value);
                               var a = ui.value;
                              //alert(a);
                               var datatype = "{range:'" + a + "'}";
                               $.ajax({
                                   type: "POST",
                                   url: "Default.aspx/range_slider",
                                   data: datatype,
                                   contentType: "application/json; charset=utf-8",
                                   dataType: "json",
                                   success: function (response) {
                                       //alert(response.d);
                                       $("#success").html(response.d);
                                   },
                                   failure: function (response) {
                                       //alert(response.d);
                                       $("#error").html("Error!");
                                   }
                               });
                           
                           }
                       });
                       $("#amount").val("" + $("#slider-range-min").slider("value"));
                       

                   });
            </script>
 

</asp:Content>

