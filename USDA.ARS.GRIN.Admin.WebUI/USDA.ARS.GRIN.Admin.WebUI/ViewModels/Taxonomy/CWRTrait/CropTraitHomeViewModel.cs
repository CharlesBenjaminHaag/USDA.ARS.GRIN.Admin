using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.Taxonomy
{
    public class CropTraitHomeViewModel : BaseViewModel
    {
        public List<CWRTrait> CropTraits { get; set; }
        public List<CWRMap> CWRMaps { get; set; }
    }
}