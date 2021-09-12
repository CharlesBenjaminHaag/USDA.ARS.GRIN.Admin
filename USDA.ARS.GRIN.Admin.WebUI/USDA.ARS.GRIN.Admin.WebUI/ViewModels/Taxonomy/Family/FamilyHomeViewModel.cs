using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.Taxonomy
{
    public class FamilyHomeViewModel : BaseViewModel
    {
        public string Name { get; set; }
        public string TribeName { get; set; }
        public string SubtribeName { get; set; }
        public string Note { get; set; }
        List<Cooperator> Cooperators { get; set; }
    }
}