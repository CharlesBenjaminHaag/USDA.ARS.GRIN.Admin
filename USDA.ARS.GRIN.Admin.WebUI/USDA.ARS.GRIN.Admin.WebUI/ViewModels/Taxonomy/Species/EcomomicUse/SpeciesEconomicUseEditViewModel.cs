using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.Taxonomy
{
    public class SpeciesEconomicUseEditViewModel:BaseViewModel
    {
        public int SpeciesID { get; set; }
        public string SpeciesName { get; set; }
        public string EconomicUsageCode { get; set; }
        public string UsageType { get; set; }
        public string PlantPartCode { get; set; }
        public SelectList EconomicUsageCodes { get; set; }
        public SelectList UsageTypes { get; set; }
        public SelectList PlantPartCodes { get; set; }

        public SpeciesEconomicUseEditViewModel()
        { }
        public SpeciesEconomicUseEditViewModel(EconomicUse economicUse)
        {
            ID = economicUse.ID;
            SpeciesID = economicUse.SpeciesID;
            SpeciesName = economicUse.SpeciesName;
            EconomicUsageCode = economicUse.EconomicUsageCode;
            UsageType = economicUse.UsageType;
            PlantPartCode = economicUse.PlantPartCode;
            CitationID = economicUse.CitationID;
            CitationText = economicUse.CitationText;
            Note = economicUse.Note;
            CreatedByCooperatorID = economicUse.CreatedByCooperatorID;
            CreatedByCooperatorName = economicUse.CreatedByCooperatorName;
            ModifiedByCooperatorID = economicUse.ModifiedByCooperatorID;
            ModifiedByCooperatorName = economicUse.ModifiedByCooperatorName;
        }

        public EconomicUse GetData()
        {
            EconomicUse economicUse = new EconomicUse();
            economicUse.ID = ID;
            economicUse.SpeciesID = SpeciesID;
            economicUse.SpeciesName = SpeciesName;
            economicUse.EconomicUsageCode = EconomicUsageCode;
            economicUse.UsageType = UsageType;
            economicUse.PlantPartCode = PlantPartCode;
            economicUse.CitationID = CitationID;
            economicUse.Note = Note;
            economicUse.CreatedByCooperatorID = CreatedByCooperatorID;
            economicUse.ModifiedByCooperatorID = ModifiedByCooperatorID;
            return economicUse;
        }
    }
}