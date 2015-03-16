using System;
using System.Web.UI;
using Microsoft.SharePoint;
using Microsoft.SharePoint.Administration;


namespace WWT.United.UI.Controls.UserControls.MasterPageControls
{
    public partial class TopBarAlerts : UserControl
    {

        private const string listName = "Global Top Bar Alerts";
        private const string urgency = "Urgency";
        private const string AlertText = "Title";


        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    InitAlerts();
                }
            }
            catch (Exception ex)
            {
                SPDiagnosticsService.Local.WriteTrace(0, new SPDiagnosticsCategory(typeof(TopBarAlerts).FullName, TraceSeverity.High, EventSeverity.Error), TraceSeverity.High, string.Format("Error loading {0}: {1}", typeof(TopBarAlerts).Name, ex), null);
                successFailMultiView.ActiveViewIndex = (int)SuccessFailView.ExceptionView;
                exceptionMessageLiteral.Text = ex.ToString();
            }

        }

        protected void InitAlerts()
        {
            using (var oSPSite = SPContext.Current.Site.WebApplication.Sites[0])
            {
                using (var web = oSPSite.OpenWeb())
                {
                    if (CheckListExistance(web, listName))
                    {
                        SPListItemCollection items = web.Lists[listName].Items;

                        CreateRepeater(items);
                    }
                    else
                    {
                        SPDiagnosticsService.Local.WriteTrace(0, new SPDiagnosticsCategory(typeof(TopBarAlerts).FullName, TraceSeverity.High, EventSeverity.Error), TraceSeverity.High, string.Format("Error loading {0}: {1} was not found on the web ({2}).", typeof(TopBarAlerts).Name, listName, web.Url), null);
                        successFailMultiView.ActiveViewIndex = (int)SuccessFailView.ExceptionView;
                        exceptionMessageLiteral.Text = string.Format("List ({0}) was not found in web ({1})", listName, web.Url);
                    }
                }
            }


        }

        protected void CreateRepeater(SPListItemCollection items)
        {
            //var list = new List<Dictionary<string, string>>();

            Alert[] list2 = new Alert[items.Count];

            if (CheckColumnExistance(urgency, items) && CheckColumnExistance(AlertText, items) && items.Count > 0)
            {

                for (int x = 0; x < items.Count; x++)
                {
                    list2[x] = GetAlertData(items[x]);
                }
                leadersRepeater.DataSource = list2;
                leadersRepeater.DataBind();
            }
        }

        protected Alert GetAlertData(SPListItem item)
        {
            Alert alert = new Alert();

            if (item[urgency].ToString() != "Informational")
            {
                alert.Urgency = "Critical";
            }
            else
            {
                alert.Urgency = "Informational";
            }
            alert.Title = item[AlertText].ToString();
            alert.ID = item.UniqueId.ToString();

            return alert;
        }

        protected bool CheckColumnExistance(string columnName, SPListItemCollection items)
        {
            if (items.Fields.TryGetFieldByStaticName(columnName) != null)
            {
                return true;
            }
            SPDiagnosticsService.Local.WriteTrace(0,
                new SPDiagnosticsCategory(typeof (TopBarAlerts).FullName, TraceSeverity.High, EventSeverity.Error),
                TraceSeverity.High, string.Format("Error loading {0}: {1} was not found in the list", typeof (TopBarAlerts).Name, columnName), null);
            successFailMultiView.ActiveViewIndex = (int) SuccessFailView.ExceptionView;
            exceptionMessageLiteral.Text = string.Format("Column ({0}) was not found in web", columnName);
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

        public class Alert
        {
            public string Urgency { get; set; }

            public string Title { get; set; }
            
            public string ID { get; set; }
        }

        protected enum SuccessFailView
        {
            SuccessView = 0,
            ExceptionView = 1
        }
    }
}
