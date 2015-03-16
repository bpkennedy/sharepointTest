using System;
using System.Runtime.InteropServices;
using System.Security.Permissions;
using Microsoft.SharePoint;
using Microsoft.SharePoint.Administration;

namespace WWT.United.UI.Features.Farm
{
    /// <summary>
    /// This class handles events raised during feature activation, deactivation, installation, uninstallation, and upgrade.
    /// </summary>
    /// <remarks>
    /// The GUID attached to this class may be used during packaging and should not be modified.
    /// </remarks>

    [Guid("e8c0f90b-6e9f-4a9c-8245-9a7839546081")]
    public class FarmEventReceiver : SPFeatureReceiver
    {
        // Uncomment the method below to handle the event raised after a feature has been activated.

        public override void FeatureActivated(SPFeatureReceiverProperties properties)
        {
            SPWebApplication webApp = properties.Feature.Parent as SPWebApplication;
            webApp.WebConfigModifications.Clear();

            SPWebConfigModification myModification = new SPWebConfigModification();
            myModification.Path = "configuration/system.web";
            myModification.Name = "webServices";
            myModification.Sequence = 0;
            myModification.Owner = "WWTWebServices";
            myModification.Type = SPWebConfigModification.SPWebConfigModificationType.EnsureChildNode;
            myModification.Value = "<webServices></webServices>";

            SPWebConfigModification myModification2 = new SPWebConfigModification();
            myModification2.Path = "configuration/system.web/webServices";
            myModification2.Name = "protocols";
            myModification2.Sequence = 1;
            myModification2.Owner = "WWTWebServices";
            myModification2.Type = SPWebConfigModification.SPWebConfigModificationType.EnsureChildNode;
            myModification2.Value = "<protocols></protocols>";

            SPWebConfigModification myModification3 = new SPWebConfigModification();
            myModification3.Path = "configuration/system.web/webServices/protocols";
            myModification3.Name = "add [@name='HttpGet']";
            myModification3.Sequence = 2;
            myModification3.Owner = "WWTWebServices";
            myModification3.Type = SPWebConfigModification.SPWebConfigModificationType.EnsureChildNode;
            myModification3.Value = "<add name='HttpGet'/>";

            SPWebConfigModification myModification4 = new SPWebConfigModification();
            myModification4.Path = "configuration/system.web/webServices/protocols";
            myModification4.Name = "add [@name='HttpPost']";
            myModification4.Sequence = 3;
            myModification4.Owner = "WWTWebServices";
            myModification4.Type = SPWebConfigModification.SPWebConfigModificationType.EnsureChildNode;
            myModification4.Value = "<add name='HttpPost'/>";

            webApp.WebConfigModifications.Add(myModification);
            webApp.WebConfigModifications.Add(myModification2);
            webApp.WebConfigModifications.Add(myModification3);
            webApp.WebConfigModifications.Add(myModification4);

            /*Call Update and ApplyWebConfigModifications to save changes*/
            webApp.Update();
            webApp.Farm.Services.GetValue<SPWebService>().ApplyWebConfigModifications();
        }


        // Uncomment the method below to handle the event raised before a feature is deactivated.

        public override void FeatureDeactivating(SPFeatureReceiverProperties properties)
        {
            SPWebApplication webApp = properties.Feature.Parent as SPWebApplication;

            SPWebConfigModification myModification = new SPWebConfigModification();
            myModification.Path = "configuration/system.web";
            myModification.Name = "webServices";
            myModification.Sequence = 0;
            myModification.Owner = "WWTWebServices";
            myModification.Type = SPWebConfigModification.SPWebConfigModificationType.EnsureChildNode;
            myModification.Value = "<webServices></webServices>";

            SPWebConfigModification myModification2 = new SPWebConfigModification();
            myModification2.Path = "configuration/system.web/webServices";
            myModification2.Name = "protocols";
            myModification2.Sequence = 1;
            myModification2.Owner = "WWTWebServices";
            myModification2.Type = SPWebConfigModification.SPWebConfigModificationType.EnsureChildNode;
            myModification2.Value = "<protocols></protocols>";

            SPWebConfigModification myModification3 = new SPWebConfigModification();
            myModification3.Path = "configuration/system.web/webServices/protocols";
            myModification3.Name = "add [@name='HttpGet']";
            myModification3.Sequence = 2;
            myModification3.Owner = "WWTWebServices";
            myModification3.Type = SPWebConfigModification.SPWebConfigModificationType.EnsureChildNode;
            myModification3.Value = "<add name='HttpGet'/>";

            SPWebConfigModification myModification4 = new SPWebConfigModification();
            myModification4.Path = "configuration/system.web/webServices/protocols";
            myModification4.Name = "add [@name='HttpPost']";
            myModification4.Sequence = 3;
            myModification4.Owner = "WWTWebServices";
            myModification4.Type = SPWebConfigModification.SPWebConfigModificationType.EnsureChildNode;
            myModification4.Value = "<add name='HttpPost'/>";

            webApp.WebConfigModifications.Remove(myModification);
            webApp.WebConfigModifications.Remove(myModification2);
            webApp.WebConfigModifications.Remove(myModification3);
            webApp.WebConfigModifications.Remove(myModification4);

            /*Call Update and ApplyWebConfigModifications to save changes*/
            webApp.Update();
            webApp.Farm.Services.GetValue<SPWebService>().ApplyWebConfigModifications();
        }


        // Uncomment the method below to handle the event raised after a feature has been installed.

        //public override void FeatureInstalled(SPFeatureReceiverProperties properties)
        //{
        //}


        // Uncomment the method below to handle the event raised before a feature is uninstalled.

        //public override void FeatureUninstalling(SPFeatureReceiverProperties properties)
        //{
        //}

        // Uncomment the method below to handle the event raised when a feature is upgrading.

        //public override void FeatureUpgrading(SPFeatureReceiverProperties properties, string upgradeActionName, System.Collections.Generic.IDictionary<string, string> parameters)
        //{
        //}
    }
}
