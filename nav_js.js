$(".nav li").on("click", function() {
      $(".nav li").removeClass("active");
      $(".navbar-right").removeClass("active");
      $(this).addClass("active");
    });
