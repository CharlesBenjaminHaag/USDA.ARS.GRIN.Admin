using DocumentFormat.OpenXml.Math;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.Taxonomy
{
    public class SpeciesHomeViewModel : BaseViewModel
    {
        public string FullName { get; set; }
        public string IsAcceptedName { get; set; }
        public string GenusName { get; set; }
        public string SubgenusName { get; set; }
        public string SpeciesName { get; set; }
        public string SynonymCode { get; set; }
        public string Protologue { get; set; }
        public SelectList IsAccceptedNameOptions { get; set; }
        public SpeciesHomeViewModel()
        {
            DataSourceName = "taxonomy_species";
            IsAccceptedNameOptions = new SelectList(GetAcceptedNameValues(), "Key", "Value");
        }
        private Dictionary<string, string> GetAcceptedNameValues()
        {
            Dictionary<string, string> selectListOptions = new Dictionary<string, string>();
            selectListOptions.Add("Y", "Accepted");
            selectListOptions.Add("N", "Not Accepted");
            return selectListOptions;
        }

    }
}