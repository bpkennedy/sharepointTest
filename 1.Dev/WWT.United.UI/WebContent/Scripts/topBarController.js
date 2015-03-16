var United = United || {};

United.Controller = (function ($, topBarSearchBox, topBarMainNav, topBarActivityStream) {
    var o;
    
    function init(options){
        o = options;
        bindUI();
    }

    function bindUI() {
        $(o.nameMenuMouseOver).attr("onmouseover", "");
        $(o.siteActionMouseOver).attr("onmouseover", "");
        o.mainNavIcon.on("click", openMainNav);
        o.streamNavIcon.on("click", openStreamNav);
        o.siteActionsMenu.on("click", openSiteActions);
        o.submitCover.on("click", handleSubmitClick);
        o.overlay.on("click", closeAll);
        o.nameButton.on("click", openSiteActions);
        o.sideNavButton.on("click", closeAll);
        o.topBarContainer.on("click", stopProp);
    }

    function stopProp(e) {
        e.stopPropagation();
    }

    function openMainNav() {
        callSharePointMenuDestoryer();
        o.streamNav.css("z-index", "20");
        o.mainNav.css("z-index", "25");
        $(o.spSiteActionPanel).css("z-index", "20");
        topBarSearchBox.close();
        topBarActivityStream.close();
    }

    function openStreamNav() {
        callSharePointMenuDestoryer();
        o.streamNav.css("z-index", "25");
        o.mainNav.css("z-index", "20");
        $(o.spSiteActionPanel).css("z-index", "20");
        topBarMainNav.close();
        topBarSearchBox.close();
    }

    function openSiteActions() {
        o.streamNav.css("z-index", "20");
        o.mainNav.css("z-index", "20");
        $(o.spSiteActionPanel).css("z-index", "25");
        topBarActivityStream.close();
        topBarMainNav.close();
        topBarSearchBox.close();
        
    }

    function handleSubmitClick() {
        callSharePointMenuDestoryer();
        //o.overlay.fadeOut();
        topBarActivityStream.close();
        topBarMainNav.close();
    }
    
    function closeAll(e) {
        callSharePointMenuDestoryer();
        topBarSearchBox.close();
        topBarMainNav.close();
        topBarActivityStream.close();
        if (e.target.className !== o.siteActionsButton && e.target.className !== o.siteActionsButtonWithHover && e.target.id !== o.nameMenuButton) {
            o.overlay.fadeOut();
        }
    }

    function callSharePointMenuDestoryer() {
        window.MenuHtc_hide();
    }
    
    return {
        init: init,
        closeAll: closeAll,
    };

// TODO: pass in other objects such as United.TopBarSearchBox
})(jQuery, United.TopBarSearchBox, United.TopBarMainNav, United.TopBarActivityStream);


(function ($) {
    $(document).ready(function () {
        United.Controller.init({
            overlay: $("#topBarOverlay"),
            mainNavIcon: $("#mainNavIcon"),
            streamNavIcon: $("#streamNavIcon"),
            siteActionsMenu: $("#siteActionsMenu"),
            siteActionMouseOver: $('.ms-siteactionsmenuinner'),
            submitCover: $("#unitedSubmitCover"),
            nameButton: $("#userDropdownCover"),
            sideNavButton: $("#snp-toggle"),
            topBarContainer: $("#united2TopBarContainer"),
            siteActionsButton: "siteActionsMenu",
            siteActionsButtonWithHover: "siteActionsMenu siteActionsMenuHover",
            nameMenuButton: "userDropdownCover",
            nameMenuMouseOver: ".ms-SPLink.ms-SpLinkButtonInActive.ms-welcomeMenu",
            mainNav: $('#tbmn > #panel'),
            streamNav: $('#streamNavPanel'),
            spSiteActionPanel: ".ms-MenuUIPopupBody.ms-MenuUIPopupScreen",
        });
    });
})(jQuery);
