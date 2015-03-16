var United = United || {};

United.TopBarMainNav = (function ($) {
    'use strict';
    var o,
        positionHolder = -1,
        isPosting = false,
        init = function (options) {
            o = options;
            o.hiddenNavLinkContainer.each(sortListDataToDom);
            o.hiddenFavoritesLinkContainer.each(sortFavoriteDataToDom);
            o.navIcon.click(openCloseMenu);
            o.categoryControl.click(openCloseCategory);
            o.searchInput.on("keyup", handleSearchInput);
            o.searchInput.keydown(handleArrowKeys);
            o.clearSearchIcon.click(clearSearchInput);
            o.favoritesTab.click(switchTabs);
            o.allSitesTab.click(switchTabs);
            o.starLink.click(handleClickedFavorite);
            o.categoryTitle.click(handleRollupCategoriesOnClick);
            handleError();
            favoritesExistCheck();
        };

    //Favorites Feature
    //------------------------------
    //handles the click on the UI star icon
    function handleClickedFavorite() {
        var $this = $(this),
        id = $this.parent().attr('id'),
        category = $this.parent().data('category'),
        keywords = $this.parent().data('altkeywords'),
        url = $this.parent().children().first().attr('href'),
        title = $this.parent().attr('title'),
        favid = $this.parent().data('favid'),
        newtab = $this.parent().data('tab') == "True" ? 1 : 0;

        if ($(this).children().hasClass(o.emptyStarClass)) {
            if (!isPosting) {
                addFavoriteToDom(category, keywords, url, title, newtab, id, $this);
            }
        } else {
            if (o.favoritesHolder.find("#" + id).length) {
                if (!isPosting) {
                    deleteFavoriteFromDom($this, id);
                }
            }
        }
    }
    //Delete favorite from the UI
    function deleteFavoriteFromDom(item, id) {
        var foundFavorite = o.favoritesHolder.find("[data-navid=\"" + id + "\"]"),
        foundFavoriteId = o.favoritesHolder.find("[data-navid=\"" + id + "\"]").data('favid');
        item.children().removeClass(o.fullStarClass);
        item.children().addClass(o.emptyStarClass);
        foundFavorite.remove();
        o.contentWrapper.find("#" + id).find(o.starLinkControl).children().removeClass(o.fullStarClass);
        o.contentWrapper.find("#" + id).find(o.starLinkControl).children().addClass(o.emptyStarClass);
        deleteFavoriteInList(item, foundFavoriteId);
        handlefavoriteMessage();
        isPosting = true;
    }
    //Add favorite to the UI
    function addFavoriteToDom(category, keywords, url, title, newtab, id, item) {
        item.children().removeClass(o.emptyStarClass);
        item.children().addClass(o.fullStarClass);
        var clone = item.parent().clone(true);
        clone.appendTo(o.favoritesHolder);
        createFavoriteInList(category, keywords, url, title, newtab, id, item, clone);
        handlefavoriteMessage();
        isPosting = true;
    }
    //Create favorite in the backend
    function createFavoriteInList(category, keywords, url, title, newtab, id, $this, clone) {
        if (newtab) {
            newtab = "true";
        } else {
            newtab = "false";
        }
        var favoriteData = encodeURI("category=" + category + "&keywords=" + keywords + "&url=" + url + "&title=" + title + "&newtab=" + newtab + "&id=" + id);
        $.ajax({
            type: "POST",
            data: favoriteData,
            url: getRelativeUrl("post"),
            success: function (xData) {
                var newFavId = xData.childNodes[0].innerHTML;
                $this.parent().attr("data-favid", newFavId).attr("data-navid", id);
                clone.attr("data-favid", newFavId).attr("data-navid", id);
                $this.children().removeClass(o.emptyStarClass);
                $this.children().addClass(o.fullStarClass);
                isPosting = false;
            },
            error: function() {
                $this.children().removeClass(o.fullStarClass);
                $this.children().addClass(o.emptyStarClass);
                isPosting = false;
            }
        });
    }
    //Delete favorite from the backend
    function deleteFavoriteInList($this, id) {
        $.ajax({
            type: "POST",
            data: ("id=" + id),
            url: getRelativeUrl("delete"),
            success: function () {
                $this.children().removeClass(o.fullStarClass);
                $this.children().addClass(o.emptyStarClass);
                isPosting = false;
            },
            error: function () {
                $this.children().removeClass(o.emptyStarClass);
                $this.children().addClass(o.fullStarClass);
                isPosting = false;
            }
        });
    }

    //Setup default full/empty star css classes on page load
    function applyDefaultStarClass(favorite) {
        var favoriteId = favorite.data('navid');
        o.favoritesHolder.each(function () {
            if ($("#" + favoriteId).parents(".contentWrapper").length == 1) {
                o.contentWrapper.find("#" + favoriteId).find(o.starLinkControl).children().removeClass(o.emptyStarClass);
                o.contentWrapper.find("#" + favoriteId).find(o.starLinkControl).children().addClass(o.fullStarClass);
            }
        });
    }
    //Handle friendly message in Favorites panel if user has no favorites
    function handlefavoriteMessage() {
        if (!o.favoritesHolder.children().length) {
            o.favoriteCheck.show();
        } else {
            o.favoriteCheck.hide();
        }
    }
    //Perform the check for if user has favorites on page load
    function favoritesExistCheck() {
        if (!o.favoritesHolder.children().length) {
            resetTabs();
            handlefavoriteMessage();
        } else {
            handlefavoriteMessage();
            o.allSitesTab.removeClass(o.activeNavLinkClass);
            o.contentWrapper.hide();
            o.favoritesTab.addClass(o.activeNavLinkClass);
            o.favoritesWrapper.show();
        }
    }

    //Panel Animations and Interface
    //----------------------------------------------
    //resets Favs/All tabs to default
    function resetTabs() {
        o.favoritesTab.removeClass(o.activeNavLinkClass);
        o.favoritesWrapper.hide();
        o.allSitesTab.addClass(o.activeNavLinkClass);
        o.contentWrapper.show();
    }
    //handles switching from Favorites to All Sites tab and vice versa
    function switchTabs() {
        if ($(this).hasClass('allSites')) {
            if ($('.contentWrapper:visible').length == 0) {
                resetTabs();
                clearSearchInput();
            }
        } else if ($(this).hasClass('favorites')) {
            if ($('.favoritesWrapper:visible').length == 0) {
                o.allSitesTab.removeClass(o.activeNavLinkClass);
                o.contentWrapper.hide();
                o.favoritesTab.addClass(o.activeNavLinkClass);
                o.favoritesWrapper.show();
                clearSearchInput();
            }
        }
    }
    //handles Accordion animations for item Categories and arrow classes
    function handleRollupCategoriesOnClick() {
        o.categoryTitle.not(this).next().children("ul").slideUp();
        o.categoryTitle.children("span").not($(this).children("span")).removeClass(o.arrowDownClass);
    }
    //slides up and closes the Main Nav Panel
    function closeMainNav() {
        o.mainNav.stop().slideUp(250);
        o.navIcon.removeClass(o.navIconHoverClass);
    }
    //handles arrow classes
    function openCloseCategory() {
        $(this).next().children().slideToggle();
        $(this).children("span").toggleClass(o.arrowDownClass);
    }
    //opens Main Nav Panel
    function openCloseMenu() {
        var mainNav = o.mainNav;
        if (mainNav.is(":hidden")) {
            mainNav
                .css("height", "0")
                .show()
                .animate({ 'height': $(window).height() - 55 + "px" }, 250);
            o.topBarOverlay.fadeIn();
            o.navIcon.addClass(o.navIconHoverClass);
            o.searchInput.focus();
            mainNav.scrollTop(0);
        } else {
            o.topBarOverlay.fadeOut();
            o.navIcon.removeClass(o.navIconHoverClass);
            mainNav.slideUp(250);
        }
    }
    //shows Keywords when user has typed in Search input and matches are found
    function showKeywords(listItem, keyWords, searchString) {
        var emptySpan = listItem.children("span");
        var selectedLi = listItem;
        var hasKeyword = false;
        emptySpan.empty();
        $.each(keyWords, function (i) {
            if (this.trim().startsWith(searchString)) {
                emptySpan.append("<span>" + keyWords[i].trim() + "</span>");
                hasKeyword = true;
                selectedLi.addClass(o.tallNavItemClass);
            }
            if (!hasKeyword) {
                selectedLi.removeClass(o.tallNavItemClass);
            }
        });

    }
    //handle arrow keys for shortcuts to up/down/enter/escape on search results and on initial Favorites panel.
    function handleArrowKeys(event) {
        if (event.keyCode === 38 && positionHolder > 0) {
            event.preventDefault();
            clearResultsActiveListItem();
            positionHolder--;
            $($(".navItems > ul > li:visible")[positionHolder]).addClass(o.activeNavItemClass);
            //up arrow
        }
        if (event.keyCode === 40 && positionHolder < ($(".navItems > ul > li:visible").length) - 1) {
            event.preventDefault();
            clearResultsActiveListItem();
            positionHolder++;
            $($(".navItems > ul > li:visible")[positionHolder]).addClass(o.activeNavItemClass);
            //down arrow
        }
        if (event.keyCode === 13) {
            event.preventDefault();
            var selectedItemLink = $($(".navItems > ul > li:visible")[positionHolder]).find("a").attr("href");
            window.open(selectedItemLink);
            //Enter key
        }
        if (event.keyCode === 27) {
            event.preventDefault();
            if ($('#tbmn > #panel:visible') && o.searchInput.val() !== "") {
                clearSearchInput();
                resetSearchState();
            }
            //esc key
        }
    }
    //clears any active classes on List items as uer arrows up/down after each keypress
    function clearResultsActiveListItem() {
        $(".navItems > ul > li").removeClass(o.activeNavItemClass);
        $("#favoritesHolder > li").removeClass(o.activeNavItemClass);
    }

    //handles animation of search close icon and clearing search input
    function handleSearchCloseIcon() {
        if (o.searchInput.val() !== "") {
            o.clearSearchIcon.addClass('clearSearchIcon');
        } else {
            o.clearSearchIcon.removeClass('clearSearchIcon');
            clearResultsActiveListItem();
        }
    }

    //handles clearing search input on click of X icon
    function clearSearchInput() {
        o.searchInput.val('');
        o.clearSearchIcon.removeClass('clearSearchIcon');
        o.emptyResultsContainer.hide();
        o.categoryTitle.show();
        o.listItemsHolder.children().show();
        o.listItemsHolder.hide();
        o.navItems.find("ul > li > span").empty();
        o.navItems.find("ul > li").removeClass("expandLi");
        clearResultsActiveListItem();
        handleRollupCategoriesOnClick();
    }

    //Search Feature
    //------------------------------------
    //handles user typing into Input
    function handleSearchInput(e) {
        var usersSearchInput = "";
        if (e.keyCode != 38 && e.keyCode != 40 && e.keyCode != 13) {
            positionHolder = -1;
            clearResultsActiveListItem();
        }
        usersSearchInput = $(this).val().toLowerCase();
        if (usersSearchInput === "") {
            if (e.keyCode != 38 && e.keyCode != 40 && e.keyCode != 13) {
                resetSearchState();
            }
        } else {
            resetTabs();
            searchNavItems(usersSearchInput);
        }
    }
    //searches through listvalues to find matches
    function searchNavItems(searchString) {
        handleSearchCloseIcon();
        var listValues = [];
        window.keycodeArray = [];
        var testIfFound = { found: false };
        o.listItemsHolder.children().hide();
        o.categoryTitle.hide();
        o.listItemsHolder.children().each(function () {
            compareItemToSearch($(this), listValues, testIfFound, searchString);
        });
    }
    //compares items that match the user's input
    function compareItemToSearch(listItem, listValues, testIfFound, searchString) {
        var selectedLi = listItem;
        var altKeywords = listItem.data("altkeywords").toLowerCase();
        var keywordsFound = false;
        altKeywords = altKeywords.split(",");
        $.each(altKeywords, function (i) {
            if (altKeywords[i].trim().startsWith(searchString)) {
                keywordsFound = true;
            }
        });
        if (!listItem.text().toLowerCase().startsWith(searchString) && !keywordsFound) {
            listItem.hide();
            selectedLi.removeClass(o.tallNavItemClass);
        } else {
            handleFoundValue(listValues, listItem, testIfFound);
            showKeywords(listItem, altKeywords, searchString);
        }
        if (testIfFound.found !== true) {
            o.emptyResultsContainer.show();
        } else {
            o.emptyResultsContainer.hide();
        }
    }
    //handles pushing the matched search input, by list item, to the DOM to search results div for user to see
    function handleFoundValue(listValues, listItem, testIfFound) {
        var foundText = listItem.text();
        if (listItem.children("span").text()) {
            foundText = listItem.text().split(listItem.children("span").text()).shift();
        }
        if (listValues.length === 0) {
            listItem.show();
            listValues.push(foundText);
            o.listItemsHolder.show();
            testIfFound.found = true;
        } else {
            listItem.hide();
            var include = true;
            for (var z = 0; z < listValues.length; z++) {
                if (listValues[z] === foundText) {
                    include = false;
                }
            }
            if (include) {
                listItem.show();
                listValues.push(foundText);
                o.listItemsHolder.show();
                testIfFound.found = true;
            }
        }
    }
    //handles resetting the var values and events for the search input
    function resetSearchState() {
        handleSearchCloseIcon();
        o.arrowRight.removeClass(o.arrowDownClass);
        o.listItemsHolder.hide();
        resetTabs();
        o.categoryHolder.show();
        o.listItemsHolder.children().show().removeClass(o.tallNavItemClass);
        o.categoryTitle.show();
        o.emptyResultsContainer.hide();
        clearResultsActiveListItem();
    }

    //Utility functions
    //---------------------------------------------
    //Determine subdomain for sharepoint environment
    function getRelativeUrl(type) {
        var subdomain;
        var PostUrl;
        var httpType;

        if (type == "post") {
            httpType = "AddFavorite";
        } else if (type == "delete") {
            httpType = "DeleteFavorite";
        }

        if (window.location.href.indexOf("-vm.wwt.com") > -1) {
            subdomain = "-vm.wwt.com";
            PostUrl = getDomain() + subdomain + "/_layouts/United/ApplicationPages/WebServices/FavoritesWebService.asmx/" + httpType;
        } else if (window.location.href.indexOf("-dev.wwt.com") > -1) {
            subdomain = "-dev.wwt.com";
            PostUrl = getDomain() + subdomain + "/_layouts/United/ApplicationPages/WebServices/FavoritesWebService.asmx/" + httpType;
        } else if (window.location.href.indexOf("-test.wwt.com") > -1) {
            subdomain = "-test.wwt.com";
            PostUrl = getDomain() + subdomain + "/_layouts/United/ApplicationPages/WebServices/FavoritesWebService.asmx/" + httpType;
        } else if (window.location.href.indexOf(".wwt.com") > -1) {
            subdomain = ".wwt.com";
            PostUrl = getDomain() + subdomain + "/_layouts/United/ApplicationPages/WebServices/FavoritesWebService.asmx/" + httpType;
        }
        return PostUrl;
    }
    //Determine Domain for sharepoint environment
    function getDomain() {
        if (window.location.href.indexOf("united2") > -1) {
            var domain = "https://united2";
        } else if (window.location.href.indexOf("mysites") > -1) {
            domain = "https://mysites";
        } else if (window.location.href.indexOf("connect") > -1) {
            domain = "https://connect";
        } else if (window.location.href.indexOf("united") > -1) {
            domain = "https://united";
        }
        return domain;
    }
    //Sorts data from the C# NavItem class object of items from the TopBarMainNav list to DOM elements
    function sortListDataToDom() {
        if ($(this).data('tab') === "True") {
            $(this).children().attr('target', '_blank');
        }
        $(this).detach();
        $("#" + $(this).data("category")).append(this);
    }
    //Sorts data from the C# NavItem class object of items from the Favorites list to DOM elements
    function sortFavoriteDataToDom() {
        var favorite = $(this);
        favorite.detach();
        o.favoritesHolder.append(favorite);
        applyDefaultStarClass(favorite);
    }
    //handles creating friendly error message if lists are named wrong.
    function handleError() {
        if (!o.categoryHolder.length > 0) {
            o.mainNav.append("<div id=\"noData\">Oops, stuff broke! Looks like it could be that the navigation list doesn't exist, or is named incorrectly, or there are no items in it!</div>");
            o.searchWrapper.hide();
        }
    }

    return {
        init: init,
        close: closeMainNav
    };

})(jQuery);