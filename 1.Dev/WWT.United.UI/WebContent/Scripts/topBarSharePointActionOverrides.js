var United = United || {};

United.TopBarSharePointActions = (function ($) {
    'use strict';
    
    var o,
        init = function (options) {
            o = options;
            o.gearIconOverlay.on("click", handleSiteActionClick);
            o.nameOverlay.on("click", handleNameClick);
            checkRibbonPermission();
        };

    function handleSiteActionClick() {
        if ($(o.siteActionMenu).length) {
            closeSiteActionsMenu();
        } else {
            handleSiteActionsMenuAnimation();
        }
    }

    function checkRibbonPermission() {
        if (!o.siteActionContainer.children().length) {
            o.siteActionContainer.hide();
            o.gearIconOverlay.hide();
        }
    }

    function closeSiteActionsMenu() {
            var a = g_menuHtc_lastMenu;
            if ($(a).attr("id").indexOf("PersonalActionMenu") == "-1") {
                window.MenuHtc_hide();
                o.topBarOverlay.fadeOut();
                o.gearIconOverlay.removeClass(o.gearIconOverlayHoverClass);
            } else {
                window.MenuHtc_hide();
                delaySiteActionsHandler();
            }
    }

    function handleSiteActionsMenuAnimation() {
        o.topBarOverlay.fadeIn();
        o.gearIconOverlay.addClass(o.gearIconOverlayHoverClass);
        setTimeout(function () {
            o.gearIcon.trigger('onclick');
            delayAnimate();
            $(o.siteActionMenu).attr("title", "");
        }, 1);
        if (window.HideMenu.toString() !== united2OriginalHideMenu.toString()) {
            window.HideMenu = united2OriginalHideMenu;
        }
        if (window.PopupMouseLeave.toString() !== united2PopupMouseLeave.toString()) {
            window.PopupMouseLeave = united2PopupMouseLeave;
        }
    }

    function delaySiteActionsHandler() {
        setTimeout(function () {
            if (!g_menuHtc_lastMenu) {
                o.gearIcon.trigger("onclick");
                o.gearIconOverlay.addClass(o.gearIconOverlayHoverClass);
                delayAnimate();
            } else {
                delaySiteActionsHandler();
            }
        }, 200);
    }


    function handleNameClick() {
        if ($(o.siteActionMenu).length) {
            var a = g_menuHtc_lastMenu;
            if ($(a).attr("id").indexOf("SiteActionsMenuMain") == "-1") {
                window.MenuHtc_hide();
                o.topBarOverlay.fadeOut();
            } else {
                window.MenuHtc_hide();
                o.gearIconOverlay.removeClass(o.gearIconOverlayHoverClass);
                delayNameHandler();
            }
        } else {
            o.topBarOverlay.fadeIn();
            setTimeout(function () {
                o.nameButton.trigger('onclick');
                delayAnimate();
            }, 1);
        }
    }

    function delayNameHandler() {
        setTimeout(function () {
            if (!g_menuHtc_lastMenu) {
                o.nameButton.trigger("onclick");
                delayAnimate();
            } else {
                delayNameHandler();
            }
        }, 200);
    }

    function hackyEval(e) {
        var x = $(this).attr("onMenuClick");
        eval(x);
        setTimeout(function() {
            United.Controller.closeAll(e);
        }, 1);
    }
    

    function delayAnimate() {
        setTimeout(function () {
            var siteActionContainer = $(o.siteActionMenu);
            siteActionContainer.addClass("siteActionBorder");
            if (g_menuHtc_lastMenu) {
                if ($(g_menuHtc_lastMenu).attr("id").indexOf("SiteActionsMenuMain") != -1) {
                    siteActionContainer.css({ "top": "50px", "left": "0" });
                } else if ($(g_menuHtc_lastMenu).attr("id").indexOf("PersonalActionMenu") != -1) {
                    siteActionContainer.css({ "top": "50px", "left": "auto", "right": "-40px" });
                }
            }
            //siteActionContainer.children().on("click", United.Controller.closeAll);
            siteActionContainer.children().on("click", hackyEval);
            siteActionContainer.css({ "height": "0" });
            siteActionContainer.addClass("visible");
            siteActionContainer.animate({ 'height': $(window).height() - 55 + "px" }, 250, function () {
                if (g_menuHtc_lastMenu && $(g_menuHtc_lastMenu).attr("id").indexOf("SiteActionsMenuMain") != -1) {
                    siteActionContainer.css({ "overflow-y": "visible" });
                } else if ($(g_menuHtc_lastMenu).attr("id").indexOf("PersonalActionMenu") != -1) {
                    siteActionContainer.css({ "overflow-y": "visible" });
                }
            });
        }, 1);
    }

    //before the IIFE we are overwriting the sharepoint OOTB javascript that handles teh destroying of the site actions and username drop-down modals.
    function updateHideMenu() {
        if (window.HideMenu) {
            window.HideMenu = united2OriginalHideMenu;
        } else {
            setTimeout(updateHideMenu, 500);
        }
    }

    function united2OriginalHideMenu(a, c) {
        ULSrLq:;
        ClearTimeOutToHideMenu();
        o.gearIconOverlay.removeClass(o.gearIconOverlayHoverClass);   //HACK: This is needed to ensure that the gear icon color changes properly
        // o.topBarOverlay.fadeOut();
        if (c == null)
            c = 0;
        if (c == 2) {
            if (a._onDestroy != null) {
                a._onDestroy();
                a._onDestroy = null;
            }
            return;
        }
        if (IsOpen(a) && !IsAccessibilityFeatureEnabledProxy()) {
            if (a._oParent != null) {
                a._oParent.onclick = a._oParent._onclick;
                a._oParent.onmouseover = a._oParent._onmouseover;
                a._oParent.onmouseout = a._oParent._onmouseout;
                a._oParent.onmousedown = a._oParent._onmousedown;
                a._oParent.oncontextmenu = a._oParent._oncontextmenu;
                if (typeof _fV4UI != "undefined" && _fV4UI)
                    a._oParent.onkeydown = a._oParent._onkeydown
            }
            SetBodyEventHandlers(null);
            UpdateLevel(a, 0);
            var b = a._arrPopup[0];
            if (b != null) {
                var d = document.getElementById(b._backgroundFrameId);
                d != null && d.parentNode.removeChild(d);
                b.parentNode != null && b.parentNode.removeChild(b);
                a._arrPopup[0] = null;
                if (c == 0)
                    if (a._onDestroy != null && typeof a._onDestroy == "function") {
                        a._onDestroy();
                        a._onDestroy = null
                    }
            }
            g_menuHtc_lastMenu = null;
            RenderECBBackwardCompatibilityMode(false)
        }

    }

    function updateMenuHtc_hide() {
        if (window.MenuHtc_hide) {
            window.MenuHtc_hide = function () {
                ULSrLq:;
                ClearTimeOutToHideMenu();
                var a = g_menuHtc_lastMenu;
                    if (a != null)
                        if (a._accessibleMenu != null)
                            CloseAccessibleMenu(a);
                        else
                            HideMenu(a);
                g_menuHtc_lastMenu = null;
            }
        } else {
            setTimeout(updateMenuHtc_hide, 500);
        }
    }

    function updatePopMouseLeave() {
        if (window.PopupMouseLeave) {
            window.PopupMouseLeave = function (b) {
                ULSrLq:;
                var a;
                a = GetEventPopup(b);
                if (a != null && $(g_menuHtc_lastMenu).attr("id").indexOf("PersonalActionMenu") === -1 && $(g_menuHtc_lastMenu).attr("id").indexOf("SiteActionsMenuMain") === -1) {
                    UnselectCurrentOption(a.master);
                    SetTimeOutToHideMenu();
                }
                return false;
            }
        } else {
            setTimeout(updatePopMouseLeave, 250);
        }
    }

    function updatePopMouseLeave() {
        if (window.PopupMouseLeave) {
            window.PopupMouseLeave = united2PopupMouseLeave;
        } else {
            setTimeout(updatePopMouseLeave, 250);
        }
    }

    function united2PopupMouseLeave(b) {
        ULSrLq:;
        var a;
        a = GetEventPopup(b);
        if (a != null && $(g_menuHtc_lastMenu).attr("id").indexOf("PersonalActionMenu") === -1 && $(g_menuHtc_lastMenu).attr("id").indexOf("SiteActionsMenuMain") === -1) {
            UnselectCurrentOption(a.master);
            SetTimeOutToHideMenu();
        }
        return false;
    }



    return {
        init: init,
        updateHideMenu: updateHideMenu,
        updateMenuHtc_hide: updateMenuHtc_hide,
        updatePopMouseLeave: updatePopMouseLeave
    };

})(jQuery);

