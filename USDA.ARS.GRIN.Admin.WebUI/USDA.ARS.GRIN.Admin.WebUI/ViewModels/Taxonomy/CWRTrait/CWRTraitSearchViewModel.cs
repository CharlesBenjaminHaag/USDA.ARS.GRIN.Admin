using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;
using System.Data;
using System.Web.Mvc;
using USDA.ARS.GRIN.Admin.Service;
using USDA.ARS.GRIN.Admin.WebUI.ViewModels;
using USDA.ARS.GRIN.Admin.WebUI.ViewModels.Taxonomy;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.Taxonomy
{
    public class CWRTraitSearchViewModel
    {
        public IQueryable<CWRTrait> CWRTraits { get; set; }
        public CWRTraitSearchViewModel()
        {
            CWRTraits = new List<CWRTrait>().AsQueryable();
        }
    }
}