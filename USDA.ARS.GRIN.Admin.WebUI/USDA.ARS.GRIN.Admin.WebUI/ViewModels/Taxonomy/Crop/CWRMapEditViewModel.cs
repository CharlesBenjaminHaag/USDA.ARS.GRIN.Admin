using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;
using USDA.ARS.GRIN.Admin.Service;
using DocumentFormat.OpenXml.Office.CustomUI;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels
{
    public class CWRMapEditViewModel : BaseViewModel
    {
        //private TaxonomyService _taxonomyService = new TaxonomyService();
        private Citation _citation = new Citation();
        private IEnumerable<Citation> _citations;
        private IEnumerable<CodeValueReferenceItem> _genepoolCodes;
        private List<CropForCWR> _taxonomyCrops;
      
        public int ID { get; set; }
        public int SpeciesID { get; set; }
        public string SpeciesName { get; set; }
        public int CropID { get; set; }
        public string CommonName { get; set; }
        public bool IsCrop { get; set; }
        public string GenepoolCode { get; set; }
        public bool IsGraftStock { get; set; }
        public bool IsPotential { get; set; }
        public int CitationID { get; set; }
        public string CitationTitle { get; set; }

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

        public IEnumerable<SelectListItem> Citations
        {
            get { return new SelectList(_citations, "ID", "CitationTitle"); }
        }

        public CWRMapEditViewModel()
        { }

        public CWRMapEditViewModel(List<CodeValueReferenceItem> genePoolCodes, List<CropForCWR> cropsForCwr, List<Citation> citations)
        {
            _genepoolCodes = genePoolCodes;
            _taxonomyCrops = cropsForCwr;
            _citations = citations;
        }

        public CWRMapEditViewModel(List<CodeValueReferenceItem> genePoolCodes, List<CropForCWR> cropsForCwr)
        {
            _genepoolCodes = genePoolCodes;
            _taxonomyCrops = cropsForCwr;
            _citations = new List<Citation>();
        }
    }
}