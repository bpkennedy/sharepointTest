using System;
using System.Web;
using System.Windows.Forms;
using System.Linq;
using System.Web.Services;
using Microsoft.SharePoint;
using Microsoft.SharePoint.Utilities;
using Microsoft.SharePoint.WebControls;
using Newtonsoft.Json;
using Microsoft.SharePoint.Administration;
using Microsoft.SharePoint.Client;

namespace WWT.United.UI
{
    public class FavoritesWebService : WebService
    {
        [WebMethod]
        public string AddFavorite(string category, string keywords, string url, string title, bool newtab, string id)
        {
            try
            {
                if (title == null) throw new ArgumentNullException("title");
                if (url == null) throw new ArgumentNullException("url");
                if (newtab == null) throw new ArgumentNullException("newtab");
                if (id == null) throw new ArgumentNullException("id");
                if (title == "") throw new ArgumentException("Cannot be empty string", "title");
                if (url == "") throw new ArgumentException("Cannot be empty string", "url");
                if (id == "") throw new ArgumentException("Cannot be empty string", "id");

                SPWebApplication webApp = SPWebApplication.Lookup(new Uri(getRelativeUrl()));

                using (SPSite site = webApp.Sites[0])
                {
                    using (SPWeb web = site.OpenWeb())
                    {
                        web.AllowUnsafeUpdates = true;
                        SPListItemCollection items = web.Lists["Favorites"].Items;
                        SPListItem item = items.Add();
                        item["Title"] = title;
                        item["Category"] = category;
                        item["URL"] = url;
                        item["Keywords"] = keywords;
                        item["Open_x0020_in_x0020_new_x0020_ta"] = newtab;
                        item["NavId"] = id;

                        item.Update();
                        web.AllowUnsafeUpdates = false;
                        return item["ID"].ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                SPDiagnosticsService.Local.WriteTrace(0, new SPDiagnosticsCategory("UnitedFavorites", TraceSeverity.Unexpected, EventSeverity.Error), TraceSeverity.Unexpected, ex.Message, ex.StackTrace);
                return "Adding Favorite did not work in FavoritesWebService.cs, check the method.";
            }
        }

        [WebMethod]
        public void DeleteFavorite(string id)
        {
            try
            {
                if (id == null) throw new ArgumentNullException("id");
                if (id == "") throw new ArgumentException("Cannot be empty string", "id");

                SPWebApplication webApp = SPWebApplication.Lookup(new Uri(getRelativeUrl()));

                using (SPSite site = webApp.Sites[0])
                {
                    using (SPWeb web = site.OpenWeb())
                    {
                        web.AllowUnsafeUpdates = true;
                        SPListItemCollection items = web.Lists["Favorites"].Items;
                        items.DeleteItemById(int.Parse(id));
                        web.AllowUnsafeUpdates = false;
                    }
                }
            }
            catch (Exception ex)
            {
                SPDiagnosticsService.Local.WriteTrace(0, new SPDiagnosticsCategory("UnitedFavorites", TraceSeverity.Unexpected, EventSeverity.Error), TraceSeverity.Unexpected, ex.Message, ex.StackTrace);
            }
        }

        public static string getRelativeUrl()
        {
            string subdomain = "";
            string PostUrl = "";

            if (HttpContext.Current.Request.Url.AbsoluteUri.Contains("-vm.wwt.com"))
            {
                subdomain = "-vm.wwt.com";
                PostUrl = "https://united2" + subdomain;
            }
            else if (HttpContext.Current.Request.Url.AbsoluteUri.Contains("-dev.wwt.com"))
            {
                subdomain = "-dev.wwt.com";
                PostUrl = "https://united" + subdomain;
            }
            else if (HttpContext.Current.Request.Url.AbsoluteUri.Contains("-test.wwt.com"))
            {
                subdomain = "-test.wwt.com";
                PostUrl = "https://united" + subdomain;
            }
            else if (HttpContext.Current.Request.Url.AbsoluteUri.Contains(".wwt.com"))
            {
                subdomain = ".wwt.com";
                PostUrl = "https://united" + subdomain;
            }
            if (PostUrl == "") throw new ArgumentException("Cannot be empty string", "PostUrl");

            return PostUrl;
        }
    }
}