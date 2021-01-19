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
        public static string GetCurrentSkin(string url)
        {
            string appName = String.Empty;
            string appVersion = String.Empty;
            string mainCssClass = String.Empty;

            
            
            if (HttpContext.Current.Request.Url.ToString().Contains("Taxonomy"))
            {
                mainCssClass = "hold-transition skin-green sidebar-mini";
                
            }
            else
            {
                if (HttpContext.Current.Request.Url.ToString().Contains("SiteManagement"))
                {
                    mainCssClass = "hold-transition skin-red sidebar-mini";
                }
                else
                {
                    if (HttpContext.Current.Request.Url.ToString().Contains("AccountManagement"))
                    {
                        mainCssClass = "hold-transition skin-purple sidebar-mini";
                    }
                    else
                    {
                        mainCssClass = "hold-transition skin-blue sidebar-mini";
                    }
                }
            }
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