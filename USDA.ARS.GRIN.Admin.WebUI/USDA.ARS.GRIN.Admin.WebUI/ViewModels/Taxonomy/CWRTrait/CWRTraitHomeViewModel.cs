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
    public class CWRTraitHomeViewModel: BaseViewModel
    {
        public int CropForCWRID { get; set; }
        public string CropForCWRName { get; set; }
        public int SpeciesID { get; set; }
        public string SpeciesName { get; set; }
        public string TraitClassCode { get; set; }
        public string IsPotential { get; set; }
        public string BreedingTypeCode { get; set; }
        public string BreedingUsageNote { get; set; }
        public string OntologyTraitIdentifier { get; set; }
        public SelectList TraitClassCodes { get; set; }
        public SelectList BreedingTypeCodes { get; set; }
        public SelectList IsPotentialOptions
        {
            get
            {
                return new SelectList(YesNoOptions, "Key", "Value");
            }
        }
        public CWRTraitHomeViewModel()
        {
            this.DataSourceName = "taxonomy_cwr_trait";
        }
    }
}