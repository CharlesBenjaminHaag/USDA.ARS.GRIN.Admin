using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Caching;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Service;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.Taxonomy
{
    public class CropWildRelativeEditViewModel : BaseViewModel
    {
        //protected TaxonomyService _taxonomyService = new TaxonomyService();

        private IEnumerable<CodeValueReferenceItem> _genepoolCodes;
        private IEnumerable<CodeValueReferenceItem> _traitClassCodes;
        private IEnumerable<CodeValueReferenceItem> _breedingTypeCodes;

        public int ID { get; set; }
        public int SpeciesID { get; set; }
        public string SpeciesName { get; set; }
        [Required(ErrorMessage ="Please enter a crop name.")]
        public string CropName { get; set; }
        public string DisplayName { get; set; }
        public string CropCommonName { get; set; }
        public bool IsCrop { get; set; }
        public string GenepoolCode { get; set; }
        public bool IsGraftStockGenepool { get; set; }
        public string TraitClassCode { get; set; }
        public bool IsPotential { get; set; }
        public string BreedingTypeCode { get; set; }
        public string BreedingUsage { get; set; }
        public string OntologyTraitIdentifier { get; set; }
        public int CitationID { get; set; }
        public string Note { get; set; }
        
        public IEnumerable<SelectListItem> GenepoolCodes
        {
            get { return new SelectList(_genepoolCodes, "CodeValue", "CodeValue"); }
        }

        public IEnumerable<SelectListItem> TraitClassCodes
        {
            get { return new SelectList(_traitClassCodes, "CodeValue", "CodeValue"); }
        }

        public IEnumerable<SelectListItem> BreedingTypeCodes
        {
            get { return new SelectList(_breedingTypeCodes, "CodeValue", "Title"); }
        }

        public CropWildRelativeEditViewModel()
        {
            //this._breedingTypeCodes = _taxonomyService.GetBreedingTypeCodes();
            //this._genepoolCodes = _taxonomyService.GetGenePoolCodes();
            //this._traitClassCodes = _taxonomyService.GetTraitClassCodes();
        }
    }
}