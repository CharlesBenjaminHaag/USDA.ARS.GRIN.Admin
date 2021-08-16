using DocumentFormat.OpenXml.Math;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.Taxonomy
{
    public class SpeciesHomeViewModel : BaseViewModel
    {
        public int CreatedByCooperatorID { get; set; }
        public string GenusName { get; set; }
        public string SubgenusName { get; set; }
        public string SpeciesName { get; set; }
        public string SynonymCode { get; set; }
        public string Protologue { get; set; }
        public SpeciesHomeViewModel()
        {
            DataSourceName = "taxonomy_species";
        }

    }
}