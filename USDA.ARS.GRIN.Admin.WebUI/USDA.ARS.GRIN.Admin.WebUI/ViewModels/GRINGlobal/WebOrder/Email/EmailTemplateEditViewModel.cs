using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.GRINGlobal;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.GRINGlobal
{
    public class EmailTemplateEditViewModel: BaseViewModel
    {
        public string Title { get; set; }
        public string RecipientAddress { get; set; }
        public string SenderAddress { get; set; }
        public string Subject { get; set; }
        public string Body { get; set; }
        public bool IsHtmlFormat { get; set; }
   
        public EmailTemplateEditViewModel()
        {
        }
    }
}