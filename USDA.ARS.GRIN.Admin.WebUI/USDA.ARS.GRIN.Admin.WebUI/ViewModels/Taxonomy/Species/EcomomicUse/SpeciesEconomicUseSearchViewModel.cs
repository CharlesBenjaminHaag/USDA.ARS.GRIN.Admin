using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.Taxonomy
{ 
    public class SpeciesEconomicUseSearchViewModel: BaseViewModel
    {
        public int SpeciesID { get; set; }
        public string SpeciesName { get; set; }
        public string EconomicUsageCode { get; set; }
        public string UsageType { get; set; }
        public string PlantPartCode { get; set; }
        public int CitationID { get; set; }
        public SelectList EconomicUsageCodes { get; set; }
        public SelectList UsageTypes { get; set; }
        public SelectList PlantPartCodes { get; set; }
    }
}