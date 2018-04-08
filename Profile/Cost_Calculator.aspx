<%@ Page Title="" Language="C#" MasterPageFile="~/Profile/Profile_m.master" AutoEventWireup="true" CodeFile="Cost_Calculator.aspx.cs" Inherits="Profile_Cost_Calculator" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<!--message for  booking of success-->


<script src='<%=ResolveUrl("make_booking.js")%>'  type="text/javascript"></script>
<script src='<%=ResolveUrl("Coast_cal.js")%>' type="text/javascript"></script>

<script type="text/javascript">

function make_call_booking()
{

    var persons = $("#tp").val();
    var menu_id;
    //alert("asdas");
    var menu_perhead;
    //checking for weather persons are in numbers
    if ($.isNumeric($("#tp").val())) {

        //alert("true");
        //alert(selected);

        //get  selected menu and selected dishes
        menu_id = jQuery("#menu option:selected").val();

        if (menu_id == 0) {
            //alert(menu_id);
        }
        else {

            menu_perhead = $("#menu").find("option:selected").attr("perhead");
            //alert(menu_perhead);
        }

        var dt = $("#datepicker").val();
        var people = $("#tp").val();
      // alert($("#amount").html());
        if (dt != "") {

            //var c_id = $("#ContentPlaceHolder1_c_id").html();
            if (validate_for_data()) {
                //pushing client data in array

                alert("data valid");       
                //pushing client email address
                client_data.push($("#email").val());
                //pushing client phone number
                client_data.push($("#phone").val());
                //pushing client cnic
                client_data.push($("#cnic").val());
                //pushing client name
                client_data.push($("#c_name").val());
                //pushing total persons in object
                client_data.push($("#tp").val());
                //alert($("#c_name").val());
                // client_data.push($("#ContentPlaceHolder1_s_id").html());
                
                //var datatype = "{menu_id:'" + menu_id + "',menu_price:'" + menu_perhead + "',dish_ids:'" + selected + "',dish_prices:'" + d_perheads + "',function_date:'" + $("#datepicker").val(); +"',client_id:'" + $("#datepicker").val(); +"',grandtotal:'" + $("#datepicker").val(); +"'}";
                var datatype = "{sp_id:'" + $("#s_id").html() + "',client_info:'" + client_data + "',menu_id:'" + menu_id + "',menu_price:'" + menu_perhead + "',dish_ids:'" + selected + "',dish_prices:'" + d_perheads + "',function_date:'" + dt + "',client_id:'" + $("#user_name").val() + "',grandtotal:'" + ($("#amount").html() - $("#hall_charges").html()) + "',totalpersons:'" + people + "',hall_rent:'" + $("#hall_charges").html() + "',f_time:'"+jQuery("#e_timing option:selected").val()+"',f_type:'"+jQuery("#e_type option:selected").val()+"'}";
                $.ajax({
                    type: "POST",
                    url: "<%=ResolveUrl("Cost_Calculator.aspx/make_booking")%>",
                    data: datatype,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {

                        //document.getElementById("web").innerHTML = "Updated";

                        if (response.d == "0") {
                            document.getElementById("s").innerHTML = "<div id='success'  class='alert alert-success alert-dismissable'><button type='button' class='close' data-dismiss='alert'  aria-hidden='true'> &times;</button><strong>Alert!</strong>Your Booking Request has been send please visit you mail to get  further Information.</div>";
                            
                        }
                        if (response.d == "1")
                            document.getElementById("s").innerHTML = "<div id='error1'  class='alert alert-dismissable alert-warning'><button type='button' class='close' data-dismiss='alert'  aria-hidden='true'> &times;</button><strong>Error!</strong>User Name not Registerd Please register first.</div>";
                        if (response.d == "2")
                            document.getElementById("s").innerHTML = "<div id='error2'  class='alert alert-dismissable alert-warning'><button type='button' class='close' data-dismiss='alert'  aria-hidden='true'> &times;</button><strong>Error!</strong>Please fill all Fields.</div>";
                    },
                    failure: function (response) {
                        alert(response.d);
                        //location.reload();
                        document.getElementById("s").innerHTML = "<div id='error2'  class='alert alert-danger alert-dismissable'><button type='button' class='close' data-dismiss='alert'  aria-hidden='true'> &times;</button><strong>Error!</strong>Error in  booking.please provide  valid data .</div>";
                    }
                });

        }
        else 
        {
            //ask for user login

            alert("Please Fill All fields ");
        }

                           }   
                                      }
    else {
        alert("Please enter total persons in number!");

    }
    
   // alert($("#ContentPlaceHolder1_s_id").html());
}

    function cost_menu_load(id) {
     var people = $("#tp").val();
    if(people!=""){
        //alert("aa");
        var m_id = $("select").val();
       
             $("#list").load("<%=ResolveUrl("Menu_dishes.aspx?id=")%>"+m_id);
             }
             else{
             alert("Please Mention Guest count first");
             }
       
    }

</script>
<div class="form-group">
    <div class="   col-lg-6 ">

        <div class="panel panel-primary">
    <div class="panel-heading">
        Cost Calculator of Event
    </div>

            <div class="panel-body">
                <div style="padding:4%;">

