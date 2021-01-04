using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.GRINGlobal;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.GRINGlobal
{
    public class WebOrderRequestEditViewModel : BaseViewModel
    {
        public string Action { get; set; }
        public int ID { get; set; }
        public int WebCooperatorID { get; set; }
        public DateTime OrderDate { get; set; }
        public string IntendedUseCode { get; set; }
        public string IntendedUseNote { get; set; }
        public string StatusCode { get; set; }
        public string Note { get; set; }
        public string SpecialInstruction { get; set; }
        public Cooperator Cooperator { get; set; }
        public Cooperator WebCooperator { get; set; } 
        public Address WebOrderRequestAddress { get; set; }

        public IEnumerable<WebOrderRequestItem> WebOrderRequestItems { get; set; }
        public List<WebOrderRequestActionGroupViewModel> WebOrderRequestActionGroupViewModels { get; set; }
        public WebOrderRequestEditViewModel()
        {
            Cooperator = new Cooperator();
            WebCooperator = new Cooperator();
            WebOrderRequestAddress = new Address();
            WebOrderRequestActionGroupViewModels = new List<WebOrderRequestActionGroupViewModel>();
        }
    }
}