(function ($) {
    $(document).ready(function () {
        United.TopBarSharePointActions.init({
            siteActionContainer: $("#siteactiontd"),
            gearIcon: $("#siteactiontd > span.ms-siteactionsmenuinner"),
            siteActionMenu: ".ms-MenuUIPopupBody.ms-MenuUIPopupScreen",
            gearIconOverlay: $("#siteActionsMenu"),
            gearIconOverlayHoverClass: "siteActionsMenuHover",
            topBarOverlay: $('#topBarOverlay'),
            streamNav: $('#streamNavPanel'),
            streamIconHoverClass: 'streamNavIconOrange',
            mainNav: $('#tbmn > #panel'),
            navIcon: $('#mainNavIcon'),
            navIconHoverClass: 'mainNavIconBlue',
            searchDropDown: $('#scopesDropdown'),
            hoverDropClass: 'hoverDrop',
            searchClick: $('#unitedSubmitCover'),
            nameOverlay: $("#userDropdownCover"),
            nameButton: $(".welcomemenu .ms-welcomeMenu")
        });

        United.TopBarSharePointActions.updateHideMenu();
        United.TopBarSharePointActions.updateMenuHtc_hide();
        United.TopBarSharePointActions.updatePopMouseLeave();
    });
})(jQuery);


