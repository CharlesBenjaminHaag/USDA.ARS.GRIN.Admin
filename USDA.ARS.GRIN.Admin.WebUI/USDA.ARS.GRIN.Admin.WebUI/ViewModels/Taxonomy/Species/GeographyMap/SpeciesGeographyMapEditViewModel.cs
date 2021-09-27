using System.ComponentModel.DataAnnotations;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.Taxonomy
{
    public class SpeciesGeographyMapEditViewModel : BaseViewModel
    {
        public int SpeciesID { get; set; }
        public string SpeciesName { get; set; }
        public int GeographyID { get; set; }
        public string GeographyDescription { get; set; }
        public string GeographyStatusCode { get; set; }
        public int CitationID { get; set; }
        
        public SpeciesGeographyMapEditViewModel()
        { 
        }

        public SpeciesGeographyMapEditViewModel(GeographyMap geographyMap)
        { 
        }
    }
}