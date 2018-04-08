<%@ Page Title="" Language="C#" MasterPageFile="~/ServiceProvider/Admin_serviceprovider.master" AutoEventWireup="true" CodeFile="Orders.aspx.cs" Inherits="ServiceProvider_Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
                   <!-- /.row -->

                <div class="row">
                   
                    
                    <div class="col-lg-10">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-money fa-fw"></i>Orders Data</h3>
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover table-striped">
                                        <thead>
                                            <tr>
                                                <th>Sr No</th>
                                                <th>Order Date</th>
                                                <th>Order PlacedON </th>
                                                <th>Function Type</th>
                                                <th>Guest Count</th>
                                                <th>Client Name</th>
                                                <th>Order Details</th>
                                                <th>Order Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                         <asp:ListView ID="order_data" runat="server" >
                                                 <ItemTemplate>
                                            <tr>
                                                <td><%#Container.DataItemIndex+1%></td>
                                                <td><%#Eval("Booking_date")%></td>
                                                <td><%#Eval("function_date")%></td>
                                                <td></td>
                                                <td><%#Eval("total_persons")%></td>
                                                <td><%#Eval("c_name")%></td>
                                                <td><a class="btn btn-primary" href='Detail.aspx?orderid=<%#Eval("booking_id")%>'>Show details</a></td>
                                                <td><p class="badge alert-info"><%#Eval("status")%></p></td>
                                                
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
    
</asp:Content>

