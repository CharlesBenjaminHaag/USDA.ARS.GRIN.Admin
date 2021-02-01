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

namespace USDA.ARS.GRIN.Admin.WebUI.Controllers.Taxonomy
{
    public class CWRMapController : BaseController, IController<CWRMapViewModel>
    {
        const string BASE_PATH = "~/Views/Taxonomy/CWRMap";
        private static readonly Logger Log = LogManager.GetCurrentClassLogger();

        [HttpGet]
        [Route("Taxonomy/CWRMap/Edit/{id}")]
        public ActionResult Edit(int id)
        {
            TaxonomyService taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);
            CWRMapViewModel viewModel = null;

            try
            {
                if (id > 0)
                {
                    TempData["context"] = "Edit CWR Map";

                    CWRMap cwrMap = taxonomyService.GetCWRMap(id);

                    viewModel = new CWRMapViewModel(taxonomyService.GetGenePoolCodes(), taxonomyService.GetCropsForCWR(), taxonomyService.FindCitations(cwrMap.SpeciesID));
                    viewModel.ID = cwrMap.ID;
                    viewModel.CropID = cwrMap.CropID;
                    viewModel.SpeciesID = cwrMap.SpeciesID;
                    viewModel.SpeciesName = cwrMap.SpeciesName;
                    viewModel.CommonName = cwrMap.CommonName;
                    viewModel.GenepoolCode = cwrMap.GenepoolCode;
                    viewModel.IsCrop = cwrMap.IsCrop;
                    viewModel.IsGraftStock = cwrMap.IsGraftStock;
                    viewModel.IsPotential = cwrMap.IsPotential;
                    viewModel.Note = cwrMap.Note;
                    viewModel.CitationID = cwrMap.CitationID;
                    viewModel.CreatedDate = cwrMap.CreatedDate;
                    viewModel.CreatedByCooperatorID = cwrMap.CreatedByCooperatorID;
                    viewModel.CreatedByCooperatorName = cwrMap.CreatedByCooperatorName;
                    viewModel.ModifiedDate = cwrMap.ModifiedDate;
                    viewModel.ModifiedByCooperatorID = cwrMap.ModifiedByCooperatorID;
                    viewModel.ModifiedByCooperatorName = cwrMap.ModifiedByCooperatorName;
                    viewModel.CWRTraits = cwrMap.CWRTraits;
                }
                else
                {
                    viewModel = new CWRMapViewModel(taxonomyService.GetGenePoolCodes(), taxonomyService.GetCropsForCWR());
                    //viewModel.CropID = cropId;
                    TempData["context"] = "Add CWR Map";
                }
            }
            catch (Exception ex)
            {
                log.Error(ex.Message + ex.StackTrace);
                return RedirectToAction("InternalServerError", "Error");
            }
            return View(BASE_PATH + "/Edit.cshtml", viewModel);
        }

        [HttpPost]
        [Route("Taxonomy/CWRMap/Edit")]
        public ActionResult Edit(CWRMapViewModel viewModel)
        {
            CWRMap cwrMap = new CWRMap();
            ResultContainer resultContainer = null;
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            if (!ModelState.IsValid)
            {
                return View(BASE_PATH + "/Edit.cshtml", viewModel);
            }

            try
            {
                cwrMap.ID = viewModel.ID;
                cwrMap.SpeciesID = viewModel.SpeciesID;
                cwrMap.CropID = viewModel.CropID;
                cwrMap.CommonName = viewModel.CommonName;
                cwrMap.IsCrop = viewModel.IsCrop;
                cwrMap.GenepoolCode = viewModel.GenepoolCode;
                cwrMap.IsGraftStock = viewModel.IsGraftStock;
                cwrMap.IsPotential = viewModel.IsPotential;
                cwrMap.CitationID = viewModel.CitationID;
                cwrMap.Note = viewModel.Note;

                if (viewModel.ID > 0)
                {
                    cwrMap.ModifiedByCooperatorID = AuthenticatedUser.CooperatorID;
                    resultContainer = _taxonomyService.UpdateCWRMap(cwrMap);
                }
                else
                {
                    cwrMap.CreatedByCooperatorID = AuthenticatedUser.CooperatorID;
                    resultContainer = _taxonomyService.AddCWRMap(cwrMap);
                    if (String.IsNullOrEmpty(resultContainer.ResultCode))
                    {
                        cwrMap.ID = resultContainer.EntityID;
                    }
                }
            }
            catch (Exception ex)
            {
                log.Error(ex.Message + ex.StackTrace);
                return RedirectToAction("InternalServerError", "Error");

            }
            return RedirectToAction("Edit", "Taxonomy/CWRMap", new { id = cwrMap.ID });
        }

        [Route("taxonomy/cwrmap/home")]
        public ActionResult Index()
        {
            CWRMapHomeViewModel cWRMapHomeViewModel = new CWRMapHomeViewModel();
            try
            {
                TempData["context"] = "CWR Map";
                return View(BASE_PATH + "/Index.cshtml", cWRMapHomeViewModel);
            }
            catch (Exception ex)
            {
                Log.Error(ex, "CWR Map Controller");
                return RedirectToAction("InternalServerError", "Error");
            }
        }

        [Route("taxonomy/cwrmap/listbyuser")]
        public PartialViewResult ListByUser()
        {
            CWRMapSearchViewModel viewModel = new CWRMapSearchViewModel();
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            try
            {
                viewModel.CWRMaps = _taxonomyService.FindUserCWRMaps(AuthenticatedUser.CooperatorID);
                return PartialView(BASE_PATH + "/_SearchResults.cshtml", viewModel);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return PartialView("~/Views/Error/_Error.cshtml", viewModel);
            }
        }

        [Route("taxonomy/cwrmap/listrecent")]
        public PartialViewResult ListRecent()
        {
            CWRMapSearchViewModel viewModel = new CWRMapSearchViewModel();
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            try
            {
                viewModel.CWRMaps = _taxonomyService.FindRecentCWRMaps();
                return PartialView(BASE_PATH + "/_SearchResults.cshtml", viewModel);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return PartialView("~/Views/Error/_Error.cshtml");
            }
        }

        [HttpGet]
        [Route("taxonomy/cwrmap/search")]
        public PartialViewResult Search(string searchText)
        {
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);
            CWRMapSearchViewModel cWRMapSearchViewModel = new CWRMapSearchViewModel();

            try
            {
                //cWRMapSearchViewModel.SearchData.QueryCriteria.Add(new QueryCriterion { FieldName = "SpeciesName", FieldValue = searchText, SearchOperatorCode = "CNT" });
                cWRMapSearchViewModel.CWRMaps = _taxonomyService.FindCWRMaps("WHERE crop_common_name LIKE '%" + searchText + "%'");
                return PartialView(BASE_PATH + "/_SearchResults.cshtml", cWRMapSearchViewModel);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return PartialView("~/Views/Error/_Error.cshtml");
            }
        }

        public PartialViewResult Search(Query q)
        {
            throw new NotImplementedException();
        }

        public PartialViewResult Search(CWRMapViewModel viewModel)
        {
            throw new NotImplementedException();
        }
    }
}