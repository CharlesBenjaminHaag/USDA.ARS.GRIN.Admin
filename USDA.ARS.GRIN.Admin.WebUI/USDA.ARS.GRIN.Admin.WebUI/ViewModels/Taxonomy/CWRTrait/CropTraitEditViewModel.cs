using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Caching;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;
using USDA.ARS.GRIN.Admin.Service;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.Taxonomy
{
    public class CropTraitEditViewModel : BaseViewModel
    {
        private IEnumerable<CodeValueReferenceItem> _traitClassCodes;
        private IEnumerable<CodeValueReferenceItem> _breedingTypeCodes;
        private IEnumerable<Citation> _citations;

        public int ID { get; set; }
        public int CropMapID { get; set; }
        public int CropID { get; set; }
        public int SpeciesID { get; set; }
        public string TraitClassCode { get; set; }
        public bool IsPotential { get; set; }
        public string BreedingTypeCode { get; set; }
        public string BreedingUsageNote { get; set; }
        public string OntologyTraitIdentifier { get; set; }
        public int CitationID { get; set; }
        public string CitationTitle { get; set; }
      
        public IEnumerable<SelectListItem> TraitClassCodes
        {
            get { return new SelectList(_traitClassCodes, "CodeValue", "Title"); }
        }

        public IEnumerable<SelectListItem> BreedingTypeCodes
        {
            get { return new SelectList(_breedingTypeCodes, "CodeValue", "Title"); }
        }

        public IEnumerable<SelectListItem> Citations
        {
            get { return new SelectList(_citations, "ID", "CitationTitle"); }
        }

        public CropTraitEditViewModel()
        {
            //this._breedingTypeCodes = _taxonomyService.GetBreedingTypeCodes();
            //this._traitClassCodes = _taxonomyService.GetTraitClassCodes();
        }
    }
}