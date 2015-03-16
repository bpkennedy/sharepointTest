<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TopBarHelpCenter.ascx.cs" Inherits="WWT.United.UI.Controls.UserControls.MasterPageControls.TopBarHelpCenter" %>

<%-- NOTE: This user control relies on master-page.min.js for javascript. --%>
<%-- NOTE: This user control relies on master-page.min.css for css. --%>

<asp:MultiView ID="successFailMultiView" ActiveViewIndex="0" runat="server">
    <asp:View ID="successView" runat="server">
        <script type="text/javascript">
            (function ($) {
                $(document).ready(function () {
                    United.TopBarHelpCenter.init({
                        li1: $("#li1"),
                        answer1: $("#answer1"),
                        serviceTicketIcon: $('.icon-ServiceTicketIcon'),
                        helpCenterIcon: $('#icon-HelpCenterIcon'),
                        helpCenterContainer: $('#helpCenterContainer'),
                        mainPanel: $('#tbhc'),
                        topBarOverlay: $("#topBarOverlay")
                    });
                });
            })(jQuery)
        </script>

        <div id="tbhc" class="s4-notdlg">
            <div class="panel" style="display:block;">
                <div id="helpLeftColumn">
                <ul>
                    <li>Service Desk</li>
                    <li>Human Resources</li>
                    <li>Payroll</li>
                    <li>Benefits</li>
                    <li>United</li>
                </ul>
                </div>
                <div id="helpRightColumn">
                <div class="faqHeader">
                    <div class="categoryIconHolder">
                    <i class="fa fa-circle fa-4x categoryIcon">
                        <span class="categoryIconAcronym">sd</span>
                    </i>
                    </div>
                        <span class="categoryTitle">Service Desk</span>
                    <div class="categoryLinkHolder">
                    <i class="fa fa-circle fa-3x categoryLinkIcon">
                        <i class="fa fa-external-link categoryLinkInnerIcon"></i>
                    </i>
                    </div>
                </div>
                <div class="faqBody">
                    <ul id="faqItemHolder" class="faqItemHolder">
                    <li>
                        <div class="questionContainer"><i class="fa fa-plus-square-o squareIcon"></i><span>This is a Frequently Asked Question</span></div><div class="answer">This an answer for a Frequently Asked Question.</div>
                    </li>
                    <li>
                        <div class="questionContainer"><i class="fa fa-plus-square-o squareIcon"></i><span>This is a Frequently Asked Question</span></div><div class="answer">This an answer for a Frequently Asked Question.</div>
                    </li>
                    <li>
                        <div class="questionContainer"><i class="fa fa-plus-square-o squareIcon"></i><span>This is a Frequently Asked Question</span></div><div class="answer">This an answer for a Frequently Asked Question.</div>
                    </li>
                    <li>
                        <div class="questionContainer"><i class="fa fa-plus-square-o squareIcon"></i><span>This is a Frequently Asked Question</span></div><div class="answer">This an answer for a Frequently Asked Question.</div>
                    </li>
                    <li>
                        <div class="questionContainer"><i class="fa fa-plus-square-o squareIcon"></i><span>This is a Frequently Asked Question</span></div><div class="answer">This an answer for a Frequently Asked Question.</div>
                    </li>
                    <li>
                        <div class="questionContainer"><i class="fa fa-plus-square-o squareIcon"></i><span>This is a Frequently Asked Question</span></div><div class="answer">This an answer for a Frequently Asked Question.</div>
                    </li>
                    <li>
                        <div class="questionContainer"><i class="fa fa-plus-square-o squareIcon"></i><span>This is a Frequently Asked Question</span></div><div class="answer">This an answer for a Frequently Asked Question.</div>
                    </li>
                    <li>
                        <div class="questionContainer"><i class="fa fa-plus-square-o squareIcon"></i><span>This is a Frequently Asked Question</span></div><div class="answer">This an answer for a Frequently Asked Question.</div>
                    </li>
                    <li>
                        <div class="questionContainer"><i class="fa fa-plus-square-o squareIcon"></i><span>This is a Frequently Asked Question</span></div><div class="answer">This an answer for a Frequently Asked Question.</div>
                    </li>
                    <li>
                        <div class="questionContainer"><i class="fa fa-plus-square-o squareIcon"></i><span>This is a Frequently Asked Question</span></div><div class="answer">This an answer for a Frequently Asked Question.</div>
                    </li>
                    <li>
                        <div class="questionContainer"><i class="fa fa-plus-square-o squareIcon"></i><span>This is a Frequently Asked Question</span></div><div class="answer">This an answer for a Frequently Asked Question.</div>
                    </li>
                    <li>
                        <div class="questionContainer"><i class="fa fa-plus-square-o squareIcon"></i><span>This is a Frequently Asked Question</span></div><div class="answer">This an answer for a Frequently Asked Question.</div>
                    </li>
                    <li>
                        <div class="questionContainer"><i class="fa fa-plus-square-o squareIcon"></i><span>This is a Frequently Asked Question</span></div><div class="answer">This an answer for a Frequently Asked Question.</div>
                    </li>
                    <li>
                        <div class="questionContainer"><i class="fa fa-plus-square-o squareIcon"></i><span>This is a Frequently Asked Question</span></div><div class="answer">This an answer for a Frequently Asked Question.</div>
                    </li>
                    <li>
                        <div class="questionContainer"><i class="fa fa-plus-square-o squareIcon"></i><span>This is a Frequently Asked Question</span></div><div class="answer">This an answer for a Frequently Asked Question.</div>
                    </li>
                    </ul>
                </div>
                </div>
            </div>
        </div>

        <div id="theBestAwesomeRepeater" style="display:none;">
            <asp:Repeater ID="topBarHelpCenterRepeater" runat="server">
                <HeaderTemplate></HeaderTemplate>
                <ItemTemplate>
                    <div data-category="<%# ((HelpCenterItem) Container.DataItem).Category %>">
                        <div class="question"><%# ((HelpCenterItem) Container.DataItem).Question %></div>
                        <div class="answer"><%# ((HelpCenterItem) Container.DataItem).Answer %></div>
                    </div>
                </ItemTemplate>
                <FooterTemplate></FooterTemplate>
            </asp:Repeater>
        </div>
    </asp:View>
        <asp:View ID="exceptionView" runat="server">
        <!--The Top Bar Help Center encountered an error.
            Exception Details:

            <asp:Literal ID="exceptionMessageLiteral" Mode="Encode" runat="server" />
        -->
    </asp:View>

</asp:MultiView>