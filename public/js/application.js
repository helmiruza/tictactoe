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
        // n += 1;
        // return n;
        
      }

      else if(n % 2 == 1) {
        $(this).text("X");
        
        $("#movevalue").val("X");
        $("#elementid").val($(this).attr("id"));
        $("#playermove").submit();
        // n += 1;
        // return n;

      }

      else if (count == 9) {
      	alert("it's a draw!");
      }

  
  });
  

});
