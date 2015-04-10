$(document).ready(function(n){
  
  // var winner = 0;
  var n = $("#gamecount").val();
  
  $(".col").click(function(){

    console.log("n:" + n)
      if(n % 2 == 0) {

        $(this).text("O");
        
        $("#movevalue").val("O");
        $("#elementid").val($(this).attr("id"));
        $("#playermove").submit();
        // check if player 1 won
        $("#symbol").val("O");
        $("#winnerplayerid").val("Player1");
        $("#winnercheck").submit();

        // $("#gamewinner").val()
        console.log($("#gamewinner").val())
        // if($("#gamewinner").val() != "" ) {
        //   alert("$("#gamewinner").val()" + " has won!");

        // }
        
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
        
        // if($("#gamewinner").val() != "" ) {
        //   alert("$("#gamewinner").val()" + " has won!");

        // }
        

      }

      else if (count == 9) {
      	alert("it's a draw!");
      }

  
  });
  

});
