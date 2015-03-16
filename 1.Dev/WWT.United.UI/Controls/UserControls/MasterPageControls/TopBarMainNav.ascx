<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TopBarMainNav.ascx.cs" Inherits="WWT.United.UI.Controls.UserControls.MasterPageControls.TopBarMainNav" %>

<%-- NOTE: This user control relies on master-page.min.js for javascript. --%>
<%-- NOTE: This user control relies on master-page.min.css for css. --%>

<!-- init the module-->
<script type="text/javascript">
    (function ($) {
        $(document).ready(function () {
            United.TopBarMainNav.init({
                //sorting values from C# data into categories in DOM
                hiddenNavLinkContainer: $('#topBarMainNavHiddenLinkContainer > li'),
                hiddenNavContainer: $('#topBarMainNavHiddenLinkContainer'),
                //nav interface and interaction
                navIcon: $('#mainNavIcon'),
                mainNav: $('#tbmn > #panel'),
                topBarOverlay: $('#topBarOverlay'),
                navIconHoverClass: 'mainNavIconBlue',
                categoryControl: $('.group'),
                //search feature
                searchInput: $('#mainNavSearchInput'),
                searchWrapper: $("#mainNavSearchWrapper"),
                arrowRight: $('.arrowRight'),
                arrowRightClass: 'arrowRight',
                arrowDownClass: 'arrowDown',
                categoryHolder: $('.tabContent'),
                listItemsHolder: $('.groupAlt'),
                categoryTitle: $('.categoryContainer'),
                emptyResultsContainer: $('#noResults'),
                clearSearchIcon: $('#searchClearable'),
                favoritesTab: $('.favorites'),
                allSitesTab: $('.allSites'),
                //favorites selectors
                contentWrapper: $(".contentWrapper"),
                favoritesWrapper: $(".favoritesWrapper"),
                starLink: $('.favLink'),
                starLinkControl: '.favLink',
                favoritesHolder: $('#favoritesHolder'),
                hiddenFavoritesLinkContainer: $('#topBarMainFavHiddenLinkContainer > li'),
                favoriteCheck: $(".noFavoritesMessage"),
                emptyStarClass: 'snp-star-o',
                fullStarClass: 'snp-star',
                activeNavLinkClass: 'active',
                tallNavItemClass: 'expandLi',
                activeNavItemClass: 'activeNavItem',
                navItems: $(".navItems"),
            });
        });
    })(jQuery)
</script>

<div id="tbmn">
    <div id="panel" style="display: none;">
        <div id="mainNavSearchWrapper">
		    <div id="search">
                <!--[if gte IE 8]>
                    <span id="ie8Block"></span>
                <![endif]-->
			    <span id="searchClearable"></span>
                <input id="mainNavSearchInput" type="text" placeholder="Navigation Search..." autocomplete="off">
		    </div>
	    </div>
        <ul class="tbmn-tabs">
            <li class="favorites">Favorites</li>
            <li class="allSites active">All Sites</li>
        </ul>
        <div class="contentWrapper" style="display: block;">
		    <div id="noResults">No Results Found</div>
            <asp:Repeater ID="topBarMainNavCatRepeater" runat="server">
                <HeaderTemplate></HeaderTemplate>
                <ItemTemplate>
            
                    <ul class="tabContent" style="display: block;">
			                    <li class="group categoryContainer"><%# ((CategoryItem) Container.DataItem).Category %><span class="arrowRight"></span></li>
			                    <li class="group navItems">
                            <ul class="groupAlt" style="display: none;" id="<%# ((CategoryItem) Container.DataItem).Category.Replace(" ","_") %>">
				                    </ul>
			                    </li>
		                    </ul>
                </ItemTemplate>
                <FooterTemplate></FooterTemplate>
            </asp:Repeater>
        </div>
        <div class="favoritesWrapper" style="display: none;">
            <ul class="tabContent" style="display: block;">
                <li class="group navItems">
                    <ul id="favoritesHolder" class="favAlt">
                        <!-- Favorite data from repeater to go here -->
                    </ul>
                </li>
            </ul>
        </div>
        <div class="noFavoritesMessage" style="display: none">
            <div>
                No favorites here!  You can make some by clicking on the star icons.
            </div>
        </div>
    </div>
</div>

<ul id="topBarMainNavHiddenLinkContainer" style="display: none;">
    <asp:Repeater ID="topBarMainNavRepeater" runat="server">  
        <HeaderTemplate></HeaderTemplate>
        <ItemTemplate>
            <li id="f_<%# ((NavItem) Container.DataItem).Id %>" data-tab="<%# ((NavItem) Container.DataItem).NewTab %>" data-category="<%# ((NavItem) Container.DataItem).Category.Replace(" ","_") %>" data-altkeywords="<%# ((NavItem) Container.DataItem).Keywords %>" title="<%# ((NavItem) Container.DataItem).Title %>"><a class="link" target="" href="<%# ((NavItem) Container.DataItem).ItemHref %>" title="<%# ((NavItem) Container.DataItem).Tooltip %>"><%# ((NavItem) Container.DataItem).Title %></a><a class="favLink"><i class="snp-star-o"></i></a><span style="display: none"></span></li>
        </ItemTemplate>
        <FooterTemplate></FooterTemplate>
    </asp:Repeater>
</ul>

<ul id="topBarMainFavHiddenLinkContainer" style="display: none;">
    <asp:Repeater ID="topBarMainFavRepeater" runat="server">
        <HeaderTemplate></HeaderTemplate>
        <ItemTemplate>
            <li data-favid="<%# ((NavItem) Container.DataItem).Id %>" data-navid="<%# ((NavItem) Container.DataItem).NavId %>" id="<%# ((NavItem) Container.DataItem).NavId %>" data-tab="<%# ((NavItem) Container.DataItem).NewTab %>" data-category="<%# ((NavItem) Container.DataItem).Category.Replace(" ","_") %>" data-altkeywords="<%# ((NavItem) Container.DataItem).Keywords %>" title="<%# ((NavItem) Container.DataItem).Title %>"><a class="link" target="" href="<%# ((NavItem) Container.DataItem).ItemHref %>" title="<%# ((NavItem) Container.DataItem).Tooltip %>"><%# ((NavItem) Container.DataItem).Title %></a><a class="favLink"><i class="snp-star"></i></a><span style="display: none"></span></li>
        </ItemTemplate>
        <FooterTemplate></FooterTemplate>
    </asp:Repeater>
</ul>