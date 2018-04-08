<%@ Page Title="" Language="C#" MasterPageFile="~/Profile/Profile_m.master" AutoEventWireup="true" CodeFile="Rates.aspx.cs" Inherits="Profile_Rates" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />

 <!-- About us-->
    <div class="container">
        <div class ="row">
               <div class="page-header"><h1><strong> Avalible Dishes List</strong></h1> </div>
                <div class=" col-lg-10">
                <div class="table-responsive">
                                    <table class="table table-bordered table-hover table-striped">
                                        <thead>
                                            <tr>
                                            
                                            <td><h4>Dish Name</h4></td>
                                            <td><h4>Per Head Charges</h4></td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <div class="panel-body">
        <asp:ListView runat="server" ID="dishes">
        <ItemTemplate>
        
                                
                                        <tr>
                                        
                                        <td><%#Eval("dish_name")%></td>
                                        <td><%#Eval("perhead_price")%>RS</td>
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

