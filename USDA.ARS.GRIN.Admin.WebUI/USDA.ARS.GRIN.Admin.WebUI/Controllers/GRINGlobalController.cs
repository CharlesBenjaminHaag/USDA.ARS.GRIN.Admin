using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Service;
using USDA.ARS.GRIN.Admin.Models.GRINGlobal;
using USDA.ARS.GRIN.Admin.WebUI.ViewModels.GRINGlobal.Accession;
using USDA.ARS.GRIN.Admin.WebUI.ViewModels.GRINGlobal.Inventory;
using USDA.ARS.GRIN.Utilities;
using System.ComponentModel;
using USDA.ARS.GRIN.Admin.WebUI.ViewModels.GRINGlobal;

namespace USDA.ARS.GRIN.Admin.WebUI.Controllers
{
    public class GRINGlobalController : BaseController
    {
        public ActionResult Index()
        {
            GRINGlobalHomeViewModel viewModel = new GRINGlobalHomeViewModel();
            viewModel.CurrentUser = this.AuthenticatedUser;
            //return View("~/Views/GRINGlobal/Index.cshtml", viewModel);
            return RedirectToAction("Inventory", "GRINGlobal");
        }

        public ActionResult Inventory()
        {
            USDA.ARS.GRIN.Admin.WebUI.ViewModels.GRINGlobal.Inventory.HomeViewModel viewModel = new USDA.ARS.GRIN.Admin.WebUI.ViewModels.GRINGlobal.Inventory.HomeViewModel();
            return View("~/Views/GRINGlobal/Inventory/Index.cshtml", viewModel);
        }

        //[OutputCache(NoStore = true, Duration = 0, VaryByParam = "*")]
        public PartialViewResult AccessionInventoryAttachments(int batchSize = 0)
        {
            GRINGlobalService _grinGlobalService = new GRINGlobalService(this.AuthenticatedUserSession.Environment);

            // TO DO: SET DEFAULT BATCH SIZE FROM USER PREF. (COOKIE?) 8/14/2020
            if (batchSize == 0)
                batchSize = 25;

            AccessionInventoryAttachmentListViewModel viewModel = new AccessionInventoryAttachmentListViewModel();
            viewModel.AccessionInventoryAttachments = _grinGlobalService.GetAccessionInventoryAttachments(batchSize, "NV");
            return PartialView("~/Views/GRINGlobal/Inventory/AccessionInventoryAttachment/_List.cshtml", viewModel);
        }

        [OutputCache(NoStore = true, Duration = 0, VaryByParam = "*")]
        public PartialViewResult ValidatedAccessionInventoryAttachments()
        {
            AccessionInventoryAttachmentListViewModel viewModel = new AccessionInventoryAttachmentListViewModel();
            GRINGlobalService _grinGlobalService = new GRINGlobalService(this.AuthenticatedUserSession.Environment);

            viewModel.AccessionInventoryAttachments = _grinGlobalService.GetAccessionInventoryAttachments(200, "VL");
            return PartialView("~/Views/GRINGlobal/Inventory/AccessionInventoryAttachment/_ValidatedList.cshtml", viewModel);
        }

        [OutputCache(NoStore = true, Duration = 0, VaryByParam = "*")]
        public PartialViewResult ErrorAccessionInventoryAttachments()
        {
            AccessionInventoryAttachmentListViewModel viewModel = new AccessionInventoryAttachmentListViewModel();
            GRINGlobalService _grinGlobalService = new GRINGlobalService(this.AuthenticatedUserSession.Environment);

            viewModel.AccessionInventoryAttachments = _grinGlobalService.GetAccessionInventoryAttachments(200, "ER");
            return PartialView("~/Views/GRINGlobal/Inventory/AccessionInventoryAttachment/_ErrorList.cshtml", viewModel);
        }

        public JsonResult Validate(string values)
        {
            FileMetaData imageFileMetaData = new FileMetaData();
            FileMetaData thumbnailImageFileMetaData = new FileMetaData();
            GRINGlobalService _grinGlobalService = new GRINGlobalService(this.AuthenticatedUserSession.Environment);

            try
            {
                string[] valueList = values.Split(',');
                foreach (var id in valueList)
                {
                    AccessionInventoryAttachment accessionInventoryAttachment = _grinGlobalService.GetAccessionInventoryAttachment(Int32.Parse(id));

                    if (accessionInventoryAttachment.ThumbnailImageURLIsValid < 0)
                    {
                        if (!String.IsNullOrEmpty(accessionInventoryAttachment.VirtualPath))
                        {
                            imageFileMetaData = _grinGlobalService.GetFileMetaData(accessionInventoryAttachment.VirtualPath);
                        }

                        if (!String.IsNullOrEmpty(accessionInventoryAttachment.ThumbnailVirtualPath))
                        {
                            thumbnailImageFileMetaData = _grinGlobalService.GetFileMetaData(accessionInventoryAttachment.ThumbnailVirtualPath);
                        }
                        _grinGlobalService.AddValidationRecord(accessionInventoryAttachment.ID, imageFileMetaData.IsValid, thumbnailImageFileMetaData.IsValid);
                    }
                }
            }
            catch (Exception ex)
            {
                return Json(new { success = false }, JsonRequestBehavior.AllowGet);
            }
            return Json(new { success = true }, JsonRequestBehavior.AllowGet);
        }

        public PartialViewResult ValidationStatistics()
        {
            ValidationStatisticsViewModel viewModel = null;
            GRINGlobalService _grinGlobalService = new GRINGlobalService(this.AuthenticatedUserSession.Environment);

            try
            {
                viewModel = new ValidationStatisticsViewModel(_grinGlobalService.GetValidationCounts());
            }
            catch (Exception ex)
            {
                log.Error(ex.Message + ", " + ex.StackTrace);
            }
            return PartialView("~/Views/GRINGlobal/Inventory/AccessionInventoryAttachment/_ValidationStatistics.cshtml", viewModel);
        }


        public void Tester()
        {
            List<string> names = new List<string>() {
        "cimcox",
                "camacho",
                "mcmamara",
        "mcnamara",
         "bill o'reilly",
        "johannes diderik van der waals",
        "mr. moseley-williams",
        "Joe VanWyck",
        "mcdonald's",
        "william the third",
        "hrh prince charles",
        "h.r.m. queen elizabeth the third",
        "william gates, iii",
        "pope leo xii",
        "a.k. jennings"
        };

            foreach (var name in names)
            {
                string DEBUG = TextUtility.ToProperCase(name);
            }
        }
    }
}