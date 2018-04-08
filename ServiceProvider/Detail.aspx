<%@ Page Title="" Language="C#" MasterPageFile="~/ServiceProvider/Admin_serviceprovider.master" AutoEventWireup="true" CodeFile="Detail.aspx.cs" Inherits="ServiceProvider_Detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

</br>
</br>
<script src="java script/Order_details_status.js"></script>
<div  class="row">

       <p id="success"></p>
       <p id="error"></p>

<div class="col-lg-5">
        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Information Box</h3>
                            </div>
                            <div class="panel-body">

                                    <div class="table-responsive">
                                    <table class="table table-bordered table-hover table-striped">
                                    <tr><td><h3>Order Number:</h3></td><td><asp:Label  ID="booking_pin"  clientidmode="Static" runat="server"></asp:Label></td></tr>
                                    <tr><td><h3>Order  Date:</h3></td><td><asp:Label  ID="o_date"  clientidmode="Static" runat="server"></asp:Label></td></tr>
                                    <tr><td><h3>Function Date:</h3></td><td><asp:Label  ID="f_date"  clientidmode="Static" runat="server"></asp:Label></td></tr>
                                    <tr><td><h3>Client Name:</h3></td><td><asp:Label  ID="c_name"  clientidmode="Static" runat="server"></asp:Label></td></tr>
                                    <tr><td><h3>Client Contact:</h3></td><td><asp:Label  ID="number"  clientidmode="Static" runat="server"></asp:Label></td></tr>
                                    <tr><td><h3>Client CNIC:</h3></td><td><asp:Label  ID="cnic"  clientidmode="Static" runat="server"></asp:Label></td></tr>
                                    <tr><td><h3>Guest Expected:</h3></td><td><asp:Label  ID="guest"  clientidmode="Static" runat="server"></asp:Label><a href="#" id="count_c" onclick="change_count()" >Change</a></td></tr>
                                    <tr><td><h3>Function Type:</h3></td><td><asp:Label  ID="type"  clientidmode="Static" runat="server"></asp:Label></td></tr>
                                    <tr><td><h3>Function Time:</h3></td><td><asp:Label  ID="f_time"  clientidmode="Static" runat="server"></asp:Label></td></tr>
                                    <tr><td><h3>Grand Total Charges:</h3></td><td><asp:Label  ID="charges"  clientidmode="Static" runat="server"></asp:Label>(Rs)</td></tr>
                                    <tr><td><h3>Hall Rent Charges:</h3></td><td><asp:Label  ID="hall_rent"  clientidmode="Static" runat="server"></asp:Label><a href="#" id="a5" onclick="update_hall_rent()" >Change</a> </td></tr>
                                    <tr><td><h3>Order Status:</h3></td><td><p class="badge alert-info" id="status"  clientidmode="Static"  runat="server" ></p><a href="#" id="change" onclick="change_status()" >Click to Change Status</a></td></tr>
                                    </table>
                        
                                    </div>
                            </div>

                            
       </div>
    </div>
</div>


<div id="menus" runat="server" class="row">
                   
                    
                    <div class="col-lg-8">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Menu Order Details</h3>
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover table-striped">
                                        <thead>
                                            <tr>
                                                <th>Sr No</th>
                                                <th>Menu Name</th>
                                                <th>Menu Price</th>
                                                <th>Menu Total(Guest*Menu Price)</th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                         <!--menu in order-->
                                         <tr>
                                         <td></td>
                                         <td><asp:Label ID="m_name" runat="server"></asp:Label></td>
                                         <td><asp:Label ID="m_price" runat="server"></asp:Label></td>
                                         <td><asp:Label ID="m_total" runat="server"></asp:Label></td>
                                         </tr>
                                           <tr><td></td><td><strong>Menu Dishes</strong></td></tr>
                                           <asp:ListView ID="m_d" runat="server" >
                                                 <ItemTemplate>
                                               <tr>
                                               
                                               <td><%#Container.DataItemIndex+1%></td>
                                                <td><%#Eval("dish_name")%></td>
                                                </tr>
                                                   </ItemTemplate>
                                           </asp:ListView>
                                            


                                        </tbody>
                                    </table>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
                <!--row dishes-->
                <div  id="dishes_table" runat="server" class="row">
                    <div class="col-lg-8">
                     <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Additional Dishes Order Detail</h3>
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover table-striped">
                                        <thead>
                                            <tr>
                                                <th>Sr No</th>
                                                <th>Dish Name</th>
                                                <th>Dish Perhead</th>
                                                <th>Dish Total(Guest*perhead)</th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                         
                                         <asp:ListView ID="dishes_ordered" runat="server" >
                                         <ItemTemplate>
                                         <tr>
                                         <td><%#Container.DataItemIndex+1%></td>
                                         <td><%#Eval("dish_name")%></td>
                                         <td><%#Eval("price")%></td>
                                         <td><%# Convert.ToInt32(Eval("price"))*Convert.ToInt32(guest.Text)%></td>

                                         </tr>
                                         </ItemTemplate>
                                         </asp:ListView>
                                         </tbody>
                                         </table>
                                         </div>
                                </div>
                                </div>
                            

                    </div>
                </div>
</asp:Content>

