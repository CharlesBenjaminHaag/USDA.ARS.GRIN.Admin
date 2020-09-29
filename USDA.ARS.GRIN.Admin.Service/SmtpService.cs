using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Mail;
using System.CodeDom;

namespace USDA.ARS.GRIN.Admin.Service
{
    public class SmtpService
    {
        public int SendTestMessage()
        {
            MailAddress to = new MailAddress("benjamin.haag@usda.gov");
            MailAddress from = new MailAddress("id_action_request@ars-grin.gov");

            MailMessage message = new MailMessage(from, to);
            message.Subject = "Test Message";
            message.Body = "TEST OF EMAIL SERVICE";

            SmtpClient client = new SmtpClient("mailproxy1.usda.gov");

            try
            {

                client.Send(message);
            }
            catch (SmtpException ex)
            {
                throw ex;
                return -1;
            }
            return 0;
        }
    }
}
