using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using USDA.ARS.GRIN.Admin.Models.GRINGlobal;
using USDA.ARS.GRIN.Admin.Repository;
using USDA.ARS.GRIN.Admin.Repository.GRINGlobal;

namespace USDA.ARS.GRIN.Admin.Service
{
    public class GRINGlobalService : BaseService
    {
        protected AccessionInventoryAttachmentDAO _accessionInventoryAttachmentDAO = null;
        protected WebOrderRequestDAO _webOrderRequestDAO = null;

        public GRINGlobalService(string context)
        {
           _accessionInventoryAttachmentDAO = new AccessionInventoryAttachmentDAO(context);
            _webOrderRequestDAO = new WebOrderRequestDAO(context);   
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

        public IQueryable<WebOrderRequest> GetWebOrderRequests(string statusCode)
        {
            return _webOrderRequestDAO.Search(statusCode);
        }

        public Dictionary<string, int> GetValidationCounts()
        {
            return _accessionInventoryAttachmentDAO.GetValidationCounts();
        }
    }
}
