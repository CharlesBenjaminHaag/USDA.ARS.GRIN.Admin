using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Caching;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;
using USDA.ARS.GRIN.Admin.Service;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.Taxonomy
{
    public class RegulationMapListViewModel : BaseSearchViewModel
    {
        
        public IQueryable<RegulationMap> RegulationMaps { get; set; }

        public RegulationMapListViewModel()
        {
            this.RegulationMaps = new List<RegulationMap>().AsQueryable();
        }
    }
}