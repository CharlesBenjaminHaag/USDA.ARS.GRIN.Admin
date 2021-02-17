using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using NLog;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;
using USDA.ARS.GRIN.Admin.Service;
using USDA.ARS.GRIN.Admin.WebUI.ViewModels.Taxonomy;

namespace USDA.ARS.GRIN.Admin.WebUI.Controllers
{
    public class CropForCWRController : BaseController
    {
        const string BASE_PATH = "~/Views/Taxonomy/CropForCWR";
        private static readonly Logger Log = LogManager.GetCurrentClassLogger();

        [HttpGet]
        [Route("Taxonomy/CropForCWR/Edit/{id}")]
        public ActionResult Edit(int id = 0)
        {
            CropForCWRViewModel cropForCWRViewModel = new CropForCWRViewModel();
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            try
            {
                if (id > 0)
                {
                    TempData["context"] = "Edit Crop for CWR";

                    CropForCWR cropForCwr = _taxonomyService.GetCropForCWR(id);
                    cropForCWRViewModel.ID = cropForCwr.ID;
                    cropForCWRViewModel.CropName = cropForCwr.CropName;
                    cropForCWRViewModel.Note = cropForCwr.Note;
                    cropForCWRViewModel.CreatedDate = cropForCwr.CreatedDate;
                    cropForCWRViewModel.CreatedByCooperatorID = cropForCwr.CreatedByCooperatorID;
                    cropForCWRViewModel.CreatedByCooperatorName = cropForCwr.CreatedByCooperatorName;
                    cropForCWRViewModel.ModifiedDate = cropForCwr.ModifiedDate;
                    cropForCWRViewModel.ModifiedByCooperatorID = cropForCwr.ModifiedByCooperatorID;
                    cropForCWRViewModel.ModifiedByCooperatorName = cropForCwr.ModifiedByCooperatorName;
                }
                else
                {
                    TempData["context"] = "Add Crop for CWR";
                }
            }
            catch (Exception ex)
            {
                log.Error(ex.Message + ex.StackTrace);
                return RedirectToAction("InternalServerError", "Error");
            }
            return View("~/Views/Taxonomy/CropForCWR/Edit.cshtml", cropForCWRViewModel);
        }

        [HttpPost]
        [Route("Taxonomy/CropForCWR/Edit")]
        public ActionResult Edit(CropForCWRViewModel viewModel)
        {
            CropForCWR cropForCwr = new CropForCWR();
            ResultContainer resultContainer = new ResultContainer();
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            if (!ModelState.IsValid)
            {
                return View("~/Views/Taxonomy/CropForCWR/Edit.cshtml", viewModel);
            }

            try
            {
                cropForCwr.ID = viewModel.ID;
                cropForCwr.CropName = viewModel.CropName;
                cropForCwr.Note = viewModel.Note;

                if (viewModel.ID > 0)
                {
                    cropForCwr.ModifiedByCooperatorID = AuthenticatedUser.CooperatorID;
                    resultContainer = _taxonomyService.UpdateCropForCWR(cropForCwr);
                }
                else
                {
                    cropForCwr.CreatedByCooperatorID = AuthenticatedUser.CooperatorID;
                    resultContainer = _taxonomyService.AddCropForCWR(cropForCwr);
                }

                if (resultContainer.ResultCode == "2601")
                {
                    viewModel.ErrorMessage = "The crop name must be unique.";
                    return View("~/Views/Taxonomy/CropForCWR/Edit.cshtml", viewModel);
                }
                cropForCwr.ID = resultContainer.EntityID;
                return RedirectToAction("Edit", "Taxonomy/CropForCWR", new { id = cropForCwr.ID });
            }
            catch (Exception ex)
            {
                log.Error(ex.Message + ex.StackTrace);
                return RedirectToAction("InternalServerError", "Error");
            }
        }

        [Route("Taxonomy/CropForCWR/Home")]
        public ActionResult Index()
        {
            CropForCWRHomeViewModel viewModel = new CropForCWRHomeViewModel();
            return View(BASE_PATH + "/Index.cshtml");
        }

        [Route("Taxonomy/CropForCWR/ListByUser")]
        public PartialViewResult ListByUser()
        {
            CropForCWRSearchViewModel cropForCWRSearchViewModel = new CropForCWRSearchViewModel();
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            cropForCWRSearchViewModel.CropsForCWR = _taxonomyService.FindUserCropsForCWR(this.AuthenticatedUser.CooperatorID);
            return PartialView(BASE_PATH + "/_SearchResults.cshtml", cropForCWRSearchViewModel);
        }

        [Route("Taxonomy/CropForCWR/ListRecent")]
        public PartialViewResult ListRecent()
        {
            CropForCWRSearchViewModel cropForCWRSearchViewModel = new CropForCWRSearchViewModel();
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            cropForCWRSearchViewModel.CropsForCWR = _taxonomyService.FindRecentCropsForCWR();
            return PartialView(BASE_PATH + "/_SearchResults.cshtml", cropForCWRSearchViewModel);
        }
       
        [Route("Taxonomy/CropForCWR/SearchAll/{searchText}")]
        [HttpGet]
        public PartialViewResult SearchAll(string searchText)
        {
            CropForCWRSearchViewModel cropForCWRSearchViewModel = new CropForCWRSearchViewModel();
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            cropForCWRSearchViewModel.CropsForCWR = _taxonomyService.FindCropsForCWR(searchText);
            return PartialView(BASE_PATH + "/_SearchResults.cshtml", cropForCWRSearchViewModel);
        }
    }
}