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
    public class CWRMapViewModel : BaseViewModel
    {
        private Citation _citation = new Citation();
        private IEnumerable<Citation> _citations;
        private IEnumerable<CodeValueReferenceItem> _genepoolCodes;
        private IQueryable<CropForCWR> _taxonomyCrops;

        public int ID { get; set; }

        [RequiredGreaterThanZero(ErrorMessage="Species is required.")]
        public int SpeciesID { get; set; }
        [Required(ErrorMessage = "Species is required.")]
        public string SpeciesName { get; set; }
        public int CropID { get; set; }
        [RequiredIf("IsCrop",true,"Common Name is required.")]
        public string CommonName { get; set; }
        public bool IsCrop { get; set; }
        public string GenepoolCode { get; set; }
        public bool IsGraftStock { get; set; }
        public bool IsPotential { get; set; }
        
        public int CitationID { get; set; }
        public string CitationTitle { get; set; }

        public List<CWRTrait> CWRTraits { get; set; }
        public IEnumerable<SelectListItem> Crops
        {
            get
            {
                SelectList taxonomyCropsForCwr = new SelectList(_taxonomyCrops, "ID", "CropName");
                //foreach (SelectListItem cropForCWr in taxonomyCropsForCwr.Items)
                //{
                //    if (cropForCWr.Value == CropID.ToString())
                //    {
                //        cropForCWr.Selected = true;
                //        break;
                //    }
                //}

                //var selected = taxonomyCropsForCwr.Where(x => x.Value == this.ID.ToString()).First();
                //selected.Selected = true;

                return taxonomyCropsForCwr;
            }
        }

        public IEnumerable<SelectListItem> GenepoolCodes
        {
            get { return new SelectList(_genepoolCodes, "CodeValue", "CodeValue"); }
        }

        public IEnumerable<SelectListItem> Citations { get; set; }
        
        public CWRMapViewModel()
        { }

        public CWRMapViewModel(List<CodeValueReferenceItem> genePoolCodes, IQueryable<CropForCWR> cropsForCwr, List<Citation> citations)
        {
            _genepoolCodes = genePoolCodes;
            _taxonomyCrops = cropsForCwr;
            _citations = citations;
            CWRTraits = new List<CWRTrait>();
        }

        public CWRMapViewModel(List<CodeValueReferenceItem> genePoolCodes, IQueryable<CropForCWR> cropsForCwr)
        {
            _genepoolCodes = genePoolCodes;
            _taxonomyCrops = cropsForCwr;
            _citations = new List<Citation>();
            CWRTraits = new List<CWRTrait>();
        }
    }
}