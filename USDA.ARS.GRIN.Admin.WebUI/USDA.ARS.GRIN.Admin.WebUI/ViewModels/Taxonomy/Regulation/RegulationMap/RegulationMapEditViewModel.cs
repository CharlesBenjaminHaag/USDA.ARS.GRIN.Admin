using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.Taxonomy
{
    public class RegulationMapEditViewModel: BaseViewModel
    {
        public int SpeciesID { get; set; }
        public string SpeciesName { get; set; }
        public int GenusID { get; set; }
        public string GenusName { get; set; }
        public int FamilyID { get; set; }
        public string FamilyName { get; set; }
        public int RegulationID { get; set; }
        public string RegulationText { get; set; }
    }
}