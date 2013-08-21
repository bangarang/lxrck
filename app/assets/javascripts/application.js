//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require prettify
//= require prettyprint_init

    $(document).ready(function(){
        $('.navicontainer').click(function() {
          $(this).toggleClass("clicked");
          $('nav.main').toggle();
          return false;
        });
      });