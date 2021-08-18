using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using USDA.ARS.GRIN.Admin.Models.GRINGlobal;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.GRINGlobal
{
    public class WebOrderRequestActionGroupViewModel : BaseViewModel
    {
        public DateTime ActionDate { get; set; }
        public string ActionDisplayDate { get; set; }
        public List<WebOrderRequestAction> WebOrderRequestActions { get; set; }

        public WebOrderRequestActionGroupViewModel()
        {
            WebOrderRequestActions = new List<WebOrderRequestAction>();
        }
    }
}