             using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Reflection;
using System.Text;
using USDA.ARS.GRIN.Admin.Models;

namespace USDA.ARS.GRIN.Admin.WebUI
{
    public class DisplayHelper
    {
        public Application GetApplication()
        {
            Application application = new Application();
           

            return application;
        }
        public static string GetCurrentSkin(string url)
        {
            string appName = String.Empty;
            string appVersion = String.Empty;
            string mainCssClass = "hold-transition skin-blue sidebar-mini";

            //if (HttpContext.Current.Request.Url.ToString().Contains("taxonomy"))
            //{
            //    mainCssClass = "hold-transition skin-green sidebar-mini";
            //}

            //if (HttpContext.Current.Request.Url.ToString().Contains("sitemanagement"))
            //{
            //    mainCssClass = "hold-transition skin-red sidebar-mini";
            //}

            //if (HttpContext.Current.Request.Url.ToString().Contains("accountmanagement"))
            //{
            //    mainCssClass = "hold-transition skin-purple sidebar-mini";
            //}

            //if (HttpContext.Current.Request.Url.ToString().ToLower().Contains("weborder"))
            //{
            //    mainCssClass = "hold-transition skin-red sidebar-mini";
            //}

            return mainCssClass;
        }

        public static string GetPageTitle(string url)
        {
            // CropList   Crop List
            // CropEdit   Edit Crop
            // CropMapEdit  Edit CWR Map
            
            if (HttpContext.Current.Request.Url.ToString().Contains("CropList"))
            {
                return "Crop List";
            }

            if (HttpContext.Current.Request.Url.ToString().Contains("CropEdit"))
            {
                return "Edit Crop";
            }
            return "Dashboard";
        }

        public static string GetDisplayString(string value)
        {
            if ((value.ToUpper() == "Y") || (value.ToUpper() == "TRUE"))
                return "<span class='label label-success'>Yes</span>";
            else
                return "<span class='label label-danger'>No</span>";

        }

        public static string GetBooleanDisplayString(bool value)
        {
            if (value)
                return "<span class='label label-success'>Yes</span>";
            else
                return "<span class='label label-danger'>No</span>";

        }

        public static string GetWebOrderRequestStatusCSSClass(string webOrderRequestStatusCode)
        {
            string cssClass = String.Empty;

            if (webOrderRequestStatusCode.Contains("NRR_FLAG"))
            {
                cssClass = "fa fa-flag-o bg-red";
            }
            else
            {
                switch (webOrderRequestStatusCode)
                {
                    case "NRR_FLAGGED":
                        cssClass = "fa fa-flag-o bg-red";
                        break;
                    case "NRR_NOTE":
                        cssClass = "fa fa-comment-o bg-purple";
                        break;
                    case "NRR_REJECT":
                        cssClass = "fa fa-thumbs-down bg-red";
                        break;
                    case "NRR_APPROVE":
                        cssClass = "fa fa-thumbs-up bg-green";
                        break;
                    default:
                        cssClass = "fa fa-clock-o bg-aqua";
                        break;
                }
            }
            return cssClass;
        }

        public static string GetVersion()
        {
            Version version = null;
            StringBuilder versionNumber = new StringBuilder();
            
            version = Assembly.GetExecutingAssembly().GetName().Version;
            versionNumber.Append(version.Major.ToString());
            versionNumber.Append(".");
            versionNumber.Append(version.Minor.ToString());
            versionNumber.Append(".");
            versionNumber.Append(version.Build.ToString());
            return versionNumber.ToString();
        }
        
    }
}