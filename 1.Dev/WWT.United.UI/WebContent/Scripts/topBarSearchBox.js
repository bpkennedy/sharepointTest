var United = United || {};

United.TopBarSearchBox = (function ($) {
    'use strict';
    var o,
        upArrowConst = 38,
        downArrowConst = 40,
        enterConst = 13,
        init = function (options) {
            o = options;
            o.unitedScope.click(handleUnitedScopeClick);
            o.peopleScope.click(handlePeopleScope);
            o.thisSiteScope.click(handleThisSiteScope);
            o.searchButton.click(handleSearchButton);
            o.searchButton.on("mouseover", handleSearchButtonMouseOn);
            o.searchButton.on("mouseout", handleSearchButtonMouseOut);
            o.searchText.keypress(handleKeyPress);
        };

    //Opening functions
    function openSearchBox() {
        o.topBarOverlay.fadeIn();
        o.searchButtonActual.animate({ "height": "32px", "margin-top": "10px", "background-color": "#9cb647", "color": "#ffffff" });
        o.searchButton.animate({ "color": "#ffffff" });
        o.searchText.animate({ "width": "264px", "padding-left": "9px", "border-top-width": "1px", "border-top-color": "#B0B0B0", "border-top-style": "solid", "border-right-width": "1px", "border-right-color": "#B0B0B0", "border-right-style": "solid", "border-bottom-width": "1px", "border-bottom-color": "#B0B0B0", "border-bottom-style": "solid" })
            .promise()
            .done(showScopesDropdown);
        setSearchTextCursor();
    }

    function setSearchTextCursor() {
        if (o.searchText.val() === "") {
            setTimeout(function () { o.searchText.focus(); }, 50);
        }
    }

    function showScopesDropdown() {
        if (!o.searchDropDown.hasClass(o.hoverDropClass)) {
            o.searchDropDown.addClass(o.hoverDropClass);
            o.searchDropDown.slideDown("fast");
        }
    }

    //Closing functions
    function closeSearchBox() {
        o.searchDropDown.removeClass(o.hoverDropClass);
        o.searchDropDown.stop().slideUp("fast").promise().done(function () {
            o.searchText.animate({ "width": "0", "padding-left": "0" }).promise().done(function () {
                o.searchButtonActual.animate({ "height": "50px", "margin-top": "0", "color": "#4D5052" });
                o.searchButtonActual.css("background-color", "");
                o.searchButton.css("color", "");
                o.searchText.css("border", "none");
            });
        });
    }

    //Change Scope
    function handleUnitedScopeClick(e) {
        e.stopPropagation();
        o.activeUrl = o.thisSiteUrl;
        o.unitedScope.addClass(o.activeClass);
        o.peopleScope.removeClass(o.activeClass);
        o.thisSiteScope.removeClass(o.activeClass);

        if (isInputEmpty()) {
            setSearchTextCursor();
        } else {
            submitSearch();
        }
    }

    function handlePeopleScope(e) {
        e.stopPropagation();
        o.activeUrl = o.thisSiteUrl;
        o.unitedScope.removeClass(o.activeClass);
        o.peopleScope.addClass(o.activeClass);
        o.thisSiteScope.removeClass(o.activeClass);

        if (isInputEmpty()) {
            setSearchTextCursor();
        } else {
            submitSearch();
        }
    }

    function handleThisSiteScope(e) {
        e.stopPropagation();
        o.activeUrl = o.thisSiteUrl;
        o.unitedScope.removeClass(o.activeClass);
        o.peopleScope.removeClass(o.activeClass);
        o.thisSiteScope.addClass(o.activeClass);

        if (isInputEmpty()) {
            setSearchTextCursor();
        } else {
            submitSearch();
        }
    }

    function handleSearchButton() {
        if (!o.searchDropDown.hasClass(o.hoverDropClass)) {
            openSearchBox();
        } else {
            if (isInputEmpty()) {
                closeSearchBox();
                o.topBarOverlay.fadeOut();
            } else {
                submitSearch();
            }
        }
    }

    function submitSearch() {
        var url = location.hostname.split('.'),
            subdomain = url.shift(),
            env = subdomain.split('-');
        switch(env[1]) {
            case "dev": 
                o.activeUrl = "https://united-dev.wwt.com" + o.activeUrl;
                o.peopleResultsUrl = "https://united-dev.wwt.com" + o.peopleResultsUrl;
                break;
            case "test":
                o.activeUrl = "https://united-test.wwt.com" + o.activeUrl;
                o.peopleResultsUrl = "https://united-test.wwt.com" + o.peopleResultsUrl;
                break;
            case "vm":
                o.activeUrl = "https://united-vm.wwt.com" + o.activeUrl;
                o.peopleResultsUrl = "https://united-vm.wwt.com" + o.peopleResultsUrl;
                break;
            default:
                o.activeUrl = "https://united.wwt.com" + o.activeUrl;
                o.peopleResultsUrl = "https://united.wwt.com" + o.peopleResultsUrl;
        }
        if (isUnitedScopeSelected()) {
            window.location = o.activeUrl + (encodeURIComponent(o.searchText.val()));
        } else if (isThisSiteScopeSelected()) {
            window.location = o.activeUrl + (encodeURIComponent(o.searchText.val())) + "&u=" + o.webUrl;
        } else {
            window.location = o.peopleResultsUrl + (encodeURIComponent(o.searchText.val() + "*"));
        }
    }

    function isUnitedScopeSelected() {
        return o.unitedScope.hasClass(o.activeClass);
    }

    function isThisSiteScopeSelected() {
        return o.thisSiteScope.hasClass(o.activeClass);
    }


    function isInputEmpty() {
        if (o.searchText.val() !== "") {
            return false;
        }
        return true;
    }

    function handleSearchButtonMouseOn() {
            o.searchButtonActual.addClass('submitHover');
    }

    function handleSearchButtonMouseOut() {
        o.searchButtonActual.removeClass('submitHover');
    }

    function handleKeyPress(event) {
        var active = o.searchLiItems.filter('.' + o.activeClass);
        if (event.keyCode === enterConst) {
            if (!isInputEmpty()) {
                submitSearch();
            }
            return false;
        } else if (event.keyCode === upArrowConst) {
            if (active.prev().length !== 0) {
                active.removeClass(o.activeClass).prev().addClass(o.activeClass);
            } else {
                active.removeClass(o.activeClass);
                o.searchLiItems.last().addClass(o.activeClass);
            }
        } else if (event.keyCode === downArrowConst) {
            if (active.next().length !== 0) {
                active.removeClass(o.activeClass).next().addClass(o.activeClass);
            } else {
                active.removeClass(o.activeClass);
                o.searchLiItems.first().addClass(o.activeClass);
            }
        }
    }

    return {
        init: init,
        close: closeSearchBox
    };

})(jQuery);