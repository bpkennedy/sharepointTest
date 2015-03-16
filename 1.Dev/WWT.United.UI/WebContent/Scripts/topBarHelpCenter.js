var United = United || {};

United.TopBarHelpCenter = (function ($) {
    'use strict';
    var o,
        init = function (options) {
            o = options;
            setUpOneLi();
            setUpListItems();
            o.helpCenterIcon.click(handleHelpCenterIconClick);
        };

    function setUpOneLi() {
        var isSet = false;
        o.li1.click(function () {
            if (isSet == false) {
                o.answer1.fadeIn();
                isSet = true;
            } else {
                o.answer1.fadeOut();
                isSet = false;
            }
        });
    }

    function setUpListItems() {
        $(".faqBody li").click(function () {
            if ($(this).find(".answer").is(':hidden')) {
                $(this).find(".answer").slideDown();
                $(this).find("i").addClass("fa-minus-square-o");
                $(this).find("i").removeClass("fa-plus-square-o");
                $(this).find("i").css("color", "#ffffff;");
                $(this).find("span").css("color", "#ffffff;");
                $(this).find(".questionContainer").css("background-color", "#B56EBC;");
            } else {
                $(this).find(".answer").slideUp();
                $(this).find("i").addClass("fa-plus-square-o");
                $(this).find("i").removeClass("fa-minus-square-o");
                $(this).find("i").css("color", "");
                $(this).find("span").css("color", "");
                $(this).css("background-color", "");
                $(this).find(".questionContainer").css("background-color", "");
            }

        });
    }

    function handleHelpCenterIconClick() {
        if (o.helpCenterContainer.css("width") == "40px") {
            o.helpCenterContainer.animate({ width: "80px" });
            o.helpCenterIcon.css("background-color", "#b56ebb;");
            o.serviceTicketIcon.css("background-color", "#b56ebb;");
            o.helpCenterIcon.css("color", "#ffffff;");
            o.serviceTicketIcon.css("color", "#ffffff;");
            o.mainPanel.css("border-bottom", "2px solid #b56ebc").css("border-top", "2px solid #b56ebc")
            o.mainPanel.animate({ height: o.mainPanel.get(0).scrollHeight }, function () { o.mainPanel.css("height", "auto"); });
            o.topBarOverlay.fadeIn();
        } else {
            o.helpCenterContainer.animate({ width: "40px" });
            o.helpCenterIcon.css("background-color", "");  // Removes the CSS background-color property so hover effects continue to work properly.
            o.helpCenterIcon.css("color", "");  // Removes the CSS color property so hover effects continue to work properly.
            o.helpCenterContainer.css("background-color", "");  // Removes the CSS background-color property so hover effects continue to work properly.
            o.mainPanel.animate({ height: "0" }, function () { o.mainPanel.css("border", "none"); });
            o.topBarOverlay.fadeOut();
        }
    }

    return {
        init: init,
    };

})(jQuery);