using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.GRINGlobal;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.GRINGlobal
{
    public class WebOrderRequestEditViewModel : BaseViewModel
    {
        public string Action { get; set; }
        public int WebCooperatorID { get; set; }
        public DateTime OrderDate { get; set; }
        public string IntendedUseCode { get; set; }
        public string IntendedUseNote { get; set; }
        public string StatusCode { get; set; }
        public string ActionNote { get; set; }

        [AllowHtml]
        public string InformationRequestText { get; set; }
        public string SpecialInstruction { get; set; }
        public bool IsReviewMode { get; set; }
        public string EmailAddressList { get; set; }
        public bool IsLocked { get; set; }
        public Cooperator Cooperator { get; set; }
        public Cooperator WebCooperator { get; set; }
        public Address WebOrderRequestAddress { get; set; }

        public IEnumerable<WebOrderRequestItem> WebOrderRequestItems { get; set; }
        public List<WebOrderRequestActionGroupViewModel> WebOrderRequestActionGroupViewModels { get; set; }
        public IEnumerable<WebOrderRequestAction> WebOrderRequestActions { get; set; }
        public List<Address> WebOrderRequestAddresses { get; set; }
        public IEnumerable<EmailTemplate> EmailTemplates { get; set; }
        public EmailTemplate InformationRequestEmailTemplate 
        { 
            get 
            {
                return EmailTemplates.Where(x => x.Category == EmailTemplateTypeEnum.RQI.ToString()).FirstOrDefault();
            } 
        }
        public EmailTemplate RequestorRejectionLetterTemplate { get 
            {
                return EmailTemplates.Where(x => x.Category == EmailTemplateTypeEnum.RRJ.ToString()).FirstOrDefault();
            } }
     
        public WebOrderRequestEditViewModel()
        {
            Cooperator = new Cooperator();
            WebCooperator = new Cooperator();
            WebOrderRequestAddress = new Address();
            WebOrderRequestAddresses = new List<Address>();
            WebOrderRequestItems = new List<WebOrderRequestItem>();
            WebOrderRequestActionGroupViewModels = new List<WebOrderRequestActionGroupViewModel>();
            WebOrderRequestActions = new List<WebOrderRequestAction>();
            EmailTemplates = new List<EmailTemplate>();
        }
    }
}