using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.Taxonomy
{
    public class RegulationMapHomeViewModel : BaseViewModel
    {
        public int SpeciesID { get; set; }
        public string SpeciesName { get; set; }
        public int GenusID { get; set; }
        public string GenusName { get; set; }
        public int FamilyID { get; set; }
        public string FamilyName { get; set; }
        public RegulationMapHomeViewModel()
        {
            this.DataSourceName = "taxonomy_regulation_map";
        }
    }
}