/*
Author:Danish Iftikhar
Date:7/21/2015
*/
//function used to change status of  sp account from existing
function change_status(id) {
       var ids = $(id).attr("id");
       var editableText = $("<Select id='status' title='" + $(id).attr("title") + "'  onchange='getval(this);'  ><option>Change Status</option><option>Active</option><option>Blocked</option><Select>");
        // fill the textarea with the div's text
        //editableText.val(divHtml);
       //alert(ids);
       //alert(editableText);
       // replace the div with the textarea
        $("#"+ids).replaceWith(editableText);
        //change button text

    }

    //function to get value of change event of status
    function getval(val) {

        var status = val.value;
        //alert(status);
        if (status != "Change Status") {
            var id = $(val).attr("title");
            //alert(id);
            var datatype = "{id:'" + id + "' ,status:'" + status + "'}";
            $.ajax({
                type: "POST",
                url: "Servcie_Providers.aspx/update_status",
                data: datatype,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    //alert(response.d);
                    //$("#success").html(response.d);
                    //document.getElementById("na").innerHTML = "updated";
                    location.reload();
                },
                failure: function (response) {
                    //alert(response.d);

                    //$("#error").html("Error!");
                    location.reload();
                }
            });
        }
        else {
            alert("Select status to change!");
        }


    }

