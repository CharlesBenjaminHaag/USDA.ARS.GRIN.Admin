using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.Taxonomy
{
    public class SpeciesListViewModel : BaseViewModel
    {
        public string FullName { get; set; }
        public bool IsAcceptedName { get; set; }
        public System.Linq.IQueryable<Species> SpeciesList { get; set; }
    }
}
