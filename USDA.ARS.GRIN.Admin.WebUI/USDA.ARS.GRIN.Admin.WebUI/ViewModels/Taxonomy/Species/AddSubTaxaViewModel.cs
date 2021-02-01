using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.Taxonomy
{
    public class AddSubTaxaViewModel
    {
        public string GenusName { get; set; }
        public string SpeciesName { get; set; }
        public string NameAuthority { get; set; }
        public string Protologue { get; set; }
        public string ProtologueURL { get; set; }
        public bool IsAutonym { get; set; }
    }
}