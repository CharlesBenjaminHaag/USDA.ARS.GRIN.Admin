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
    public class RegulationListViewModel : BaseSearchViewModel
    {
        
        public IQueryable<Regulation> Regulations { get; set; }

        public RegulationListViewModel()
        {
            this.Regulations = new List<Regulation>().AsQueryable();
        }
    }
}