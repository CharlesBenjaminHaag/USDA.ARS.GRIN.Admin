using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.GRINGlobal;


namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.GRINGlobal
{
    public class WebOrderRequestListViewModel : BaseViewModel
    {
        public int WebCooperatorID { get; set; }
        public IQueryable<WebOrderRequest> WebOrderRequests { get; set; }
    }
}