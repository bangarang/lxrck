/*
* Background Video
*/

(function($) {

  $.backgroundVideo = function(el, options) {
    
    var defaults = {}
    var plugin = this;    
    plugin.settings = {}
    
    var init = function() {
      plugin.settings = $.extend({}, defaults, options);
      plugin.el = el;
      buildVideo();
    }
    
    var buildVideo = function () {
      plugin.videoEl = document.getElementById("background");
      plugin.$videoEl = $(plugin.videoEl);
      plugin.$videoEl.fadeIn(2000);
      setProportion();
    }
    
    var setProportion = function () {
      var proportion = getProportion();
      plugin.$videoEl.width(proportion*plugin.settings.width);
      plugin.$videoEl.height(proportion*plugin.settings.height);
      
      if (typeof plugin.settings.align !== 'undefined') {
        centerVideo();
      }
    }
    
    var getProportion = function () {
      var windowWidth = $(window).width();
      var windowHeight = $(window).height();
      var windowProportion = windowWidth / windowHeight;
      var origProportion = plugin.settings.width / plugin.settings.height;
      var proportion = windowHeight / plugin.settings.height;
      
      if (windowProportion >= origProportion) {
        proportion = windowWidth / plugin.settings.width;
      }
      
      return proportion;
    }
    
    var centerVideo = function() {
      var centerX = (($(window).width() >> 1) - (plugin.$videoEl.width() >> 1)) | 0;
      var centerY = (($(window).height() >> 1) - (plugin.$videoEl.height() >> 1)) | 0;

      if (plugin.settings.align == 'centerXY') {
        plugin.$videoEl.css({ 'left': centerX, 'top': centerY });
        return;
      }

      if (plugin.settings.align == 'centerX') {
        plugin.$videoEl.css('left', centerX);
        return;
      }

      if (plugin.settings.align == 'centerY') {
        plugin.$videoEl.css('top', centerY);
        return;
      }
    }

    init();
    
    $(window).resize(function() { setProportion(); });
    plugin.$videoEl.bind('ended', function(){ this.play();  });
  }
})(jQuery);
