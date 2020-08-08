$(document).on('turbolinks:load', function(){

  $(function() {

    $(".HeaderInner__parents,.HeaderInner__children,.HeaderInner__grandchildren").hide();
    $(".HeaderInner__parent,.HeaderInner__child,.HeaderInner__grandchild").css('background-color','#fff');


    $(".HeaderInner__List").hover(
      function(){
        console.log('のった')
      var parents = $(this).find(".HeaderInner__parents")
          parents.show(10);
       },
      function(){
        var parents = $(this).find(".HeaderInner__parents")
          parents.hide(10);
       }
    )
    $(".HeaderInner__parent").hover(
      function(){
      var children = $(this).children(".HeaderInner__children")
          children.show(10);
       },
      function(){
        var children = $(this).children(".HeaderInner__children")
        children.hide(10);
       }
    )
   
    $(".HeaderInner__child").hover(
      function() {
        var grandchildren = $(this).children(".HeaderInner__grandchildren")
            grandchildren.show(10);
      },
      function(){
        var grandchildren = $(this).children(".HeaderInner__grandchildren")
            grandchildren.hide(10);
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