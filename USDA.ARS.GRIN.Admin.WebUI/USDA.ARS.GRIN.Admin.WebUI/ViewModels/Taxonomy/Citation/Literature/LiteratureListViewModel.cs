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
    public class LiteratureListViewModel: BaseViewModel
    {
        public string SearchText { get; set; }
        public IQueryable<Literature> LiteratureList { get; set; }

        public LiteratureListViewModel()
        {
            ListViewName = "Citation/Literature/_List.cshtml";
        }
    }
}