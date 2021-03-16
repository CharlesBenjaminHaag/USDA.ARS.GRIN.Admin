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
    public class CitationViewModel : BaseViewModel
    {
        public int ID { get; set; }

        public int SpeciesID { get; set; }
        public int LiteratureID { get; set; }
        public string LiteratureReferenceTitle { get; set; }
        public string CitationTitle { get; set; }
        public string AuthorName { get; set; }
        public string Year { get; set; }
        public string Reference { get; set; }
        public string DOIReference { get; set; }
        public string URL { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public Literature Literature { get; set; }
    }
}