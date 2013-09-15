//= require jquery
//= require jquery_ujs
//= require item_types
//= require turbolinks
//= require prettify
//= require prettyprint_init
//= require lazyload

    $(document).ready(function(){
        $('.navicontainer').click(function() {
          $(this).toggleClass("clicked");
          $('nav.main').toggle();
          return false;
        });
        $('.video-link').click(function() {
          $('.home-video').toggleClass("open");
          return false;
        });
        $(".lazy").lazyload({
              effect : "fadeIn"
          });
      });

