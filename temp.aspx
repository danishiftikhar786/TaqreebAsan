<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="temp.aspx.cs" Inherits="temp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



<div class="fileuploadDiv">
    <div class="status"></div>
     <h3>Upload File using Jquery AJAX in Asp.net</h3>
     <input type="file" name="files[]" multiple="multiple" id="files">
     <input type="submit" value="Upload" class="button" id="btnUpload">
           <div class="progress">
            <div class="bar"></div >
            <div class="percent">0%</div >
          </div>
    </div>

        
            <div class="col-lg-9 filter_bg_color" style="border:1px solid #d3dbe7; margin: 5px; "  >
                <div class="row"><div class="col-lg-9"><h1 style="color: #808080">Find the Best deal.</h1></div></div>
                <div class="row"><div class="col-lg-9"><p style="color: #3399FF;">For Wedding Event ,Birthday Parties,Political gatherings,Social Gathering  and &amp; More+.</p></div></div>
                <div class="row"><div class="col-lg-7"><hr  class="h5" 
                             style="border-style: outset; border-width: 2px; color:#99FF33;"/></div></div>
             
             
                <div class="row">
                            <div class="col-lg-3"><select id="c1" class=" input-lg dropdown">
    <option>- Select City -</option>
    <option value="Rawalpindi">Rawalpindi</option>
    <option value="Islamabad">Islamabad</option>
    </select></div>
                            <div class="col-lg-3"><select id="p1" class=" input-lg input-lg dropdown">
    <option>- Max Persons -</option>
    <option value="100">100</option>
    <option value="200">200</option>
    <option value="300">300</option>
    <option value="400">400</option>
    <option value="500">500</option>
    <option value="1000">1000+</option>
    <option value="2000">2000+</option>
    </select></div>
   
                </div>
                 <br />
                  
             
             
             
                <div class="row">
                            <div class="col-lg-3"><select id="car" class=" input-lg dropdown">
    <option>- CarParking -</option>
    <option value="1">Avalible</option>
    <option value="2">Not Avalible</option>
    </select></div>
                            <div class="col-lg-3"><select id="timing" class=" input-lg dropdown">
    <option>- Avalibility -</option>
    <option value="3">Both</option>
    <option value="2">Day(12pm-5pm)</option>
    <option value="1">Night(5pm-10pm)</option>
    </select></div>
                </div>
                <br />
                <div class="row">
                <div class="col-lg-3"></div>
                <div class="col-lg-3"><a  class="btn btn-primary " onclick="redirect_search();" o href="#Search"><h4 style="font-family:@Arial Unicode MS;"><i class="glyphicon glyphicon-search"></i>SEARCH</h4></a></div>
                </div>


            
        </div>

        

</asp:Content>

