using System.ComponentModel.DataAnnotations;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.Taxonomy
{ 
    public class AuthorEditViewModel : BaseViewModel
    {
        public int ID { get; set; }
        public string ShortName { get; set; }
        public string FullName { get; set; }
        public string ShortNameExpandedDiacritic { get; set; }
        public string FullNameExpandedDiacritic { get; set; }

        public AuthorEditViewModel()
        { }
    }
}