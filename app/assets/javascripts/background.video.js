;(function ( $, window, document, undefined ) {

  // Create the defaults once
  var pluginName = "backgroundVideo",
      defaults = {
        autoplaying: true,
        $container: [],
        triggerElement: null,
        triggerEvent: 'click',
        currentSlide: 1,
        videoSelector: '.slide video',
        $videos: [],
        slideshowLength: 0
      };

  // The actual plugin constructor
  function backgroundVideo( element, options ) {
    this.element = element;
    this.options = $.extend( {}, defaults, options );
    this._defaults = defaults;
    this._name = pluginName;
    this.init();
  }

  backgroundVideo.prototype = {

    init: function() {
      this.$container = $(this.element);
      this.$videos = this.options.$videos.length || $(this.options.videoSelector);
      this.currentSlide = this.options.currentSlide;
      this.slideshowLength = this.options.slideshowLength || this.$videos.length;

      var self = this,
          slideshowType = window.matchMedia("(max-width: 700px)").matches ||
                          window.matchMedia("(max-device-width: 1024px)").matches ? 'image' : 'video';

      this.$container.addClass(slideshowType + '-slideshow');
      if (this.options.autoplaying) {
        this.startSlideshow(slideshowType);
      } else if (this.options.triggerElement) {
        $(this.options.triggerElement).on(this.options.triggerEvent, function() {
          self.startSlideshow(slideshowType);
        });
      }
    },

    startSlideshow: function(slideshowType) {
      switch (slideshowType) {
        case 'image':
          this.initImageSlideshow();
          break;
        case 'video':
          this.initVideoSlideshow();
          break;
        default:
          this.initVideoSlideshow();
          break;
      }
    },

    advanceSlide: function() {
      var nextSlide = this.currentSlide < this.slideshowLength ? this.currentSlide + 1 : 1;

      this.$container.removeClass('slideshow-initial slide' + this.currentSlide + '-playing').addClass('slide' + nextSlide + '-playing');
      this.currentSlide = nextSlide;
    },

    initVideoSlideshow: function() {
      var self = this;

      this.$container.addClass('slideshow-playing slide1-playing');
      this.$videos[0].play();
      this.$videos.on('timeupdate', function(e) {
        self.videoTimeupdateHandler(e);
      });
    },

    initImageSlideshow: function() {
      var self = this;

      this.$container.addClass('slideshow-playing slide1-playing');
      setInterval(function() {
        self.advanceSlide();
      }, 6000);
    },

    videoTimeupdateHandler: function(e) {
      var video = e.target;

      if (video != this.$videos[this.currentSlide - 1]) return;
      if (video.currentTime + 1 >= video.duration) {
        this.advanceSlide();
        this.$videos[this.currentSlide - 1].play();
      }
    }

  };

  // A really lightweight plugin wrapper around the constructor,
  // preventing against multiple instantiations
  $.fn[pluginName] = function ( options ) {
    return this.each(function () {
      if (!$.data(this, "plugin_" + pluginName)) {
        $.data(this, "plugin_" + pluginName, new backgroundVideo( this, options ));
      }
    });
  };


})( jQuery, window, document );