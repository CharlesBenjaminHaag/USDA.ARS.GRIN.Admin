using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using System.IO;
using System.Net;
using System.Web.UI.WebControls;
using System.Data;
using System.Net.Mail;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Service;

namespace USDA.ARS.GRIN.Admin.WebUI.Controllers
{
    public class BaseController : Controller
    {
        public User AuthenticatedUser
        {
            get
            {
                UserSession userSession = new UserSession();
                
                if (Session["USER_SESSION"] != null)
                {
                    userSession = Session["USER_SESSION"] as UserSession;
                }
                return userSession.AuthenticatedUser;
            }
        }

        //public int UpdateUserSession(string appContext)
        //{
        //    SecurityService securityService = new SecurityService();
        //    try
        //    {
        //        UserSession userSession = GetUserSession();
        //        if (userSession == null)
        //        {
        //            throw new NullReferenceException("No UserSession object in session.");
        //        }
        //        userSession.Application = 
        //        Session["USER_SESSION"] = userSession;
        //    }
        //    catch (NullReferenceException nex)
        //    {
        //        return -1;
        //    }
        //    catch (Exception ex)
        //    {
        //        return -2;
        //    }
        //    return 0;
        //}

        public UserSession AuthenticatedUserSession
        {
            get
            {
                UserSession userSession = null;

                if (Session["USER_SESSION"] != null)
                {
                    userSession = Session["USER_SESSION"] as UserSession;
                }
                return userSession;
            }
        }

        public bool ParseBool(string boolValue)
        {
            bool boolResult = false;

            if (boolValue.ToUpper() == "Y")
                boolResult = true;
            else
            {
                if (boolValue.ToUpper() == "N")
                {
                    boolResult = false;
                }
            }
            return boolResult;
        }

        public DateTime ParseDate(string dateTime)
        {
            DateTime dateTimeResult;

            if (String.IsNullOrEmpty(dateTime))
            {
                return DateTime.MinValue;
            }
            else
            {
                if (DateTime.TryParse(dateTime, out dateTimeResult))
                {
                    return dateTimeResult;
                }
                else
                {
                    return DateTime.MinValue;
                }
            }
        }

        public string UnBool(bool boolValue)
        {
            if (boolValue)
                return "Y";
            else
                return "N";
        }

        protected ActionResult RenderExcel(string dataSourceName)
        {
            var gv = new GridView();
            DataTable dtSource = new DataTable();
            StringWriter objStringWriter = new StringWriter();
            HtmlTextWriter objHtmlTextWriter = new HtmlTextWriter(objStringWriter);

            if (Session[dataSourceName] != null)
            {
                var dataSource = Session[dataSourceName];
                gv.DataSource = dataSource;
            }

            gv.DataBind();
            Response.ClearContent();
            Response.Buffer = true;
            //Response.AddHeader("content-disposition", "attachment; filename=RhizobiumDataset.xls");
            //Response.ContentType = "application/ms-excel";
            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            Response.AddHeader("content-disposition", "attachment;filename=" + dataSourceName + "_" + DateTime.Now.ToUniversalTime().ToString() + ".xls");
            Response.Charset = "";
            
            gv.RenderControl(objHtmlTextWriter);
            Response.Output.Write(objStringWriter.ToString());
            Response.Flush();
            Response.End();
            return View("Test");
        }

        public int SendMessage()
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

        public FileMetaData GetFileMetaData(string url)
        {
            FileMetaData fileMetaData = new FileMetaData();

            HttpWebRequest request = WebRequest.Create(url) as HttpWebRequest;
            request.Method = "HEAD";

            try
            {

                HttpWebResponse response = request.GetResponse() as HttpWebResponse;

                if (response.StatusCode == HttpStatusCode.OK)
                {
                    fileMetaData.IsValid = true;
                    fileMetaData.FileSize = response.ContentLength;
                    fileMetaData.LastModified = response.LastModified;
                }
                else
                {
                    fileMetaData.IsValid = false;
                }
            }
            catch (Exception ex)
            {
                fileMetaData.IsValid = false;
            }
            return fileMetaData;
        }
    }
}