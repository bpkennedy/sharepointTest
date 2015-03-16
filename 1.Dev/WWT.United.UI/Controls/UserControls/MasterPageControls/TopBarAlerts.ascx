<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Assembly Name="Microsoft.SharePoint.Linq, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Assembly Name="WWT.United.Data, Version=1.0.0.0, Culture=neutral, PublicKeyToken=e2138b880074e232" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Import Namespace="WWT.United.Data.TopBarAlert" %>
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TopBarAlerts.ascx.cs" Inherits="WWT.United.UI.Controls.UserControls.MasterPageControls.TopBarAlerts" %>

<%-- NOTE: This user control relies on something.min.css for javascript. --%>
<%-- NOTE: This user control relies on master-page.min.js for javascript. --%>

<asp:MultiView ID="successFailMultiView" ActiveViewIndex="0" runat="server">
    <asp:View ID="successView" runat="server">
<script>
    (function ($) {
        $(document).ready(function () {
            United.AlertModule.init({
                warnings: $(".unitedAlert.Critical"),
                information: $(".unitedAlert.Informational"),
                warningDismiss: $(".unitedAlert.Critical .alertDismiss"),
                informationDismiss: $(".unitedAlert.Informational .alertDismiss")
            });
        })
    })(jQuery);
</script>

            <asp:Repeater ID="leadersRepeater" runat="server">
                <HeaderTemplate>
                    <div id="tba" class="s4-notdlg">
                        <div id="tbaContainer">
                </HeaderTemplate>
                <ItemTemplate>

		                <%-- <td class="pictureCell"><img src="<%# ((Leader) Container.DataItem).PictureUrl %>" Visible="<%# !string.IsNullOrEmpty(((Leader) Container.DataItem).PictureUrl) %>" runat="server" /></td>--%>
                           <div id="unitedAlertItemWrapper">
                               <div id="unitedAlert" class="unitedAlert <%# ((Alert) Container.DataItem).Urgency %>" style="display:none;" alertid="<%# ((Alert) Container.DataItem).ID %>">
                                   <div class="unitedAlertInner">
                                       <span class="<%# ((Alert) Container.DataItem).Urgency %>"></span>
                                       <div class="unitedAlertMessage">
                                           <%# ((Alert) Container.DataItem).Title %>
                                       </div>
                                       <span class="alertDismiss"></span>
                                   </div>
                               </div>
                           </div>

                </ItemTemplate>
                <FooterTemplate>
                        </div>
                    </div>
                </FooterTemplate>
            </asp:Repeater>

    </asp:View>
    <asp:View ID="exceptionView" runat="server">
        <!--The Top Bar Alerts encountered an error.
            Exception Details:

            <asp:Literal ID="exceptionMessageLiteral" Mode="Encode" runat="server" />
        -->
    </asp:View>
</asp:MultiView>
