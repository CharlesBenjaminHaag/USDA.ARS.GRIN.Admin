using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Mail;
using System.CodeDom;
using USDA.ARS.GRIN.Admin.Models;

namespace USDA.ARS.GRIN.Admin.Service
{
    public class SmtpService
    {
        public ResultContainer SendMessage(EmailMessage emailMessage)
        {
            MailAddress to = new MailAddress(emailMessage.To);
            MailAddress from = new MailAddress(emailMessage.From);
            MailMessage message = new MailMessage(from, to);
            message.Subject = emailMessage.Subject;
            message.Body = emailMessage.Body;
            message.IsBodyHtml = emailMessage.IsHtml;
            SmtpClient client = new SmtpClient("mailproxy1.usda.gov");
            ResultContainer resultContainer = new ResultContainer();

            try
            {
                client.Send(message);
            }
            catch (SmtpException ex)
            {
                resultContainer.ResultDescription = ex.Message;
            }
            resultContainer.ResultCode = "OK";
            return resultContainer;
        }
    }
}
