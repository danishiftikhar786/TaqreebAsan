<%@ Page Title="" Language="C#" MasterPageFile="~/ServiceProvider/Admin_serviceprovider.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="ServiceProvider_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
   <script src="java script/missig_data.js" type="text/javascript"></script>
    <div id="page-wrapper" >
    <div id="name_sp" runat="server" style="visibility:hidden;"></div>
            <div class="container-fluid">
            
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                    <div  id="message"class="page-header warning">   
                        </div>
                        <h1 class="page-header">
                            Service Provider <small>Overview statics</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-dashboard"></i> Dashboard
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                
                <!-- /.row -->

                <div class="row">
                    
                        <div class="col-lg-3 col-md-6">
                        <div class="panel panel-yellow">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-shopping-cart fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div id="order_no" runat="server" class="huge"></div>
                                        <div>New Orders!</div>
                                    </div>
                                </div>
                            </div>
                            <a href="Orders.aspx">
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                <!-- /.row -->

                <div class="row">
                   
                   
                </div>
                <!-- /.row -->

                <div class="row">
                   
                    
                    <div class="col-lg-10">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-money fa-fw"></i>Order Status</h3>
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
                                <div class="text-right">
                                    <a href="#">View All Transactions <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->


</asp:Content>

