using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models.GRINGlobal
{
    public static class OrderRequestAction
    {
        public const string NRRApprove = "NRR_APPROVE";
        public const string NRRReview = "NRR_REVIEW";
        public const string NRRReviewEnd = "NRR_REVIEW_END";
        public const string NRRReject = "NRR_REJECT";
        public const string NRRFlagged = "NRR_FLAGGED";
    }
}
