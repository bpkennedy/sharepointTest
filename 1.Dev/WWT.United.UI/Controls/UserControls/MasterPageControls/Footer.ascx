<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Footer.ascx.cs" Inherits="WWT.United.UI.Controls.UserControls.MasterPageControls.Footer" %>
<%@ Import Namespace="System.Collections.Generic" %>

<%-- NOTE: This user control relies on master-page.min.css for styles. --%>

    <div style="clear:both"></div>

	<div id="fc" class="s4-notdlg">
		<div id="footer">
	        <div class="nonCorpBlockHolder">
                    <div class="footerImage"><img src="/_layouts/United/Images/FooterCorpHQIcon.png" /></div>   
				        <div class="infoBlock">
					        <h2>Corporate HQ</h2>
					        <span>701 Fee Fee Road<br/> Maryland Heights, MO 63043</span><br/>
					        <span>1+314-301-2741</span>
				        </div>
                    <div class="footerImage"><img src="/_layouts/United/Images/FooterServiceDeskIcon.png" /></div>
                    <a class="noTextDec" href="https://united.wwt.com/sites/support/itss">
					    <div class="infoBlock"> 
						    <h2>Global Service Desk</h2>
						    <ul class="footerUl topfooterUl">
							    <li>IT Support Community</li>
							    <li>1+314-919-1600</li>
						    </ul>
					    </div>
                    </a>
                    <div class="footerImage"><img src="/_layouts/United/Images/FooterSecurityIcon.png" /></div>
				    <a class="noTextDec" href="https://united.wwt.com/sites/support/security">
                        <div class="infoBlock">
					        <h2>Corporate Security</h2>
					        <ul>
						        <li>Security Community</li>
						        <li>1+314-301-2570</li>
					        </ul>	
				        </div>
                    </a>
                    <div class="footerImage"><img src="/_layouts/United/Images/FooterPoliciesIcon.png" /></div>
				        <div class="infoBlock">
					        <h2>Policies</h2>
					        <ul class="footerUl">
                                <li><a class="noTextDec" href="https://united.wwt.com/sites/Corporate/Legal/Lists/Policy%20Current%20State/AllItems.aspx">Policies List</a></li>
						        <li><a class="noTextDec" href="https://united.wwt.com/sites/HR/Shared%20Documents/WWT%20Code%20of%20Conduct%20and%20Ethics%20Policy.docx">Conduct and Ethics</a></li>
						        <li><a class="noTextDec" href="https://united.wwt.com/sites/IT/busserv/ecm/Shared%20Documents/United%20Social%20Terms%20of%20Use.docx">United Terms of Use</a></li>
					        </ul>
				        </div>
                    <div class="footerImage"><img src="/_layouts/United/Images/FooterAboutIcon.png" /></div>
				        <div class="infoBlock">
					        <h2>About Us</h2>
					           <ul class="footerUl">
						            <li><a class="noTextDec" href="https://www2.wwt.com/company/about_world_wide_technology">About</a></li>
						            <li><a class="noTextDec" href="https://www2.wwt.com/company/history">History</a></li>
						            <li><a class="noTextDec" href="https://www2.wwt.com/content/executive-team">Executive Team</a></li>
						            <li><a class="noTextDec" href="https://united.wwt.com/sites/Support/CorpProp/Pages/WWTLocations.aspx">Locations</a></li>
					           </ul>
				       </div>
                    <div class="footerImage"><img src="/_layouts/United/Images/FooterTelephoneIcon.png" /></div>
                        <div class="infoBlock">
					        <h2>Employee Helpline</h2>
					        <ul class="footerUl">
						        <li><a class="noTextDec" href="https://united.wwt.com/Pages/Helpline.aspx">Anonymous Helpline Link</a></li>
						        <li>1-866-300-2482</li>
					        </ul>
				        </div>
			    <div id="corpInfoBlock">
                    <a href="https://www.wwt.com/" target="_blank" id="wwtFooterHomeLink">            
				    <img id="footerWwtLogo" src="/_layouts/United/Images/footer_wwt_logo_white.png"/>
                    </a>
			    </div>
          </div>
          <!--This is the ASP Repeater for the Server Variables
            <asp:Repeater ID="serverVarRepeater" runat="server">
                <ItemTemplate>
                    <%# ((KeyValuePair<string,string>)Container.DataItem).Key %>: <%# ((KeyValuePair<string,string>)Container.DataItem).Value %>
                </ItemTemplate> 
            </asp:Repeater> -->
		</div>  
    </div>