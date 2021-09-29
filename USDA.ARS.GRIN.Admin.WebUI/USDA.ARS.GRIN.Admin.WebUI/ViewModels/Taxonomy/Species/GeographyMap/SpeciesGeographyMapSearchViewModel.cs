using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;
using USDA.ARS.GRIN.Admin.Service;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.Taxonomy
{ 
    public class SpeciesGeographyMapSearchViewModel : BaseViewModel
    {
        public int GeographyID { get; set; }
        public string GeographyDescription { get; set; }
        public int SpeciesID { get; set; }
        public string SpeciesName { get; set; }
        public string StatusCode { get; set; }
        public IQueryable<GeographyMap> GeographyMaps { get; set; }
        public SelectList GeographyMapStatuses { get; set; }
    }
}