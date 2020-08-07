$(document).on('turbolinks:load', function(){

  $(function() {
   
   
    $(".HeaderInner__List").hover(
      function(){
        console.log('のった')
      $(this).find(".HeaderInner__parents").show();
       },
      function(){
      $(this).find(".HeaderInner__parents").hide();
       }
    )
    $(".HeaderInner__parent").hover(
      function(){
      $(this).children(".HeaderInner__children").show();
       },
      function(){
      $(this).children(".HeaderInner__children").hide();
       }
    )
   
    $(".HeaderInner__child").hover(
      function() {
        $(this).children(".HeaderInner__grandchildren").show();
      },
      function(){
        $(this).children(".HeaderInner__grandchildren").hide();
      }
    )
  
        // # hoverで色を変える
      $(".HeaderInner__parent").hover(
        function() {
          $(this).css('background-color','#b2f6f8');
        },
        
        function() {
          $(this).css('background-color','#fff');
        });
      $(".HeaderInner__child,.HeaderInner__grandchild").hover(
        function() {
  
          $(this).css('background-color','rgb(236, 235, 235)');
        },
        
        function() {
          $(this).css('background-color','#fff');
        });
  });
  
  });