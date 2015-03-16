<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="wssuc" TagName="Welcome" src="~/_controltemplates/Welcome.ascx" %>
<%@ Register TagPrefix="wssuc" TagName="DesignModeConsole" src="~/_controltemplates/DesignModeConsole.ascx" %>
<%@ Register TagPrefix="wssuc" TagName="MUISelector" src="~/_controltemplates/MUISelector.ascx" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TopBarSideNav.ascx.cs" Inherits="WWT.United.UI.Controls.UserControls.MasterPageControls.TopBarSideNav" %>

<%-- NOTE: This user control relies on master-page.min.js for javascript. --%>
<%-- NOTE: This user control relies on master-page.min.css for css. --%>

<script type="text/javascript">
    (function($) {
        $(document).ready(function() {
            setTimeout(function() { window.sideNavPanel.createSideNavPanel($("#wrapper"), $("#snp-toggle")); }, 1000);
        });
    })(jQuery);
</script>

<div id="unitedToggle">
    <!-- Welcome / Login control -->
    <div class="welcomemenu">
        <div class="user-img"></div>
        <div id="userDropdownCover"></div>
		<wssuc:Welcome id="IdWelcome" runat="server" EnableViewState="false"></wssuc:Welcome>
		<wssuc:MUISelector ID="IdMuiSelector" runat="server"/>
    </div>
    <div id="snp-toggle">
        <div class="user-name"></div>
    </div>
</div>