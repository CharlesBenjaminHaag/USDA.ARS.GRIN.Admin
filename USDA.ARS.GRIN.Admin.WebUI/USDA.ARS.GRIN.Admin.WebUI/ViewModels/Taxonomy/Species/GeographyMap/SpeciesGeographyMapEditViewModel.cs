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
    public class SpeciesGeographyMapEditViewModel : BaseViewModel
    {
        public int GeographyID { get; set; }
        [AllowHtml]
        public string GeographyDescription { get; set; }
        public int SpeciesID { get; set; }
        [AllowHtml]
        public string SpeciesName { get; set; }
        public string GeographyStatusCode { get; set; }
        public SelectList GeographyMapStatuses { get; set; }

        public SpeciesGeographyMapEditViewModel()
        { 
        }

        public SpeciesGeographyMapEditViewModel(GeographyMap geographyMap)
        {
            ID = geographyMap.ID;
            SpeciesID = geographyMap.SpeciesID;
            SpeciesName = geographyMap.SpeciesName;
            GeographyID = geographyMap.GeographyID;
            GeographyDescription = geographyMap.GeographyText;
            GeographyStatusCode = geographyMap.GeographyStatusCode;
            CreatedByCooperatorID = geographyMap.CreatedByCooperatorID;
            CreatedByCooperatorName = geographyMap.CreatedByCooperatorName;
            CreatedDate = geographyMap.CreatedDate;
            ModifiedByCooperatorID = geographyMap.ModifiedByCooperatorID;
            ModifiedByCooperatorName = geographyMap.ModifiedByCooperatorName;
            ModifiedDate = geographyMap.ModifiedDate;
        }

        public GeographyMap GetData()
        {
            return new GeographyMap
            {
                ID = this.ID,
                SpeciesID = this.SpeciesID,
                SpeciesName = this.SpeciesName,
                GeographyID = this.GeographyID,
                GeographyStatusCode = this.GeographyStatusCode,
                CreatedByCooperatorID = this.CreatedByCooperatorID,
                CreatedByCooperatorName = this.CreatedByCooperatorName,
                CreatedDate = this.CreatedDate,
                ModifiedByCooperatorID = this.ModifiedByCooperatorID,
                ModifiedByCooperatorName = this.ModifiedByCooperatorName,
                ModifiedDate = this.ModifiedDate
            };
        }
    }
}