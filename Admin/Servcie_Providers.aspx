<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Servcie_Providers.aspx.cs" Inherits="Admin_Servcie_Providers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">





<!-- /.row -->

                <div class="row">
                   
                    
                    <div class="col-lg-8">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-money fa-fw"></i>Account Data</h3>
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover table-striped">
                                        <thead>
                                            <tr>
                                                <th>Sr No</th>
                                                <th>Sp Name</th>
                                               
                                                <th>Email</th>
                                                <th>Status</th>
                                                <th>Address</th>
                                                <th>Admin Name</th>
                                                <th>Main City</th>
                                                <th>Change Status</th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                         <asp:ListView ID="sp_accounts" runat="server" >
                                                 <ItemTemplate>
                                            <tr>
                                               <td><%#Container.DataItemIndex+1%></td>
                                               <td><%#Eval("sp_name")%></td>
                                               <td><%#Eval("Email")%></td>
                                               <td><%#Eval("status")%></td>
                                               <td><%#Eval("sp_name")%></td>
                                               <td><%#Eval("admin_name")%></td>
                                               <td><%#Eval("main_city")%></td>
                                               <td><a href="#" id='<%#Container.DataItemIndex+1%>' onclick="change_status(this)" title='<%#Eval("s_email_id")%>' class="btn btn-danger">Change Status</a> </td>
                                               
                                                
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
                <script  src="javascript/sp_status_change.js"></script>
</asp:Content>

