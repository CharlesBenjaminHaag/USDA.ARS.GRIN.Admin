using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.Mvc;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.WebUI.ViewModels.Taxonomy;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels
{
    public class CropWildRelativeSearchViewModel : BaseSearchViewModel
    {
        public string CropNameComparisonOperator { get; set; }
        public string CropName { get; set; }

        public string DisplayNameComparisonOperator { get; set; }
        public string DisplayName { get; set; }

        public string CommonNameComparisonOperator { get; set; }
        public string CropCommonName { get; set; }

        

        

        public CropWildRelativeSearchViewModel()
        {
       
        }
    }
}