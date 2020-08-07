$(document).on('turbolinks:load', function(){

  $(function() {

    $(".HeaderInner__parents").hide();

    $(".HeaderInner__List").hover(
      function(){
        console.log('のった')
      var parents = $(this).find(".HeaderInner__parents")
          parents.show();
       },
      function(){
        var parents = $(this).find(".HeaderInner__parents")
          parents.hide();
       }
    )
    $(".HeaderInner__parent").hover(
      function(){
      var children = $(this).children(".HeaderInner__children")
          children.show();
       },
      function(){
        var children = $(this).children(".HeaderInner__children")
        children.hide();
       }
    )
   
    $(".HeaderInner__child").hover(
      function() {
        var grandchildren = $(this).children(".HeaderInner__grandchildren")
            grandchildren.show();
      },
      function(){
        var grandchildren = $(this).children(".HeaderInner__grandchildren")
            grandchildren.hide();
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