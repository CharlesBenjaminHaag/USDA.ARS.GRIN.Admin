using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.GRINGlobal;
using USDA.ARS.GRIN.Admin.Repository;
using USDA.ARS.GRIN.Admin.Repository.GRINGlobal;

namespace USDA.ARS.GRIN.Admin.Service
{
    public class GRINGlobalService : BaseService
    {
        protected AccessionInventoryAttachmentDAO _accessionInventoryAttachmentDAO = null;
        protected WebOrderRequestDAO _webOrderRequestDAO = null;
        protected EmailTemplateDAO _emailTemplateDAO = null;
        protected SmtpService _smtpService = null;
        protected string _context;
        
        public GRINGlobalService(string context)
        {
            _context = context;
            _accessionInventoryAttachmentDAO = new AccessionInventoryAttachmentDAO(context);
            _webOrderRequestDAO = new WebOrderRequestDAO(context);
            _emailTemplateDAO = new EmailTemplateDAO(context);
            _smtpService = new SmtpService();
        }

        public AccessionInventoryAttachment GetAccessionInventoryAttachment(int id)
        {
            return _accessionInventoryAttachmentDAO.Get(id);
        }

        public IQueryable<USDA.ARS.GRIN.Admin.Models.GRINGlobal.AccessionInventoryAttachment> GetAccessionInventoryAttachments(int batchSize, string validationStatus = "")
        {
            IQueryable<USDA.ARS.GRIN.Admin.Models.GRINGlobal.AccessionInventoryAttachment> accessionInventoryAttachments = new List<Models.GRINGlobal.AccessionInventoryAttachment>().AsQueryable();
            accessionInventoryAttachments = _accessionInventoryAttachmentDAO.Find(batchSize, validationStatus);
            return accessionInventoryAttachments;
        }

        public void AddValidationRecord(int accessionInventoryAttachId, bool imageUrlIsValid, bool thumbnailImageUrlIsValid)
        {
            _accessionInventoryAttachmentDAO.AddValidation(accessionInventoryAttachId, imageUrlIsValid, thumbnailImageUrlIsValid);
        }

        public WebOrderRequest GetWebOrderRequest(int id)
        {
            return _webOrderRequestDAO.Get(id);   
        }

        public IQueryable<WebOrderRequest> GetWebOrderRequests(string statusCode, int timeFrameCode)
        {
            return _webOrderRequestDAO.SearchByStatus(statusCode, timeFrameCode);
        }
        public IQueryable<WebOrderRequest> SearchWebOrderRequests(Query query)
        {
            return _webOrderRequestDAO.Search(query);
        }

        public List<ReferenceItem> GetWebOrderRequestStatuses()
        {
            return _webOrderRequestDAO.GetStatuses();
        }
        public List<ReferenceItem> GetWebOrderRequestIntendedUseCodes()
        {
            return _webOrderRequestDAO.GetIntendedUseCodes();
        }

        public ResultContainer AddWebOrderRequestAction(WebOrderRequestAction webOrderRequestAction)
        {
            return _webOrderRequestDAO.AddAction(webOrderRequestAction);
        }

        public ResultContainer UpdateWebOrderRequest(WebOrderRequest webOrderRequest)
        {
            return _webOrderRequestDAO.Update(webOrderRequest);
        }
        public ResultContainer SetReviewStatus(int id, int webCooperatorId, bool locked)
        {
            return _webOrderRequestDAO.UpdateLockStatus(id, webCooperatorId, locked);
        }

        public Dictionary<string, int> GetValidationCounts()
        {
            return _accessionInventoryAttachmentDAO.GetValidationCounts();
        }

        #region Email Templates

        public EmailTemplate GetEmailTemplate(int id)
        {
            return _emailTemplateDAO.Get(id);
        }

        public IQueryable<EmailTemplate> GetEmailTemplates()
        {
            return _emailTemplateDAO.FindAll();
        }

        public ResultContainer UpdateEmailTemplate(EmailTemplate emailTemplate)
        {
            return _emailTemplateDAO.Update(emailTemplate);
        }

        #endregion Email Templates
        #region Email

        public string GetEmailNotificationList(int webOrderRequestId)
        {
            if (_context != "PRODUCTION")
            {
                return "marty.reisinger@usda.gov,benjamin.haag@usda.gov";
            }
            else
            {
                return _webOrderRequestDAO.GetEmailNotificationList(webOrderRequestId).ToString();
            }
        }

        public ResultContainer SendEmail(int webOrderRequestId, string type, string emailNotificationList)
        {
            ResultContainer resultContainer = new ResultContainer();
            EmailTemplate emailTemplate = new EmailTemplate();
            EmailMessage emailMessage = new EmailMessage();

            try
            {
                emailTemplate = _emailTemplateDAO.Search(type).First();
                emailMessage.Subject = emailTemplate.Subject.Replace("[ID_HERE]", webOrderRequestId.ToString());
                emailMessage.From = emailTemplate.From;
                emailMessage.ReplyTo = emailTemplate.From;
                emailMessage.Recipients = emailNotificationList.Split(',');
                emailMessage.Body = emailTemplate.Body.Replace("[ID_HERE]", webOrderRequestId.ToString());
                resultContainer = _smtpService.SendMessage(emailMessage);
                if (resultContainer.ResultMessage == ResultContainer.ResultCodeValue.OK.ToString())
                {
                    throw new Exception(resultContainer.ResultMessage);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return resultContainer;
        }

        #endregion
    }
}
