jQuery(function ($) {

    var $divSiteIcon = $("#divSiteIcon");
    var $descTag = $("#NGSS_CommunityStatusDiv .Description");
    var $tabNavigation = $("#s4-topheader2 ul#navigation");
    var $br = $("#NGSS_CommunityStatusDiv br");


    //Save description in variable and empty it from DOM
    var descHTML = $descTag.html();
    $descTag.html("");

    //Move the description and site icon to format 
    //according to UI
    $descTag.append($divSiteIcon);
    $descTag.append("<div id='divSiteDesc'>" + descHTML + "</div>");
    $descTag.append("<div style='clear: both;'></div>");
    $divSiteIcon.show();

    //Remove the Admin tab if present. 
    //UI allows 7 tabs. Admin will make it 8
    var $lastNavItem = $tabNavigation.find("li:last");
    if ($lastNavItem.length > 0) {
        var $lastSpan = $lastNavItem.find("span");
        if ($lastSpan.length > 0) {
            var lastHtml = $lastSpan.html();
            if (lastHtml == "Admin")
                $lastNavItem.remove();
        }
    }

    //Remove the line break after the community title
    if ($br.length > 0)
        $br.remove();

    $("ul.dfwp-column li:last").attr("class", "dfwp-item last");

});