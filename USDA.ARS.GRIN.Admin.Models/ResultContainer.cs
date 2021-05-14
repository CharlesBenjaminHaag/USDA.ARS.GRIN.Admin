using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using USDA.ARS.GRIN.Admin;

namespace USDA.ARS.GRIN.Admin.Models
{
    public class ResultContainer
    {
        public int EntityID { get; set; }
        public string ResultCode { get; set; }
        public string ResultMessage { get; set; }
        public string ResultDescription { get; set; }

        public string GetUserFriendlyDescription(string errorCode)
        {
            string errorMessage = String.Empty;

            if (errorCode == LoginResultEnum.USER_NOT_FOUND.ToString())
            {
                errorMessage = "The username that you entered does not exist. You may need to request a Curator Tool account.";
            }

            if (errorCode == LoginResultEnum.INVALID_PASSWORD.ToString())
            {
                errorMessage = "Your password is invalid.";
            }

            if (errorCode == LoginResultEnum.SYSTEM_ERROR.ToString())
            {
                errorMessage = "A system error has occurred, and has been logged.";
            }

            return errorMessage;
        }
    }
}
