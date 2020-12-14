using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.GRINGlobal
{
    public class WebOrderRequestEditViewModel : BaseViewModel
    {
        public int ID { get; set; }
        public string Note { get; set; }
        public string EmailText { get; set; }

    }
}