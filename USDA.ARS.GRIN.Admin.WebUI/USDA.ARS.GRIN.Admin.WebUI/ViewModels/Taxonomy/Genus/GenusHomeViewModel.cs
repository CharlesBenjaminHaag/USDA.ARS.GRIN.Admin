using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.Taxonomy
{
    public class GenusHomeViewModel : BaseViewModel
    {
        public string QualifyingCode { get; set; }
        public string HybridCode { get; set; }
        public string Name { get; set; }
        public string Authority { get; set; }
        public string SubGenusName { get; set; }
        public string SectionName { get; set; }
        public string SubSectionName { get; set; }
        public string SeriesName { get; set; }
        public string SubSeriesName { get; set; }
       
    }
}