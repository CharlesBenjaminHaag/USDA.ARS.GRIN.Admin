using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;
using USDA.ARS.GRIN.Admin.Service;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.Taxonomy
{
    public class CropForCWRHomeViewModel : BaseViewModel
    {
        public string Name { get; set; }
        public CropForCWRHomeViewModel()
        {
            this.DataSourceName = "taxonomy_cwr_crop";
        }
    }
}