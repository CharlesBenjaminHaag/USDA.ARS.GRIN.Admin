using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using USDA.ARS.GRIN.Admin.Models.GRINGlobal;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.GRINGlobal.Inventory
{
    public class AccessionInventoryAttachmentListViewModel
    {
        IEnumerable<AccessionInventoryAttachment> _accessionInventoryAttachments = new List<AccessionInventoryAttachment>().AsEnumerable();
        //IEnumerable<AccessionInventoryAttachment> _validatedAccessionInventoryAttachments = new List<AccessionInventoryAttachment>().AsEnumerable();
        public int BatchSize { get; set; }
        public string ValidationStatus { get; set; }
        public Dictionary<string, int> ValidationCounts { get; set; }
        public SelectList ValidationStatuses 
        {
            get
            {
                List<SelectListItem> items = new List<SelectListItem>();
                items.Add(new SelectListItem { Value = "NV", Text = "Not Validated" });
                items.Add(new SelectListItem { Value = "VL", Text = "Validated" });
                items.Add(new SelectListItem { Value = "ER", Text = "Error" });
                SelectList list = new SelectList(items, "Value", "Text");
                return list;    
            }
        }

        public SelectList BatchSizes
        {
            get
            {
                List<SelectListItem> items = new List<SelectListItem>();
                items.Add(new SelectListItem { Value = "25", Text = "25" });
                items.Add(new SelectListItem { Value = "50", Text = "50" });
                items.Add(new SelectListItem { Value = "100", Text = "100" });
                items.Add(new SelectListItem { Value = "150", Text = "150" });
                items.Add(new SelectListItem { Value = "200", Text = "200" });
                items.Add(new SelectListItem { Value = "250", Text = "250" });
                SelectList list = new SelectList(items, "Value", "Text");
                return list;
            }
        }

        public IEnumerable<AccessionInventoryAttachment> AccessionInventoryAttachments
        {
            get
            {
                return this._accessionInventoryAttachments;
            }
            set
            {
                this._accessionInventoryAttachments = value;
            }

        }

        public string GetValidatedHtmlString(int status, string url) 
        {
            if (status == 1)
            {
                url = "<span class='label label-success'>" + url + "</span>";
            }
            else
            {
                if ((status != -9))
                //{
                //    url = "<span class='label label-default'>" + url + "</span>";
                //}
                //else
                {
                    url = "<span class='label label-danger'>" + url + "</span>";
                }
            }
            return url;
        }
    }
}