<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="New_Dish.aspx.cs" Inherits="Admin_New_Dish" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



<div class="row">
                   <div class="col-lg-2"><div class="input-group"><input class="input-sm" id="dish_name" placeholder="Enter Dish Name!" type="text" /><a class="btn btn-primary" onclick="new_dish()" href="#new">New</a></div></div>
                   <br />
                    
                    <div class="col-lg-8">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-money fa-fw"></i>Dishes  Avalible</h3>
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover table-striped">
                                        <thead>
                                            <tr>
                                                <th>Sr No</th>
                                                <th>Dish Name</th>
                                                <th>Update</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                         <asp:ListView ID="dishes" runat="server" >
                                                 <ItemTemplate>
                                                 <tr>
                                                 <td><%#Container.DataItemIndex+1%></td>
                                                 <td><p id='dish_<%#Eval("dish_id")%>'><%#Eval("dish_name")%></p></td>
                                                 <td><a href="#change" title='<%#Eval("dish_id")%>'  id='<%#Eval("dish_id")%>' onclick="update_dish_name(this)" class="btn btn-primary">Update</a></td>
                                                 </tr>
                                                 </ItemTemplate>
                                         </asp:ListView>
                                        </tbody>
                               </div>
                          </div>
                    </div>
                  </div
 </div>
                 

                 <script src="javascript/new_dish.js"></script>

</asp:Content>

