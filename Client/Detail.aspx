<%@ Page Title="" Language="C#" MasterPageFile="~/Client/Client.master" AutoEventWireup="true" CodeFile="Detail.aspx.cs" Inherits="ServiceProvider_Detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script src="../ServiceProvider/java script/Order_details_status.js"></script>
<div  class="row">

       
<div class="col-lg-7">
        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Information Box</h3>
                            </div>
                            <div class="panel-body">

                                    <div class="table-responsive">
                                    <table class="table table-bordered table-hover table-striped">
                                    <tr><td><h5>Order Number:</h5></td><td><asp:Label  ID="booking_pin" runat="server"></asp:Label></td></tr>
                                    <tr><td><h5>Order  Date:</h5></td><td><asp:Label  ID="o_date" runat="server"></asp:Label></td></tr>
                                    <tr><td><h5>Function Date:</h5></td><td><asp:Label  ID="f_date" runat="server"></asp:Label></td></tr>
                                    <tr><td><h5>Client Name:</h5></td><td><asp:Label  ID="c_name" runat="server"></asp:Label></td></tr>
                                    <tr><td><h5>Client Contact:</h5></td><td><asp:Label  ID="number" runat="server"></asp:Label></td></tr>
                                    <tr><td><h5>Client CNIC:</h5></td><td><asp:Label  ID="cnic" runat="server"></asp:Label></td></tr>
                                    <tr><td><h5>Guest Expected:</h5></td><td><asp:Label  ID="guest" runat="server"></asp:Label></td></tr>
                                    <tr><td><h5>Function Type:</h5></td><td><asp:Label  ID="type" runat="server"></asp:Label></td></tr>
                                    <tr><td><h5>Total Charges:</h5></td><td><asp:Label  ID="charges" runat="server"></asp:Label>(Rs)</td></tr>
                                    <tr><td><h5>Order Status:</h5></td><td><p class="badge alert-info" id="status"  runat="server" ></p></td></tr>
                                    </table>
                        
                                    </div>
                            </div>

                            
       </div>
    </div>
</div>


<div id="menus" runat="server" class="row">
                   
                    
                    <div class="col-lg-10">
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
                                                <th>Total(Guestcount*price)</th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                         <asp:ListView ID="o_m" runat="server" >
                                                 <ItemTemplate>
                                            <tr>
                                               
                                               <td><%#Container.DataItemIndex+1%></td>
                                               <td><%#Eval("name")%></td>                                               
                                               <td><%#Eval("per_head")%></td>
                                               <td></td>
                                            </tr>
                                            </ItemTemplate>
                                           </asp:ListView>
                                           
                                           <asp:ListView ID="m_d" runat="server" >
                                                 <ItemTemplate>
                                               <tr>
                                               <td><%#Container.DataItemIndex+1%></td>
                                                <td><%#Eval("name") %></td>
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
                    <div class="col-lg-10">
                     <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Dishes Order Detail</h3>
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover table-striped">
                                        <thead>
                                            <tr>
                                                <th>Sr No</th>
                                                <th>Dish Name</th>
                                                <th>Dish Perhead</th>
                                                <th>Total(Guestcount*price)</th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                         
                                         <asp:ListView ID="dishes_ordered" runat="server" >
                                         <ItemTemplate>
                                         <tr>
                                         <td><%#Container.DataItemIndex+1%></td>
                                         <td><%#Eval("dish_name")%></td>
                                         <td><%#Eval("price")%></td>
                                         <td></td>

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

