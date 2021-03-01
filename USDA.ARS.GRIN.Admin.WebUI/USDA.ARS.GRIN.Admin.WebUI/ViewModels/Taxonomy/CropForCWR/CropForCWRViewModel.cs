using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;
using USDA.ARS.GRIN.Admin.Service;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.Taxonomy
{
    public class CropForCWRViewModel : BaseViewModel
    {
        private string _errorMessage;

        public string ErrorMessage
        {
            get
            {
                string formattedErrorMessage = String.Empty;

                if (!string.IsNullOrEmpty(_errorMessage))
                {
                    return "<div class='alert-error'>" + _errorMessage + "</div>";
                }
                else
                {
                    return String.Empty;
                }


            }
            set
            {
                _errorMessage = value;
            }
        }

        public int ID { get; set; }

        public int SpeciesID { get; set; }

        [Required]
        public string CropName { get; set; }
        public IQueryable<CWRMap> CWRMaps { get; set; }
        public CWRTraitViewModel CWRTraitViewModel { get; set; }
        public List<Genus> Genera { get; set; }
    }
}