(function ($) {

    $(document).ready(function () {
        var $body = $("body");
        $body.on('scroll', scrollTop);  //HACK - Prevent top bar from scrolling out of view (example - anchor tags)
        $body.trigger('scroll');

        function scrollTop() {
            $body.scrollTop(0);
        }

        United.AnchorSlide.handleAnchorSlide();

        $("a[href='#top']").click(function () {
            $("#s4-workspace").animate({ scrollTop: 0 }, "slow");
            return false;
        });
    });

})(window.jQuery)