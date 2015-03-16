var united = united || {};

united.sample = (function ($) {
    "use strict";

    var settings = {
        title: undefined,
    };

    function initConfig(titleSelector) {
        settings.title = settings.sampleContainer.find(titleSelector);
    }

    function bindEvents() {
        settings.title.hover(function () {
            $(this).append($("<span> ****</span>"));
        }, function() {
            $(this).find("span:last").remove();
        });
    } 

    return {
        init: function (titleSelector) {
            initConfig(titleSelector);

            bindEvents();
        },
    };
}(jQuery));