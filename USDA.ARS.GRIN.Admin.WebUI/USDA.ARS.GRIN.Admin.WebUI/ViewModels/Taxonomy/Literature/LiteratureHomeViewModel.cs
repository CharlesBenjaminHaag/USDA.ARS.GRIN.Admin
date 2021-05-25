using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;
using USDA.ARS.GRIN.Admin.Service;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.Taxonomy
{
    public class LiteratureHomeViewModel: BaseViewModel
    {
        public string Action { get; set; }
        public SearchViewModel SearchViewModel { get; set; }
        public string Abbreviation { get; set; }
        public string StandardAbbreviation { get; set; }
        public string ReferenceTitle { get; set; }
        public string Author { get; set; }
        public string TypeCode { get; set; }
        public string Year { get; set; }
        public string Title { get; set; }
        public string URL { get; set; }
        public SelectList LiteratureTypeCodes { get; set; }
        public List<Literature> LiteratureResults { get; set; }
        public LiteratureHomeViewModel()
        {
            this.DataSourceName = "literature";
        }
    }
}