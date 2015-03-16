<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TopBarSearchBox.ascx.cs" Inherits="WWT.United.UI.Controls.UserControls.MasterPageControls.TopBarSearchBox" %>

<%-- NOTE: This user control relies on topBarSearchBox.js for javascript. --%>
<%-- NOTE: This user control relies on master-page.min.css for css. --%>

<!-- init the module-->
<script type="text/javascript">
    (function($) {
        $(document).ready(function() {
            United.TopBarSearchBox.init({
                webUrl: "<asp:Literal runat="server" ID="currentWebLiteral"/>",
                searchButton: $('#unitedSubmitCover'),
                searchButtonActual: $('#unitedSearchSubmit'),
                searchText: $('#unitedSearchInput'),
                unitedScope: $('#unitedScope'),
                peopleScope: $('#peopleScope'),
                thisSiteScope: $('#thisSiteScope'),
                activeClass: 'activeScope',
                searchDropDown: $('#scopesDropdown'),
                hoverDropClass: 'hoverDrop',
                searchLiItems: $('#scopesDropdown > li'),
                activeUrl: "/search/Pages/results.aspx?k=",
                thisSiteUrl: "/search/Pages/Results.aspx?cs=This Site&k=",
                peopleResultsUrl: "/search/Pages/peopleresults.aspx?k=",
                topBarOverlay: $('#topBarOverlay'),
            });
        });
    })(jQuery);
</script>

<div id="tbsb">
    <div id="unitedSearchWrapper">
        <p>
            <span id="unitedSearchSubmit"></span>
            <span id="unitedSubmitCover"></span>
            <input id="unitedSearchInput" placeholder="Search..." type="text" autocomplete="off"/>
	    </p>
	    <ul id="scopesDropdown" style="display:none;">
		    <li id="unitedScope" class="activeScope">
			    <span class="icon-tux"></span>
			    <span class="scopeLabel">United</span>
		    </li>
		    <li id="peopleScope">
                <span class="icon-finder"></span>
			    <span class="scopeLabel">People</span>
		    </li>
		    <li id="thisSiteScope">
                <span class="icon-windows"></span>
			    <span class="scopeLabel">This Site</span>
		    </li>
	    </ul>
    </div>
</div>