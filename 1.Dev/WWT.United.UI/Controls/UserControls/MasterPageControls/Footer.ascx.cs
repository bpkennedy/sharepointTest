using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Collections.Generic;

namespace WWT.United.UI.Controls.UserControls.MasterPageControls
{
    public partial class Footer : UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)                    //Check if the request is a Post Back or  a Get Request
            {
                LoadServerVarRepeater();
            }
        }
        private void LoadServerVarRepeater()                //Method for Loading the Server Variables into the footer area
        {
            var variables = new List<KeyValuePair<String, String>>();
            foreach (string key in Request.ServerVariables)
            {
                variables.Add(new KeyValuePair<string, string>(key, Request.ServerVariables[key]));
            }
            serverVarRepeater.DataSource = variables;
            serverVarRepeater.DataBind();
        }
    }
}
