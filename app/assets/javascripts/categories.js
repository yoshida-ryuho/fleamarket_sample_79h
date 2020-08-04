$(function() {

  $(".HeaderInner__Block").hover(
    function() {
      $(this).css('background-color','#b2f6f8');
    },

    function() {
      $(this).css('background-color','#fff');
    }

  );

  
  
  $(".HeaderInner__Default,.HeaderInner__CategoryBox").hover(
    function() {
      $(".HeaderInner__CategoryBox").css("display", "block");
    },
    function() {
      $(".HeaderInner__CategoryBox").css("display", "none");
    }
    );


    function getChildren(child) {
      let html = `
          <div class="HeaderInner__Block">
            <a class="HeaderInner__Left--first" href="/categories/1">
              <div class="HeaderInner__Parent_name">
                ${child.name}
              </div>
            </a>
          </div>
                  `;
      $(".HeaderInner__CategoryBox--parents").append(html);
    }


 


    $(".HeaderInner__Block").hover(function() {
      let input = $(this).attr('value');
      console.log(input);
      $.ajax({
        type: "GET",
        url: "/categories/get_category_children",
        data: { id: input },
        dataType: "json"
      })
      .done(function() {
        
        getChildren();
        console.log("成功です");
      })
      .fail(function() {
        console.log("失敗です");
      });
    });
});