<!--hall charges-->
<div><b>Hall Charges:</b><asp:Label ID="hall_charges"  ClientIDMode="Static" Text="0"  runat="server"></asp:Label>RS</div></br>
<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="textinput"></label>
  <div class="controls">
    <input id="tp"  onchange="persons();" name="textinput" type="text" placeholder="Guest Count" class="form-control input-md" required="">
    <p class="help-block">e.g 350/400/700/100</p>
  </div>
</div>

<!--Menus-->
        <form id="Form1" runat="server">
<h2>Service Provider Offer Menus</h2>
<table><tr><td><b>Select Menu:</b><asp:Label ID="mu" ClientIDMode="Static" runat="server"></asp:Label></td><td><b>Per Head:</b><b><span id="m_p"></span>RS</b></td></tr></table>

            <div id="list">
            </div>
<!--Dishes-->
</br>
<h2>Service Provider Offer Dishes</h2>

<div ><b>Dish Name</b>--------------------------------------------------------<b>Perhead</b></div>
                 <div style="padding:4%;"> <asp:Label ID="df" ClientIDMode="Static" runat="server">No dish Avalible</asp:Label></div>
                 
                <div><table><tr><td><h2>Grand Total:</h2></td><td><h2><span id="amount"></span>Rs</h2></td></tr></table></div>
         </form>   
            </div>
          </div>
       </div>
    </div>





  </div>
  



    <div class="col-lg-4">
        <div class="panel panel-success">


<!-- Form Name -->
<div class="panel-heading">
No payment needed Today pay on booking Confirm!
</div>

</div>
<div id="s"></div>
</div>


<!--div for some details-->
<div id="info_form">
    <div class="col-lg-4">
        <div class="panel panel-primary">


<!-- Form Name -->
<div class="panel-heading">
Enter Yor Detail
</div>
            <div class="panel-body">
                <fieldset>
<div class="control-group">
  <label class="control-label" for="textinput"></label>
  <div class="controls">
  <input   class="form-control input-md" type='text' id='datepicker' placeholder="Function Date"><script>   
                                                                               var dateToday = new Date(); $(function () { $('#datepicker').datepicker({ minDate: dateToday }); });</script>
   </div>
</div>
<!-- Text input function type-->
<div class="control-group">
  <label class="control-label" ></label>
  <div class="controls">
  <p class="help-block">Specify Event Type like Valima Barat,etc </p>
    <select id="e_type" class=" input-sm dropdown">
    <option value="0">-Select Event Type-</option>
    <option value="Mehndi">Mehndi</option>
    <option value="Barat">Barat</option>
    <option value="Valima">Valima</option>
    <option value="Milad Mahfil">Milad Mahfil</option>
    <option value="Political Gthering">Political Gthering</option>
    <option value="others">others</option>
    </select>
     
     
  </div>
</div>

<!-- Text input function type-->
<div class="control-group">
  <label class="control-label" ></label>
  <div class="controls">
  <p class="help-block">Specify Event Time </p>
    <select id="e_timing" class=" input-sm dropdown">
    <option value="0">-Select Event Timing-</option>
    <option value="Day(12pm-5pm)">Day(11am-4pm)</option>
    <option value="Night(5pm-10pm)">Night(5pm-10pm)</option>
    </select>
     
  </div>
</div>


<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="textinput"></label>
  <div class="controls">
  <p class="help-block">User Name</p>
 
    <input id="user_name" name="textinput" type="text" placeholder="User Name" class="form-control input-sm" required="true">
    <p class="help-block">To get user name Please <a href=' <%=ResolveUrl("../Client/Client_Registeration.aspx")%>'><b>Signup!</b></a> </p>
  </div>
</div>

<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="textinput"></label>
  <div class="controls">
    <input id="c_name" name="textinput" type="text" placeholder="Your Name" class="form-control input-md">
    <p class="help-block">e.g Ali Aslam </p>
  </div>
</div>

<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="textinput"></label>
  <div class="controls">
    <input id="email" name="textinput" type="text" placeholder="email address" class="form-control input-md" required="">
    <p class="help-block">e.gbooking@gmail.com</p>
  </div>
</div>

<!-- Password input-->
<div class="control-group">
  <label class="control-label" for=""></label>
  <div class="controls">
    <input id="cnic" name="textinput" type="text" placeholder="CNIC number" class="form-control input-md" required="true">
    <p class="help-block">37402-8465698-6</p>
  </div>
</div>


<!-- Text input-->

<div class="control-group">
  <label class="control-label" for="number"></label>
  <div class="controls">
    <input id="phone" name="number" type="text" placeholder="Phone Number/Mobile Number" class="form-control input-md" required="true">
    <p class="help-block">0305-2569236/051-569823</p>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for=""></label>
  <div class="col-md-4">
    <button id="Button1" name="" onclick="make_call_booking()" class="btn btn-primary">Contine Booking</button>
  </div>
 
</fieldset>
</div>
</div>
</div>



</div>





<asp:Label ID="s_id" runat="server" ClientIDMode="Static" CssClass="invisible" ></asp:Label>
</asp:Content>

