using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;
using USDA.ARS.GRIN.Admin.Service;
using USDA.ARS.GRIN.Admin.WebUI.ViewModels;
using USDA.ARS.GRIN.Admin.WebUI.ViewModels.Taxonomy;
using log4net;
using System.Web.UI.WebControls.WebParts;

namespace USDA.ARS.GRIN.Admin.WebUI.Controllers
{
    [GrinGlobalAuthentication]
    public class TaxonomyController : BaseController
    {
        const string BASE_PATH = "~/Views/Taxonomy/";

        //protected override void OnActionExecuted(ActionExecutedContext ctx)
        //{
        //    base.OnActionExecuted(ctx);
        //    UserSession userSession = this.GetUserSession();
        //    //this.AuthenticatedUser = userSession.AuthenticatedUser;
        //    //this.AuthenticatedUserSession = userSession;
        //}

        public TaxonomyController()
        {
            
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

        public ActionResult Index()
        {
            IndexViewModel viewModel = null; 
            try
            { 
                viewModel = new IndexViewModel();
            }
            catch (Exception ex)
            {
                log.Error(ex.Message + ex.StackTrace);
                return RedirectToAction("InternalServerError", "Error");
            }
            return View("~/Views/Taxonomy/Index.cshtml", viewModel);
        }

        #region Reports

        public ActionResult Reports()
        {
            return View("~/Views/Taxonomy/Reports/Index.cshtml");
        }
        public ActionResult Report()
        {
            ReportService reportService = new ReportService(this.AuthenticatedUserSession.Environment);
            List<ISTAReportRecord> iSTAReportRecords = new List<ISTAReportRecord>();

            try
            {
                iSTAReportRecords = reportService.ISTAReport();
                return View("~/Views/Taxonomy/Reports/Detail.cshtml", iSTAReportRecords);
            }
            catch (Exception ex)
            {
                log.Error(ex.Message + ", " + ex.StackTrace);
                return RedirectToAction("InternalServerError", "Error", new { loginStatus = LoginStatusEnum.ERROR });
            }
        }
        #endregion Reports

        #region Species
        public ActionResult FindSpecies(string searchString)
        {
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            try
            {
                log.Info("SEARCH SPECIES: " + searchString);
                IQueryable<Species> speciesList = new List<Species>().AsQueryable();
                speciesList = _taxonomyService.FindSpecies(searchString);
                log.Info("SPECIES FOUND: " + speciesList.Count());
                return PartialView("~/Views/Taxonomy/Species/_List.cshtml", speciesList);
            }
            catch (Exception ex)
            {
                log.Error(ex.Message + ex.StackTrace);
                return RedirectToAction("InternalServerError", "Error");
            }
        }

        public ActionResult SpeciesList()
        {
            return View();
        }
                
        public ActionResult SpeciesEdit()
        {
            return View();
        }
        [HttpPost]
        public ActionResult SpeciesEdit(SpeciesEditViewModel speciesEditViewModel)
        {
            return View();
        }
        #endregion Species

        #region Crop for CWR

        public ActionResult CropHome()
        {
            CropHomeViewModel viewModel = new CropHomeViewModel();
            return View("~/Views/Taxonomy/Crop/Index.cshtml", viewModel);
        }

        [OutputCache(NoStore = true, Duration = 0, VaryByParam = "*")]
        public PartialViewResult RecentCrops()
        {
            CropSearchViewModel viewModel = new CropSearchViewModel();
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            viewModel.CropsForCWR = _taxonomyService.FindRecentCrops(); 
            return PartialView("~/Views/Taxonomy/Crop/_SearchResults.cshtml", viewModel);
        }

        [OutputCache(NoStore = true, Duration = 0, VaryByParam = "*")]
        public PartialViewResult UserCrops()
        {
            CropSearchViewModel viewModel = new CropSearchViewModel();
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            viewModel.CropsForCWR = _taxonomyService.FindUserCrops(AuthenticatedUser.CooperatorID);
            return PartialView("~/Views/Taxonomy/Crop/_SearchResults.cshtml", viewModel);
        }

        [OutputCache(NoStore = true, Duration = 0, VaryByParam = "*")]
        public ActionResult CropSearch(string searchText)
        {
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            List<CropForCWR> crops = new List<CropForCWR>();
            CropSearchViewModel viewModel = new CropSearchViewModel();

            viewModel.SearchData.QueryCriteria.Add(new QueryCriterion { FieldName = "CropName", FieldValue = searchText, SearchOperatorCode = "CNT" });
            viewModel.CropsForCWR = _taxonomyService.FindCropsForCWR("WHERE crop_name LIKE '%" + searchText + "%'");
            return PartialView("~/Views/Taxonomy/Crop/_SearchResults.cshtml", viewModel);
        }

        public ActionResult CropEdit(int id = 0)
        {
            CropEditViewModel viewModel = new CropEditViewModel();
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);


            try
            {
                if (id > 0)
                {
                    TempData["context"] = "Edit Crop for CWR";

                    CropForCWR crop = _taxonomyService.GetCropForCWR(id);
                    viewModel.ID = crop.ID;
                    viewModel.CropName = crop.CropName;
                    viewModel.Note = crop.Note;
                    viewModel.CreatedDate = crop.CreatedDate;
                    viewModel.CreatedByCooperatorID = crop.CreatedByCooperatorID;
                    viewModel.CreatedByCooperatorName = crop.CreatedByCooperatorName;
                    viewModel.ModifiedDate = crop.ModifiedDate;
                    viewModel.ModifiedByCooperatorID = crop.ModifiedByCooperatorID;
                    viewModel.ModifiedByCooperatorName = crop.ModifiedByCooperatorName;
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
            return View("~/Views/Taxonomy/Crop/Edit.cshtml", viewModel);
        }

        [HttpPost]
        public ActionResult CropEdit(CropEditViewModel viewModel)
        {
            CropForCWR crop = new CropForCWR();
            ResultContainer resultContainer = new ResultContainer();
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            if (!ModelState.IsValid)
            {
                return View("~/Views/Taxonomy/Crop/Edit.cshtml", viewModel);
            }

            try
            {
                crop.ID = viewModel.ID;
                crop.CropName = viewModel.CropName;
                crop.Note = viewModel.Note;

                if (viewModel.ID > 0)
                {
                    crop.ModifiedByCooperatorID = AuthenticatedUser.CooperatorID;
                    resultContainer = _taxonomyService.UpdateCropForCWR(crop);
                }
                else
                {
                    crop.CreatedByCooperatorID = AuthenticatedUser.CooperatorID;
                    resultContainer = _taxonomyService.AddCropForCWR(crop);
                }

                if (resultContainer.ResultCode == "2601")
                {
                    viewModel.ErrorMessage = "The crop name must be unique.";
                    return View("~/Views/Taxonomy/Crop/Edit.cshtml", viewModel);
                }
                crop.ID = resultContainer.EntityID;

            }
            catch (Exception ex)
            {
                log.Error(ex.Message + ex.StackTrace);
                return RedirectToAction("InternalServerError", "Error");

            }
            return RedirectToAction("CropEdit", "Taxonomy", new { id = crop.ID });
        }

        #endregion

        #region CWR Map

        public ActionResult CWRMapHome()
        {
            CWRMapHomeViewModel viewModel = new CWRMapHomeViewModel();
            return View("~/Views/Taxonomy/Crop/Map/Index.cshtml", viewModel);
        }

        [OutputCache(NoStore = true, Duration = 0, VaryByParam = "*")]
        public PartialViewResult RecentCWRMaps()
        {
            CWRMapSearchViewModel viewModel = new CWRMapSearchViewModel();
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            viewModel.CWRMaps = _taxonomyService.FindRecentCWRMaps();
            return PartialView("~/Views/Taxonomy/Crop/Map/_SearchResults.cshtml", viewModel);
        }

        [OutputCache(NoStore = true, Duration = 0, VaryByParam = "*")]
        public PartialViewResult UserCWRMaps()
        {
            CWRMapSearchViewModel viewModel = new CWRMapSearchViewModel();
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            viewModel.CWRMaps = _taxonomyService.FindUserCWRMaps(AuthenticatedUser.CooperatorID);
            return PartialView("~/Views/Taxonomy/Crop/Map/_SearchResults.cshtml", viewModel);
        }

        //[OutputCache(NoStore = true, Duration = 0, VaryByParam = "*")]
        //public ActionResult CWRMapSearch(string searchText)
        //{
        //    List<CropForCWR> crops = new List<CropForCWR>();
        //    CropSearchViewModel viewModel = new CropSearchViewModel();

        //    viewModel.SearchData.QueryCriteria.Add(new QueryCriterion { FieldName = "CropName", FieldValue = searchText, SearchOperatorCode = "CNT" });
        //    viewModel.Crops = _taxonomyService.FindCropsForCWR("WHERE crop_name LIKE '%" + searchText + "'%");
        //    return PartialView("~/Views/Taxonomy/Crop/_SearchResults.cshtml", viewModel);
        //}

        public ActionResult CWRMapEdit(int cropId, int cwrMapId = 0)
        {
            CWRMapEditViewModel viewModel = new CWRMapEditViewModel();
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            try
            {
                if (cwrMapId > 0)
                {
                    TempData["context"] = "Edit CWR Map";

                    CWRMap cwrMap = _taxonomyService.GetCWRMap(cwrMapId);
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
                    viewModel.LoadCitations(viewModel.SpeciesID);
                }
                else
                {
                    viewModel.CropID = cropId;
                    TempData["context"] = "Add CWR Map";
                }
            }
            catch (Exception ex)
            {
                log.Error(ex.Message + ex.StackTrace);
                return RedirectToAction("InternalServerError", "Error");
            }
            return View("~/Views/Taxonomy/Crop/Map/Edit.cshtml", viewModel);
        }

        [HttpPost]
        public ActionResult CWRMapEdit(CWRMapEditViewModel viewModel)
        {
            CWRMap cwrMap = new CWRMap();
            ResultContainer resultContainer = null;
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            if (!ModelState.IsValid)
            {
                return View("~/Views/Taxonomy/Crop/Map/Edit.cshtml", viewModel);
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
            return RedirectToAction("CWRMapEdit", "Taxonomy", new { cropId = cwrMap.CropID, cwrMapId = cwrMap.ID });
        }

        [OutputCache(NoStore = true, Duration = 0, VaryByParam = "*")]
        public ActionResult CWRMapSearch(string searchText)
        {
            List<CropForCWR> crops = new List<CropForCWR>();
            CWRMapSearchViewModel viewModel = new CWRMapSearchViewModel();
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            //viewModel.SearchData.QueryCriteria.Add(new QueryCriterion { FieldName = "CropCommonName", FieldValue = searchText, SearchOperatorCode = "CNT" });
            viewModel.CWRMaps = _taxonomyService.FindCWRMaps("WHERE crop_common_name LIKE '%" + searchText + "%'");
            return PartialView("~/Views/Taxonomy/Crop/Map/_SearchResults.cshtml", viewModel);
        }

        //public ActionResult CWRMapList(int cropId)
        //{
        //    CWRMapSearchViewModel viewModel = new CWRMapSearchViewModel();
        //    viewModel.CropID = cropId;
        //    viewModel.SearchData.QueryCriteria.Add(new QueryCriterion { FieldName = "TaxonomyCWRCropID", FieldValue = cropId.ToString(), SearchOperatorCode = "EQL" });
            
        //    viewModel.SearchResults = _taxonomyService.FindCWRMaps(viewModel.SearchData);
            
        //    return PartialView("~/Views/Taxonomy/Crop/Map/_List.cshtml", viewModel);
        //}

        //[HttpPost]
        //public ActionResult CWRMapSearch(CWRMapSearchViewModel viewModel)
        //{
        //    viewModel.SearchData.QueryCriteria.Add(new QueryCriterion { FieldName = "CropCommonName", FieldValue = viewModel.CommonName, SearchOperatorCode = viewModel.CommonNameComparisonOperator });
        //    viewModel.SearchData.QueryCriteria.Add(new QueryCriterion { FieldName = "TaxonomyCWRCropID", FieldValue = viewModel.SelectedCropID.ToString(), SearchOperatorCode = "EQL" });
        //    viewModel.SearchData.QueryCriteria.Add(new QueryCriterion { FieldName = "Genepool", FieldValue = viewModel.SelectedGenepoolCode, SearchOperatorCode = "MTE" });
        //    //viewModel.SearchData.QueryCriteria.Add(new QueryCriterion { FieldName = "IsCrop?", FieldValue = viewModel.IsCrop.ToString(), SearchOperatorCode = "EQL" });
        //    viewModel.SearchData.QueryCriteria = viewModel.SearchData.QueryCriteria.Where(x => x.FieldValue != null).ToList();

        //    viewModel.SearchResults = _taxonomyService.FindCWRMaps(viewModel.SearchData);

        //    return View("~/Views/Taxonomy/Crop/Map/Index.cshtml", viewModel);
        //}
      
        public ActionResult CWRMapDelete(int cropId, int cropMapId)
        {
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            _taxonomyService.DeleteCWRMap(cropMapId);
            return RedirectToAction("CropEdit", "Taxonomy", new { id = cropId });
        }

        //public ActionResult CWRMapsDelete(int cropId, string cropMapIdList)
        //{
        //    CWRMapSearchViewModel viewModel = new CWRMapSearchViewModel();

        //    _taxonomyService.DeleteCWRMaps(cropMapIdList);
        //    viewModel.CropID = cropId;
        //    viewModel.SearchData.QueryCriteria.Add(new QueryCriterion { FieldName = "TaxonomyCWRCropID", FieldValue = cropId.ToString(), SearchOperatorCode = "EQL" });
        //    viewModel.CWRMaps = _taxonomyService.FindCWRMaps(viewModel.SearchData);
        //    return PartialView("~/Views/Taxonomy/Crop/Map/_List.cshtml", viewModel);
        //}

        #endregion

        #region CWR Trait

        public ActionResult CropTraits(int speciesId, int cropId, int cropMapId)
        {
            CropTraitListViewModel viewModel = new CropTraitListViewModel();
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            viewModel.SpeciesID = speciesId;
            viewModel.CropId = cropId;
            viewModel.CropMapID = cropMapId;
            viewModel.CropTraits = _taxonomyService.GetCropMapTraits(cropMapId);
            return PartialView("~/Views/Taxonomy/Crop/Trait/_List.cshtml", viewModel);
        }

        public ActionResult CropTraitEdit(int speciesId = 0, int cropId = 0, int cropMapId = 0, int cropTraitId = 0)
        {
            CropTraitEditViewModel viewModel = new CropTraitEditViewModel();
            CropTrait cropTrait = new CropTrait();
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            try
            {
                viewModel.CropMapID = cropMapId;
                if (cropTraitId > 0)
                {
                    TempData["context"] = "Edit Crop Trait";

                    cropTrait = _taxonomyService.GetCropTrait(cropTraitId);
                    viewModel.ID = cropTrait.ID;
                    viewModel.CropMapID = cropTrait.CropMapID;
                    viewModel.CropID = cropTrait.CropID;
                    viewModel.SpeciesID = cropTrait.SpeciesID;
                    viewModel.TraitClassCode = cropTrait.TraitClassCode;
                    viewModel.IsPotential = cropTrait.IsPotential;
                    viewModel.BreedingTypeCode = cropTrait.BreedingTypeCode;
                    viewModel.BreedingUsageNote = cropTrait.BreedingUsageNote;
                    viewModel.OntologyTraitIdentifier = cropTrait.OntologyTraitIdentifier;
                    viewModel.CitationID = cropTrait.CitationID;
                    viewModel.Note = cropTrait.Note;
                    viewModel.CreatedDate = cropTrait.CreatedDate;
                    viewModel.CreatedByCooperatorID = cropTrait.CreatedByCooperatorID;
                    viewModel.CreatedByCooperatorName = cropTrait.CreatedByCooperatorName;
                    viewModel.ModifiedDate = cropTrait.ModifiedDate;
                    viewModel.ModifiedByCooperatorID = cropTrait.ModifiedByCooperatorID;
                    viewModel.ModifiedByCooperatorName = cropTrait.ModifiedByCooperatorName;
                }
                else
                {
                    TempData["context"] = "Add Crop Trait";
                }
                viewModel.LoadCitations(speciesId);
            }
            catch (Exception ex)
            {
                log.Error(ex.Message + ex.StackTrace);
                return RedirectToAction("InternalServerError", "Error");
            }
            return View("~/Views/Taxonomy/Crop/Trait/Edit.cshtml", viewModel);
        }

        [HttpPost]
        public ActionResult CropTraitEdit(CropTraitEditViewModel viewModel)
        {
            ResultContainer resultContainer = new ResultContainer();
            CropTrait cropTrait = new CropTrait();
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            if (!ModelState.IsValid)
            {
                return View("~/Views/Taxonomy/Crop/Trait/Edit.cshtml", viewModel);
            }

            try
            {
                cropTrait.ID = viewModel.ID;
                cropTrait.CropMapID = viewModel.CropMapID;
                cropTrait.TraitClassCode = viewModel.TraitClassCode;
                cropTrait.IsPotential = viewModel.IsPotential;
                cropTrait.BreedingTypeCode = viewModel.BreedingTypeCode;
                cropTrait.BreedingUsageNote = viewModel.BreedingUsageNote;
                cropTrait.OntologyTraitIdentifier = viewModel.OntologyTraitIdentifier;
                cropTrait.CitationID = viewModel.CitationID;
                cropTrait.Note = viewModel.Note;

                if (viewModel.ID == 0)
                {
                    cropTrait.CreatedDate = viewModel.CreatedDate;
                    cropTrait.CreatedByCooperatorID = AuthenticatedUser.CooperatorID;
                    resultContainer = _taxonomyService.AddCropTrait(cropTrait);
                    if (String.IsNullOrEmpty(resultContainer.ResultCode))
                    {
                        viewModel.ID = resultContainer.EntityID;
                    }
                }
                else
                {
                    cropTrait.ModifiedDate = viewModel.ModifiedDate;
                    cropTrait.ModifiedByCooperatorID = AuthenticatedUser.CooperatorID;
                    _taxonomyService.UpdateCropTrait(cropTrait);
                }
            }
            catch (Exception ex)
            {
                log.Error(ex.Message + ex.StackTrace);
                return RedirectToAction("InternalServerError", "Error");
            }
            return RedirectToAction("CropTraitEdit", "Taxonomy", new { speciesId = viewModel.SpeciesID, cropId = viewModel.CropID, cropMapId = viewModel.CropMapID, cropTraitId = viewModel.ID });
        }

        public ActionResult CropTraitDelete(int cropId, int cropMapId, int cropTraitId)
        {
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            _taxonomyService.DeleteCropTrait(cropTraitId);
            return RedirectToAction("CWRMapEdit", "Taxonomy", new { cropId = cropId, cropMapid = cropMapId });
        }

        public ActionResult CropTraitsDelete(int speciesId, int cropId, int cropMapId, string cropTraitIdList)
        {
            CropTraitListViewModel viewModel = new CropTraitListViewModel();
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            _taxonomyService.DeleteCropTraits(cropTraitIdList);
            
            viewModel.SpeciesID = speciesId;
            viewModel.CropId = cropId;
            viewModel.CropMapID = cropMapId;
            viewModel.CropTraits = _taxonomyService.GetCropMapTraits(cropMapId);
            return PartialView("~/Views/Taxonomy/Crop/Trait/_List.cshtml", viewModel);
        }

        #endregion

        #region CWR
        public ActionResult CropWildRelativeSearch()
        { 
            CropWildRelativeSearchViewModel viewModel = new CropWildRelativeSearchViewModel();

            try
            {
                // TO DO
                // Load validation data into VM
            }
            catch (Exception ex)
            {
                log.Error(ex.Message + ex.StackTrace);
                return RedirectToAction("InternalServerError", "Error");
            }
            return View("~/Views/Taxonomy/Crop/CWR/Index.cshtml", viewModel);
        }
        [HttpPost]
        public ActionResult CropWildRelativeSearch(CropWildRelativeSearchViewModel viewModel, FormCollection formCollection)
        {
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            // EXAMPLE: Use to locate FIELD NAMES
            //var example = formCollection.AllKeys.Where(x => x.Length > 0);

            // Plug VM values into SearchData. SHOULD BE DYNAMIC.
            viewModel.SearchData.QueryCriteria.Add(new QueryCriterion { FieldName = "CropName", FieldValue = viewModel.CropName, SearchOperatorCode = viewModel.CropNameComparisonOperator });
            viewModel.SearchData.QueryCriteria.Add(new QueryCriterion { FieldName = "DisplayName", FieldValue = viewModel.DisplayName, SearchOperatorCode = viewModel.DisplayNameComparisonOperator });
            viewModel.SearchData.QueryCriteria.Add(new QueryCriterion { FieldName = "CropCommonName", FieldValue = viewModel.CropCommonName, SearchOperatorCode = viewModel.CommonNameComparisonOperator });
            viewModel.SearchData.QueryCriteria = viewModel.SearchData.QueryCriteria.Where(x => x.FieldValue != null).ToList();

            viewModel.SearchResults = _taxonomyService.FindCropWildRelatives(viewModel.SearchData);

            return View("~/Views/Taxonomy/Crop/CWR/Index.cshtml", viewModel);
        }

        public ActionResult CropWildRelativeList(CropWildRelativeSearchViewModel viewModel)
        {
            return PartialView("~/Views/Taxonomy/Crop/CWR/_List.cshtml", viewModel);
        }

        public ActionResult CropWildRelativeEdit(int id = 0)
        {
            CropWildRelativeEditViewModel viewModel = new CropWildRelativeEditViewModel();
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            if (id > 0)
            {
                CropWildRelative cropWildRelative = _taxonomyService.GetCropWildRelative(id);
                viewModel.ID = cropWildRelative.ID;
                viewModel.SpeciesID = cropWildRelative.SpeciesID;
                viewModel.SpeciesName = cropWildRelative.SpeciesName;
                viewModel.CropName = cropWildRelative.CropName;
                viewModel.DisplayName = cropWildRelative.DisplayName;
                viewModel.CropCommonName = cropWildRelative.CropCommonName;
                viewModel.IsCrop = cropWildRelative.IsCrop;
                viewModel.GenepoolCode = cropWildRelative.GenepoolCode;
                viewModel.IsGraftStockGenepool = cropWildRelative.IsGraftstockGenepool;
                viewModel.TraitClassCode = cropWildRelative.TraitClassCode;
                viewModel.IsPotential = cropWildRelative.IsPotential;
                viewModel.BreedingTypeCode = cropWildRelative.BreedingTypeCode;
                viewModel.BreedingUsage = cropWildRelative.BreedingUsage;
                viewModel.OntologyTraitIdentifier = cropWildRelative.OntologyTraitIdentifier;
                viewModel.CitationID = cropWildRelative.CitationID;
                viewModel.Note = cropWildRelative.Note;
                viewModel.CreatedDate = cropWildRelative.CreatedDate;
                viewModel.CreatedByCooperatorID = cropWildRelative.CreatedByCooperatorID;
                viewModel.CreatedByCooperatorName = cropWildRelative.CreatedByCooperatorName;
                viewModel.ModifiedDate = cropWildRelative.ModifiedDate;
                viewModel.ModifiedByCooperatorID = cropWildRelative.ModifiedByCooperatorID;
                viewModel.ModifiedByCooperatorName = cropWildRelative.ModifiedByCooperatorName;
            }
            return View("~/Views/Taxonomy/Crop/CWR/Edit.cshtml", viewModel);
        }

        [HttpPost]
        public ActionResult CropWildRelativeEdit(CropWildRelativeEditViewModel viewModel)
        {
            CropWildRelative cropWildRelative = new CropWildRelative();
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            if (!ModelState.IsValid)
            {
                return View("~/Views/Taxonomy/Crop/CWR/Edit.cshtml", viewModel);
            }
            
            cropWildRelative.ID = viewModel.ID;
            cropWildRelative.SpeciesID = viewModel.SpeciesID;
            cropWildRelative.SpeciesName = viewModel.SpeciesName;
            cropWildRelative.CropName = viewModel.CropName;
            cropWildRelative.DisplayName = viewModel.DisplayName;
            cropWildRelative.CropCommonName = viewModel.CropCommonName;
            cropWildRelative.IsCrop = viewModel.IsCrop;
            cropWildRelative.GenepoolCode = viewModel.GenepoolCode;
            cropWildRelative.IsGraftstockGenepool = viewModel.IsGraftStockGenepool;
            cropWildRelative.TraitClassCode = viewModel.TraitClassCode;
            cropWildRelative.IsPotential = viewModel.IsPotential;
            cropWildRelative.BreedingTypeCode = viewModel.BreedingTypeCode;
            cropWildRelative.BreedingUsage = viewModel.BreedingUsage;
            cropWildRelative.OntologyTraitIdentifier = viewModel.OntologyTraitIdentifier;
            cropWildRelative.CitationID = viewModel.CitationID;
            cropWildRelative.Note = viewModel.Note;
            if (viewModel.ID > 0)
            {
                cropWildRelative.ModifiedByCooperatorID = AuthenticatedUser.CooperatorID;
                _taxonomyService.UpdateCropWildRelative(cropWildRelative);
            }
            else
            {
                cropWildRelative.CreatedByCooperatorID = AuthenticatedUser.CooperatorID;
                cropWildRelative.ID = _taxonomyService.InsertCropWildRelative(cropWildRelative);
            }
            return RedirectToAction("CropWildRelativeEdit", "Taxonomy", new { id = cropWildRelative.ID });
        }
        #endregion

        #region Citation
        public PartialViewResult CitationDetail(int citationId)
        {
            Citation citation = new Citation();

            return PartialView("~/Views/Taxonomy/Citation/_Detail.cshtml", citation);
        }

        public PartialViewResult FindCitations(int speciesId, string searchString)
        {
            IEnumerable<Citation> citationList = new List<Citation>().AsEnumerable();
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            try
            {
                log.Info("SEARCH CITATIONS: " + searchString);
                citationList = _taxonomyService.FindCitations(searchString);
                log.Info("CITATIONS FOUND: " + citationList.Count());
            }
            catch (Exception ex)
            {
                log.Error(ex.Message + ex.StackTrace);
            }
            return PartialView("~/Views/Taxonomy/Citation/_List.cshtml", citationList);
        }

        #endregion

        #region Notes

        public ActionResult FindNotes(string searchString, string context)
        {
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            try
            {
                log.Info("NOTES SEARCH: " + searchString + ", " + context);
                IEnumerable<Note> noteList = new List<Note>().AsEnumerable();
                noteList = _taxonomyService.FindNotes(searchString, context);
                log.Info("NOTES FOUND: " + noteList.Count());
                return PartialView("~/Views/Taxonomy/Shared/_NoteList.cshtml", noteList);
            }
            catch (Exception ex)
            {
                log.Error(ex.Message + ex.StackTrace);
                return RedirectToAction("InternalServerError", "Error");
            }
        }

        #endregion

        #region Dashboard
        public ActionResult _MySearches()
        {
            return PartialView("~/Views/Taxonomy/Shared/_UserSearchList.cshtml");
        }
        public ActionResult _MyFolders()
        {
            IEnumerable<Folder> folders = new List<Folder>().AsEnumerable();
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            folders = _taxonomyService.GetFolders(AuthenticatedUser.CooperatorID);
            return PartialView("~/Views/Taxonomy/Folder/_List.cshtml", folders);
        }

        public ActionResult GetFolder(int folderId)
        {
            FolderEditViewModel viewModel = new FolderEditViewModel();
            Folder folder = new Folder();
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            folder = _taxonomyService.GetFolder(folderId);
            viewModel.ID = folder.ID;
            viewModel.Title = folder.Title;
            viewModel.Description = folder.Description;
            viewModel.DataSource = folder.DataSource;
            viewModel.Note = folder.Note;
            viewModel.IsShared = folder.IsShared;
            viewModel.ModifiedByCooperatorID = folder.ModifiedByCooperatorID;
            viewModel.SearchResults = folder.SearchResults;
            return View(BASE_PATH +  "Folder/Edit.cshtml", viewModel);
        }

        public JsonResult AddToFolder(int folderId, string folderTitle, string dataSource, string values)
        {
            Folder folder = new Folder();
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            if (folderId == 0)
            {
                folder.Title = folderTitle;
                folder.DataSource = dataSource;
                folder.CreatedByCooperatorID = AuthenticatedUser.CooperatorID;
                folder.ItemList = values;
                folderId = _taxonomyService.AddFolder(folder);
            }
            else
            {
                string[] valueList = values.Split(',');
                foreach (var id in valueList)
                { 
                    // TO DO: ADD EACH ITEM TO FOLDER
                }
            }
            return Json(new { success = true }, JsonRequestBehavior.AllowGet);
        }

        #endregion Dashboard

        #region Folder

        public PartialViewResult FolderList()
        {
            IEnumerable<Folder> folderList = null;
            try 
            {
                TaxonomyService taxonomyService = new TaxonomyService(this.AuthenticatedUserSession.Environment);
                folderList = taxonomyService.GetFolders(AuthenticatedUser.CooperatorID);
                return PartialView("~/Views/Taxonomy/Folder/_List.cshtml", folderList);
            }
            catch (Exception ex)
            {
                log.Error(ex.Message + ex.StackTrace);
                return PartialView("~/Views/Error/_Error.cshtml");
            }
        }

        public ActionResult FolderEdit(int id)
        {
            FolderEditViewModel viewModel = new FolderEditViewModel();
            Folder folder = new Folder();
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            folder = _taxonomyService.GetFolder(id);
            viewModel.ID = folder.ID;
            viewModel.Title = folder.Title;
            viewModel.Description = folder.Description;
            viewModel.DataSource = folder.DataSource;
            viewModel.IsShared = folder.IsShared;
            viewModel.Note = folder.Note;
            viewModel.SearchResults = folder.SearchResults;
            viewModel.CreatedDate = folder.CreatedDate;
            viewModel.CreatedByCooperatorID = folder.CreatedByCooperatorID;
            viewModel.CreatedByCooperatorName = folder.CreatedByCooperatorName;
            viewModel.ModifiedDate = folder.ModifiedDate;
            viewModel.ModifiedByCooperatorID = folder.ModifiedByCooperatorID;
            viewModel.ModifiedByCooperatorName = folder.ModifiedByCooperatorName;

            return View(BASE_PATH + "Folder/Edit.cshtml", viewModel);
        }

        [HttpPost]
        public ActionResult FolderEdit(FolderEditViewModel viewModel)
        {
            int retVal = 0;
            Folder folder = new Folder();
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            try
            {
                folder.ID = viewModel.ID;
                folder.Title = viewModel.Title;
                folder.Description = viewModel.Description;
                folder.DataSource = viewModel.DataSource;
                folder.Note = viewModel.Note;
                folder.IsShared = viewModel.IsShared;
                folder.ModifiedByCooperatorID = AuthenticatedUser.CooperatorID;
                retVal = _taxonomyService.UpdateFolder(folder);
            }
            catch (Exception ex)
            {
                log.Error(ex.Message + ex.StackTrace);
                return RedirectToAction("InternalServerError", "Error");
            }
            return RedirectToAction("FolderEdit", "Taxonomy", new { @id = viewModel.ID } );
        }

        public ActionResult FolderDelete(int id)
        {
            int retVal = 0;
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            try
            {
                _taxonomyService.DeleteFolder(id);
            }
            catch (Exception ex)
            {
                log.Error(ex.Message + ex.StackTrace);
                return RedirectToAction("InternalServerError", "Error");
            }
            return RedirectToAction("Index", "Taxonomy");
        }

        public PartialViewResult FolderItemList(int targetFolderId, string dataSource)
        {
            const string VIEW_ROOT = "~/Views/Taxonomy/Folder/";
            string partialViewName = String.Empty;
            FolderItemListViewModel viewModel = new FolderItemListViewModel();
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            try
            {
                viewModel.FolderID = targetFolderId;
                viewModel.Results = _taxonomyService.GetFolderItems(targetFolderId, dataSource);
                partialViewName = GetViewName(dataSource);
                return PartialView(VIEW_ROOT + partialViewName, viewModel);
            }
            catch (Exception ex)
            {
                log.Error(ex.Message + ex.StackTrace);
                return PartialView("~/Views/Error/_Error.cshtml");
            }
        }

        public PartialViewResult FolderItemDelete(int targetFolderId, int itemId, string dataSource)
        {
            const string VIEW_ROOT = "~/Views/Taxonomy/Folder/";
            string partialViewName = String.Empty;
            int retVal = 0;
            FolderItemListViewModel viewModel = new FolderItemListViewModel();
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            try
            {
                retVal = _taxonomyService.DeleteFolderItem(itemId);
                viewModel.FolderID = targetFolderId;
                viewModel.Results = _taxonomyService.GetFolderItems(targetFolderId, dataSource);
            }
            catch (Exception ex)
            {
                log.Error(ex.Message + ex.StackTrace);
            }

            partialViewName = GetViewName(dataSource);
            return PartialView(VIEW_ROOT + partialViewName, viewModel);
        }

        public PartialViewResult FolderItemsDelete(int folderId, string folderItemIdList, string dataSource)
        {
            const string VIEW_ROOT = "~/Views/Taxonomy/Folder/";
            string partialViewName = String.Empty;
            ResultContainer resultContainer = new ResultContainer();
            FolderItemListViewModel viewModel = new FolderItemListViewModel();
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            try
            {
                resultContainer = _taxonomyService.DeleteFolderItems(folderItemIdList);
                viewModel.FolderID = folderId;
                viewModel.Results = _taxonomyService.GetFolderItems(folderId, dataSource);
                partialViewName = GetViewName(dataSource);
                return PartialView(VIEW_ROOT + partialViewName, viewModel);
            }
            catch (Exception ex)
            {
                log.Error(ex.Message + ex.StackTrace);
                return PartialView("~/Views/Error/_Error.cshtml");
            }
        }

        private string GetViewName(string dataSource)
        {
            switch (dataSource)
            {
                case "usp_TaxonomyFolderCropForCWRItems_Select":
                    return "_CropForCWRItemList.cshtml";
                case "usp_TaxonomyFolderCWRMapItems_Select":
                    return "_CWRMapItemList.cshtml";
                default:
                    return String.Empty;
            }
        }

        #endregion

        #region Regulation

        public ActionResult RegulationHome()
        {
            RegulationListViewModel viewModel = new RegulationListViewModel();

            return View("~/Views/Taxonomy/Regulation/Index.cshtml", viewModel);
        }

        [OutputCache(NoStore = true, Duration = 0, VaryByParam = "*")]
        public PartialViewResult AllRegulations()
        {
            RegulationListViewModel viewModel = new RegulationListViewModel();
            return PartialView("~/Views/Taxonomy/Regulation/_List.cshtml", viewModel);
        }

        #endregion

        #region Reference

        [HttpGet]
        public ActionResult GetCitations(int speciesId)
        {
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);
            IEnumerable<Citation> citations = _taxonomyService.FindCitations(speciesId);
           
            return Json(citations, JsonRequestBehavior.AllowGet);
        }

        #endregion
    }
}