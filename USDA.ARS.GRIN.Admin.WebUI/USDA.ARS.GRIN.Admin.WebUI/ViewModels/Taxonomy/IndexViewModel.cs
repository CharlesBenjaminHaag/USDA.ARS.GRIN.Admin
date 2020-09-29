using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;
using USDA.ARS.GRIN.Admin.Service;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.Taxonomy
{
    public class IndexViewModel : BaseViewModel
    {
        //private TaxonomyService _taxonomyService = new TaxonomyService();

        public IEnumerable<Family> Families { get; set; }

        public IndexViewModel()
        {
            //t/his._taxonomyService = new TaxonomyService();
            //this.Families = _taxonomyService.SearchFamilies(null);
        }
    }
}