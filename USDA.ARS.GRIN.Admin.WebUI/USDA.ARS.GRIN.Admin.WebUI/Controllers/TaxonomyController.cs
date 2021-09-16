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
using NLog;
using System.Web.UI.WebControls.WebParts;
using USDA.ARS.GRIN.Admin.WebUI.ViewModels.Taxonomy;

namespace USDA.ARS.GRIN.Admin.WebUI.Controllers
{
    [GrinGlobalAuthentication]
    public class TaxonomyController : BaseController
    {
        const string BASE_PATH = "~/Views/Taxonomy/";
        private static readonly Logger Log = LogManager.GetCurrentClassLogger();

        public ActionResult Index()
        {
            TaxonomyService taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);
            IndexViewModel viewModel = null; 
            try
            {
                TempData["context"] = AuthenticatedUserSession.Application.Title + " Home";
                viewModel = new IndexViewModel();
                //taxonomyService.FindCachedSpecies();
            }
            catch (Exception ex)
            {
                Log.Error(ex, "Error Occurred");
                return RedirectToAction("InternalServerError", "Error");
            }
            return View("~/Views/Taxonomy/Index.cshtml", viewModel);
        }

        #region Crop for CWR

        [Route("Taxonomy/CropForCWR/Home")]
        public ActionResult CropForCWRHome()
        {
            TempData["page_title"] = "Crop For CWR Home";
            TaxonomyService taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);
            CropForCWRHomeViewModel cropForCWRHomeViewModel = new CropForCWRHomeViewModel();        

