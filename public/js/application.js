$(document).ready(function(n){
  
  // var winner = 0;
  var n = $("#gamecount").val();

  if($("#gamewinner").val() != ""){
    alert($("#gamewinner").val() + " has won!");
    

  }
  else {

    $(".col").click(function(){

        if(n % 2 == 0) {

          $(this).text("O");
          
          $("#movevalue").val("O");
          $("#elementid").val($(this).attr("id"));
          $("#symbol").val("O");
          $("#winnerplayerid").val("Player1");

          $("#playermove").submit();
        
          
        }

        else if(n % 2 == 1) {
          $(this).text("X");
          
          $("#movevalue").val("X");
          $("#elementid").val($(this).attr("id"));
          $("#playermove").submit();
          // check if player 2 won
          $("#symbol").val("X");
          $("#winnerplayerid").val("Player2");
          $("#winnercheck").submit();
          

        }

        else if (count == 9) {
        	alert("it's a draw!");
        }

    
    });
  }      

});

