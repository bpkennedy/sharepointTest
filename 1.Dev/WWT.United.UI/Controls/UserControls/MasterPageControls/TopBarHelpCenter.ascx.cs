using Microsoft.SharePoint;
using Microsoft.SharePoint.Administration;
using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace WWT.United.UI.Controls.UserControls.MasterPageControls
{
    public partial class TopBarHelpCenter : UserControl
    {
        private const string listName = "HelpCenter";

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    InitHelpCenter();
                }
            }
            catch (Exception ex)
            {
                SPDiagnosticsService.Local.WriteTrace(0, new SPDiagnosticsCategory(typeof(TopBarHelpCenter).FullName, TraceSeverity.High, EventSeverity.Error), TraceSeverity.High, string.Format("Error loading {0}: {1}", typeof(TopBarHelpCenter).Name, ex), null);
                successFailMultiView.ActiveViewIndex = (int)SuccessFailView.ExceptionView;
                exceptionMessageLiteral.Text = ex.ToString();
            }
        }

        public void InitHelpCenter() {
            SPWebApplication webApp = SPWebApplication.Lookup(new Uri(getRelativeUrl()));
            Guid webID = SPContext.Current.Web.ID;
            Guid siteID = SPContext.Current.Site.ID;

            using (SPSite usedSite = webApp.Sites[0])
                {
                    using (SPWeb usedWeb = usedSite.OpenWeb())
                    {
                        SPQuery newObject = new SPQuery();
                        newObject.Query = usedWeb.Lists[listName].Views[0].Query;

                        SPListItemCollection items = usedWeb.Lists[listName].GetItems(newObject);

                        CreateListRepeater(items);
                    }
                }
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
            else if (HttpContext.Current.Request.Url.AbsoluteUri.Contains("united") || HttpContext.Current.Request.Url.AbsoluteUri.Contains("mysites") || HttpContext.Current.Request.Url.AbsoluteUri.Contains("connect"))
            {
                domain = "https://united";
            }
            return domain;
        }

        protected void CreateListRepeater(SPListItemCollection items)
        {
            HelpCenterItem[] list1 = new HelpCenterItem[items.Count];

            if (CheckColumnExistance("Category", items) && CheckColumnExistance("Question", items) && CheckColumnExistance("Answer", items) && items.Count > 0)
            {
                for (int x = 0; x < items.Count; x++)
                {
                    list1[x] = GetHelpItems(items[x]);
                }
                topBarHelpCenterRepeater.DataSource = list1;
                topBarHelpCenterRepeater.DataBind();
            }
        }

        protected HelpCenterItem GetHelpItems(SPListItem item)
        {
            HelpCenterItem helpItem = new HelpCenterItem();

            helpItem.Category = item["Category"] != null ? item["Category"].ToString() : "no_category";
            helpItem.Question = item["Question"] != null ? item["Question"].ToString() : "no_question";
            helpItem.Answer = item["Answer"] != null ? item["Answer"].ToString() : "no_answer";
            return helpItem;
        }

        protected bool CheckColumnExistance(string columnName, SPListItemCollection items)
        {
            if (items.Fields.TryGetFieldByStaticName(columnName) != null)
            {
                return true;
            }
            return false;
        }

        public class HelpCenterItem
        {
            public string Category { get; set; }

            public string Question { get; set; }

            public string Answer { get; set; }
        }

        protected enum SuccessFailView
        {
            SuccessView = 0,
            ExceptionView = 1
        }
    }
}
