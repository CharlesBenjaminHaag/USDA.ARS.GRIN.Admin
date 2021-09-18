using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;
using USDA.ARS.GRIN.Admin.Service;
using USDA.ARS.GRIN.Admin.WebUI.Utilities;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.Taxonomy
{
    public class CWRMapEditViewModel : BaseViewModel
    {
        private Citation _citation = new Citation();
        private IEnumerable<Citation> _citations;
        private IEnumerable<CodeValueReferenceItem> _genepoolCodes;
        private IQueryable<Models.Taxonomy.CropForCWR> _taxonomyCrops;

         public int GenusID { get; set; }
        
        [Required]
        //[RequiredGreaterThanZero(ErrorMessage="Species is required.")]
        public int SpeciesID { get; set; }
        
        public string SpeciesName { get; set; }
        [Required]
        public int CropForCWRID { get; set; }
        public string CropForCWRName { get; set; }

        [RequiredIf("IsCrop",true,"Common Name is required.")]
        public string CropCommonName { get; set; }

        public bool IsCrop { get; set; }
        public string GenepoolCode { get; set; }
        public bool IsGraftStock { get; set; }
        public bool IsPotential { get; set; }
        
        public int CitationID { get; set; }
        public string CitationTitle { get; set; }

        public List<Models.Taxonomy.CWRTrait> CWRTraits { get; set; }
        public IEnumerable<SelectListItem> Crops { get; set; }
     
        public IEnumerable<SelectListItem> GenepoolCodes { get; set; }
        
        public CWRMapEditViewModel()
        {
            DataSourceName = "taxonomy_cwr_map";
        }
    }
}