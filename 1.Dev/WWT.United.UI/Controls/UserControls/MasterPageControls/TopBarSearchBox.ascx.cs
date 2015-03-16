using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using Microsoft.SharePoint;


namespace WWT.United.UI.Controls.UserControls.MasterPageControls
{
    public partial class TopBarSearchBox : UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SetCurrentWeb();
        }

        protected void SetCurrentWeb() 
        {
            if (!Page.IsPostBack) 
            {
                currentWebLiteral.Text = SPContext.Current.Web.Url.ToString();
            }
        }
    }
}
