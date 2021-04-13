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
        public string SelectedStatusCode { get; set; }
        public int SelectedTimeFrameCode { get; set; }
        public string RequestorEmailAddress { get; set; }
        public string RequestorFirstName { get; set; }
        public string RequestorLastName { get; set; }
        public string IntendedUseCode { get; set; }
        public List<ReferenceItem> IntendedUseCodes { get; set; }
        public List<ReferenceItem> Statuses { get; set; }
        public List<ReferenceItem> TimeFrames { get; set; }
        public string ActiveStatus { get; set; }
        public string ActiveTimeFrame { get; set; }
        public IQueryable<WebOrderRequest> WebOrderRequests { get; set; }

        public WebOrderRequestSearchViewModel()
        {
            this.Statuses = new List<ReferenceItem>();
            this.TimeFrames = new List<ReferenceItem>();
            this.IntendedUseCodes = new List<ReferenceItem>();
            this.WebOrderRequests = new List<WebOrderRequest>().AsQueryable();
        }
    }
}