            try
            {
                cropForCWRHomeViewModel.DataSourceName = "taxonomy_cwr_crop;";
                cropForCWRHomeViewModel.Cooperators = new SelectList(taxonomyService.GetCreatedByCooperators("taxonomy_cwr_crop"), "ID", "FullName");
                cropForCWRHomeViewModel.DefaultCooperatorID = AuthenticatedUser.CooperatorID;
                return View(BASE_PATH + "CropForCWR/Index.cshtml", cropForCWRHomeViewModel);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return RedirectToAction("InternalServerError", "Error");
            }
        }
       
        [HttpGet]
        public ActionResult CropForCWREdit(int id = 0)
        {
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);
            CropForCWRViewModel cropForCWRViewModel = new CropForCWRViewModel();

            try
            {
                cropForCWRViewModel.CWRTraitViewModel = new CWRTraitEditViewModel(_taxonomyService.GetTraitClassCodes(), _taxonomyService.GetBreedingTypeCodes());
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
                    //cropForCWRViewModel.CWRMaps = cropForCwr.CWRMaps;
                }
                else
                {
                    TempData["context"] = "Add Crop for CWR";
                    
                    cropForCWRViewModel.CWRTraitViewModel.Citations = new SelectList(new List<Citation>(), "ID", "Title");
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return RedirectToAction("InternalServerError", "Error");
            }
            return View("~/Views/Taxonomy/CropForCWR/Edit.cshtml", cropForCWRViewModel);
        }

        [HttpPost]
        public ActionResult CropForCWREdit(CropEditViewModel viewModel)
        {
            CropForCWR crop = new CropForCWR();
            ResultContainer resultContainer = new ResultContainer();
             TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            if (!ModelState.IsValid)
            {
                return View("~/Views/Taxonomy/CropForCWR/Edit.cshtml", viewModel);
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

                //if (resultContainer.ResultCode == "2601")
                //{
                //    viewModel.ErrorMessage = "The crop name must be unique.";
                //    return View("~/Views/Taxonomy/CropForCWR/Edit.cshtml", viewModel);
                //}
                crop.ID = resultContainer.EntityID;
                return RedirectToAction("CropForCWREdit", "Taxonomy", new { id = crop.ID });
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return RedirectToAction("InternalServerError", "Error");
            }
        }
 
        [HttpPost]
        public PartialViewResult CropForCWRSearch(FormCollection formCollection)
        {
            string resultsFormat = String.Empty;
            string resultsViewName = "CropForCWR/_List.cshtml";
            Query query = new Query();
            TaxonomyService taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);
            CropForCWRListViewModel cropForCWRListViewModel = new CropForCWRListViewModel();

            try
            {
                if (!String.IsNullOrEmpty(formCollection["CreatedByCooperatorID"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "created_by", SearchOperatorCode = "=", FieldValue = formCollection["CreatedByCooperatorID"], DataType = "INT" });
                }

                if (!String.IsNullOrEmpty(formCollection["CropName"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "crop_name", SearchOperatorCode = "LIKE", FieldValue = formCollection["CropName"], DataType = "NVARCHAR" });
                }

                if (!String.IsNullOrEmpty(formCollection["Note"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "note", SearchOperatorCode = "LIKE", FieldValue = formCollection["Note"], DataType = "NVARCHAR" });
                }

                if (!String.IsNullOrEmpty(formCollection["ResultsFormat"]))
                {
                    resultsFormat = formCollection["ResultsFormat"];
                    if (resultsFormat == "2")
                        resultsViewName = "CropForCWR/_SelectList.cshtml";
                }

                cropForCWRListViewModel.CropsForCWR = taxonomyService.CropForCWRSearch(query);
                return PartialView(BASE_PATH + resultsViewName, cropForCWRListViewModel);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return PartialView("~/Views/Error/_Error.cshtml");
            }
        }

        #endregion

        #region CWR Map

        public ActionResult CWRMapHome()
        {
            CWRMapHomeViewModel cWRMapHomeViewModel = new CWRMapHomeViewModel();
            TaxonomyService taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            try
            {
                TempData["page_title"] = "CWR Map Home";
                cWRMapHomeViewModel.DataSourceName = "taxonomy_cwr_map";
                cWRMapHomeViewModel.Cooperators = new SelectList(AuthenticatedUserSession.Application.Cooperators, "ID", "FullName");
                cWRMapHomeViewModel.GenepoolCodes = new SelectList(taxonomyService.GetGenePoolCodes(),"CodeValue","Title");
                cWRMapHomeViewModel.DefaultCooperatorID = AuthenticatedUser.CooperatorID;
                return View(BASE_PATH + "CWRMap/Index.cshtml", cWRMapHomeViewModel);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return RedirectToAction("InternalServerError", "Error");
            }
        }

        [HttpPost]
        public ActionResult CWRMapSearch(FormCollection formCollection)
        {
            string resultsFormat = String.Empty;
            string resultsViewName = "CWRMap/_List.cshtml";
            Query query = new Query();
            TaxonomyService taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);
            CWRMapListViewModel cwrMapListViewModel = new CWRMapListViewModel();

            try
            {
                if (!String.IsNullOrEmpty(formCollection["CreatedByCooperatorID"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "created_by", SearchOperatorCode = "=", FieldValue = formCollection["CreatedByCooperatorID"], DataType = "INT" });
                }

                if (!String.IsNullOrEmpty(formCollection["CropForCWID"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "taxonomy_cwr_crop_id", SearchOperatorCode = "=", FieldValue = formCollection["CropForCWRID"], DataType = "INT" });
                }

                if (!String.IsNullOrEmpty(formCollection["SpeciesID"]))
                {
                    if (Int32.Parse(formCollection["SpeciesID"]) > 0)
                    {
                        query.QueryCriteria.Add(new QueryCriterion { FieldName = "taxonomy_species_id", SearchOperatorCode = "=", FieldValue = formCollection["SpeciesID"], DataType = "INT" });
                    }
                }

                if (!String.IsNullOrEmpty(formCollection["GenepoolCode"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "genepool_code", SearchOperatorCode = "=", FieldValue = formCollection["GenepoolCode"], DataType = "NVARCHAR" });
                }

                if (!String.IsNullOrEmpty(formCollection["CropCommonName"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "crop_common_name", SearchOperatorCode = "LIKE", FieldValue = formCollection["CropCommonName"], DataType = "NVARCHAR" });
                }

                if (!String.IsNullOrEmpty(formCollection["IsCrop"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "is_crop", SearchOperatorCode = "=", FieldValue = formCollection["IsCrop"], DataType = "NVARCHAR" });
                }

                if (!String.IsNullOrEmpty(formCollection["IsGraftstock"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "is_graftstock", SearchOperatorCode = "=", FieldValue = formCollection["IsGraftstock"], DataType = "NVARCHAR" });
                }

                if (!String.IsNullOrEmpty(formCollection["IsPotential"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "is_potential", SearchOperatorCode = "=", FieldValue = formCollection["IsPotential"], DataType = "NVARCHAR" });
                }

                if (!String.IsNullOrEmpty(formCollection["Note"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "note", SearchOperatorCode = "LIKE", FieldValue = formCollection["Note"], DataType = "NVARCHAR" });
                }


                if (!String.IsNullOrEmpty(formCollection["ResultsFormat"]))
                {
                    resultsFormat = formCollection["ResultsFormat"];
                    if (resultsFormat == "2")
                        resultsViewName = "CropForCWR/_SelectList.cshtml";
                }

                cwrMapListViewModel.CWRMaps = taxonomyService.CWRMapSearch(query);
                return PartialView(BASE_PATH + resultsViewName, cwrMapListViewModel);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return PartialView("~/Views/Error/_Error.cshtml");
            }
        }

        public ActionResult CWRMapEdit(int cropForCwrId = 0, int cwrMapId = 0)
        {
            TaxonomyService taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);
            CWRMapViewModel viewModel = null;
           
            try
            {
                if (cwrMapId > 0)
                {
                    TempData["context"] = "Edit CWR Map";

                    CWRMap cwrMap = taxonomyService.GetCWRMap(cwrMapId);

                    viewModel = new CWRMapViewModel();
                    viewModel.ID = cwrMap.ID;
                    viewModel.CropForCWRID = cwrMap.CropForCWRID;
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
                    viewModel.Citations = new SelectList(new List<Citation>(), "ID", "Title");
                    viewModel.CWRTraits = cwrMap.CWRTraits;
                }
                else
                {
                    viewModel = new CWRMapViewModel();
                    viewModel.CropForCWRID = cropForCwrId;
                    viewModel.Citations = new SelectList(new List<Citation>(), "ID", "Title");
                    TempData["context"] = "Add CWR Map";
                }
                // TODO: Refactor; use Genus search and Query.
                //viewModel.Genera = new SelectList(taxonomyService.GenusSearch()nera(), "ID","Name");
                return View("~/Views/Taxonomy/CWRMap/Edit.cshtml", viewModel);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return RedirectToAction("InternalServerError", "Error");
            }
        }

        [HttpPost]
        public ActionResult CWRMapEdit(CWRMapViewModel viewModel)
        {
            CWRMap cwrMap = new CWRMap();
            ResultContainer resultContainer = null;
            TaxonomyService taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            //if (!ModelState.IsValid)
            //{
            //    return View("~/Views/Taxonomy/CWRMap/Edit.cshtml", viewModel);
            //}

            try
            {
                cwrMap.ID = viewModel.ID;
                cwrMap.SpeciesID = viewModel.SpeciesID;
                cwrMap.CropForCWRID = viewModel.CropForCWRID;
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
                    resultContainer = taxonomyService.UpdateCWRMap(cwrMap);
                }
                else
                {
                    cwrMap.CreatedByCooperatorID = AuthenticatedUser.CooperatorID;
                    resultContainer = taxonomyService.AddCWRMap(cwrMap);

                    if (String.IsNullOrEmpty(resultContainer.ResultCode))
                    {
                        cwrMap.ID = resultContainer.EntityID;
                    }
                    else
                    {
                        throw new Exception(resultContainer.ResultDescription);
                    }
                }
                return RedirectToAction("CWRMapEdit", "Taxonomy", new { cropForCwrId = cwrMap.CropForCWRID, cwrMapId = cwrMap.ID });
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message); 
                return RedirectToAction("InternalServerError", "Error");
            }
        }

        public ActionResult Manager()
        {
            TempData["context"] = "Crop Mapper";
            ManagerViewModel managerViewModel = new ManagerViewModel();
            TaxonomyService taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);
            return View("~/Views/Taxonomy/CWRMap/Manager.cshtml", managerViewModel);
        }

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

        public ActionResult CWRTraitHome()
        {
            CWRTraitHomeViewModel cwrTraitHomeViewModel = new CWRTraitHomeViewModel();
            TaxonomyService taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            try
            {
                TempData["page_title"] = "CWR Trait Home";
                cwrTraitHomeViewModel.DataSourceName = "taxonomy_cwr_map";
                cwrTraitHomeViewModel.Cooperators = new SelectList(AuthenticatedUserSession.Application.Cooperators, "ID", "FullName");
                cwrTraitHomeViewModel.DefaultCooperatorID = AuthenticatedUser.CooperatorID;
                cwrTraitHomeViewModel.TraitClassCodes = new SelectList(taxonomyService.GetTraitClassCodes(),"CodeValue","Title");
                cwrTraitHomeViewModel.BreedingTypeCodes = new SelectList(taxonomyService.GetBreedingTypeCodes(), "CodeValue", "Title");
                return View(BASE_PATH + "CWRTrait/Index.cshtml", cwrTraitHomeViewModel);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return RedirectToAction("InternalServerError", "Error");
            }
        }

        [OutputCache(NoStore = true, Duration = 0, VaryByParam = "*")]
        public ActionResult CWRTraitSearch(string searchText)
        {
            return PartialView("~/Views/Taxonomy/CWRTrait/_SearchResults.cshtml");
        }

        public ActionResult CWRTraitEdit(int speciesId = 0, int cropForCwrId = 0, int cwrMapId = 0, int cwrTraitId = 0)
        {
            CWRTraitEditViewModel cwrTraitViewModel = null;
            CWRTrait cwrTrait = new CWRTrait();
            TaxonomyService taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            try
            {
                cwrTraitViewModel = new CWRTraitEditViewModel(taxonomyService.GetTraitClassCodes(), taxonomyService.GetBreedingTypeCodes());

                cwrTraitViewModel.CWRMap = taxonomyService.GetCWRMap(cwrMapId);
                
                cwrTraitViewModel.CWRMapID = cwrMapId;
                if (cwrTraitId > 0)
                {
                    TempData["context"] = "Edit CWR Trait";

                    cwrTrait = taxonomyService.GetCWRTrait(cwrTraitId);
                    cwrTraitViewModel.ID = cwrTrait.ID;
                    cwrTraitViewModel.CWRMapID = cwrTrait.CWRMapID;
                    cwrTraitViewModel.CropForCWRID = cwrTrait.CropForCWRID;
                    cwrTraitViewModel.CropForCWRName = cwrTrait.CropForCWRName;
                    cwrTraitViewModel.SpeciesID = cwrTrait.SpeciesID;
                    cwrTraitViewModel.SpeciesName = cwrTrait.SpeciesName;
                    cwrTraitViewModel.TraitClassCode = cwrTrait.TraitClassCode;
                    cwrTraitViewModel.IsPotential = cwrTrait.IsPotential;
                    cwrTraitViewModel.BreedingTypeCode = cwrTrait.BreedingTypeCode;
                    cwrTraitViewModel.BreedingUsageNote = cwrTrait.BreedingUsageNote;
                    cwrTraitViewModel.OntologyTraitIdentifier = cwrTrait.OntologyTraitIdentifier;
                    cwrTraitViewModel.CitationID = cwrTrait.CitationID;
                    cwrTraitViewModel.Note = cwrTrait.Note;
                    cwrTraitViewModel.CreatedDate = cwrTrait.CreatedDate;
                    cwrTraitViewModel.CreatedByCooperatorID = cwrTrait.CreatedByCooperatorID;
                    cwrTraitViewModel.CreatedByCooperatorName = cwrTrait.CreatedByCooperatorName;
                    cwrTraitViewModel.ModifiedDate = cwrTrait.ModifiedDate;
                    cwrTraitViewModel.ModifiedByCooperatorID = cwrTrait.ModifiedByCooperatorID;
                    cwrTraitViewModel.ModifiedByCooperatorName = cwrTrait.ModifiedByCooperatorName;
                    //cwrTraitViewModel.Citations = new SelectList(taxonomyService.FindCitations(cwrTraitViewModel.SpeciesID), "ID", "Title");
                    cwrTraitViewModel.Citations = new SelectList(new List<Citation>(), "ID", "Title");
                }
                else
                {
                    TempData["context"] = "Add CWR Trait";
                    cwrTraitViewModel.CropForCWRID = cropForCwrId;
                    cwrTraitViewModel.SpeciesID = speciesId;
                    cwrTraitViewModel.Citations = new SelectList(new List<Citation>(), "ID", "Title");
                }
                cwrTraitViewModel.CropForCWR = taxonomyService.GetCropForCWR(cwrTraitViewModel.CropForCWRID);
                cwrTraitViewModel.Species = taxonomyService.GetSpecies(cwrTraitViewModel.SpeciesID);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return RedirectToAction("InternalServerError", "Error");
            }
            return View("~/Views/Taxonomy/CWRTrait/Edit.cshtml", cwrTraitViewModel);
        }

        [HttpPost]
        public ActionResult CWRTraitEdit(CWRTraitEditViewModel viewModel)
        {
            ResultContainer resultContainer = new ResultContainer();
            CWRTrait cropTrait = new CWRTrait();
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            try
            {
                cropTrait.ID = viewModel.ID;
                cropTrait.CWRMapID = viewModel.CWRMapID;
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
                    _taxonomyService.UpdateCWRTrait(cropTrait);
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return RedirectToAction("InternalServerError", "Error");
            }
            return RedirectToAction("CWRTraitEdit", "Taxonomy", new { speciesId = viewModel.SpeciesID, cropForCwrId = viewModel.CropForCWRID, cwrMapId = viewModel.CWRMapID, cwrTraitId = viewModel.ID });
        }

        public ActionResult CWRTraitDelete(int cropForCwrId, int cwrMapId, int cwrTraitId)
        {
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);
             
            _taxonomyService.DeleteCWRTrait(new CWRTrait { ID = cwrTraitId });
            return RedirectToAction("CWRMapEdit", "Taxonomy", new { cropForCwrId = cropForCwrId, cwrMapId = cwrMapId });
        }

        //public ActionResult CropTraitsDelete(int speciesId, int cropId, int cropMapId, string cropTraitIdList)
        //{
        //    CropTraitListViewModel viewModel = new CropTraitListViewModel();
        //    TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

        //    _taxonomyService.DeleteCropTraits(cropTraitIdList);

        //    viewModel.SpeciesID = speciesId;
        //    viewModel.CropId = cropId;
        //    viewModel.CropMapID = cropMapId;
        //    viewModel.CropTraits = _taxonomyService.GetCWRTraits(cropMapId);
        //    return PartialView("~/Views/Taxonomy/Crop/Trait/_List.cshtml", viewModel);
        //}


        //traitClassCode = $("#CWRTraitViewModel_TraitClassCode").val();
        //breedingTypeCode = $("#CWRTraitViewModel_BreedingTypeCode").val();
        //breedingUsageNote = $("#CWRTraitViewModel_BreedingUsageNote").val();
        //ontologyTraitIdentifier



        public JsonResult ApplyCWRTrait(string traitClassCode, string breedingTypeCode, string breedingUsageNote, string ontologyTraitIdentifier, string cwrMapIdList)
        {
            TaxonomyService taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            string[] valueList = cwrMapIdList.Split(',');
            foreach (var cwrMapId in valueList)
            {
                taxonomyService.AddCropTrait(new CWRTrait { CWRMapID = Int32.Parse(cwrMapId), TraitClassCode = traitClassCode, BreedingTypeCode = breedingTypeCode, BreedingUsageNote = breedingUsageNote, OntologyTraitIdentifier = ontologyTraitIdentifier, CreatedByCooperatorID = AuthenticatedUser.CooperatorID });
            }
            return Json(new { success = true }, JsonRequestBehavior.AllowGet);
        }

        #endregion

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
                Log.Error(ex, ex.Message);
                return RedirectToAction("InternalServerError", "Error", new { loginStatus = LoginStatusEnum.ERROR });
            }
        }

        public PartialViewResult FiscalYearSummary()
        {
            SummaryReport summaryReport = null;

            try
            {
                TaxonomyService taxonomyService = new TaxonomyService(this.AuthenticatedUserSession.Environment);
                summaryReport = taxonomyService.FiscalYearSummary();
                return PartialView("~/Views/Taxonomy/Reports/_FiscalYearSummary.cshtml", summaryReport);
            }
            catch (Exception ex)
            {
                Log.Error(ex, "Error");
                return PartialView("~/Views/Error/_Error.cshtml");
            }
        }

        #endregion Reports

        #region Family

        public ActionResult FamilyHome()
        {
            TempData["context"] = "Family Home";
            TaxonomyService taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);
            FamilyHomeViewModel familyHomeViewModel = new FamilyHomeViewModel();

            try
            {
                familyHomeViewModel.DataSourceName = "taxonomy_family;";
                familyHomeViewModel.Cooperators = new SelectList(taxonomyService.GetCreatedByCooperators("taxonomy_family"), "ID", "FullName");
                familyHomeViewModel.DefaultCooperatorID = AuthenticatedUser.CooperatorID;
                return View(BASE_PATH + "Family/Index.cshtml", familyHomeViewModel);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return RedirectToAction("InternalServerError", "Error");
            }        
        }
        [HttpPost]
        public PartialViewResult FamilySearch(FormCollection formCollection)
        {
            string resultsFormat = String.Empty;
            string resultsViewName = "Family/_List.cshtml";
            Query query = new Query();
            TaxonomyService taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);
            FamilyListViewModel familyListViewModel = new FamilyListViewModel();

            try 
            {
                if (!String.IsNullOrEmpty(formCollection["CurrentFamilyID"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "current_taxonomy_family_id", SearchOperatorCode = "=", FieldValue = formCollection["CurrentFamilyID"], DataType = "INT" });
                }

                if (!String.IsNullOrEmpty(formCollection["FamilyID"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "taxonomy_family_id", SearchOperatorCode = "=", FieldValue = formCollection["FamilyID"], DataType = "INT" });
                }

                if (!String.IsNullOrEmpty(formCollection["CreatedByCooperatorID"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "created_by", SearchOperatorCode = "=", FieldValue = formCollection["CreatedByCooperatorID"], DataType = "INT" });
                }

                if (!String.IsNullOrEmpty(formCollection["Name"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "full_name", SearchOperatorCode = "LIKE", FieldValue = formCollection["Name"], DataType = "NVARCHAR" });
                }

                if (!String.IsNullOrEmpty(formCollection["TribeName"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "tribe_name", SearchOperatorCode = "LIKE",  FieldValue = formCollection["TribeName"], DataType = "NVARCHAR" });
                }

                if (!String.IsNullOrEmpty(formCollection["SubTribeName"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "subtribe_name", SearchOperatorCode = "LIKE", FieldValue = formCollection["SubtribeName"], DataType = "NVARCHAR" });
                }

                if (!String.IsNullOrEmpty(formCollection["Note"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "note", SearchOperatorCode = "LIKE", FieldValue = formCollection["Note"], DataType = "NVARCHAR" });
                }

                if (!String.IsNullOrEmpty(formCollection["ResultsFormat"]))
                {
                    resultsFormat = formCollection["ResultsFormat"];
                    if (resultsFormat == "2")
                        resultsViewName = "Family/_SelectList.cshtml";
                }

                familyListViewModel.Families = taxonomyService.FamilySearch(query);
                return PartialView(BASE_PATH + resultsViewName, familyListViewModel);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return PartialView("~/Views/Error/_Error.cshtml");
            }
        }

        public ActionResult FamilyEdit(int id = 0)
        {
            TaxonomyService taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);
            FamilyEditViewModel familyEditViewModel = null;
            Family family = new Family();
            
            try
            {
                if (id > 0)
                {
                    TempData["context"] = String.Format("Edit Family [{0}]", id);
                    family = taxonomyService.GetFamily(id);
                    familyEditViewModel = new FamilyEditViewModel(family);
                }
                else
                {
                    TempData["context"] = "Add Family";
                    familyEditViewModel = new FamilyEditViewModel();
                }
                familyEditViewModel.DataSourceName = "taxonomy_family";
                familyEditViewModel.SuprafamilyRankCodes = new SelectList(taxonomyService.GetCodeValues("TAXONOMY_SUPRAFAMILY"),"CodeValue","Title");
                return View(BASE_PATH + "Family/Edit.cshtml", familyEditViewModel);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return RedirectToAction("InternalServerError", "Error");
            }
        }
        [HttpPost]
        public ActionResult FamilyEdit(FamilyEditViewModel familyEditViewModel)
        {
            Family family = new Family();
            ResultContainer resultContainer = new ResultContainer();
            TaxonomyService taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            try 
            {
                family.ID = familyEditViewModel.ID;
                //current
                family.Name = familyEditViewModel.Name;
                family.Authority = familyEditViewModel.Authority;
                family.TypeGenusID = familyEditViewModel.TypeGenusID;
                family.SuprafamilyRankCode = familyEditViewModel.SuprafamilyRankCode;
                family.SuprafamilyRankName = familyEditViewModel.SuprafamilyRankName;
                family.AlternateName = familyEditViewModel.AlternateName;
                family.SubFamilyName = familyEditViewModel.SubFamilyName;
                family.TribeName = familyEditViewModel.TribeName;
                family.SubTribeName = familyEditViewModel.SubTribeName;
                family.Note = familyEditViewModel.Note;

                if (familyEditViewModel.ID > 0)
                {
                    family.ModifiedByCooperatorID = AuthenticatedUser.Cooperator.ID;
                    resultContainer = taxonomyService.UpdateFamily(family);
                }
                else 
                {
                    family.CreatedByCooperatorID = AuthenticatedUser.Cooperator.ID;
                    resultContainer = taxonomyService.AddFamily(family);
                    familyEditViewModel.ID = resultContainer.EntityID;
                }
                
                if (resultContainer.ResultCode == ResultContainer.ResultCodeValue.Error.ToString())
                {
                    throw new Exception(resultContainer.ResultMessage);
                }

                return RedirectToAction("FamilyEdit", "Taxonomy", new { id = familyEditViewModel.ID });
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return RedirectToAction("InternalServerError", "Error");
            }
        }
        #endregion

        #region Genus

        public ActionResult GenusHome()
        {
            TempData["page_title"] = "Genus Home";
            TaxonomyService taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);
            GenusHomeViewModel genusHomeViewModel = new GenusHomeViewModel();

            try
            {
                genusHomeViewModel.Cooperators = new SelectList(taxonomyService.GetCreatedByCooperators("taxonomy_genus"), "ID", "FullName");
                genusHomeViewModel.HybridCodes = new SelectList(taxonomyService.GetCodeValues("GENUS_HYBRID"), "CodeValue", "CodeValue");
                genusHomeViewModel.QualifyingCodes = new SelectList(taxonomyService.GetCodeValues("TAXONOMY_GENUS_QUALIFIER"), "CodeValue", "CodeValue");
                genusHomeViewModel.DefaultCooperatorID = AuthenticatedUser.CooperatorID;
                return View(BASE_PATH + "Genus/Index.cshtml", genusHomeViewModel);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return RedirectToAction("InternalServerError", "Error");
            }
        }

        [HttpPost]
        public PartialViewResult GenusSearch(FormCollection formCollection)
        {
            Query query = new Query();
            TaxonomyService taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);
            GenusListViewModel genusListViewModel = new GenusListViewModel();

            try
            {
                genusListViewModel.Format = 1;
                genusListViewModel.ListViewName = "Genus/_List.cshtml";

                if (!String.IsNullOrEmpty(formCollection["FamilyID"]))
                {
                    genusListViewModel.Action = "Parent";
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "taxonomy_family_id", SearchOperatorCode = "=", FieldValue = formCollection["FamilyID"], DataType = "INT" });
                }

                if (!String.IsNullOrEmpty(formCollection["CurrentGenusID"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "current_taxonomy_genus_id", SearchOperatorCode = "=", FieldValue = formCollection["CurrentGenusID"], DataType = "INT" });
                }

                if (!String.IsNullOrEmpty(formCollection["CreatedByCooperatorID"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "created_by", SearchOperatorCode = "=", FieldValue = formCollection["CreatedByCooperatorID"], DataType = "INT" });
                }

                if (!String.IsNullOrEmpty(formCollection["Name"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "full_name", SearchOperatorCode = "LIKE", FieldValue = formCollection["Name"], DataType = "NVARCHAR", LogicalOperator = "OR" });
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "subgenus_name", SearchOperatorCode = "LIKE", FieldValue = formCollection["Name"], DataType = "NVARCHAR", LogicalOperator = "OR" });
                }

                if (!String.IsNullOrEmpty(formCollection["HybridCode"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "hybrid_code", SearchOperatorCode = "=", FieldValue = formCollection["HybridCode"], DataType = "NVARCHAR" });
                }

                if (!String.IsNullOrEmpty(formCollection["QualifyingCode"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "qualifying_code", SearchOperatorCode = "=", FieldValue = formCollection["QualifyingCode"], DataType = "NVARCHAR" });
                }

                if (!String.IsNullOrEmpty(formCollection["SectionName"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "section_name", SearchOperatorCode = "LIKE", FieldValue = formCollection["HybridCode"], DataType = "NVARCHAR" });
                }

                if (!String.IsNullOrEmpty(formCollection["Note"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "note", SearchOperatorCode = "LIKE", FieldValue = formCollection["Note"], DataType = "NVARCHAR" });
                }

                if (!String.IsNullOrEmpty(formCollection["ResultsFormat"]))
                {
                    genusListViewModel.Format = 2;
                    genusListViewModel.ListViewName = "Genus/_SelectList.cshtml";
                }
                genusListViewModel.Genera = taxonomyService.GenusSearch(query);
                return PartialView(BASE_PATH + genusListViewModel.ListViewName, genusListViewModel);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return PartialView("~/Views/Error/_Error.cshtml");
            }
        }

        public ActionResult GenusEdit(int familyId = 0, int id = 0, int currentId = 0)
        {
            TaxonomyService taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);
            GenusEditViewModel genusEditViewModel = null;
            Genus genus = new Genus();
            Genus currentGenus = new Genus();

            try
            {
                if (id > 0)
                {
                    TempData["page_title"] = String.Format("Edit Genus [{0}]", id);
                    genus = taxonomyService.GetGenus(id);
                    genusEditViewModel = new GenusEditViewModel(genus);
                }
                else
                {
                    genusEditViewModel = new GenusEditViewModel(genus);
                    if (currentId > 0)
                    {
                        TempData["context"] = "Add Genus Synonym";
                        currentGenus = taxonomyService.GetGenus(currentId);
                        genusEditViewModel.CurrentID = currentId;
                        genusEditViewModel.CurrentName = currentGenus.Name;
                        genusEditViewModel.FamilyID = currentGenus.FamilyID;
                        genusEditViewModel.FamilyName = currentGenus.FamilyName;
                        genusEditViewModel.FamilyFullName = currentGenus.FamilyFullName;
                        genusEditViewModel.QualifyingCode = "=";
                        genusEditViewModel.IsSynonym = true;
                    }
                    else
                    {
                        TempData["context"] = "Add Genus";
                    }        
                }
                genusEditViewModel.DataSourceName = "taxonomy_genus";
                genusEditViewModel.HybridCodes = new SelectList(taxonomyService.GetCodeValues("GENUS_HYBRID"), "CodeValue", "CodeValue");
                genusEditViewModel.QualifyingCodes = new SelectList(taxonomyService.GetCodeValues("TAXONOMY_GENUS_QUALIFIER"), "CodeValue", "CodeValue");
                return View(BASE_PATH + "Genus/Edit.cshtml", genusEditViewModel);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return RedirectToAction("InternalServerError", "Error");
            }
        }
        [HttpPost]
        public ActionResult GenusEdit(GenusEditViewModel genusEditViewModel)
        {
            Genus genus = new Genus();
            ResultContainer resultContainer = new ResultContainer();
            TaxonomyService taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            try
            {
                genus.ID = genusEditViewModel.ID;
                genus.ParentID = genusEditViewModel.CurrentID;
                genus.FamilyID = genusEditViewModel.FamilyID;
                genus.QualifyingCode = genusEditViewModel.QualifyingCode;
                genus.HybridCode = genusEditViewModel.HybridCode;
                genus.Name = genusEditViewModel.Name;
                genus.Authority = genusEditViewModel.Authority;
                genus.SubGenusName = genusEditViewModel.SubGenusName;
                genus.SectionName = genusEditViewModel.SectionName;
                genus.SubSectionName = genusEditViewModel.SubSectionName;
                genus.SeriesName = genusEditViewModel.SeriesName;
                genus.SubSeriesName = genusEditViewModel.SubSeriesName;
                genus.Note = genusEditViewModel.Note;

                if (genusEditViewModel.ID > 0)
                {
                    genus.ModifiedByCooperatorID = AuthenticatedUser.Cooperator.ID;
                    resultContainer = taxonomyService.UpdateGenus(genus);
                }
                else
                {
                    genus.CreatedByCooperatorID = AuthenticatedUser.Cooperator.ID;
                    resultContainer = taxonomyService.AddGenus(genus);
                    genusEditViewModel.ID = resultContainer.EntityID;
                }

                if (resultContainer.ResultCode == ResultContainer.ResultCodeValue.Error.ToString())
                {
                    throw new Exception(resultContainer.ResultMessage);
                }
                return RedirectToAction("GenusEdit", "Taxonomy", new { id = genusEditViewModel.ID });
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return RedirectToAction("InternalServerError", "Error");
            }
        }

        #endregion

        #region Species

        public ActionResult SpeciesHome()
        {
            TempData["context"] = "Species Home";
            TaxonomyService taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);
            SpeciesHomeViewModel viewModel = new SpeciesHomeViewModel();

            try
            {
                viewModel.Cooperators = new SelectList(taxonomyService.GetCreatedByCooperators("taxonomy_species"), "ID", "FullName");
                viewModel.DefaultCooperatorID = AuthenticatedUser.CooperatorID;
                return View(BASE_PATH + "Species/Index.cshtml", viewModel);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message + ex.StackTrace);
                return RedirectToAction("InternalServerError", "Error");
            }
        }

        [HttpPost]
        public ActionResult SpeciesSearch(FormCollection formCollection)
        {
            Query query = new Query();
            TaxonomyService taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);
            SpeciesListViewModel speciesListViewModel = new SpeciesListViewModel();
            speciesListViewModel.ListViewName = "Species/_List.cshtml";

            try
            {
                if (!String.IsNullOrEmpty(formCollection["GenusID"]))
                {
                    speciesListViewModel.Action = "Parent";
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "taxonomy_genus_id", SearchOperatorCode = "=", FieldValue = formCollection["GenusID"], DataType = "INT" });
                }

                if (!String.IsNullOrEmpty(formCollection["CurrentID"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "current_taxonomy_species_id", SearchOperatorCode = "=", FieldValue = formCollection["CurrentID"], DataType = "INT" });
                }

                if (!String.IsNullOrEmpty(formCollection["CreatedByCooperatorID"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "created_by", SearchOperatorCode = "=", FieldValue = formCollection["CreatedByCooperatorID"], DataType = "INT" });
                }

                if (!String.IsNullOrEmpty(formCollection["FullName"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "REPLACE(REPLACE(full_name,'<i>',''),'</i>','')", SearchOperatorCode = "LIKE", FieldValue = formCollection["FullName"], DataType = "NVARCHAR" });
                }

                if (!String.IsNullOrEmpty(formCollection["IsAcceptedName"]))
                {
                    string isAcceptedName = UnBool(Boolean.Parse(formCollection["IsAcceptedName"]));

                    if (isAcceptedName == "Y")
                    {
                        query.QueryCriteria.Add(new QueryCriterion { FieldName = "is_accepted_name", SearchOperatorCode = "=", FieldValue = isAcceptedName, DataType = "NVARCHAR" });
                    }
                }

                if (!String.IsNullOrEmpty(formCollection["Protologue"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "protologue", SearchOperatorCode = "LIKE", FieldValue = formCollection["Protologue"], DataType = "NVARCHAR" });
                }

                if (!String.IsNullOrEmpty(formCollection["Note"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "note", SearchOperatorCode = "LIKE", FieldValue = formCollection["Note"], DataType = "NVARCHAR" });
                }

                if (!String.IsNullOrEmpty(formCollection["ResultsFormat"]))
                {
                    speciesListViewModel.Format = Int32.Parse(formCollection["ResultsFormat"]);
                    if (speciesListViewModel.Format == 2)
                        speciesListViewModel.ListViewName = "Species/_SelectList.cshtml";
                }

                speciesListViewModel.SpeciesList = taxonomyService.SpeciesSearch(query);
                return PartialView(BASE_PATH + speciesListViewModel.ListViewName, speciesListViewModel);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return PartialView("~/Views/Error/_Error.cshtml");
            }
        }

        public ActionResult SpeciesEdit(int id = 0, int currentId = 0, string synonymCode = "", string infraspecificTypeCode = "", string context="")
        {
            Species species = new Species();
            SpeciesEditViewModel speciesEditViewModel = null;
            TaxonomyService taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            try
            {
                if (id > 0)
                {
                    // EDIT
                    species = taxonomyService.GetSpecies(id);
                    speciesEditViewModel = new SpeciesEditViewModel(species);
                    TempData["page_title"] = String.Format("Edit Species [{0}]", id) + speciesEditViewModel.FullName;
                    speciesEditViewModel.SynonymCodes = new SelectList(taxonomyService.GetCodeValues("TAXONOMY_SYNONYM_CODE"), "CodeValue", "Title");
                    speciesEditViewModel.DataSourceName = "taxonomy_species";

                    // If species is has a parent, retrive the parent record.
                    if ((speciesEditViewModel.CurrentID > 0) && (speciesEditViewModel.ID != speciesEditViewModel.CurrentID))
                    {
                        speciesEditViewModel.CurrentSpecies = taxonomyService.GetSpecies(speciesEditViewModel.CurrentID);
                        speciesEditViewModel.CurrentName = speciesEditViewModel.CurrentSpecies.FullName;
                        speciesEditViewModel.IsSynonym = true;
                    }
                }
                else
                {
                    // ADD NEW SPECIES
                    speciesEditViewModel = new SpeciesEditViewModel(species);
                    speciesEditViewModel.SynonymCodes = new SelectList(taxonomyService.GetCodeValues("TAXONOMY_SYNONYM_CODE"), "CodeValue", "Title");
                    speciesEditViewModel.DataSourceName = "taxonomy_species";
                  
                    if (currentId > 0)
                    {
                        // Based on the value of the context parameter, configure the viewmodel for one of several possible sub-taxa.
                        if (!String.IsNullOrEmpty(context))
                        {
                            speciesEditViewModel.Context = context;
                            switch (context)
                            {
                                case "sub":
                                    TempData["context"] = "Add Subvariety";
                                    break;
                                case "var":
                                    TempData["context"] = "Add Variety";
                                    break;
                                case "for":
                                    TempData["context"] = "Add Form";
                                    break;
                            }
                        }
                        else
                        {
                            TempData["context"] = "Add Species Synonym";
                        }
                        speciesEditViewModel.CurrentSpecies = taxonomyService.GetSpecies(currentId);
                        speciesEditViewModel.CurrentID = currentId;
                        speciesEditViewModel.CurrentName = speciesEditViewModel.CurrentSpecies.FullName;
                        speciesEditViewModel.IsSynonym = true;
                        speciesEditViewModel.GenusID = speciesEditViewModel.CurrentSpecies.GenusID;
                        speciesEditViewModel.GenusName = speciesEditViewModel.CurrentSpecies.GenusName;
                    }
                    else
                    {
                        TempData["context"] = "Add Species";
                    }
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message + ex.StackTrace);
                return RedirectToAction("InternalServerError", "Error");
            }
            return View("~/Views/Taxonomy/Species/Edit.cshtml", speciesEditViewModel);
        }
        [HttpPost]
        public ActionResult SpeciesEdit(SpeciesEditViewModel viewModel)
        {
            Species species = new Species();
            ResultContainer resultContainer = new ResultContainer();
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            try
            {
                species.ID = viewModel.ID;
                species.CurrentID = viewModel.CurrentID;
                species.NomenNumber = viewModel.NomenNumber;
                species.IsSpecificHybrid = viewModel.IsSpecificHybrid;
                species.SpeciesName = viewModel.Name;
                species.IsAcceptedName = viewModel.IsAcceptedName;
                species.Authority = viewModel.Authority;
                species.IsSpecificHybrid = viewModel.IsSpecificHybrid;
                species.IsSubSpecificHybrid = viewModel.IsSubSpecificHybrid;
                species.IsFormaHybrid = viewModel.IsFormaHybrid;
                species.IsVarietalHybrid = viewModel.IsVarietalHybrid;
                species.SubSpeciesName = viewModel.SubSpeciesName;
                species.SubSpeciesAuthority = viewModel.SubSpeciesAuthority;
                species.VarietyName = viewModel.VarietyName;
                species.VarietyAuthority = viewModel.VarietyAuthority;
                species.FormaName = viewModel.FormaName;
                species.FormaAuthority = viewModel.FormaAuthority;
                species.FormaRankType = viewModel.FormaRankType;
                species.GenusID = viewModel.GenusID;
                species.Protologue = viewModel.Protologue;
                species.NameAuthority = viewModel.NameAuthority;
                species.GenusID = viewModel.GenusID;
                species.Authority = viewModel.Authority;
                species.Note = viewModel.Note;
                species.SynonymCode = viewModel.SynonymCode;
                
                if (viewModel.ID > 0)
                {
                    if (viewModel.Context == "verify")
                    {
                        species.VerifierCooperatorID = AuthenticatedUser.CooperatorID;
                        species.NameVerifiedDate = DateTime.Now;
                    }

                    species.ModifiedByCooperatorID = AuthenticatedUser.CooperatorID;
                    resultContainer = _taxonomyService.UpdateSpecies(species);
                }
                else
                {
                    species.CreatedByCooperatorID = AuthenticatedUser.CooperatorID;
                    resultContainer = _taxonomyService.AddSpecies(species);
                    viewModel.ID = resultContainer.EntityID;

                }

                if (resultContainer.ResultCode == "2601")
                {
                    viewModel.ErrorMessage = "The species name must be unique.";
                    return View("~/Views/Taxonomy/Species/Edit.cshtml", viewModel);
                }

                return RedirectToAction("SpeciesEdit", "Taxonomy", new { id = viewModel.ID, currentId = 0, synonymCode = "", infraspecificTypeCode = "" });
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message + ex.StackTrace);
                return RedirectToAction("InternalServerError", "Error");
            }
        }
     
        [HttpGet]
        public ActionResult GetBreedingTypes(string traitClassCode)
        {
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);
            IEnumerable <CodeValueReferenceItem> breedingTypeCodes = _taxonomyService.GetBreedingTypeCodes(traitClassCode);
            return Json(breedingTypeCodes, JsonRequestBehavior.AllowGet);
        }

        #endregion Species

        #region Citation
        public ActionResult CitationHome()
        {
            TempData["context"] = "Citation Home";
            CitationHomeViewModel viewModel = new CitationHomeViewModel();
            TaxonomyService taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            // TO DO: SET UP SEARCH HERE
            SearchViewModel searchViewModel = new SearchViewModel();
            List<Field> fields = new List<Field>();
            
            fields.Add(new Field { Name = "citation.citation_title", Title = "Title" });
            fields.Add(new Field { Name = "citation.author_name", Title = "Author" });
            fields.Add(new Field { Name = "citation.citation_year", Title = "Year" });
            searchViewModel.Fields = new SelectList(fields, "Name", "Title");

            List<SearchOperator> searchOperators = new List<SearchOperator>();
            searchOperators.Add(new SearchOperator { Title = "Starts With", SearchOperatorSyntax= "LIKE" });
            searchOperators.Add(new SearchOperator { Title = "Matches", SearchOperatorSyntax = "=" });
            searchOperators.Add(new SearchOperator { Title = "Ends In", SearchOperatorSyntax = "LIKE" });
            searchViewModel.SearchOperators = new SelectList(searchOperators, "SearchOperatorSyntax","Title");

            List<ReferenceItem> citationTypeCodes = new List<ReferenceItem>();
            citationTypeCodes.Add(new ReferenceItem { ID = 1, Name = "MEDICINE", Description = "" });
            citationTypeCodes.Add(new ReferenceItem { ID = 2, Name = "NODULATION", Description = "" });
            citationTypeCodes.Add(new ReferenceItem { ID = 3, Name = "RELATIVE", Description = "" });
            citationTypeCodes.Add(new ReferenceItem { ID = 4, Name = "NULL", Description = "" });
            viewModel.CitationTypeCodes = new SelectList(citationTypeCodes, "Name", "Name");

            viewModel.SearchViewModel = searchViewModel;

            return View("~/Views/Taxonomy/Citation/Index.cshtml", viewModel);
        }

        [HttpPost]
        public ActionResult CitationSearch(FormCollection formCollection)
        {
            string resultsViewName = "Citation/_List.cshtml";
            string resultsFormat = String.Empty;
            string dataSourceIdFieldName = String.Empty;
            Query query = new Query();
            TaxonomyService taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);
            CitationListViewModel citationListViewModel = new CitationListViewModel();

            try
            {
                if (!String.IsNullOrEmpty(formCollection["DataSourceName"]))
                {
                    dataSourceIdFieldName = formCollection["DataSourceName"] + "_id";
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = dataSourceIdFieldName, SearchOperatorCode = "IS NOT", FieldValue = "NULL", DataType = "INT" });
                }

                if (!String.IsNullOrEmpty(formCollection["FamilyID"]))
                {
                    if (Int32.Parse(formCollection["FamilyID"]) > 0)
                    {
                        query.QueryCriteria.Add(new QueryCriterion { FieldName = "taxonomy_family_id", SearchOperatorCode = "=", FieldValue = formCollection["FamilyID"], DataType = "INT" });
                    }
                }

                if (!String.IsNullOrEmpty(formCollection["GenusID"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "taxonomy_genus_id", SearchOperatorCode = "=", FieldValue = formCollection["GenusID"], DataType = "INT" });
                }

                if (!String.IsNullOrEmpty(formCollection["SpeciesID"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "taxonomy_species_id", SearchOperatorCode = "=", FieldValue = formCollection["SpeciesID"], DataType = "INT" });
                }

                if (!String.IsNullOrEmpty(formCollection["FullText"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = dataSourceIdFieldName, SearchOperatorCode = "IS NOT", FieldValue = "NULL", DataType = "NVARCHAR" });
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "citation_text", SearchOperatorCode = "LIKE", FieldValue = formCollection["FullText"], DataType = "NVARCHAR" });
                }

                if (!String.IsNullOrEmpty(formCollection["TypeCode"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "type_code", SearchOperatorCode = "=", FieldValue = formCollection["TypeCode"], DataType = "NVARCHAR" });
                }

                if (!String.IsNullOrEmpty(formCollection["Reference"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "reference", SearchOperatorCode = "LIKE", FieldValue = formCollection["Reference"], DataType = "NVARCHAR" });
                }

                if (!String.IsNullOrEmpty(formCollection["DOIReference"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "doi_reference", SearchOperatorCode = "LIKE", FieldValue = formCollection["DOIReference"], DataType = "NVARCHAR" });
                }

                if (!String.IsNullOrEmpty(formCollection["Title"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "title", SearchOperatorCode = "LIKE", FieldValue = formCollection["Title"], DataType = "NVARCHAR" });
                }


                if (!String.IsNullOrEmpty(formCollection["ResultsFormat"]))
                {
                    resultsFormat = formCollection["ResultsFormat"];
                    if (resultsFormat == "2")
                        resultsViewName = "Citation/_SelectList.cshtml";
                }
                citationListViewModel.Citations = taxonomyService.CitationSearch(query);
                
                return PartialView(BASE_PATH + resultsViewName, citationListViewModel);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return PartialView("~/Views/Error/_Error.cshtml");
            }
        }

        public JsonResult CitationAdd(int citationId, int taxonID = 0, string dataSource = "")
        {
            TaxonomyService taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);
            Citation citation = new Citation();
            ResultContainer resultContainer = new ResultContainer();
            
            try 
            {
                resultContainer = taxonomyService.AddTaxonCitation(citationId, taxonID, dataSource);
            }
            catch (Exception ex)
            {
                return Json(new { success = false }, JsonRequestBehavior.AllowGet);
            }

            return Json(new { success = true }, JsonRequestBehavior.AllowGet);
        }

        //[HttpPost]
        //public ActionResult CitationSearch(CitationHomeViewModel citationHomeViewModel)
        //{
        //    TempData["context"] = "Citation Search";
        //    CitationSearchViewModel viewModel = new CitationSearchViewModel();
        //    TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);
        //    Query query = new Query();
        //    QueryCriterion queryCriterion = null;

        //    if (!String.IsNullOrEmpty(citationHomeViewModel.SpeciesName))
        //    {
        //        queryCriterion = new QueryCriterion { FieldName = "ts.name", FieldValue = citationHomeViewModel.SpeciesName, SearchOperatorCode = "LIKE", DataType = "NVARCHAR" };
        //        query.QueryCriteria.Add(queryCriterion);
        //    }

        //    if (!String.IsNullOrEmpty(citationHomeViewModel.GenusName))
        //    {
        //        queryCriterion = new QueryCriterion { FieldName = "tg.name", FieldValue = citationHomeViewModel.GenusName, SearchOperatorCode = "LIKE", DataType = "NVARCHAR" };
        //        query.QueryCriteria.Add(queryCriterion);
        //    }

        //    if (!String.IsNullOrEmpty(citationHomeViewModel.FamilyName))
        //    {
        //        queryCriterion = new QueryCriterion { FieldName = "tf.name", FieldValue = citationHomeViewModel.FamilyName, SearchOperatorCode = "LIKE", DataType = "NVARCHAR" };
        //        query.QueryCriteria.Add(queryCriterion);
        //    }

        //    if (!String.IsNullOrEmpty(citationHomeViewModel.Abbreviation))
        //    {
        //        queryCriterion = new QueryCriterion { FieldName = "l.abbreviation", FieldValue = citationHomeViewModel.Abbreviation, SearchOperatorCode = "LIKE", DataType = "NVARCHAR" };
        //        query.QueryCriteria.Add(queryCriterion);
        //    }

        //    if (!String.IsNullOrEmpty(citationHomeViewModel.Note))
        //    {
        //        queryCriterion = new QueryCriterion { FieldName = "cit.abbreviation", FieldValue = citationHomeViewModel.Note, SearchOperatorCode = "LIKE", DataType = "NVARCHAR" };
        //        query.QueryCriteria.Add(queryCriterion);
        //    }

        //    if (!String.IsNullOrEmpty(citationHomeViewModel.TypeCode))
        //    {
        //        if (!citationHomeViewModel.TypeCode.Contains("Select"))
        //        {
        //            if (citationHomeViewModel.TypeCode == "NULL")
        //            {
        //                queryCriterion = new QueryCriterion { FieldName = "cit.type_code", FieldValue = "NULL", SearchOperatorCode = "IS", DataType = "NVARCHAR" };
        //            }
        //            else
        //            {
        //                queryCriterion = new QueryCriterion { FieldName = "cit.type_code", FieldValue = citationHomeViewModel.TypeCode, SearchOperatorCode = "=", DataType = "NVARCHAR" };
        //            }
        //            query.QueryCriteria.Add(queryCriterion);
        //        }
        //    }
        //    citationHomeViewModel.Citations = _taxonomyService.FindCitations(1,query);
        //    //return PartialView("~/Views/Taxonomy/Citation/_SearchResults.cshtml", viewModel);

        //    List<ReferenceItem> citationTypeCodes = new List<ReferenceItem>();
        //    citationTypeCodes.Add(new ReferenceItem { ID = 1, Name = "MEDICINE", Description = "" });
        //    citationTypeCodes.Add(new ReferenceItem { ID = 2, Name = "NODULATION", Description = "" });
        //    citationTypeCodes.Add(new ReferenceItem { ID = 3, Name = "RELATIVE", Description = "" });
        //    citationTypeCodes.Add(new ReferenceItem { ID = 4, Name = "NULL", Description = "" });
        //    citationHomeViewModel.CitationTypeCodes = new SelectList(citationTypeCodes, "ID", "Name");

        //    return View(BASE_PATH + "Citation/Index.cshtml", citationHomeViewModel);
        //}

        [HttpPost]
        public PartialViewResult CitationList(string category, int id)
        {
            CitationSearchViewModel viewModel = new CitationSearchViewModel();
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            try
            {
                //viewModel.Citations = _taxonomyService.GetCitationsByCategory(category, id);
                return PartialView("~/Views/Taxonomy/Citation/_SearchResults.cshtml", viewModel);
            }
            catch (Exception ex)
            {
                return PartialView("~/Views/Error/_Error.cshtml", viewModel);
            }
        }

        public ActionResult CitationEdit(int id = 0)
        {
            TempData["context"] = "Edit Citation";
            CitationViewModel viewModel = new CitationViewModel();
            Citation citation = new Citation();
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            try
            {
                if (id > 0)
                {
                    TempData["context"] = "Edit Citation";
                    citation = _taxonomyService.GetCitation(id);
                    viewModel.ID = citation.ID;
                    viewModel.LiteratureID = citation.LiteratureID;
                    viewModel.LiteratureReferenceTitle = citation.LiteratureReferenceTitle;
                    viewModel.CitationTitle = citation.CitationTitle;
                    viewModel.AuthorName = citation.AuthorName;
                    viewModel.Year = citation.CitationYear;
                    viewModel.Reference = citation.Reference;
                    viewModel.DOIReference = citation.DOIReference;
                    viewModel.URL = citation.URL;
                    viewModel.CitationTitle = citation.Title;
                    viewModel.Description = citation.Description;
                    viewModel.AccessionID = citation.AccessionID;
                    viewModel.SpeciesID = citation.SpeciesID;
                    viewModel.GenusID = citation.GenusID;
                    viewModel.FamilyID = citation.FamilyID;
                    viewModel.TypeCode = citation.TypeCode;
                    viewModel.CreatedByCooperatorID = citation.CreatedByCooperatorID;
                    viewModel.CreatedDate = citation.CreatedDate;
                    viewModel.CreatedByCooperatorName = citation.CreatedByCooperatorName;
                    viewModel.ModifiedByCooperatorID = citation.ModifiedByCooperatorID;
                    viewModel.ModifiedDate = citation.ModifiedDate;
                    viewModel.ModifiedByCooperatorName = citation.ModifiedByCooperatorName;
                    viewModel.Species = _taxonomyService.GetSpecies(citation.SpeciesID);
                }
                else
                {
                    TempData["context"] = "Add  Citation";
                }
                List<ReferenceItem> citationTypeCodes = new List<ReferenceItem>();
                citationTypeCodes.Add(new ReferenceItem { ID = 1, Name = "MEDICINE", Description = "MEDICINE" });
                citationTypeCodes.Add(new ReferenceItem { ID = 2, Name = "NODULATION", Description = "NODULATION" });
                citationTypeCodes.Add(new ReferenceItem { ID = 3, Name = "RELATIVE", Description = "RELATIVE" });
                viewModel.CitationTypeCodes = new SelectList(citationTypeCodes, "Name", "Description");
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return RedirectToAction("InternalServerError", "Error");
            }
            return View(BASE_PATH + "Citation/Edit.cshtml", viewModel);
        }

        [HttpPost]
        public ActionResult CitationEdit(CitationViewModel viewModel)
        {
            TempData["context"] = "Edit Citation";
            Citation citation = new Citation();
            ResultContainer resultContainer = null;
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            try
            {
                citation.ID = viewModel.ID;
                citation.LiteratureID = viewModel.LiteratureID;
                citation.Title = viewModel.CitationTitle;
                citation.AuthorName = viewModel.AuthorName;
                citation.CitationYear = viewModel.Year;
                citation.Reference = viewModel.Reference;
                citation.URL = viewModel.URL;
                citation.AccessionID = viewModel.AccessionID;
                citation.SpeciesID = viewModel.SpeciesID;
                citation.GenusID = viewModel.GenusID;
                citation.FamilyID = viewModel.FamilyID;
                citation.TypeCode = viewModel.TypeCode;
                citation.CreatedByCooperatorID = viewModel.CreatedByCooperatorID;
                citation.CreatedDate = viewModel.CreatedDate;
                citation.CreatedByCooperatorName = viewModel.CreatedByCooperatorName;
                citation.ModifiedByCooperatorID = viewModel.ModifiedByCooperatorID;
                citation.ModifiedDate = viewModel.ModifiedDate;
                citation.ModifiedByCooperatorName = viewModel.ModifiedByCooperatorName;

                if (viewModel.ID > 0)
                {
                    citation.ModifiedByCooperatorID = AuthenticatedUser.CooperatorID;
                    resultContainer = _taxonomyService.UpdateCitation(citation);
                }
                else
                {
                    citation.CreatedByCooperatorID = AuthenticatedUser.CooperatorID;
                    resultContainer = _taxonomyService.AddCitation(citation);
                    viewModel.ID = resultContainer.EntityID;
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return RedirectToAction("InternalServerError", "Error");
            }
            return RedirectToAction("CitationEdit", "Taxonomy", new { id = citation.ID });

        }

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
                //TODO
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
            }
            return PartialView("~/Views/Taxonomy/Citation/_List.cshtml", citationList);
        }

        #endregion

        #region Literature

        public ActionResult LiteratureHome()
        {
            TempData["page_title"] = "Literature";
            TaxonomyService taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);
            LiteratureHomeViewModel literatureHomeViewModel = new LiteratureHomeViewModel();
            literatureHomeViewModel.SysTable = taxonomyService.GetSysTable(48);
            literatureHomeViewModel.DataSourceName = literatureHomeViewModel.SysTable.Name;
            literatureHomeViewModel.DataSourceTitle = literatureHomeViewModel.SysTable.Title;
         
            try
            {
                List<CodeValueReferenceItem> literatureTypeCodes = taxonomyService.GetCodeValues("LITERATURE_TYPE");
                literatureHomeViewModel.LiteratureTypeCodes = new SelectList(literatureTypeCodes, "CodeValue", "Title");
                return View(BASE_PATH + "Literature/Index.cshtml", literatureHomeViewModel);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return RedirectToAction("InternalServerError", "Error");
            }
        }

        public ActionResult LiteratureEdit(int id)
        {
            LiteratureEditViewModel literatureEditViewModel = new LiteratureEditViewModel();
            Literature literature = null;
            try 
            {
                TaxonomyService taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);
                List<CodeValueReferenceItem> literatureTypeCodes = taxonomyService.GetCodeValues("LITERATURE_TYPE");
                literatureEditViewModel.LiteratureTypeCodes = new SelectList(literatureTypeCodes, "CodeValue", "Title");

                if (id > 0)
                {
                    TempData["context"] = "Edit Literature";
                    literature = taxonomyService.GetLiterature(id);
                    literatureEditViewModel.ID = literature.ID;
                    literatureEditViewModel.Abbreviation = literature.Abbreviation;
                    literatureEditViewModel.StandardAbbreviation = literature.StandardAbbreviation;
                    literatureEditViewModel.ReferenceTitle = literature.ReferenceTitle;
                    literatureEditViewModel.Author = literature.EditorAuthorName;
                    literatureEditViewModel.TypeCode = literature.TypeCode;
                    literatureEditViewModel.Year = literature.PublicationYear;
                    literatureEditViewModel.URL = literature.URL;

                    if (!String.IsNullOrEmpty(literature.URL))
                    {
                        FileMetaData fileMetaData = taxonomyService.GetFileMetaData(literature.URL);
                        literatureEditViewModel.URLIsValid = fileMetaData.IsValid;
                    }
                    literatureEditViewModel.CreatedDate = literature.CreatedDate;
                    literatureEditViewModel.CreatedByCooperatorID = literature.CreatedByCooperatorID;
                    literatureEditViewModel.CreatedByCooperatorName = literature.CreatedByCooperatorName;
                    literatureEditViewModel.ModifiedDate = literature.ModifiedDate;
                    literatureEditViewModel.ModifiedByCooperatorID = literature.ModifiedByCooperatorID;
                    literatureEditViewModel.ModifiedByCooperatorName = literature.ModifiedByCooperatorName;
                    //literatureEditViewModel.Citations = taxonomyService.GetCitationsByLiterature(literatureEditViewModel.ID);
                }
                else
                {
                    TempData["context"] = "Add Literature";
                }

                return View(BASE_PATH + "Literature/Edit.cshtml", literatureEditViewModel);
            }
            catch (Exception ex)
            {
                Log.Error(ex);
                return RedirectToAction("InternalServerError", "Error");
            }
        }

        [HttpPost]
        public ActionResult LiteratureEdit(LiteratureEditViewModel literatureEditViewModel)
        {
            TaxonomyService taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);
            Literature literature = new Literature();
            try 
            {
                literature.ID = literatureEditViewModel.ID;


                taxonomyService.UpdateLiterature(literature);
                return RedirectToAction("LiteratureEdit", "Taxonomy", new { id = literatureEditViewModel.ID });
            }
            catch (Exception ex)
            {
                Log.Error(ex);
                return RedirectToAction("InternalServerError", "Error");
            }
        }

        [HttpPost]
        public ActionResult LiteratureSearch(LiteratureHomeViewModel literatureHomeViewModel)
        {
            CitationSearchViewModel viewModel = new CitationSearchViewModel();
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);
            Query query = new Query();
            QueryCriterion queryCriterion = null;
            try
            {
                if (!String.IsNullOrEmpty(literatureHomeViewModel.Abbreviation))
                {
                    queryCriterion = new QueryCriterion { FieldName = "abbreviation", FieldValue = literatureHomeViewModel.Abbreviation, SearchOperatorCode = "LIKE", DataType = "NVARCHAR" };
                    query.QueryCriteria.Add(queryCriterion);
                }

                if (!String.IsNullOrEmpty(literatureHomeViewModel.ReferenceTitle))
                {
                    queryCriterion = new QueryCriterion { FieldName = "reference_title", FieldValue = literatureHomeViewModel.ReferenceTitle, SearchOperatorCode = "LIKE", DataType = "NVARCHAR" };
                    query.QueryCriteria.Add(queryCriterion);
                }

                if (!String.IsNullOrEmpty(literatureHomeViewModel.Author))
                {
                    queryCriterion = new QueryCriterion { FieldName = "editor_author_name", FieldValue = literatureHomeViewModel.Author, SearchOperatorCode = "LIKE", DataType = "NVARCHAR" };
                    query.QueryCriteria.Add(queryCriterion);
                }

                if (!String.IsNullOrEmpty(literatureHomeViewModel.Year))
                {
                    queryCriterion = new QueryCriterion { FieldName = "publication_year", FieldValue = literatureHomeViewModel.Year, SearchOperatorCode = "LIKE", DataType = "NVARCHAR" };
                    query.QueryCriteria.Add(queryCriterion);
                }


                if (!String.IsNullOrEmpty(literatureHomeViewModel.TypeCode))
                {
                    if (!literatureHomeViewModel.TypeCode.Contains("Select"))
                    {
                        if (literatureHomeViewModel.TypeCode == "NULL")
                        {
                            queryCriterion = new QueryCriterion { FieldName = "literature_type_code", FieldValue = "NULL", SearchOperatorCode = "IS", DataType = "NVARCHAR" };
                        }
                        else
                        {
                            queryCriterion = new QueryCriterion { FieldName = "literature_type_code", FieldValue = literatureHomeViewModel.TypeCode, SearchOperatorCode = "=", DataType = "NVARCHAR" };
                        }
                        query.QueryCriteria.Add(queryCriterion);
                    }
                }

                if (!String.IsNullOrEmpty(literatureHomeViewModel.Note))
                {
                    queryCriterion = new QueryCriterion { FieldName = "note", FieldValue = literatureHomeViewModel.Note, SearchOperatorCode = "LIKE", DataType = "NVARCHAR" };
                    query.QueryCriteria.Add(queryCriterion);
                }

                TaxonomyService taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);
                List<CodeValueReferenceItem> literatureTypeCodes = taxonomyService.GetCodeValues("LITERATURE_TYPE");
                literatureHomeViewModel.LiteratureTypeCodes = new SelectList(literatureTypeCodes, "CodeValue", "Title");
                literatureHomeViewModel.LiteratureResults = _taxonomyService.SearchLiterature(query);

                //TEST
                foreach (var literature in literatureHomeViewModel.LiteratureResults)
                {
                    if (!String.IsNullOrEmpty(literature.URL))
                    {
                        FileMetaData fileMetaData = GetFileMetaData(literature.URL);
                        literature.UrlIsValid = fileMetaData.IsValid;
                    }
                }

                return View(BASE_PATH + "Literature/Index.cshtml", literatureHomeViewModel);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return RedirectToAction("InternalServerError", "Error");
            }
        }

        public ActionResult FindLiterature(string searchString)
        {
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            try
            {
                IEnumerable<Literature> literatureList = new List<Literature>().AsEnumerable();
                literatureList = _taxonomyService.SearchLiterature(searchString);
                return PartialView("~/Views/Taxonomy/Citation/_LiteratureSearchResults.cshtml", literatureList);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return RedirectToAction("InternalServerError", "Error");
            }
        }

        
        [HttpGet]
        public PartialViewResult _LiteratureDetail(int id)
        {
            Literature literature = new Literature();
            TaxonomyService taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            try
            {
                literature = taxonomyService.GetLiterature(id); 
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
            }
            return PartialView(BASE_PATH + "Citation/_LiteratureDetail.cshtml", literature);
        }
        

        #endregion Literature

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
            viewModel.Category = folder.Category;
            viewModel.Description = folder.Description;
            viewModel.DataSourceName = folder.DataSourceName;
            viewModel.DataSourceTitle = folder.DataSourceTitle;
            viewModel.IsShared = folder.IsShared;
            viewModel.ModifiedByCooperatorID = folder.ModifiedByCooperatorID;
            viewModel.SearchResults = folder.SearchResults;
            return View(BASE_PATH + "Folder/Edit.cshtml", viewModel);
        }

        #region Geography
        public ActionResult GeographySearch()
        {
            TempData["context"] = "Geography Search";
            GeographySearchViewModel geographySearchViewModel = new GeographySearchViewModel();

            try
            {
                // TO DO

                return View(BASE_PATH + "Geography/Search.cshtml", geographySearchViewModel);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message + ex.StackTrace);
                return RedirectToAction("InternalServerError", "Error");
            }
        }

        public JsonResult MapGeography(string keyValues = "")
        {
            return Json(new { success = true }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetRegions(string continentIds)
        {
            List<Region> regions = new List<Region>();
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            regions = _taxonomyService.SearchRegions(continentIds);
            return Json(regions, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetCountries(string regionIds)
        {
            List<Country> countries = new List<Country>();
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            countries = _taxonomyService.SearchCountries(regionIds);
            return Json(countries, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetMunicipalities(string countryCodes)
        {
            List<Geography> geographies = new List<Geography>();
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            geographies = _taxonomyService.SearchMunicipalities(countryCodes);
            return Json(geographies, JsonRequestBehavior.AllowGet);
        }

        #endregion Geography

        public JsonResult AddToFolder(int folderId, string folderTitle, string folderCategory, string folderDescription, Boolean isShared, string dataSourceName, string dataSourceTitle, string values)
        {
            Folder folder = new Folder();
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            if (folderId == 0)
            {
                folder.Title = folderTitle;
                folder.Category = folderCategory;
                folder.Description = folderDescription;
                folder.Note = folderDescription;
                folder.IsShared = isShared;
                folder.DataSourceName = dataSourceName;
                folder.DataSourceTitle = dataSourceTitle;
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
                Log.Error(ex, "Error");
                return PartialView("~/Views/Error/_Error.cshtml");
            }
        }

        public ActionResult FolderEdit(int id)
        {
            FolderEditViewModel viewModel = new FolderEditViewModel();
            Folder folder = new Folder();
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);
            TempData["context"] = "Edit Folder";

            try
            {
                folder = _taxonomyService.GetFolder(id);
                viewModel.ID = folder.ID;
                viewModel.Title = folder.Title;
                viewModel.Category = folder.Category;
                viewModel.Description = folder.Description;
                viewModel.DataSourceName = folder.DataSourceName;
                viewModel.DataSourceTitle = folder.DataSourceTitle;
                viewModel.IsShared = folder.IsShared;
                viewModel.IsFavorite = folder.IsFavorite;
                viewModel.SearchResults = folder.SearchResults;
                viewModel.CreatedDate = folder.CreatedDate;
                viewModel.CreatedByCooperatorID = folder.CreatedByCooperatorID;
                viewModel.CreatedByCooperatorName = folder.CreatedByCooperatorName;
                viewModel.ModifiedDate = folder.ModifiedDate;
                viewModel.ModifiedByCooperatorID = folder.ModifiedByCooperatorID;
                viewModel.ModifiedByCooperatorName = folder.ModifiedByCooperatorName;
                return View(BASE_PATH + "Folder/Edit.cshtml", viewModel);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return RedirectToAction("InternalServerError", "Error");
            }
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
                folder.Category = viewModel.Category;
                folder.Description = viewModel.Description;
                folder.DataSourceName = viewModel.DataSourceName;
                folder.DataSourceTitle = viewModel.DataSourceTitle;
                folder.IsShared = viewModel.IsShared;
                folder.IsFavorite = viewModel.IsFavorite;
                folder.ModifiedByCooperatorID = AuthenticatedUser.CooperatorID;
                retVal = _taxonomyService.UpdateFolder(folder);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return RedirectToAction("InternalServerError", "Error");
            }
            return RedirectToAction("FolderEdit", "Taxonomy", new { @id = viewModel.ID } );
        }

        public JsonResult FolderAdd(string dataSourceName, string itemIdList)
        {
            return null;
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
                Log.Error(ex, ex.Message);
                return RedirectToAction("InternalServerError", "Error");
            }
            return RedirectToAction("Index", "Taxonomy");
        }

        [HttpPost]
        public PartialViewResult FolderItemList(FormCollection formCollection)
        {
            const string SUB_PATH = "Species/";
            int folderId = 0;
            string dataSourceName = String.Empty;
            string partialViewName = String.Empty;
            FamilyListViewModel familyListViewModel = null;
            GenusListViewModel genusListViewModel = null;
            SpeciesListViewModel speciesListViewModel = null;
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            try
            {
                if (!String.IsNullOrEmpty(formCollection["FolderID"]))
                {
                    folderId = Int32.Parse(formCollection["FolderID"]);
                }
                if (!String.IsNullOrEmpty(formCollection["DataSourceName"]))
                {
                    dataSourceName = formCollection["DataSourceName"];
                }

                switch (dataSourceName)
                {
                    case "taxonomy_family":
                        familyListViewModel = new FamilyListViewModel();
                        familyListViewModel.ReferenceID = folderId;
                        familyListViewModel.Format = 3;
                        familyListViewModel.Action = "Folder";
                        familyListViewModel.Families = _taxonomyService.GetFamilyFolderItems(folderId);
                        return PartialView(BASE_PATH + "Family/_List.cshtml", familyListViewModel);
                    case "taxonomy_genus":
                        genusListViewModel = new GenusListViewModel();
                        genusListViewModel.ReferenceID = folderId;
                        genusListViewModel.Format = 3;
                        genusListViewModel.Action = "Folder";
                        genusListViewModel.Genera = _taxonomyService.GetGenusFolderItems(folderId);
                        return PartialView(BASE_PATH + "Genus/_List.cshtml", genusListViewModel);
                    case "taxonomy_species":
                        speciesListViewModel = new SpeciesListViewModel();
                        speciesListViewModel.ReferenceID = folderId;
                        speciesListViewModel.Format = 3;
                        speciesListViewModel.Action = "Folder";
                        speciesListViewModel.SpeciesList = _taxonomyService.GetSpeciesFolderItems(folderId);
                        return PartialView(BASE_PATH + "Species/_List.cshtml", speciesListViewModel);
                    case "citation":
                        CitationListViewModel citationListViewModel = new CitationListViewModel();
                        citationListViewModel.ReferenceID = folderId;
                        citationListViewModel.Format = 3;
                        citationListViewModel.Action = "Folder";
                        //citationListViewModel.Citations =
                        return PartialView(BASE_PATH + "Citation/_List.cshtml", citationListViewModel);
                    case "literature":
                        
                        
                        
                        
                        
                        return PartialView(BASE_PATH + "Citation/_List.cshtml");
                    case "taxonomy_cwr_crop":
                        CropForCWRListViewModel cropForCWRListViewModel = new CropForCWRListViewModel();
                        cropForCWRListViewModel.ReferenceID = folderId;
                        cropForCWRListViewModel.Format = 3;
                        cropForCWRListViewModel.Action = "Folder";
                        cropForCWRListViewModel.CropsForCWR = _taxonomyService.GetCropForCWRFolderItems(folderId);
                        return PartialView(BASE_PATH + "CropForCWR/_List.cshtml", cropForCWRListViewModel);
                    case "taxonomy_cwr_map":
                        CWRMapListViewModel cwrMapListViewModel = new CWRMapListViewModel();
                        cwrMapListViewModel.ReferenceID = folderId;
                        cwrMapListViewModel.Format = 3;
                        cwrMapListViewModel.Action = "Folder";
                        cwrMapListViewModel.CWRMaps = _taxonomyService.GetCWRMapFolderItems(folderId);
                        return PartialView(BASE_PATH + "CWRMap/_List.cshtml", cwrMapListViewModel);
                    case "taxonomy_cwr_trait":



                        return PartialView(BASE_PATH + "CWRTrait/_List.cshtml", genusListViewModel);
                    case "taxonomy_regulation":



                        return PartialView(BASE_PATH + "Regulation/_List.cshtml", genusListViewModel);
                    case "taxonomy_regulation_map":



                        return PartialView(BASE_PATH + "Regulation/RegulationMap/_List.cshtml", genusListViewModel);
                }
                return PartialView(BASE_PATH + partialViewName);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return PartialView("~/Views/Error/_Error.cshtml");
            }
        }

        public JsonResult FolderItemDelete(int id)
        {
            int retVal = 0;
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            try
            {
                retVal = _taxonomyService.DeleteFolderItem(id);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return Json(new { success = false }, JsonRequestBehavior.AllowGet);
            }
            return Json(new { success = true }, JsonRequestBehavior.AllowGet);
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
                Log.Error(ex, ex.Message);
                return PartialView("~/Views/Error/_Error.cshtml");
            }
        }

        private string GetViewName(string dataSource)
        {
            switch (dataSource)
            {
                case "taxonomy_cwr_crop":
                    return "_CropForCWRItemList.cshtml";
                case "taxonomy_cwr_map":
                    return "_CWRMapItemList.cshtml";
                case "taxonomy_cwr_trait":
                    return "_CWRTraitItemList.cshtml";
                case "taxonomy_species":
                    return "_SpeciesItemList.cshtml";
                case "taxonomy_genus":
                    return "_GenusItemList.cshtml";
                case "taxonomy_family":
                    return "_FamilyItemList.cshtml";
                case "citation":
                    return "_CitationItemList.cshtml";
                case "literature":
                    return "_LiteratureItemList.cshtml";
                default:
                    return String.Empty;
            }
        }

        #endregion

        #region Regulation

        public ActionResult RegulationHome()
        {
            TempData["page_title"] = "Regulation";
            RegulationHomeViewModel viewModel = new RegulationHomeViewModel();
            return View("~/Views/Taxonomy/Regulation/Index.cshtml", viewModel);
        }

        public ActionResult RegulationEdit(int id)
        {
            //TODO
            return View("~/Views/Taxonomy/Regulation/Edit.cshtml");
        }
        public ActionResult RegulationEdit(RegulationEditViewModel viewModel)
        {
            //TODO
            return View("~/Views/Taxonomy/Regulation/Edit.cshtml");
        }

        public ActionResult RegulationMapHome()
        {
            TempData["page_title"] = "Regulation Map";
            return View("Index.cshtml");
        }
        #endregion

        #region Geography

        public ActionResult Search()
        {
            return View(BASE_PATH + "Geography/Search.cshtml");
        }

        #endregion

        #region Modals
        public PartialViewResult _FolderModal(string dataSourceName, string idList)
        {
            FolderEditViewModel folderEditViewModel = new FolderEditViewModel();
            try
            {

            }
            catch (Exception ex)
            {

            }
            return PartialView(BASE_PATH + "Shared/Modals/_FolderEditModal.cshtml", folderEditViewModel);
        }

        public PartialViewResult _CitationSearchModal(int taxonId, string dataSourceName)
        {
            CitationSearchViewModel citationSearchViewModel = new CitationSearchViewModel();
            try 
            {
                citationSearchViewModel.FamilyID = taxonId;
                citationSearchViewModel.DataSourceName = dataSourceName;
            }
            catch (Exception ex)
            { 
            
            }
            return PartialView(BASE_PATH + "Shared/Modals/_CitationSearchModal.cshtml", citationSearchViewModel);
        }

        public PartialViewResult _FamilySearchModal()
        {
            FamilyListViewModel familyListViewModel = new FamilyListViewModel();
            try
            {

            }
            catch (Exception ex)
            {

            }
            return PartialView(BASE_PATH + "Shared/Modals/_FamilySearchModal.cshtml", familyListViewModel);
        }

        public PartialViewResult _GenusSearchModal()
        {
            GenusListViewModel genusListViewModel = new GenusListViewModel();
            try
            {

            }
            catch (Exception ex)
            {

            }
            return PartialView(BASE_PATH + "Shared/Modals/_GenusSearchModal.cshtml", genusListViewModel);
        }

        public PartialViewResult _SpeciesSearchModal()
        {
            SpeciesListViewModel speciesListViewModel = new SpeciesListViewModel();
            try
            {

            }
            catch (Exception ex)
            {

            }
            return PartialView(BASE_PATH + "Shared/Modals/_SpeciesSearchModal.cshtml", speciesListViewModel);
        }

        public PartialViewResult _CropForCWRSearchModal()
        {
            return PartialView(BASE_PATH + "Shared/Modals/_CropForCWRSearchModal.cshtml");
        }

        public PartialViewResult _AuthorSearchModal()
        {
            try
            {

            }
            catch (Exception ex)
            {

            }
            return PartialView(BASE_PATH + "Shared/Modals/_AuthorSearchModal.cshtml");
        }

        public PartialViewResult _ProtologueSearchModal()
        {
            try
            {

            }
            catch (Exception ex)
            {

            }
            return PartialView(BASE_PATH + "Shared/Modals/_ProtologueSearchModal.cshtml");
        }

        public PartialViewResult _NoteSearchModal()
        {
            try
            {

            }
            catch (Exception ex)
            {

            }
            return PartialView(BASE_PATH + "Shared/Modals/_NoteSearchModal.cshtml");
        }

        #endregion 

        #region Reference
        public ActionResult NoteSearch(string dataSourceName, string searchText)
        {
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            try
            {
                IEnumerable<Note> noteList = new List<Note>().AsEnumerable();
                noteList = _taxonomyService.NoteSearch(dataSourceName, searchText);
                return PartialView(BASE_PATH + "Shared/Modals/_NoteSearchResultsList.cshtml", noteList);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return RedirectToAction("InternalServerError", "Error");
            }
        }

        public ActionResult AuthoritySearch(string dataSourceName, string searchText)
        {
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            try
            {
                IEnumerable<Authority> authorList = new List<Authority>().AsEnumerable();
                authorList = _taxonomyService.AuthoritySearch(dataSourceName, searchText);
                return PartialView(BASE_PATH + "Shared/Modals/_AuthorSearchResultsList.cshtml", authorList);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return RedirectToAction("InternalServerError", "Error");
            }
        }

        public ActionResult ProtologueSearch(string searchText)
        {
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            try
            {
                IEnumerable<Protologue> protologues = new List<Protologue>().AsEnumerable();
                protologues = _taxonomyService.ProtologueSearch(searchText);
                return PartialView(BASE_PATH + "Shared/Modals/_ProtologueSearchResultsList.cshtml", protologues);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return PartialView("~/Views/Error/_Error.cshtml");
            }
        }

        #endregion

        #region Proof of Concept

        public ActionResult Explorer()
        {
            return View(BASE_PATH + "Explorer.cshtml");
        }

        #endregion
    }
}