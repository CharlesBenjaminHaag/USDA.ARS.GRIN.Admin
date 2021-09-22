using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.Taxonomy
{
    public class RegulationHomeViewModel : BaseViewModel
    {
        public int Geography { get; set; }
        public string RegulationTypeCode { get; set; }
        public string RegulationLevelCode { get; set; }
        public string Description { get; set; }
        public string URL { get; set; }
        public SelectList Cooperators { get; set; }
        public SelectList RegulationTypeCodes { get; set; }
        public SelectList RegulationLevelCodes { get; set; }
    }
}