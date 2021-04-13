using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;
using USDA.ARS.GRIN.Admin.Service;


namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.Taxonomy
{
    public class CitationHomeViewModel : BaseViewModel
    {
        public SearchViewModel SearchViewModel { get; set; }
        public int SpeciesID { get; set; }
        public string SpeciesName { get; set; }
        public int GenusID { get; set; }
        public string GenusName { get; set; }
        public int FamilyID { get; set; }
        public string FamilyName { get; set; }
        public string FullText { get; set; }
        public string TypeCode { get; set; }
        public string Abbreviation { get; set; }
        public string Author { get; set; }
    }
}