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
    public class CWRMapSearchViewModel : BaseSearchViewModel
    {
        private TaxonomyService _taxonomyService;
        private List<CropForCWR> _cropsForCwr;
        private IEnumerable<CodeValueReferenceItem> _genepoolCodes;

        public string CommonNameComparisonOperator { get; set; }
        public int CropForCWRID { get; set; }
        public string CommonName { get; set; }
        public bool IsCrop { get; set; }
        public bool IsGraftStock { get; set; }
        public bool IsPotential { get; set; }
        public int SelectedCropID { get; set; }
        public string SelectedGenepoolCode { get; set; }

        public CWRMapSearchViewModel()
        {
           // _taxonomyService = new TaxonomyService();
        }

        public IQueryable<CWRMap> CWRMaps 
        { get; set; }
    }
}