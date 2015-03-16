<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TopBarActivityStream.ascx.cs" Inherits="WWT.United.UI.Controls.UserControls.MasterPageControls.TopBarActivityStream" %>

<%-- NOTE: This user control relies on master-page.min.css for css. --%>
<%-- NOTE: This user control relies on master-page.min.js for js. --%>

<!-- init the module -->
<script type="text/javascript">
    (function($) {
        $(document).ready(function() {
            United.TopBarActivityStream.init({
                streamNav: $('#streamNavPanel'),
                streamIcon: $('#streamNavIcon'),
                streamIconHoverClass: 'streamNavIconOrange',
                streamIframeContainer: $('#streamIframeContainer'),
                streamPopoutIcon: $("#streamPopoutIcon"),
                topBarOverlay: $('#topBarOverlay'),
                streamSettingsIcon: $("#streamSettingsIcon"),
                iframe: $('<iframe />', { id: 'streamRemoteFrame', src: '/_layouts/United/ApplicationPages/ActivityStream.aspx', style: 'height:100%;width:360px;border:none;z-index:4' }),
            });
        });
    })(jQuery)
</script>

<!-- start html -->
<div id="tbas">
    <div id="streamNavPanel" style="display: none;">
        <div id="streamPopoutHolder">
            <div id="streamPopoutIcon">
                <i class="fa fa-external-link"></i>
            </div>
            <div id="streamSettingsIcon">
                <i class="fa fa-wrench"></i>
            </div>
        </div>
        <div id="streamIframeContainer">
        </div>
    </div>
</div>