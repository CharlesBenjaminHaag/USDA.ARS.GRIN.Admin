using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;
using USDA.ARS.GRIN.Admin.Service;


namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.Taxonomy
{
    public class CitationSearchViewModel
    {
        public List<Citation> Citations { get; set; }
    }
}