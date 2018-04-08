<%@ Page Title="" Language="C#" MasterPageFile="~/Client/Client.master" AutoEventWireup="true" CodeFile="MyBookings.aspx.cs" Inherits="Client_MyBookings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div  class="row">
    <div class="col-lg-14">
        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">My Orders</h3>
                            </div>
                            <div class="panel-body">

                                    <div class="table-responsive">
                                    <table class="table table-bordered table-hover table-striped">
                                    <thead>
                                            <tr>
                                                <th>Sr NO</th>
                                                <th>Pincode</th>
                                                <th>Booking Date</th>
                                                <th>Status</th>
                                                <th>Name</th>
                                                <th>Total</th>
                                                <th>Details</th>
                                                 <th>Cancle Booking</th>
                                                
                                            </tr>
                                      </thead>
                                      <tbody>
                                      <asp:ListView  ID="my_booking" runat="server">
                                      <ItemTemplate>
                                      <tr>
                                      <td><%#Container.DataItemIndex+1%></td>
                                      <td><%#Eval("booking_id")%></td>
                                      <td><%#Eval("booking_date")%></td>
                                      <td><%#Eval("status")%></td>
                                      <td><%#Eval("c_name")%></td>
                                      <td><%#Eval("booking_charges")%></td>
                                      <td><a href="#"> Show Details</a></td>
                                      <td><a href="#">Cancel Booking</a></td>

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

