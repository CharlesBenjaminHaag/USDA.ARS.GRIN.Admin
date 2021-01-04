using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using System.IO;
using System.Web.UI.WebControls;
using System.Data;
using USDA.ARS.GRIN.Admin.Models;

namespace USDA.ARS.GRIN.Admin.WebUI.Controllers
{
    public class BaseController : Controller
    {
        protected static readonly log4net.ILog log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        
        public User AuthenticatedUser
        {
            get
            {
                UserSession userSession = null;
                
                if (Session["USER_SESSION"] != null)
                {
                    userSession = Session["USER_SESSION"] as UserSession;
                }
                return userSession.AuthenticatedUser;
            }
        }

        public UserSession GetUserSession()
        {
            UserSession userSession = null;

            try
            {
                if (Session["USER_SESSION"] != null)
                {
                    userSession = Session["USER_SESSION"] as UserSession;
                }
            }
            catch (Exception ex)
            {
                log.Error(ex.Message + "|" + ex.StackTrace);
            }
            return userSession;
        }

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
    }
}