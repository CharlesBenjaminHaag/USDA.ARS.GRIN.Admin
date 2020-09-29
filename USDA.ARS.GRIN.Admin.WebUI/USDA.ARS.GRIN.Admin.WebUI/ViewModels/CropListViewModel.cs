using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using USDA.ARS.GRIN.Admin.Models;


namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels
{
    public class CropListViewModel
    {
        public IQueryable<TaxonomyCrop> Crops { get; set; }

        public CropListViewModel()
        {
            this.Crops = new List<TaxonomyCrop>().AsQueryable();
        }

    }
}