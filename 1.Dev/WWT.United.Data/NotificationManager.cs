using System;
using System.Collections.Generic;
using System.Linq;
using WWT.United.Data.TopBarAlert;

namespace WWT.United.Data
{
    public class NotificationManager
    {
        public IEnumerable<GlobalTopBarAlertsItem> GetTopBarAlerts(Uri pageUri)
        {
            if (pageUri == null) throw new ArgumentNullException("pageUri");

            using (var dataContext = new TopBarAlertDataContext(pageUri.GetLeftPart(UriPartial.Authority)))
            {
                return (from alert in dataContext.GlobalTopBarAlerts
                        where
                            alert.Active == true &&
                            (alert.StartDate == null || alert.StartDate <= DateTime.Now) &&
                            (alert.EndDate == null || alert.EndDate >= DateTime.Now)
                        orderby alert.Urgency
                        select alert);
            }
        }
    }
}