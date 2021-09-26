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
    public class RegulationEditViewModel: BaseViewModel
    {
        public int GeographyID { get; set; }
        [Required]
        public string GeographyDescription { get; set; }
        [Required]
        public string Description { get; set; }
        [Required]
        public string RegulationTypeCode { get; set; }
        [Required]
        public string RegulationLevelCode { get; set; }
        public string URL { get; set; }
        public SelectList RegulationTypeCodes { get; set; }
        public SelectList RegulationLevelCodes { get; set; }
        public RegulationEditViewModel()
        {
            DataSourceName = "taxonomy_regulation";
        }
        public RegulationEditViewModel(Regulation regulation): base()
        {
            DataSourceName = "taxonomy_regulation";
            ID = regulation.ID;
            GeographyID = regulation.GeographyID;
            GeographyDescription = regulation.GeographyDescription;
            Description = regulation.Description;
            RegulationTypeCode = regulation.RegulationTypeCode;
            RegulationLevelCode = regulation.RegulationLevelCode;
            URL = regulation.PrimaryURL;
            CreatedDate = regulation.CreatedDate;
            CreatedByCooperatorID = regulation.CreatedByCooperatorID;
            CreatedByCooperatorName = regulation.CreatedByCooperatorName;
            ModifiedDate = regulation.ModifiedDate;
            ModifiedByCooperatorID = regulation.ModifiedByCooperatorID;
            ModifiedByCooperatorName = regulation.ModifiedByCooperatorName;
        }
    }
}