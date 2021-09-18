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
    public class CWRMapHomeViewModel : BaseViewModel
    {
        public int SpeciesID { get; set; }
        public string SpeciesName { get; set; }
        public int CropForCWID { get; set; }
        public string CropForCWRName { get; set; }
        public string CropCommonName { get; set; }
        public string IsCrop { get; set; }
        public string GenepoolCode { get; set; }
        public string IsGraftStock { get; set; }
        public string IsPotential { get; set; }

        public SelectList IsCropOptions
        {
            get 
            {
                return new SelectList(YesNoOptions, "Key", "Value");
            }
        }

        public SelectList GenepoolCodes { get; set; }

        public SelectList IsGraftStockOptions
        {
            get
            {
                return new SelectList(YesNoOptions, "Key", "Value");
            }
        }
        public SelectList IsPotentialOptions
        {
            get
            {
                return new SelectList(YesNoOptions, "Key", "Value");
            }
        }
        public CWRMapHomeViewModel()
        {
        }
    }
}