<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CommunityLeaders.ascx.cs" Inherits="WWT.United.UI.Controls.UserControls.MasterPageControls.CommunityLeaders" %>

<div class="community-leader-container">
    <asp:Panel ID="pnlCommunityLeaderContainer" runat="server" CssClass="CommunityLeaderContainer" Visible="false">
        <div class="CommunityLeaderHeader"></div>
        <div class="CommunityLeaderPictureContainer"><asp:HyperLink ID="linkPic" runat="server"><asp:Image ID="imgCommunityLeaderProfilePicture" runat="server" CssClass="CommunityLeaderPicture" /></asp:HyperLink></div>
        <div class="CommunityLeaderName"><asp:HyperLink ID="linkCommunityLeaderName" runat="server" /></div>
    </asp:Panel>
    <asp:Panel ID="pnlCommunityLeaderContainer2" runat="server" CssClass="CommunityLeaderContainer" Visible="false">
        <div class="CommunityLeaderHeader"></div>
        <div class="CommunityLeaderPictureContainer"><asp:HyperLink ID="linkPic2" runat="server"><asp:Image ID="imgCommunityLeaderProfilePicture2" runat="server" CssClass="CommunityLeaderPicture" /></asp:HyperLink></div>
        <div class="CommunityLeaderName"><asp:HyperLink ID="linkCommunityLeaderName2" runat="server" /></div>
    </asp:Panel>
    <br clear="all" />
</div>