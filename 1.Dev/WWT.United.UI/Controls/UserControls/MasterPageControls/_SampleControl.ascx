<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_SampleControl.ascx.cs" Inherits="WWT.United.UI.Controls.UserControls.MasterPageControls._SampleControl" %>

<SharePoint:CssRegistration Name="United/sample.min.css" runat="server" />
<SharePoint:ScriptLink Name="United/Scripts/sample.min.js" Localizable="False" runat="server" />

<script type="text/javascript">
    $(document).ready(function () {
        var titleSelector = "h1";

        united.sample.init(titleSelector);
    });
</script>

<div id="sampleContainer">
    <h1 class="title">Sample User Control</h1>

    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut bibendum, nulla sed sollicitudin molestie, arcu turpis sodales leo, in scelerisque purus nulla id purus. Nulla congue tincidunt accumsan. Fusce non imperdiet lacus. Morbi sit amet volutpat augue. In ac lobortis quam, eget interdum felis. Nam eu ipsum ipsum. Duis eleifend porttitor massa in tincidunt. Suspendisse tincidunt ante non risus porttitor tincidunt. Morbi dolor libero, sodales sed aliquet quis, sodales id tortor. Nullam sit amet vehicula risus. Cras lorem massa, suscipit at ipsum vitae, convallis consectetur nunc. Phasellus iaculis erat et ipsum feugiat porttitor. Mauris augue nibh, aliquet nec pellentesque quis, lobortis ornare odio. Proin vulputate turpis nulla, adipiscing facilisis orci vehicula vitae. Sed enim est, convallis quis est in, auctor mattis augue. Nulla condimentum lacinia malesuada.</p>
</div>
