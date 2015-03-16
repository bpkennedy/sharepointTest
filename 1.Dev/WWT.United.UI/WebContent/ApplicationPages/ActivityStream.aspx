<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Import Namespace="Microsoft.SharePoint.ApplicationPages" %>
<%@ Assembly Name="SharePoint.Ajax.Library, Version=1.0.0.0, Culture=neutral, PublicKeyToken=a37ac551ad665a44" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ActivityStream.aspx.cs" Inherits="WWT.United.UI.WebContent.ApplicationPages.ActivityStream" %>
<%@ Register tagprefix="NG" namespace="NewsGator.Social.Web" assembly="NewsGator.Social.Web, Version=1.0.0.0, Culture=neutral, PublicKeyToken=83f4a735be5c41e6" %>

<html>
    <head runat="server">
        <title>United Activity Stream</title>
        <meta http-equiv="X-UA-Compatible" content="IE=8"/>
	    <!-- all OOTB css -->
	    <SharePoint:CssLink runat="server" Version="4"/>
        <!-- link to our newsgator css  -->
	    <SharePoint:CssRegistration Name="United/newsgator.min.css" runat="server" After="corev4.css" />
        <style type="text/css">
            html,
            body {
                background-color:#ffffff;
                height:100%;
                overflow:auto;
                width:100%;
                overflow-x:hidden;
                -webkit-overflow-scrolling:touch;
            }
            html {
                overflow-y:hidden!important;
            }
            #streamNavPanel {
                left:0;
                min-width:360px;
                top:0;
            }
            .ngAttachmentUI {
                display:none;
            }
            /*Here changing NewsGator CSS styles*/
            .ngWrapper a,
            .ngWrapper a:visited,
            #ngNewsFeedSettings A,
            #ngNewsFeedSettings A:visited,
            .ngAuthorLink,
            .ngActivityRow A,
            .ngActivityRow A:link,
            .ngActivityRow A:visited,
            .ngTutorialNavigation A,
            .ngTutorialNavigation A:visited,
            .ngTutorialStepNext,
            .ngTutorialStepNext:visited,
            .ngColleagueLink,
            .ngColleagueLink:visited,
            #ngSSColleagueDiv A,
            #ngSSColleagueDiv A:visited,
            .ngMembersLink A,
            .ngMembersLink A:visited,
            .ngCommunityResults A,
            .ngCommunityResults A:visited,
            #ngSSProfileHolder A,
            #ngSSProfileHolder A:visited,
            .ngMemberLink,
            .ngMemberLink:visited,
            #ngCommunityNewsControlDiv A,
            #ngCommunityNewsControlDiv A:visited,
            .ngSummary A,
            .ngSummary A:hover,
            a.ngTag,
            a.ngTag:visited,
            .ngMiniName a,
            .ngMiniName a:link,
            .ngMiniName a:visited,
            .ngActivityActionDiv .ngActivityNewsView a.ngItemLink,
            .ngActivityActionDiv .ngActivityNewsView a.ngItemLink:link,
            .ngActivityActionDiv .ngActivityNewsView a.ngItemLink:visited {
                color: #0072bc !important;
            }
            .ngStatusHolder .ngWrapper .ngInputTypes {
 	            width:104px!important;
             }
            img.x_NGActivityFeed {
                max-width:270px!important;
            }

            .ngActivityHeader {
                display:block!important;
                line-height: 18px!important;
                top: -5px!important;
                width:100%!important;
            }
            .ngInputToggles {
                width:104px!important;
            }
            #ngEventShowOptions_chzn {
                display:block;
                width:160px!important;
            }
            #ngEventShowOptions_chzn .chzn-drop {
                width: 158px !important;
            }
            .chzn-search input {
                width:150px!important;
            }
            .chzn_container {
                padding-left:10px;
            }
            .ngActivityDate {
                display:block;
            }
            .ngActionItem {
                padding-right:15px!important;
            }
            .ngActionItem a {
                padding-left:0;
            }
            .ngActivityHeader span {
                display: block;
                font-family: arial;
                font-size: 24px;
                margin-top: 20px;
            }
            #ngNewsFeedSettings {
                font-size: 12px;
                text-align: left;
                margin-right:6px;
            }
            #ngNewsControlDiv ul {
                padding-right:14px!important;
            }
            .SubActivityType-Poll div.ngPollName {
                width:90%!important;
            }
            .variableOverflow {
                overflow:hidden!important;
            }
            .ng-ui-wrapper {
                left:0!important;
                width:100%!important;
            }
            .unitedStreamSettingsFloat {
                float:left;
            }
            .unitedStreamSettingsBGColor {
                background-color: #eeeeee;
            }
            .ngModuleSettingsLink {
                display:none;
            }
            #ngEventNotificationHolder {
                display: block;
                width: 40px !important;
            }
            .ngMiniInfoHolder {
                display:none;
            }
            .ngMiniProfilePopup {
                display:none;
            }
            .ngCommentAttachFile {
                display:none!important;
            }
        </style>

    </head>
    <body>
        <form runat="server">
            <SharePoint:FormDigest runat="server"/>
            <!-- handles SharePoint scripts -->
            <asp:ScriptManager id="ScriptManager" runat="server" EnablePageMethods="false" EnablePartialRendering="true" EnableScriptGlobalization="false" EnableScriptLocalization="true" />
            <div id="unitedStreamPage">
                <NG:ActivityFeedWebPart runat="server" Count="25" CustomCssPath="" Priority="2" DelayMilliseconds="0" RefreshInterval="0" LoadingText="Loading..." LoadingImageUrl="/_layouts/sharepointajaxlibrary/modernuiloadingbar.gif" Title="Activity Stream" FrameType="None" SuppressWebPartChrome="False" Description="" IsIncluded="True" ZoneID="MiddleLeftZone" PartOrder="2" FrameState="Normal" AllowRemove="True" AllowZoneChange="True" AllowMinimize="True" AllowConnect="True" AllowEdit="True" AllowHide="True" IsVisible="True" DetailLink="" HelpLink="" HelpMode="Modeless" Dir="Default" PartImageSmall="" MissingAssembly="Cannot import this Web Part." PartImageLarge="" IsIncludedFilter="" ExportControlledProperties="True" ConnectionID="00000000-0000-0000-0000-000000000000" ID="g_4a53bbc8_e0be_45bf_bcbf_d54ee98d6d37" ChromeType="None" ExportMode="All" __MarkupType="vsattributemarkup" __WebPartId="{4A53BBC8-E0BE-45BF-BCBF-D54EE98D6D37}" WebPart="true" Height="" Width=""></NG:ActivityFeedWebPart> 
            </div>
        </form>
        <script type="text/javascript">
        var United = United || {};

        United.ApplicationPageActivityStream = (function ($) {
            'use strict';

            var o = {
                editSettingsLink: $('.ngEditSettingsLink'),
                ngSettings: $('#ngSettings'),
                NotificationPanel: '<div id="ngSettings"><div id="ngSettingsContainer"></div></div>',
                htmlBody: $('body'),
                html: $('html'),
                variableOverflowClass: 'variableOverflow',
                streamNavPanel: '#streamNavPanel',
                streamRemoteFrame: '#streamRemoteFrame',
                ngSettingsContainer: $('#ngSettingsContainer'),
                ngSettingsNav: $('#ngSettingsNav'),
                ngSettingsAppPageClasses: 'unitedStreamSettingsFloat unitedStreamSettingsBGColor',
                sideNav: '#snp-toggle',
                siteActions: '#siteactiontd',
                searchInput: '#unitedSearchInput',
                mainNav: $('#mainNavIcon'),
                spheresIcon: $("#ngManageGroupLink"),
                modalWrapper: ".ng-ui-wrapper",
                ngSettingsLink: $('.ngActivityAction.ngEditSettingsLink')
                }

            $(document).ready(function () {
                hideEditSettings();
                o.spheresIcon.parent().hide();
                addTargetBlankToLinks();


                function hideEditSettings() {
                    o.ngSettingsLink.hide();
                }

                function addTargetBlankToLinks() {
                    setTimeout(function () {
                        if ($('.ngSummary').text() != "") {
                            $('.ngActivityProfileIconHolder').find('a').each(function () {
                                //console.log("found");  
                                $(this).attr("target", "_blank");
                            });
                            $('.ngSummary').find('a').each(function () {
                                //console.log("found");  
                                $(this).attr("target", "_blank");
                            });
                            $('.ngAttachmentHolder').find('a').each(function () {
                                //console.log("found");  
                                $(this).attr("target", "_blank");
                            });
                            $('.ngMetaContainer').find('a').each(function () {
                                $(this).attr("target", "_blank");
                            });
                        } else {
                            addTargetBlankToLinks();
                        }
                    }, 200);
                }

                //prevent newsgator's native Edit Settings click to add our own
                o.editSettingsLink.off("click");
                //TODO - abstract into another function
                o.editSettingsLink.on("click", function () {
                    if (o.ngSettings.length == 0) {
                        o.htmlBody.append(o.NotificationPanel);
                        o.ngSettings = $('#ngSettings');
                    }
                    $(this).ngsettings({
                        dialogWidth: '100%'
                    })
                    //this is handling the 100% width of the stream links that popup inside the masterpage
                    if (window.parent != window) {
                        o.html.addClass(o.variableOverflowClass);
                        window.parent.jQuery(o.streamNavPanel).width('100%');
                        window.parent.jQuery(o.streamRemoteFrame).width('100%');
                        handleCloseSettings();
                    } else {
                        o.ngSettingsContainer.addClass(o.ngSettingsAppPageClasses);
                    }
                    $(o.modalWrapper).css("width", "100%");
                    //$(".ngAuthorLink").attr("target", "_blank");
                    //$(".ngActivityProfileIcon").parent().attr("target", "_blank");
                    //jQuery142('.ngActivityRow').find('a').each(function () {
                    //    jQuery142(this).attr("target", "_blank");
                    //});
                });

                //this is a recusive looping function because we need to wait for the Settings menu to be built with javascript before we remove and replace the click event.  The load times of the javascript on page load is not always within 1 millisecond.  So we are telling the function to run again if the selector does not exist (i.e. has not been created yet).
                function handleCloseSettings() {
                    setTimeout(function () {
                        var ngDialogue = $(".ui-dialog-titlebar-close.ui-corner-all");
                        if (ngDialogue.length !== 0) {
                            ngDialogue.off("click");
                            ngDialogue.on("click", closeSettings);
                            window.parent.jQuery(o.sideNav).add(o.mainNav).add(o.siteActions).add(o.searchInput).on("click", closeSettings);
                        } else {
                            handleCloseSettings();
                        }
                    }, 100);
                }

                function closeSettings() {
                    var ngSettings = $('#ngSettings');
                    var ngSettingsNav = $('#ngSettingsNav');
                    o.html.removeClass(o.variableOverflowClass);
                    ngSettings.dialog("destroy");
                    o.ngSettingsContainer.empty();
                    ngSettingsNav.remove();
                    window.parent.jQuery(o.streamNavPanel).width('360px');
                    window.parent.jQuery(o.streamRemoteFrame).width('360px');
                }
            });
        })(jQuery142);
        </script>
    </body>
</html>


