using System;
using System.Web.Mvc;
using System.Reflection;
using USDA.ARS.GRIN.Admin.WebUI.ViewModels;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Service;

namespace USDA.ARS.GRIN.Admin.WebUI.Controllers
{
    public class HomeController : BaseController
    {
        [GrinGlobalAuthentication]
        [HttpGet]
        public ActionResult Index(string appContext = "")
        {
            DashboardViewModel dashboardViewModel = new DashboardViewModel();
            dashboardViewModel.AuthenticatedUser = this.AuthenticatedUser;
            string destinationView = "Index.cshtml";

            if (!String.IsNullOrEmpty(appContext))
            {
                return RedirectToAction("Index", appContext);
            }
            else
            {

                return View(dashboardViewModel);
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
            UserViewModel userViewModel = new UserViewModel();
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
            else
            {
                if (requestedUrl.ToLower().Contains("sitemanagement"))
                {
                    userViewModel.ActiveContext = "sitemanagement";
                    userViewModel.AppName1 = "Grin";
                    userViewModel.AppName2 = "CMS";
                    userViewModel.AppAbbrev = "CMS";
                }
                else
                {
                    if (requestedUrl.ToLower().Contains("accountmanagement"))
                    {
                        userViewModel.ActiveContext = "accountmanagement";
                        userViewModel.AppName1 = "Account";
                        userViewModel.AppName2 = "Manager";
                        userViewModel.AppAbbrev = "AM";
                    }
                }
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


            }
            catch (Exception ex)
            { 
            
            }
            return PartialView(sideBarPath);
        }
    }
}
