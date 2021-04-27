using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Caching;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.Taxonomy
{
    public class CWRTraitViewModel : BaseViewModel
    {
        private IEnumerable<CodeValueReferenceItem> _traitClassCodes;
        private IEnumerable<CodeValueReferenceItem> _breedingTypeCodes;
        private IEnumerable<Citation> _citations;
       
        public int ID { get; set; }
        public int CWRMapID { get; set; }
        public int CropForCWRID { get; set; }
        public string CropForCWRName { get; set; }
        public int SpeciesID { get; set; }
        public string SpeciesName { get; set; }
        public string TraitClassCode { get; set; }
        public bool IsPotential { get; set; }
        public string BreedingTypeCode { get; set; }
        [AllowHtml]
        public string BreedingUsageNote { get; set; }
        public string OntologyTraitIdentifier { get; set; }
        public int CitationID { get; set; }
        public string CitationTitle { get; set; }
        public CWRMap CWRMap { get; set; }
        public CropForCWR CropForCWR { get; set; }
        public Species Species { get; set; }
        public CWRTraitViewModel()
         {
        }

        public CWRTraitViewModel(List<CodeValueReferenceItem> traitClassCodes, List<CodeValueReferenceItem> breedingTypeCodes)
        {
            _traitClassCodes = traitClassCodes;
            _breedingTypeCodes = breedingTypeCodes;
        }
        public IEnumerable<SelectListItem> TraitClassCodes
        {
            get { return new SelectList(_traitClassCodes, "CodeValue", "Title"); }
        }

        public IEnumerable<SelectListItem> BreedingTypeCodes
        {
            get { return new SelectList(_breedingTypeCodes, "CodeValue", "Title"); }
        }

        public IEnumerable<SelectListItem> Citations { get; set; }
    }
}