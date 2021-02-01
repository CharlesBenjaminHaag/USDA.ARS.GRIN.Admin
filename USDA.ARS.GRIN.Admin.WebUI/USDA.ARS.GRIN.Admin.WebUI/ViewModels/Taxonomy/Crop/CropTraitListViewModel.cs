using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;
using USDA.ARS.GRIN.Admin.Service;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.Taxonomy
{
    public class CropTraitListViewModel : BaseViewModel
    {
        public int SpeciesID { get; set; }
        public int CropId { get; set; }
        public int CropMapID { get; set; }
        public List<CWRTrait> CropTraits { get; set; }
        public CropTraitListViewModel()
        {
            this.CropTraits = new List<CWRTrait>();
        }
    }
}