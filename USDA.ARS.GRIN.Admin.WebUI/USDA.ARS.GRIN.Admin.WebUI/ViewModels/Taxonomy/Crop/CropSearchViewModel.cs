using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;
using System.Data;
using System.Web.Mvc;
using USDA.ARS.GRIN.Admin.Service;
using USDA.ARS.GRIN.Admin.WebUI.ViewModels;
using USDA.ARS.GRIN.Admin.WebUI.ViewModels.Taxonomy;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.Taxonomy
{
    public class CropSearchViewModel : BaseSearchViewModel
    {
        private List<CropForCWR> _crops;

        public string CropName { get; set; }
        public string CropNameComparisonOperator { get; set; }
        public string DisplayNameComparisonOperator { get; set; }
        public string Note { get; set; }
        public string NoteComparisonOperator { get; set; }
        public List<CropForCWR> CropsForCWR { get; set; }
    }
}