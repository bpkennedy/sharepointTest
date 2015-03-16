var United = United || {};

United.AnchorSlide = (function ($) {
    'use strict';


    function handleAnchorSlide() {
        $('a[href*=#]').click(function () {
            if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
                var $target = $(this.hash);
                if (this.hash) {
                    $target = $target.length && $target || $('[name=' + this.hash.slice(1) + ']');
                    if ($target.length) {
                        var targetOffset = $target.position().top;
                        $('#s4-workspace')
                        .animate({ scrollTop: targetOffset }, 500);
                        return false;
                    }
                }
            }
        });
    }

    return {
        handleAnchorSlide: handleAnchorSlide
    };

})(jQuery);