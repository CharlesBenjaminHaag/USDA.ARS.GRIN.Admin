using System;
using System.Web.Mvc;
using System.Reflection;
using NLog;
using USDA.ARS.GRIN.Admin.WebUI.ViewModels;
using USDA.ARS.GRIN.Admin.WebUI.ViewModels.AccountManagement;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Service;

namespace USDA.ARS.GRIN.Admin.WebUI.Controllers
{
    public class HomeController : BaseController
    {
        private static readonly Logger Log = LogManager.GetCurrentClassLogger();

        [GrinGlobalAuthentication]
        [HttpGet]
        public ActionResult Index(string appContext = "")
        {
            DashboardViewModel dashboardViewModel = new DashboardViewModel();
            string destinationView = "Index.cshtml";

            try
            {
                dashboardViewModel.AuthenticatedUser = this.AuthenticatedUser;
                TempData["context"] = "My Profile";

                if (!String.IsNullOrEmpty(appContext))
                {
                    return RedirectToAction("Index", appContext);
                }
                else
                {
                    return View(dashboardViewModel);
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex, "Error Occurred");
                return RedirectToAction("InternalServerError", "Error");
            }
        }

        public ActionResult LoadApplication(string appContext)
        {
            UserSession userSession = null;
            SecurityService securityService = new SecurityService(AuthenticatedUserSession.Environment);

            // Get metadata and security information related to selected application.
            if (Session["USER_SESSION"] != null)
            {
                userSession = Session["USER_SESSION"] as UserSession;
            }

            // Get application data and add to user session.
            // TODO
            userSession.Application = securityService.GetApplication(appContext);
            if (userSession.Application == null)
            {
                throw new NullReferenceException("No application found matching " + appContext);
            }
            Session["USER_SESSION"] = userSession;
            return RedirectToAction("Index", appContext);
        }

        public ActionResult _Header()
        {
            string requestedUrl = String.Empty;
            UserEditViewModel userViewModel = new UserEditViewModel();
            userViewModel.AppName1 = "GRINGlobal";
            userViewModel.AppName2 = "Admin";
            userViewModel.AppAbbrev = "GGA";

            // Determine the title to display, based on the selected application.
            // NOTE: SHOULD BE STORED! (12/19/2019)
            requestedUrl = Request.Url.AbsoluteUri.ToString();
            if (requestedUrl.ToLower().Contains("taxonomy"))
            {
                userViewModel.ActiveContext = "taxonomy";
                userViewModel.AppName1 = "Turbo";
                userViewModel.AppName2 = "Taxon";
                userViewModel.AppAbbrev = "TT";
            }
            if (requestedUrl.ToLower().Contains("sitemanagement"))
            {
                userViewModel.ActiveContext = "sitemanagement";
                userViewModel.AppName1 = "ARS-GRIN";
                userViewModel.AppName2 = "CMS";
                userViewModel.AppAbbrev = "CMS";
            }

            if (requestedUrl.ToLower().Contains("accountmanagement"))
            {
                userViewModel.ActiveContext = "accountmanagement";
                userViewModel.AppName1 = "You";
                userViewModel.AppName2 = "ser";
                userViewModel.AppAbbrev = "AM";
            }

            if (requestedUrl.ToLower().Contains("weborder"))
            {
                userViewModel.ActiveContext = "weborder";
                userViewModel.AppName1 = "NRR";
                userViewModel.AppName2 = "-B-GONE";
                userViewModel.AppAbbrev = "NRR";
            }

            userViewModel.AuthenticatedUser = this.AuthenticatedUser;
            return PartialView("~/Views/Shared/_Header.cshtml", userViewModel);
        }

        public ActionResult _Sidebar()
        {
            string requestedUrl = String.Empty;
            string sideBarPath = "~/Views/Shared/_Sidebar.cshtml";

            try
            {
                requestedUrl = Request.Url.AbsoluteUri.ToString();

                if (requestedUrl.ToLower().Contains("taxonomy"))
                {
                    sideBarPath = "~/Views/Taxonomy/Shared/_SidebarTaxonomy.cshtml";
                }

                if (requestedUrl.ToLower().Contains("gringlobal"))
                {
                    sideBarPath = "~/Views/GRINGlobal/Shared/_SidebarGRINGlobal.cshtml";
                }

                if (requestedUrl.ToLower().Contains("weborder"))
                {
                    sideBarPath = "~/Views/GRINGlobal/Shared/_SidebarWebOrder.cshtml";
                }

                if (requestedUrl.ToLower().Contains("emailtemplate"))
                {
                    sideBarPath = "~/Views/GRINGlobal/Shared/_SidebarEmailTemplateEdit.cshtml";
                }

            }
            catch (Exception ex)
            { 
            
            }
            return PartialView(sideBarPath);
        }
    }
}
