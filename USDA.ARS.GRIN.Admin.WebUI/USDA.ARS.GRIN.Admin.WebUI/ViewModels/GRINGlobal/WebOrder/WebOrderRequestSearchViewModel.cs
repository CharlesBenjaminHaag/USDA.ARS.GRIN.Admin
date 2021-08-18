using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.GRINGlobal;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.GRINGlobal
{
    public class WebOrderRequestSearchViewModel : BaseSearchViewModel
    {
        public string SelectedStatusCode { get; set; }
        public int SelectedTimeFrameCode { get; set; }
        public string SelectedTimeFrameDesc { get; set; }
        public string SelectedDateRange { get; set; }
        public DateTime SelectedStartDate { get; set; }
        public DateTime SelectedEndDate { get; set; }
        public string RequestorEmailAddress { get; set; }
        public string RequestorFirstName { get; set; }
        public string RequestorLastName { get; set; }
        public string RequestorOrganization { get; set; }
        public string IntendedUseCode { get; set; }
        public List<ReferenceItem> Statuses { get; set; }
        public List<ReferenceItem> TimeFrames { get; set; }
        public string ActiveStatus { get; set; }
        public string ActiveTimeFrame { get; set; }
        public IQueryable<WebOrderRequest> WebOrderRequests { get; set; }
        public SelectList IntendedUseCodes { get; set; }
        public WebOrderRequestSearchViewModel()
        {
            this.Statuses = new List<ReferenceItem>();
            this.TimeFrames = new List<ReferenceItem>();
            this.WebOrderRequests = new List<WebOrderRequest>().AsQueryable();
        }
    }
}