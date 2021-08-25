using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using USDA.ARS.GRIN.Admin.Models;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.AccessRightsManagement
{
    public class UserProfileViewModel : BaseViewModel
    {
        public string ActiveContext { get; set; }
        public string AppName1 { get; set; }
        public string AppName2 { get; set; }
        public string AppAbbrev { get; set; }
    }
}