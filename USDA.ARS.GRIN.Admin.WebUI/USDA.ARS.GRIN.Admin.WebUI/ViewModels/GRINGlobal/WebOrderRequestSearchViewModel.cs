using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.GRINGlobal;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.GRINGlobal
{
    public class WebOrderRequestSearchViewModel : BaseSearchViewModel
    {
        public List<ReferenceItem> Statuses { get; set; }
        public List<ReferenceItem> TimeFrames { get; set; }
        public string ActiveStatus { get; set; }
        public string ActiveTimeFrame { get; set; }
        public IQueryable<WebOrderRequest> WebOrderRequests { get; set; }
    }
}