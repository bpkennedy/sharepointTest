using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.ComponentModel; // unused at the moment
using System.Collections.Generic;
using System.Web;   //used for HTTP context
using Microsoft.SharePoint;
using Microsoft.SharePoint.Utilities;
using Microsoft.SharePoint.Administration;
using Microsoft.SharePoint.WebControls;

namespace WWT.United.UI.Controls.UserControls.MasterPageControls
{
    public partial class TopBarMainNav : UserControl
    {
        private const string listName = "TopBarMainNav";
        private const string favListName = "Favorites";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                InitMainNav();
            }
        }

        protected void InitMainNav()
        {
            SPWebApplication webApp = SPWebApplication.Lookup(new Uri(getRelativeUrl()));
            Guid webID = SPContext.Current.Web.ID;
            Guid siteID = SPContext.Current.Site.ID;

            using (SPSite site = new SPSite(siteID))
            {
                using (SPWeb web = site.OpenWeb(webID))
                {
                    SPUser user = web.CurrentUser;
                    string userLoginName = user.LoginName;

                    SPSecurity.RunWithElevatedPrivileges(delegate()
                    {
                        using (SPSite elevatedSite = webApp.Sites[0])
                        {
                            using (SPWeb elevatedWeb = elevatedSite.OpenWeb())
                            {

                                if (CheckListExistance(elevatedWeb, listName))
                                {
                                    SPQuery newObject = new SPQuery();
                                    newObject.Query = elevatedWeb.Lists[listName].Views[0].Query;

                                    SPListItemCollection items = elevatedWeb.Lists[listName].GetItems(newObject);

                                    CreateListRepeater(items);
                                    CreateCategoryRepeater(items);
                                }
                                if (CheckListExistance(elevatedWeb, favListName))
                                {
                                    SPQuery newFavObject = new SPQuery();
                                    newFavObject.Query = @"<Where>" +
                                                            "<Eq>" +
                                                                "<FieldRef Name='Author'/>" +
                                                                "<Value Type='User'>" + userLoginName + "</Value>" +
                                                            "</Eq>" +
                                                          "</Where>" + 
                                                          "<OrderBy>" +
                                                            "<FieldRef Ascending='TRUE' Name='Title' />" +
                                                          "</OrderBy>";

                                    SPListItemCollection favItems = elevatedWeb.Lists[favListName].GetItems(newFavObject);

                                    CreateFavListRepeater(favItems);
                                }
                            }
                        }
                    });

                }
            }
        }

        protected void CreateListRepeater(SPListItemCollection items)
        {
            NavItem[] list2 = new NavItem[items.Count];

            if (CheckColumnExistance("Category", items) && CheckColumnExistance("Keywords", items) && CheckColumnExistance("Title", items) && CheckColumnExistance("URL", items) && items.Count > 0)
            {
                for (int x = 0; x < items.Count; x++)
                {
                    list2[x] = GetNavData(items[x]);
                }
                topBarMainNavRepeater.DataSource = list2;
                topBarMainNavRepeater.DataBind();
            }
        }

        protected void CreateFavListRepeater(SPListItemCollection items)
        {
            NavItem[] favList = new NavItem[items.Count];
            try
            {
                if (CheckColumnExistance("Category", items) && CheckColumnExistance("Keywords", items) && CheckColumnExistance("Title", items) && CheckColumnExistance("URL", items))
                {
                    for (int x = 0; x < items.Count; x++)
                    {
                        favList[x] = GetNavData(items[x]);
                    }
                    topBarMainFavRepeater.DataSource = favList;
                    topBarMainFavRepeater.DataBind();
                }
            }
            catch (Exception ex)
            {
                SPDiagnosticsService.Local.WriteTrace(0, new SPDiagnosticsCategory(typeof(TopBarMainNav).FullName, TraceSeverity.High, EventSeverity.Error), TraceSeverity.High, string.Format("Error zipper loading {0}: {1}", typeof(TopBarMainNav).Name, ex), null);
            }
        }

        protected void CreateCategoryRepeater(SPListItemCollection items)
        {
            CategoryItem[] list3 = new CategoryItem[] { };
            List<CategoryItem> CategoryList = new List<CategoryItem>();

            if (CheckColumnExistance("Category", items) && CheckColumnExistance("Keywords", items) && CheckColumnExistance("Title", items) && CheckColumnExistance("URL", items) && items.Count > 0)
            {
                for (int x = 0; x < items.Count; x++)
                {
                    if (!CategoryList.Exists(s => s.Category == items[x]["Category"].ToString()))
                    {
                        CategoryList.Add(new CategoryItem { Category = items[x]["Category"].ToString() });
                    }
                }

                topBarMainNavCatRepeater.DataSource = CategoryList.ToArray();
                topBarMainNavCatRepeater.DataBind();
            }
        }

        protected NavItem GetNavData(SPListItem item)
        {
            NavItem navitem = new NavItem();

            navitem.Category = item["Category"] != null ? item["Category"].ToString() : "no_category";
            navitem.Keywords = item["Keywords"] != null ? item["Keywords"].ToString() : "";
            navitem.Title = item["Title"] != null ? item["Title"].ToString() : "no_title";
            navitem.ItemHref = item["URL"] != null ? item["URL"].ToString() : "no_url";

            if (item["ID"] != null)
            {
                navitem.Id = item["ID"].ToString();
            }
            else
            {
                item["ID"] = "no_Id";
            }

            navitem.Tooltip = item["Title"] != null ? item["Title"].ToString() : "no_title";
            navitem.NewTab = item["Open in new tab?"].ToString();
            navitem.NavId = item["NavId"] != null ? item["NavId"].ToString() : "no_NavId";


            return navitem;
        }

        protected CategoryItem GetCategories(SPListItem item)
        {
            CategoryItem categoryItem = new CategoryItem();

            categoryItem.Category = item["Category"].ToString();

            return categoryItem;
        }

        protected bool CheckColumnExistance(string columnName, SPListItemCollection items)
        {
            if (items.Fields.TryGetFieldByStaticName(columnName) != null)
            {
                return true;
            }
            return false;
        }

        private bool CheckListExistance(SPWeb web, string listName)
        {
            SPListCollection lists = web.Lists;
            if (lists.TryGetList(listName) != null)
            {
                return true;
            }
            return false;
        }

        public static string getRelativeUrl()
        {
            string subdomain = "";
            string PostUrl = "";

            if (HttpContext.Current.Request.Url.AbsoluteUri.Contains("-vm.wwt.com"))
            {
                subdomain = "-vm.wwt.com";
                PostUrl = getDomain() + subdomain;
            }
            else if (HttpContext.Current.Request.Url.AbsoluteUri.Contains("-dev.wwt.com"))
            {
                subdomain = "-dev.wwt.com";
                PostUrl = getDomain() + subdomain;
            }
            else if (HttpContext.Current.Request.Url.AbsoluteUri.Contains("-test.wwt.com"))
            {
                subdomain = "-test.wwt.com";
                PostUrl = getDomain() + subdomain;
            }
            else if (HttpContext.Current.Request.Url.AbsoluteUri.Contains(".wwt.com"))
            {
                subdomain = ".wwt.com";
                PostUrl = getDomain() + subdomain;
            }
            return PostUrl;
        }

        public static string getDomain() 
        {
            string domain = "";
            if (HttpContext.Current.Request.Url.AbsoluteUri.Contains("mysites-vm.wwt.com") || HttpContext.Current.Request.Url.AbsoluteUri.Contains("united2") || HttpContext.Current.Request.Url.AbsoluteUri.Contains("connect-vm") || HttpContext.Current.Request.Url.AbsoluteUri.Contains("united-vm")) 
            { 
                domain = "https://united2";
            }
            else if (HttpContext.Current.Request.Url.AbsoluteUri.Contains("united") || HttpContext.Current.Request.Url.AbsoluteUri.Contains("mysites") || HttpContext.Current.Request.Url.AbsoluteUri.Contains("connect") )
            {
                domain = "https://united";
            }
            return domain;
        }

        public class NavItem
        {
            public string Category { get; set; }

            public string Keywords { get; set; }

            public string ItemHref { get; set; }

            public string Title { get; set; }

            public string Id { get; set; }

            public string Tooltip { get; set; }

            public string NewTab { get; set; }

            public string NavId { get; set; }

        }

        public class CategoryItem
        {
            public string Category { get; set; }
        }
    }
}