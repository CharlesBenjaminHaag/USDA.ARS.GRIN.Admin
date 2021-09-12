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
        public bool IsAcceptedName { get; set; }
        public IQueryable<Species> SpeciesList { get; set; }
    }
}
