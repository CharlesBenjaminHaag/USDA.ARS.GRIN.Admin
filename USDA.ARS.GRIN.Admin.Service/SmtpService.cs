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
        protected static string SMTP_SERVER = "mailproxy1.usda.gov";

        //public ResultContainer SendMessage(EmailMessage emailMessage)
        //{
        //    MailMessage message = new MailMessage();
        //    message.From = new MailAddress(emailMessage.From);

        //    // TODO: HANDLE MULT ADDRESSES
        //    message.To.Add(new MailAddress(emailMessage.To));

        //    message.Subject = emailMessage.Subject;
        //    message.Body = emailMessage.Body;
        //    message.IsBodyHtml = emailMessage.IsHtml;
            
            
        //    SmtpClient client = new SmtpClient("mailproxy1.usda.gov");
        //    ResultContainer resultContainer = new ResultContainer();

        //    try
        //    {
        //        client.Send(message);
        //    }
        //    catch (SmtpException ex)
        //    {
        //        resultContainer.ResultDescription = ex.Message;
        //    }
        //    resultContainer.ResultCode = "OK";
        //    return resultContainer;
        //}

        public ResultContainer SendMessage(EmailMessage emailMessage)
        {
            StringBuilder sbResultDescription = new StringBuilder();
            MailAddress from = new MailAddress(emailMessage.From);
            MailAddress to = new MailAddress(emailMessage.To);
            MailMessage message = new MailMessage(from, to);
            message.Subject = emailMessage.Subject;
            message.Body = emailMessage.Body;
            message.IsBodyHtml = true;

            // CONSIDER FOR LATER RELEASE
            //MailAddress copy = new MailAddress("Notifications@contoso.com");
            //message.CC.Add(copy);
                
            SmtpClient client = new SmtpClient(SMTP_SERVER);
            
            //NEEDED?
            //client.Credentials = (ICredentialsByHost)CredentialCache.DefaultNetworkCredentials;
            
            ResultContainer resultContainer = new ResultContainer();
            resultContainer.ResultCode = ResultContainer.ResultCodeValue.OK.ToString();

            try
            {
                client.Send(message);
            }
            catch (SmtpFailedRecipientsException ex)
            {
                for (int i = 0; i < ex.InnerExceptions.Length; i++)
                {
                    SmtpStatusCode status = ex.InnerExceptions[i].StatusCode;
                    if (status == SmtpStatusCode.MailboxBusy ||
                        status == SmtpStatusCode.MailboxUnavailable)
                    {
                        sbResultDescription.Append("Delivery failed - retrying in 5 seconds.");
                        System.Threading.Thread.Sleep(5000);
                        client.Send(message);
                    }
                    else
                    {
                        sbResultDescription.Append(String.Format("Failed to deliver message to {0}", ex.InnerExceptions[i].FailedRecipient));
                    }
                }
            }
            catch (SmtpFailedRecipientException smex)
            {
                resultContainer.ResultCode = ResultContainer.ResultCodeValue.Error.ToString();
                resultContainer.ResultMessage = smex.Message;
            }
            catch (Exception ex)
            {
                resultContainer.ResultCode = ResultContainer.ResultCodeValue.Error.ToString();
                resultContainer.ResultMessage = String.Format("Exception caught in RetryIfBusy(): {0}", ex.ToString());
            }
            return resultContainer;
            }
        }
}
