using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.Taxonomy
{
    public class SpeciesSearchViewModel : BaseSearchViewModel
    {
        public int CreatedByCooperatorID { get; set; }
        public string GenusName { get; set; }
        public string SpeciesName { get; set; }
        public string SynonymCode { get; set; }
        public string Protologue { get; set; }
        public IEnumerable<Species> Species { get; set; }
    }
}