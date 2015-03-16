var United = United || {};

United.TopBarActivityStream = (function ($) {
    'use strict';
    var o,
        iFrameLoaded = false,
        init = function (options) {
            o = options;
            o.streamIcon.click(handleIconClick);
            o.streamPopoutIcon.click(popOutApplicationPage);
            o.streamSettingsIcon.click(openStreamSettings);
        };

    function handleIconClick() {
        if (o.streamNav.is(":hidden")) {
            openStreamNav();
        } else {
            closeStreamNav();
        }
    }

    function openStreamNav() {
        o.topBarOverlay.fadeIn();
        loadIframe();
        o.streamIcon.addClass(o.streamIconHoverClass);
        o.streamNav
            .css("height", "0")
            .show()
            .animate({ 'height': $(window).height() - 55 + "px" }, 350).promise().done(function() {
                $("iframe#streamRemoteFrame").height("100%");
                $("iframe#streamRemoteFrame").height("-=35");
            });
    }

    function openStreamSettings() {
        //left "jQuery" here because this code may not work on the Images library - because sharepoint overwrites the $ sign with a new function on that page
        if (jQuery("#ngSettings").length == 0) {
            var b = '<div id="ngSettings" style="display:none;"><div id="ngSettingsContainer"></div></div>';
            jQuery("body").append(b)
        }
        jQuery(this).ngsettings({
            dialogWidth: 1e3
        });
    }

    function closeStreamNav() {
        o.topBarOverlay.fadeOut();
        o.streamIcon.removeClass(o.streamIconHoverClass);
        o.streamNav.slideUp(250);
    }

    function loadIframe() {
        if (iFrameLoaded === false) {
            o.streamIframeContainer.append(o.iframe).promise().done(function () {
                $(".ngAuthorLink").attr("target", "_blank");
                $(".ngActivityProfileIcon").parent().attr("target", "_blank");
            });
            iFrameLoaded = true;
        }
    }

    function popOutApplicationPage() {
        var dynamicHeight = $(window).height();
        window.open('/_layouts/United/ApplicationPages/ActivityStream.aspx', "", "toolbar=0, scrollbars=1, resizable=1, status=0, titlebar=0, menubar=0, location=0, directories=0, top=0, left=0, width=500, height=" + dynamicHeight + "");
        o.streamIcon.trigger("click");
    }

    function closeActivityStream() {
        o.streamNav.stop().slideUp(250);
        o.streamIcon.removeClass(o.streamIconHoverClass);
    }

    return {
        init: init,
        close: closeActivityStream
    };
})(jQuery);