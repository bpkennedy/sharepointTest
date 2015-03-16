var United = United || {};

United.AlertModule = (function ($) {
    'use strict';
    $.cookie.json = true;
    var workSpace,
        msTopBar2Height,
        topBarHeight = 50,
        alertHeight = 31,
        cookie = $.cookie('UnitedAlertBar') || {},
        o = {},
        app = {
            init: function (options) {
                if (!$("html").hasClass("ms-dialog")) {
                    o = options;
                    msTopBar2Height = $(".ms-cui-topBar2").height();
                    workSpace = $("#s4-workspace");
                    bindUI();
                }

            }
        };

    function setHeightNoAlert() {
        workSpace.css({ "height": $(window).height() - (msTopBar2Height + topBarHeight) });
    }

    function setHeightAlert() {
        workSpace.css({ "height": $(window).height() - (msTopBar2Height + alertHeight + topBarHeight) });
    }

    function bindUI() {
        o.warnings.length !== 0 ? o.warnings.each(showDismissAlert).promise().done(handleDismissedWarnings) : o.information.each(showDismissAlert);
        o.warningDismiss.on("click", closeAlert);
        o.informationDismiss.on("click", closeAlert);
    }

    function showDismissAlert() {
        var id = $(this).attr("alertid");
        if (cookie[id] !== "dismissed") {
            $(this).slideDown().promise().done(setHeightAlert);
        } else {
            $(this).remove();
        }
    }

    function updateCookie() {
        var date = new Date();
        var midnight = new Date(date.getFullYear(), date.getMonth(), date.getDate(), 23, 59, 59);
        $.cookie('UnitedAlertBar', cookie, {
            path:"/",
            expires: midnight
        });
    }

    function addToCookie(cname) {
        cookie[cname] = "dismissed";
        updateCookie();
    }

    function closeAlert() {
        var alert = $(this).parent().parent();
        alert.slideUp().promise().done(
            function () {
                setHeightNoAlert();
                dismissAlert(alert, alert.attr("alertid"));
            }
        );
    }

    function dismissAlert(item, id){
        item.remove();
        addToCookie(id);
        handleDismissedWarnings();
    }
    
    function handleDismissedWarnings()
    {
        if ($(".unitedAlert.Critical").length === 0) // && $(".unitedAlert.Informational").length !== 0
        {
            var id = $(".unitedAlert.Informational").first().attr("alertid");
            //var cookie = getCookie("UnitedAlerts-" + id);
            if (id && (!cookie[id] || cookie[id] !== "dismissed")) {
                $(".unitedAlert.Informational").first().slideDown().promise().done(setHeightAlert);
            } else {
                $(".unitedAlert.Informational").first().remove();
                setHeightNoAlert();
                //handleDismissedWarnings();
            }

        }
    }
    return app;
})(jQuery);