using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using USDA.ARS.GRIN.Admin.WebUI.ViewModels;
using USDA.ARS.GRIN.Admin.WebUI.ViewModels.SiteManagement;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Service;

namespace USDA.ARS.GRIN.Admin.WebUI.Controllers
{
    public class SiteManagementController : Controller
    {
        const string BASE_PATH = "~/Views/SiteManagement/";
        // GET: SiteManagement
        public ActionResult Index()
        {
            // TEMP: Replace with app home page once functionality is designed (CBH, 4/11/2021)
            return RedirectToAction("CGC");
        }

        public ActionResult CGC()
        {
            SiteManagementHomeViewModel siteManagementHomeViewModel = new SiteManagementHomeViewModel();
            TempData["page_title"] = "CGC Content";
            return View(BASE_PATH + "CGC/Index.cshtml",siteManagementHomeViewModel);
        }

        [OutputCache(NoStore = true, Duration = 0, VaryByParam = "*")]
        public PartialViewResult CGCDocumentListRecent()
        {
            CGCDocumentSearchViewModel viewModel = new CGCDocumentSearchViewModel();
            SiteManagementService siteManagementService = new SiteManagementService();

            try
            {
                //viewModel.CWRMaps = _taxonomyService.FindRecentCWRMaps();
                return PartialView(BASE_PATH + "/CGC/_SearchResults.cshtml", viewModel);
            }
            catch (Exception ex)
            {
                return PartialView("~/Views/Error/_Error.cshtml", viewModel);
            }
        }
    }
}