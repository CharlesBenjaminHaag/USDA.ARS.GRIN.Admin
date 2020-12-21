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
        public int ID { get; set; }
        public DateTime OrderDate {get; set; }
        public Cooperator Cooperator { get; set; }
        public WebCooperator WebCooperator { get; set; } 
        public Address WebOrderRequestAddress { get; set; }

        public WebOrderRequestEditViewModel()
        {
            Cooperator = new Cooperator();
            WebCooperator = new WebCooperator();
            WebOrderRequestAddress = new Address();
        }
    }
}