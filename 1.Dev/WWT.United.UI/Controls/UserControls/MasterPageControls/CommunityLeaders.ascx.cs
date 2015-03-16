using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using Microsoft.SharePoint;
using Microsoft.SharePoint.Administration;
using Microsoft.SharePoint.WebControls;
using Microsoft.Office.Server.UserProfiles;

namespace WWT.United.UI.Controls.UserControls.MasterPageControls
{
    public partial class CommunityLeaders : UserControl
    {
        private const string LIST_NAME = "CommunityLeader";
        private const string COLUMN_NAME = "CommunityLeader";
        private const string COLUMN_NAME2 = "CommunityLeader2";
        private const string FIRST_NAME_PROPERTY = "FirstName";
        private const string LAST_NAME_PROPERTY = "LastName";
        private const string PICTURE_PROPERTY = "PictureURL";
        private const string PICTURE_PLACEHOLDER = "/PublishingImages/anniversary/O14_person_placeholder.png";

        protected void Page_Load(object sender, EventArgs e)
        {

            WebPartManager wpm = WebPartManager.GetCurrentWebPartManager(Page);

            //Response.Write(wpm.DisplayMode.Name);

            if (wpm.DisplayMode.Name.Equals("Browse") && SPContext.Current.FormContext.FormMode != SPControlMode.Edit)
            {
                GetLeaderInfo();
            }
            else
            {
                pnlCommunityLeaderContainer.Visible = false;
                pnlCommunityLeaderContainer2.Visible = false;
            }
        }

        private void GetLeaderInfo()
        {
            try
            {
                SPSite site = SPContext.Current.Site;
                SPWeb web = SPContext.Current.Web;

                using (SPSite theSite = new SPSite(site.ID))
                {
                    using (SPWeb theWeb = theSite.OpenWeb(web.ID))
                    {
                        SPServiceContext context = SPServiceContext.GetContext(SPContext.Current.Site);
                        var profileManager = new UserProfileManager(context);
                        SPList list = theWeb.Lists[LIST_NAME];
                        SPListItem item = list.Items[0];

                        var simpleProfile1 = GetSimpleProfile(profileManager, item, COLUMN_NAME);
                        var simpleProfile2 = GetSimpleProfile(profileManager, item, COLUMN_NAME2);

                        if (simpleProfile1 != null)
                        {
                            SetLeader1(simpleProfile1);
                        }

                        if (simpleProfile2 != null)
                        {
                            if (simpleProfile1 != null)
                            {
                                SetLeader2(simpleProfile2);
                            }
                            else
                            {
                                SetLeader1(simpleProfile2);
                            }
                        }

                    }
                }
            }
            catch (Exception e) // We might expect to encounter an error if the provided user is not yet sync'ed into the User Profile Service Application or if there are no entries in the list
            {
                pnlCommunityLeaderContainer.Visible = false;
                pnlCommunityLeaderContainer2.Visible = false;

                SPDiagnosticsService.Local.WriteTrace(0, new SPDiagnosticsCategory("Community Leader", TraceSeverity.Unexpected, EventSeverity.ErrorCritical), TraceSeverity.Unexpected, e.ToString());
            }
        }

        private void SetLeader2(SimpleProfile simpleProfile)
        {
            linkCommunityLeaderName2.NavigateUrl = simpleProfile.ProfileUrl;
            linkCommunityLeaderName2.Text = simpleProfile.FirstName + " " + simpleProfile.LastName;

            linkPic2.NavigateUrl = simpleProfile.ProfileUrl;

            imgCommunityLeaderProfilePicture2.ImageUrl = simpleProfile.ImageUrl;

            pnlCommunityLeaderContainer2.Visible = true;
        }

        private void SetLeader1(SimpleProfile simpleProfile)
        {
            linkCommunityLeaderName.NavigateUrl = simpleProfile.ProfileUrl;
            linkCommunityLeaderName.Text = simpleProfile.FirstName + " " + simpleProfile.LastName;

            linkPic.NavigateUrl = simpleProfile.ProfileUrl;

            imgCommunityLeaderProfilePicture.ImageUrl = simpleProfile.ImageUrl;

            pnlCommunityLeaderContainer.Visible = true;
        }

        private SimpleProfile GetSimpleProfile(UserProfileManager profileManager, SPListItem item, string leaderColumnName)
        {
            if (item[leaderColumnName] == null)
            {
                return null;
            }

            var spfu = (SPFieldUser)item.Fields[leaderColumnName];
            var user = (SPFieldUserValue)spfu.GetFieldValue(item[leaderColumnName].ToString());

            if (user == null || user.User == null || user.User.LoginName == null)
            {
                return null;
            }

            UserProfile profile = profileManager.GetUserProfile(user.User.LoginName);

            if (profile == null)
            {
                return null;
            }

            if (profile[PropertyConstants.PreferredName] == null)
            {
                return null;
            }

            var preferredName = profile[PropertyConstants.PreferredName].Value as string;

            if (preferredName == null)
            {
                return null;
            }

            string[] names = new string[] { preferredName, "" };
            if (preferredName.Contains(","))
            {
                names = preferredName.Split(',');
            }
            else if (preferredName.Contains(" "))
            {
                names = preferredName.Split(' ');
                names = new string[] { names[1], names[0] };
            }

            if (names.Length != 2 || string.IsNullOrEmpty(names[0]) || string.IsNullOrEmpty(names[1]))
            {
                return null;
            }

            string firstName = names[1].Trim();
            string lastName = names[0].Trim();
            string imageUrl = profile[PICTURE_PROPERTY] != null && profile[PICTURE_PROPERTY].Value as string != null ? (string)profile[PICTURE_PROPERTY].Value : PICTURE_PLACEHOLDER;
            string profileUrl = profile.PublicUrl != null ? profile.PublicUrl.ToString() : "#";

            return new SimpleProfile
            {
                FirstName = firstName,
                LastName = lastName,
                ImageUrl = imageUrl,
                ProfileUrl = profileUrl
            };
        }

        protected class SimpleProfile
        {
            public string FirstName { get; set; }
            public string LastName { get; set; }
            public string ImageUrl { get; set; }
            public string ProfileUrl { get; set; }
        }
    }
}
