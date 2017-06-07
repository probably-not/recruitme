$(document).ready(function(){

  $("#submit-invite-request").click(function(){

    var email = $("#email").val();

    if(email == "") {
      $("#successmessage").html("<div class=\"alert alert-danger alert-dismissable\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>Please enter your email!</div>");
    }
    else {
      $.ajax({
        type: "POST",
        url: "/php/contact_us.php",
        data: "email="+email,
        success: function(html){

          var text = $(html).text();
          //Pulls hidden div that includes "true" in the success response
          var response = text.substr(text.length - 4);

          if(response == "true"){
            $("#successmessage").html(html);
          }
          else {
            $("#successmessage").html(html);
          }
        },
        beforeSend: function()
        {
          $("#successmessage").html("<p class='text-center'><img src='css/ajax-loader.gif'></p>")
        }
      });
    }
    return false;
  });
});