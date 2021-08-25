using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.AccessRightsManagement
{
    public class CooperatorListViewModel: BaseViewModel
    {
        public List<Cooperator> Cooperators { get; set; }

        public CooperatorListViewModel()
        {
            Cooperators = new List<Cooperator>();
        }
    }
}