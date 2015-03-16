/* ------------------------------------------------------------
 Title:     Side Navigation Panel

 Copied from Magellan
 --------------------------------------------------------------- */

(function (sideNavPanel, $, undefined) {
    'use strict';

    var $panel,
        $wrapper,
        $toggle,
        $toggleInt,
        $search,
        $noresults,
        $tabs,
        $activeTab,
        $favObjs = {},
        $activeIndex,
        panelIsVisible,
        activeClass,
        toggleClass,
        transitionEndEvents,
        $tabContent,
        $items,
        $itemsToFilter,
        $activeItem;


    /*
     *  Generates host for an environment-specific URL
     *  subdomainPrefix param is optional, but will replace 'www' in subdomain (eg, 'reports' for 'reports-dev.wwt.com')
     */
    function generateHost(subdomainPrefix) {
        var subdomain = location.hostname.split('.')[0],
            host = getProtocol() + '://';

        host += subdomainPrefix || 'www';

        if (subdomain.indexOf('-dev') !== -1 || subdomain === 'localhost') {
            host += '-dev';
        } else if (subdomain.indexOf('-test') !== -1) {
            host += '-test';
        }

        return host + '.wwt.com';
    }
    // Build Initial Nav Panel Structure
    // -------------------------------------------------------
    function createStructure() {
        var logoutUrl = generateHost() + '/portalWeb/comergent/logout.do',
            panelHtml;

        panelHtml = '<div id="side-nav-panel">' +
        '<div class="snp-logout">' +
        '<a href=' + logoutUrl + ' class="logout">Logout</a>' +
        '<i id="toggleClose"></i>' +
        '</div>' +
        '<div id="snp-search">' +
        '<input type="text" placeholder="Find apps and reports...">' +
        '</div>' +
        '<ul class="snp-tabs">' +
        '<li>Favs</li>' +
        '<li>Apps</li>' +
        '<li>Reports</li>' +
        '</ul>' +
        '<div class="snp-no-results">No Results Found</div>' +
        '</div>';
        // add reports ibi login iframe
        $('body').prepend(panelHtml);
        return $("#side-nav-panel");
    }


    // Build reports ibi_apps hidden iframe (necessary to avoid login prompt)
    // -----------------------------------------------------------------
    function getProtocol() {
        var url = window.location.href,
            arr = url.split(":");
        return arr[0];
    }

    function reportIframe() {
        return '<iframe src="' + generateHost('reports') + '/ibi_apps/bid-login?" width="0" height="0" frameborder="0"></iframe>';
    }

    // Build api url
    // -----------------------------------------------------------------
    function apiUrl() {
        return '/apirouter/api/forward/user';
    }


    // Build HREF, adds "http://" if it doesn't exist
    function buildHref(href) {
        return href.indexOf("://") === -1 ? getProtocol() + "://" + href : href;
    }


    // Test Browser for CSS Transition Support
    // -------------------------------------------------------
    function hasTransitionSupport() {
        var s = document.createElement("div").style;
        return "transition" in s || "WebkitTransition" in s || "MozTransition" in s || "msTransition" in s || "OTransition" in s;
    }


    // Test Browser for Placeholder Text Support
    // -------------------------------------------------------
    function hasPlaceholderSupport() {
        var i = document.createElement('input');
        return i.placeholder !== undefined;
    }


    // Add Placeholder Text Support for Non-Supporting Browsers
    // -------------------------------------------------------
    function placeholderPolyfill(elem) {
        var placeholder = elem.attr("placeholder");

        elem.focus(function () {
            if (elem.val() === placeholder) {
                elem.val("");
            }
        });

        elem.blur(function () {
            if (elem.val() !== placeholder && elem.val() === "") {
                elem.val(placeholder);
            }
        });

        elem.blur();
    }


    // Truncate Text
    // Fix for IE Font Awesome Bug...IE tries to apply font awesome to the ellipsis (no usable css fix found)
    // ----------------------------------------------------------
    function truncateText(text, length) {

        // Still using text-overflow: ellipsis for non-IE browsers, because it's more reliable layout-wise
        if (navigator.userAgent.indexOf("MSIE") === -1) {
            return text;
        }

        var str = text.substring(0, Math.min(length, text.length));
        if (str.length >= length) {
            return str + "...";
        }
        return str;
    }

    sideNavPanel.addFavorite = function addFavorite(itemName, icon, baseUrl, itemLocation) {
        $("#bk" + itemName.replace(/\s/g, '_')).removeClass("snp-star-o");
        $("#bk" + itemName.replace(/\s/g, '_')).addClass("snp-star");
        $("#FavApps_content").append('<li class="favapps" id="FavApps_' + itemName.replace(/\s/g, '_') + '"><a class="a-link" href="' + buildHref(baseUrl) + itemLocation + '"><i class="snp-' + icon + '"></i>' + truncateText(itemName, 26) + '</a></li>');
        $("#favSet_" + itemName.replace(/\s/g, '_')).attr("href", 'javascript:sideNavPanel.removeFavorite(\'' + itemName + '\', \'' + icon + '\', \'' + baseUrl + '\', \'' + itemLocation + '\');');

        $.ajax({
            url: apiUrl() + '/sidenav/addfav/' + itemName.replace(/ /g, '+'),
            success: function (response) {
            },
            dataType: 'jsonp'
        });
    };

    sideNavPanel.removeFavorite = function removeFavorite(itemName, icon, baseUrl, itemLocation) {
        $("#FavApps_" + itemName.replace(/\s/g, '_')).remove();
        $("#bk" + itemName.replace(/\s/g, '_')).removeClass("snp-star");
        $("#bk" + itemName.replace(/\s/g, '_')).addClass("snp-star-o");
        $("#favSet_" + itemName.replace(/\s/g, '_')).attr("href", 'javascript:sideNavPanel.addFavorite(\'' + itemName + '\', \'' + icon + '\', \'' + baseUrl + '\', \'' + itemLocation + '\');');

        $.ajax({
            url: apiUrl() + '/sidenav/removefav/' + itemName.replace(/ /g, '+'),
            success: function (response) {
            },
            dataType: 'jsonp'
        });
    };


    // Side Nav Panel Functionality
    // -------------------------------------------------------
    sideNavPanel.createSideNavPanel = function (siteWrapperElm, toggleElm) {

        // Cache jquery objects and intialize vars
        // -------------------------------------------------------
        $panel = createStructure();
        $wrapper = siteWrapperElm;
        $toggle = toggleElm;
        $toggleInt = $('#toggleClose');
        $search = $panel.find("#snp-search input");
        $noresults = $panel.find(".snp-no-results");
        $tabs = $panel.find(".snp-tabs li");
        $activeTab = $tabs.eq(1);
        $activeIndex = 1;
        panelIsVisible = false;
        activeClass = "active";
        toggleClass = hasTransitionSupport() ? "togglePanel" : "togglePanelFallback";
        transitionEndEvents = "transitionend webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd";

        //Handle response code error messages from ajax call
        function buildResponseCodeMessage(message, status) {
            var httpCode = status;
            var httpMessage;

            if (httpCode == undefined) {
                httpMessage = "";
            } else {
                httpMessage = " (" + httpCode + ")";
            }

            $panel.append("<div class=\"snp-login-error\" id=\"snp-nam-check\">" +
                message +
                httpMessage +
                "</div>"
                );
            $panel.find(".snp-logout").add("#snp-search").hide();
        }

        //Build the re-login button and hide some base sidenav styles - for when unauthenticated to NAM
        function buildLoginButton() {
            buildResponseCodeMessage("Oops, we lost your connection!  Please click HERE to log in.");
            $("#snp-nam-check").on("click", function () {
                goLogin();
            });
        }

        //Handle separate domain NAM login URLs - for when unauthenticated to NAM
        function goLogin() {
            if (window.location.href.indexOf("-dev.wwt.com") > -1) {
                constructNamUrl("-dev.wwt.com");
            } else if (window.location.href.indexOf("-test.wwt.com") > -1) {
                constructNamUrl("-test.wwt.com");
            } else if (window.location.href.indexOf(".wwt.com") > -1) {
                constructNamUrl(".wwt.com");
            }
        }

        //Build NAM Url - for when unauthenticated to NAM
        function constructNamUrl(subdomain) {
            var currentPage = document.location.href;
            window.location.href = "https://secure" + subdomain + "/nidp/idff/sso/" + "?target=" + encodeURIComponent(currentPage);
        }

        // Build Item HTML from JSON Data
        // -------------------------------------------------------
        function buildItems(data, type) {
            var html = '', icon;

            html += '<li class="snp-group">My ' + (type === "FavApps" ? "Favorites" : type) + '</li>';

            // groups
            $.each(data, function (i, group) {

                // items
                $.each(group, function (x, item) {
                    icon = item.iconName || "globe";
                    html += '<li class="' + type.toLowerCase() + '" id="' + type + '_' + item.name.replace(/\s/g, '_') + '">'
                    html += '<a class="a-link" href="' + buildHref(item.baseUrl) + item.location + '"><i class="snp-' + icon + '"></i>' + truncateText(item.name, 26) + "</a>";

                    //Setting the active tab dynamically so that if there are no favorites we only see the app tab as active
                    if (type === 'FavApps') {
                        $activeTab = $tabs.eq(0);
                        $activeIndex = 0;
                        $favObjs[item.name] = true;
                    }
                        //If application content then add in the favorite link
                    else if (type === 'Applications') {
                        if ($favObjs.hasOwnProperty(item.name)) {
                            html += '<a class="snp-fav" id="favSet_' + item.name.replace(/\s/g, '_') + '" href="javascript:sideNavPanel.removeFavorite(\'' + item.name + '\', \'' + icon + '\', \'' + item.baseUrl + '\', \'' + item.location + '\');"><i id="bk' + item.name.replace(/\s/g, '_') + '" class="snp-star"></i></a>';
                        } else {
                            html += '<a class="snp-fav" id="favSet_' + item.name.replace(/\s/g, '_') + '" href="javascript:sideNavPanel.addFavorite(\'' + item.name + '\', \'' + icon + '\', \'' + item.baseUrl + '\', \'' + item.location + '\');"><i id="bk' + item.name.replace(/\s/g, '_') + '" class="snp-star-o"></i></a>';
                        }
                    }

                    html += "</li>";
                });
            });

            return '<ul id="' + type + '_content" class="snp-tab-content">' + html + "</ul>";
        }


        // Build out all items from JSON data
        // -------------------------------------------------------
        function buildPanel(data) {
            var favs = buildItems(data.FavApps, 'FavApps'),
                apps = buildItems(data.Applications, 'Applications'),
                reports = buildItems(data.Reports, 'Reports');

            $panel.append(favs);
            $panel.append(apps); // some IE builds choked on: $panel.append([apps, reports]);
            $panel.append(reports);

            // Add reports ibi_apps hidden iframe (necessary to avoid login prompt)
            $panel.append(reportIframe());
        }


        // Finish panel setup after everything else is done
        // -------------------------------------------------------
        function activatePanel() {
            $tabContent = $panel.find(".snp-tab-content");
            $items = $tabContent.find("li");
            $itemsToFilter = $items.not(".snp-group").not(".favapps");
            $activeItem = $items.filter(function () {
                return $(this).find("a").attr("href") === location.href;
            });

            // manually add Search placeholder text for IE8 and below
            if (!hasPlaceholderSupport()) {
                placeholderPolyfill($search);
            }

            $activeTab.addClass(activeClass);
            $activeItem.addClass(activeClass);
            $tabContent.eq($activeIndex).show();
        }


        // Get Data & Initialize the UI
        // -------------------------------------------------------
        $.ajax({
            url: apiUrl() + '/sidenav',
            success: function (data) {
                buildPanel(data);
            },
            error: function (response) {
                //can't do statusCode ajax setting on 302 - this status 0 is checking for the 302 status from NAM redirect when not authenticated which is transparent to the browser, so we assume 0 as 302 here.
                switch (response.status) {
                    case 0: buildLoginButton();
                        break;
                    default:
                        buildResponseCodeMessage("Oops, there appears to be a problem! Please contact your application's administrator.", response.status);
                        break;
                }
                $search.hide();
                $tabs.hide();
                $panel.find(".snp-error").show();
            },
            complete: function () {
                activatePanel();
            },
            dataType: 'jsonp'
        });

        // Hide Off-screen Navs when side nav panel is open
        // Can't just use overfow:hidden on #nav, due to the active nav pointer getting cut off
        // Oh my gosh this seems ugly...
        // -------------------------------------------------------

        function toggleVisibility(el, mode) {
            if (mode === 'show') {
                el.show();
            }

            if (mode === 'hide') {
                el.hide();
            }
        }

        // Toggle Panel Open/Close
        // -------------------------------------------------------
        function openClosePanel(e) {
            var panelOpenClass = 'snp-open';

            // scroll window to the top to avoid awkward behavior like fixed elements losing their fixed positioning
            window.scrollTo(0, 0);

            $panel.show();
            panelIsVisible = !panelIsVisible;

            $('body').addClass(panelOpenClass);

            // timeout prevents firefox's 'transitionend' event from getting hosed when two classes are added at once (snp-open above, tooggleClass within)
            setTimeout(function () {
                $wrapper.toggleClass(toggleClass).one(transitionEndEvents, function () {
                    if (!panelIsVisible) {
                        $panel.hide();
                        $('body').removeClass(panelOpenClass);
                    }
                });
            }, 50);

            if (!hasTransitionSupport() && !panelIsVisible) {
                $panel.hide();
                $('body').removeClass(panelOpenClass);
            }
            e.preventDefault();
        }

        $toggle.bind('touchend', function (e) {
            openClosePanel(e);
        });

        $toggle.bind('click', function (e) {
            openClosePanel(e);
        });

        $toggleInt.bind('touchend', function (e) {
            openClosePanel(e);
        });

        $toggleInt.bind('click', function (e) {
            openClosePanel(e);
        });


        // Handle Tab Switching
        // -------------------------------------------------------
        function switchTabs(element) {
            var $this = element,
                i = $this.index();

            $this.addClass(activeClass).siblings().removeClass();
            $tabContent.hide().eq(i).show();

            // store ui state for restoring after search
            $activeTab = $tabs.eq(i);

            // restore ui state if a tab is clicked without a search clear
            if ($search.val().length) {
                $noresults.hide();
                $activeItem.addClass(activeClass);
                $items.show();
                $(".favapps").show();
                if (hasPlaceholderSupport()) {
                    $search.val("");
                } else {
                    $search.val($search.attr("placeholder"));
                }
            }
        }

        $tabs.bind('touchend', function () {
            switchTabs($(this));
        });

        $tabs.bind('click', function () {
            switchTabs($(this));
        });

        // Search/Filter Items
        // -------------------------------------------------------
        $search.keyup(function () {
            var val = $.trim($(this).val()).toLowerCase() || '',
                results;

            if (val.length) {
                // setup ui for results display (only on first keyup)
                if (!$activeTab.siblings().hasClass(activeClass)) {
                    $tabs.addClass("active");
                    $itemsToFilter.removeClass(); // not $items so .snp-group's keep their class
                    $tabContent.show(); // so items in non-active tab will show in results
                }
                $(".favapps").hide();

                $items.hide();

                // filter and show search results
                results = $itemsToFilter.filter(function () {
                    return $(this).text().toLowerCase().indexOf(val) > -1;
                });

                if (results.length) {
                    $noresults.hide();
                    results.show();
                } else {
                    $noresults.show();
                }

            } else {
                // restore ui state to what it was before searching
                $(".favapps").show();
                $noresults.hide();
                $tabs.removeClass();
                $activeTab.addClass(activeClass);
                $activeItem.addClass(activeClass);
                $tabContent.hide().eq($activeTab.index()).show();
                $items.show();
            }
        });


        // Close panel before following a link (css transition-supporting browsers only)
        // -------------------------------------------------------
        $panel.on("click", ".a-link", function (e) {
            e.preventDefault();
            panelIsVisible = false;
            var that = this;

            $wrapper.toggleClass(toggleClass);
            $search.val("");
            window.open(that.href, '');
        });
    };

}(window.sideNavPanel = window.sideNavPanel || {}, window.jQuery));