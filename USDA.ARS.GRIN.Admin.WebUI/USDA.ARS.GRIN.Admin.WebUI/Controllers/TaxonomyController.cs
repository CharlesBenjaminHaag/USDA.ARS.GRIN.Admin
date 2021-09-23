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
                TempData["page_title"] = AuthenticatedUserSession.Application.Title + " Search";
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

        //[Route("Taxonomy/CropForCWR/Home")]
        public ActionResult CropForCWRSearch()
        {
            TempData["page_title"] = "Crop For CWR Search";
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
                if (id > 0)
                {
                    TempData["page_title"] = "Edit Crop for CWR";
                    
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
                    TempData["page_title"] = "Add Crop for CWR";
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

        public ActionResult CWRMapSearch()
        {
            CWRMapHomeViewModel cWRMapHomeViewModel = new CWRMapHomeViewModel();
            TaxonomyService taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            try
            {
                TempData["page_title"] = "CWR Map Search";
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
            CWRMapEditViewModel cwrMapEditViewModel = new CWRMapEditViewModel();
           
            try
            {
                cwrMapEditViewModel.CropForCWRID = cropForCwrId;
                cwrMapEditViewModel.GenepoolCodes = new SelectList(taxonomyService.GetGenePoolCodes(), "CodeValue", "Title");

                if (cwrMapId > 0)
                {
                    TempData["page_title"] = "Edit CWR Map";

                    CWRMap cwrMap = taxonomyService.GetCWRMap(cwrMapId);
                    cwrMapEditViewModel.ID = cwrMap.ID;
                    cwrMapEditViewModel.CropForCWRID = cwrMap.CropForCWRID;
                    cwrMapEditViewModel.CropForCWRName = cwrMap.CropForCWRName;
                    cwrMapEditViewModel.SpeciesID = cwrMap.SpeciesID;
                    cwrMapEditViewModel.SpeciesName = cwrMap.SpeciesName;
                    cwrMapEditViewModel.CropCommonName = cwrMap.CommonName;
                    cwrMapEditViewModel.GenepoolCode = cwrMap.GenepoolCode;
                    cwrMapEditViewModel.IsCrop = cwrMap.IsCrop;
                    cwrMapEditViewModel.IsGraftStock = cwrMap.IsGraftStock;
                    cwrMapEditViewModel.IsPotential = cwrMap.IsPotential;
                    cwrMapEditViewModel.Note = cwrMap.Note;
                    cwrMapEditViewModel.CitationID = cwrMap.CitationID;
                    cwrMapEditViewModel.CreatedDate = cwrMap.CreatedDate;
                    cwrMapEditViewModel.CreatedByCooperatorID = cwrMap.CreatedByCooperatorID;
                    cwrMapEditViewModel.CreatedByCooperatorName = cwrMap.CreatedByCooperatorName;
                    cwrMapEditViewModel.ModifiedDate = cwrMap.ModifiedDate;
                    cwrMapEditViewModel.ModifiedByCooperatorID = cwrMap.ModifiedByCooperatorID;
                    cwrMapEditViewModel.ModifiedByCooperatorName = cwrMap.ModifiedByCooperatorName;
                }
                else
                {
                    cwrMapEditViewModel.CropForCWRID = cropForCwrId;
                    TempData["page_title"] = "Add CWR Map";
                }
                return View("~/Views/Taxonomy/CWRMap/Edit.cshtml", cwrMapEditViewModel);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return RedirectToAction("InternalServerError", "Error");
            }
        }

        public PartialViewResult _CWRMapWidget(int id)
        {
            TaxonomyService taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);
            CWRMapEditViewModel cwrMapEditViewModel = new CWRMapEditViewModel();

            try
            {
                CWRMap cwrMap = taxonomyService.GetCWRMap(id);
                cwrMapEditViewModel.ID = cwrMap.ID;
                cwrMapEditViewModel.CropForCWRID = cwrMap.CropForCWRID;
                cwrMapEditViewModel.CropForCWRName = cwrMap.CropForCWRName;
                cwrMapEditViewModel.SpeciesID = cwrMap.SpeciesID;
                cwrMapEditViewModel.SpeciesName = cwrMap.SpeciesName;
                cwrMapEditViewModel.CropCommonName = cwrMap.CommonName;
                //cwrMapEditViewModel.GenepoolCode = cwrMap.GenepoolCode;
                //cwrMapEditViewModel.IsCrop = cwrMap.IsCrop;
                //cwrMapEditViewModel.IsGraftStock = cwrMap.IsGraftStock;
                //cwrMapEditViewModel.IsPotential = cwrMap.IsPotential;
                //cwrMapEditViewModel.Note = cwrMap.Note;
                //cwrMapEditViewModel.CitationID = cwrMap.CitationID;
                //cwrMapEditViewModel.CreatedDate = cwrMap.CreatedDate;
                //cwrMapEditViewModel.CreatedByCooperatorID = cwrMap.CreatedByCooperatorID;
                //cwrMapEditViewModel.CreatedByCooperatorName = cwrMap.CreatedByCooperatorName;
                //cwrMapEditViewModel.ModifiedDate = cwrMap.ModifiedDate;
                //cwrMapEditViewModel.ModifiedByCooperatorID = cwrMap.ModifiedByCooperatorID;
                //cwrMapEditViewModel.ModifiedByCooperatorName = cwrMap.ModifiedByCooperatorName;
                return PartialView(BASE_PATH + "CWRMap/_Widget.cshtml", cwrMapEditViewModel);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return PartialView("~/Views/Error/_Error.cshtml");
            }
        }


        [HttpPost]
        public ActionResult CWRMapEdit(CWRMapEditViewModel viewModel)
        {
            CWRMap cwrMap = new CWRMap();
            ResultContainer resultContainer = null;
            TaxonomyService taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            
            try
            {
                cwrMap.ID = viewModel.ID;
                cwrMap.SpeciesID = viewModel.SpeciesID;
                cwrMap.CropForCWRID = viewModel.CropForCWRID;
                cwrMap.CommonName = viewModel.CropCommonName;
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
            TempData["page_title"] = "Crop Mapper";
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

        public ActionResult CWRTraitSearch()
        {
            CWRTraitHomeViewModel cwrTraitHomeViewModel = new CWRTraitHomeViewModel();
            TaxonomyService taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            try
            {
                TempData["page_title"] = "CWR Trait Search";
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

        [HttpPost]
        public ActionResult CWRTraitSearch(FormCollection formCollection)
        {
            string resultsFormat = String.Empty;
            string resultsViewName = "CWRTrait/_List.cshtml";
            Query query = new Query();
            TaxonomyService taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);
            CWRTraitListViewModel cwrTraitListViewModel = new CWRTraitListViewModel();

            try
            {
                if (!String.IsNullOrEmpty(formCollection["CreatedByCooperatorID"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "created_by", SearchOperatorCode = "=", FieldValue = formCollection["CreatedByCooperatorID"], DataType = "INT" });
                }

                if (!String.IsNullOrEmpty(formCollection["CropForCWRID"]))
                {
                    if (Int32.Parse(formCollection["CropForCWRID"]) > 0)
                    {
                        query.QueryCriteria.Add(new QueryCriterion { FieldName = "taxonomy_cwr_crop_id", SearchOperatorCode = "=", FieldValue = formCollection["CropForCWRID"], DataType = "INT" });
                    }
                }

                if (!String.IsNullOrEmpty(formCollection["SpeciesID"]))
                {
                    if (Int32.Parse(formCollection["SpeciesID"]) > 0)
                    {
                        query.QueryCriteria.Add(new QueryCriterion { FieldName = "taxonomy_species_id", SearchOperatorCode = "=", FieldValue = formCollection["SpeciesID"], DataType = "INT" });
                    }
                }

                if (!String.IsNullOrEmpty(formCollection["TraitClassCode"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "trait_class_code", SearchOperatorCode = "=", FieldValue = formCollection["TraitClassCode"], DataType = "NVARCHAR" });
                }

                if (!String.IsNullOrEmpty(formCollection["IsPotential"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "is_potential", SearchOperatorCode = "=", FieldValue = formCollection["IsPotential"], DataType = "NVARCHAR" });
                }

                if (!String.IsNullOrEmpty(formCollection["BreedingTypeCode"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "breeding_type_code", SearchOperatorCode = "=", FieldValue = formCollection["BreedingTypeCode"], DataType = "NVARCHAR" });
                }

                if (!String.IsNullOrEmpty(formCollection["BreedingUsageNote"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "breeding_usage_note", SearchOperatorCode = "LIKE", FieldValue = formCollection["BreedingUsageNote"], DataType = "NVARCHAR" });
                }

                if (!String.IsNullOrEmpty(formCollection["OntologyTraitIdentifier"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "ontology_trait_identifier", SearchOperatorCode = "=", FieldValue = formCollection["OntologyTraitIdentifier"], DataType = "NVARCHAR" });
                }

                if (!String.IsNullOrEmpty(formCollection["Note"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "note", SearchOperatorCode = "LIKE", FieldValue = formCollection["Note"], DataType = "NVARCHAR" });
                }

                if (!String.IsNullOrEmpty(formCollection["ResultsFormat"]))
                {
                    resultsFormat = formCollection["ResultsFormat"];
                    if (resultsFormat == "2")
                        resultsViewName = "CWRTrait/_SelectList.cshtml";
                }

                cwrTraitListViewModel.CWRTraits = taxonomyService.CWRTraitSearch(query);
                return PartialView(BASE_PATH + resultsViewName, cwrTraitListViewModel);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return PartialView("~/Views/Error/_Error.cshtml");
            }
        }
        public PartialViewResult _CWRTraitEditModal()
        {
            TaxonomyService taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);
            CWRTraitEditViewModel cWRTraitEditViewModel = new CWRTraitEditViewModel();

            try
            {
                cWRTraitEditViewModel.TraitClassCodes = new SelectList(taxonomyService.GetTraitClassCodes(), "CodeValue", "Title");
                cWRTraitEditViewModel.BreedingTypeCodes = new SelectList(taxonomyService.GetBreedingTypeCodes(), "CodeValue", "Title");
                return PartialView(BASE_PATH + "CWRTrait/_Edit.cshtml", cWRTraitEditViewModel);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return PartialView("~/Views/Error/_Error.cshtml");
            }
        }

        public ActionResult CWRTraitEdit(int speciesId = 0, int cropForCwrId = 0, int cwrMapId = 0, int cwrTraitId = 0)
        {
            CWRTraitEditViewModel cwrTraitViewModel = null;
            CWRTrait cwrTrait = new CWRTrait();
            TaxonomyService taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            try
            {
                cwrTraitViewModel = new CWRTraitEditViewModel();
                cwrTraitViewModel.ID = cwrTraitId;
                cwrTraitViewModel.CropForCWRID = cropForCwrId;
                cwrTraitViewModel.TraitClassCodes = new SelectList(taxonomyService.GetTraitClassCodes(),"CodeValue","Title");
                cwrTraitViewModel.BreedingTypeCodes = new SelectList(taxonomyService.GetBreedingTypeCodes(), "CodeValue", "Title");
                cwrTraitViewModel.CWRMap = taxonomyService.GetCWRMap(cwrMapId);
                
                cwrTraitViewModel.CWRMapID = cwrMapId;
                if (cwrTraitId > 0)
                {
                    TempData["page_title"] = String.Format("Edit CWR Trait [{0}]", cwrTraitViewModel.ID);
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
                }
                else
                {
                    TempData["page_title"] = "Add CWR Trait";
                    cwrTraitViewModel.CropForCWRID = cropForCwrId;
                    cwrTraitViewModel.SpeciesID = speciesId;
                }
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

        //public JsonResult ApplyCWRTrait(string traitClassCode, string breedingTypeCode, string breedingUsageNote, string ontologyTraitIdentifier, string cwrMapIdList)
        //{
        //    TaxonomyService taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

        //    string[] valueList = cwrMapIdList.Split(',');
        //    foreach (var cwrMapId in valueList)
        //    {
        //        taxonomyService.AddCropTrait(new CWRTrait { CWRMapID = Int32.Parse(cwrMapId), TraitClassCode = traitClassCode, BreedingTypeCode = breedingTypeCode, BreedingUsageNote = breedingUsageNote, OntologyTraitIdentifier = ontologyTraitIdentifier, CreatedByCooperatorID = AuthenticatedUser.CooperatorID });
        //    }
        //    return Json(new { success = true }, JsonRequestBehavior.AllowGet);
        //}

        [HttpPost]
        public JsonResult AddCWRTrait(FormCollection formCollection)
        {
            CWRTrait cWRTrait = new CWRTrait();
            TaxonomyService taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);
            string[] cWRMapIdList = formCollection["CWRMapIDList"].Split(',');

            cWRTrait.TraitClassCode = formCollection["TraitClassCode"];
            cWRTrait.BreedingTypeCode = formCollection["BreedingTypeCode"];
            cWRTrait.BreedingUsageNote = formCollection["BreedingUsageNote"];
            cWRTrait.OntologyTraitIdentifier = formCollection["OntologyTraitIdentifier"];

            foreach (var cwrMapId in cWRMapIdList)
            {
                cWRTrait.CWRMapID = Int32.Parse(cwrMapId);
                cWRTrait.CreatedByCooperatorID = AuthenticatedUser.CooperatorID;
                taxonomyService.AddCropTrait(cWRTrait);
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
            TempData["page_title"] = "Family Search";
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
                    TempData["page_title"] = String.Format("Edit Family [{0}]", id);
                    family = taxonomyService.GetFamily(id);
                    familyEditViewModel = new FamilyEditViewModel(family);
                }
                else
                {
                    TempData["page_title"] = "Add Family";
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
            TempData["page_title"] = "Genus Search";
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
                        TempData["page_title"] = "Add Genus Synonym";
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
                        TempData["page_title"] = "Add Genus";
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
            TempData["page_title"] = "Species Search";
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
                                    TempData["page_title"] = "Add Subvariety";
                                    break;
                                case "var":
                                    TempData["page_title"] = "Add Variety";
                                    break;
                                case "for":
                                    TempData["page_title"] = "Add Form";
                                    break;
                            }
                        }
                        else
                        {
                            TempData["page_title"] = "Add Species Synonym";
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
                        TempData["page_title"] = "Add Species";
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

        public PartialViewResult _SpeciesWidget(int id)
        {
            Species species = new Species();
            SpeciesEditViewModel speciesEditViewModel = null;
            TaxonomyService taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            try
            {
                species = taxonomyService.GetSpecies(id);
                speciesEditViewModel = new SpeciesEditViewModel(species);
                return PartialView(BASE_PATH + "Species/_Widget.cshtml", speciesEditViewModel);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return PartialView("~/Views/Error/_Error.cshtml");
            }
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

        #region Common Name

        //TODO

        public ActionResult CommonNameHome()
        {
            return View(BASE_PATH + "Species/CommonName/Index.cshtml");
        }

        #endregion

        #region Economic Use
        //TODO
        public ActionResult EconomicUseHome()
        {
            return View(BASE_PATH + "Species/EconomicUse/Index.cshtml");
        }

        #endregion

        #region Geography Map
        //TODO
        public ActionResult GeographyMapHome()
        {
            return View(BASE_PATH + "Species/GeographyMap/Index.cshtml");
        }

        #endregion

        #region Author
        //TODO
        public ActionResult AuthorHome()
        {
            return View(BASE_PATH + "Author/Index.cshtml");
        }
        #endregion

        #region Citation
        public ActionResult CitationHome()
        {
            CitationHomeViewModel citationHomeViewModel = new CitationHomeViewModel();
            TaxonomyService taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            try
            {
                TempData["page_title"] = "Citation Search";
                citationHomeViewModel.DataSourceName = "citation";
                citationHomeViewModel.Cooperators = new SelectList(taxonomyService.GetCreatedByCooperators(citationHomeViewModel.DataSourceName), "ID", "FullName");
                citationHomeViewModel.CitationTypeCodes = new SelectList(taxonomyService.GetCodeValues("CITATION_TYPE"),"CodeValue","CodeValue");
                citationHomeViewModel.DefaultCooperatorID = AuthenticatedUser.CooperatorID;
                return View(BASE_PATH + "Citation/Index.cshtml", citationHomeViewModel);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return RedirectToAction("InternalServerError", "Error");
            }
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

                if ((!String.IsNullOrEmpty(formCollection["FamilyID"])) && (Int32.Parse(formCollection["FamilyID"]) > 0))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "taxonomy_family_id", SearchOperatorCode = "=", FieldValue = formCollection["FamilyID"], DataType = "INT" });
                }

                if ((!String.IsNullOrEmpty(formCollection["GenusID"])) && (Int32.Parse(formCollection["GenusID"]) > 0))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "taxonomy_genus_id", SearchOperatorCode = "=", FieldValue = formCollection["GenusID"], DataType = "INT" });
                }

                if ((!String.IsNullOrEmpty(formCollection["SpeciesID"])) && (Int32.Parse(formCollection["SpeciesID"]) > 0))
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

                if (!String.IsNullOrEmpty(formCollection["Abbreviation"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "abbreviation", SearchOperatorCode = "LIKE", FieldValue = formCollection["Abbreviation"], DataType = "NVARCHAR" });
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "standard_abbreviation", SearchOperatorCode = "LIKE", FieldValue = formCollection["Abbreviation"], DataType = "NVARCHAR", LogicalOperator = "OR" });
                }

                if (!String.IsNullOrEmpty(formCollection["Author"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = " editor_author_name", SearchOperatorCode = "LIKE", FieldValue = formCollection["Author"], DataType = "NVARCHAR" });
                }

                if (!String.IsNullOrEmpty(formCollection["Title"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "reference_title", SearchOperatorCode = "LIKE", FieldValue = formCollection["Title"], DataType = "NVARCHAR" });
                }

                if (!String.IsNullOrEmpty(formCollection["Year"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "publication_year", SearchOperatorCode = "LIKE", FieldValue = formCollection["Year"], DataType = "NVARCHAR" });
                }

                if (!String.IsNullOrEmpty(formCollection["Note"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "note", SearchOperatorCode = "LIKE", FieldValue = formCollection["Note"], DataType = "NVARCHAR" });
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

        public ActionResult CitationEdit(int id = 0)
        {
            TempData["page_title"] = "Edit Citation";
            CitationViewModel viewModel = new CitationViewModel();
            Citation citation = new Citation();
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            try
            {
                if (id > 0)
                {
                    TempData["page_title"] = "Edit Citation";
                    citation = _taxonomyService.GetCitation(id);
                    viewModel.ID = citation.ID;
                    viewModel.LiteratureID = citation.LiteratureID;
                    viewModel.LiteratureReferenceTitle = citation.LiteratureReferenceTitle;
                    viewModel.CitationTitle = citation.CitationTitle;
                    viewModel.AuthorName = citation.LiteratureEditorAuthorName;
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
                    viewModel.RelatedSpecies = _taxonomyService.GetSpecies(citation.SpeciesID);
                }
                else
                {
                    TempData["page_title"] = "Add  Citation";
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
            TempData["page_title"] = "Edit Citation";
            Citation citation = new Citation();
            ResultContainer resultContainer = null;
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            try
            {
                citation.ID = viewModel.ID;
                citation.LiteratureID = viewModel.LiteratureID;
                citation.Title = viewModel.CitationTitle;
                citation.LiteratureEditorAuthorName = viewModel.AuthorName;
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
            return RedirectToAction("CitationEdit", "Taxonomy", new { id = viewModel.ID });

        }

        public PartialViewResult CitationDetail(int citationId)
        {
            Citation citation = new Citation();

            return PartialView("~/Views/Taxonomy/Citation/_Detail.cshtml", citation);
        }

        #endregion

        #region Literature

        public ActionResult LiteratureHome()
        {
            TempData["page_title"] = "Literature";
            TaxonomyService taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);
            LiteratureHomeViewModel literatureHomeViewModel = new LiteratureHomeViewModel();
         
            try
            {
                List<CodeValueReferenceItem> literatureTypeCodes = taxonomyService.GetCodeValues("LITERATURE_TYPE");
                literatureHomeViewModel.TypeCodes = new SelectList(literatureTypeCodes, "CodeValue", "Title");
                return View(BASE_PATH + "Citation/Literature/Index.cshtml", literatureHomeViewModel);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return RedirectToAction("InternalServerError", "Error");
            }
        }

        public PartialViewResult _LiteratureSearch()
        {
            LiteratureHomeViewModel literatureHomeViewModel = new LiteratureHomeViewModel();
            try
            {

            }
            catch (Exception ex)
            {

            }
            return PartialView(BASE_PATH + "Citation/Literature/_Search.cshtml", literatureHomeViewModel);
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
                    TempData["page_title"] = "Edit Literature";
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
                    TempData["page_title"] = "Add Literature";
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
        public PartialViewResult LiteratureSearch(FormCollection formCollection)
        {
            LiteratureListViewModel literatureListViewModel = new LiteratureListViewModel();
            Query query = new Query();
            QueryCriterion queryCriterion = null;
            TaxonomyService taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            try
            {
                if (!String.IsNullOrEmpty(formCollection["SearchText"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "abbreviation", SearchOperatorCode = "LIKE", FieldValue = formCollection["SearchText"], DataType = "NVARCHAR", LogicalOperator="OR" });
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "standard_abbreviation", SearchOperatorCode = "LIKE", FieldValue = formCollection["SearchText"], DataType = "NVARCHAR", LogicalOperator = "OR" });
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "reference_title", SearchOperatorCode = "LIKE", FieldValue = formCollection["SearchText"], DataType = "NVARCHAR", LogicalOperator = "OR" });
                }

                if (!String.IsNullOrEmpty(formCollection["Abbreviation"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "abbreviation", SearchOperatorCode = "LIKE", FieldValue = formCollection["Abbreviation"], DataType = "NVARCHAR" });
                }

                if (!String.IsNullOrEmpty(formCollection["StandardAbbreviation"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "standard_abbreviation", SearchOperatorCode = "LIKE", FieldValue = formCollection["StandardAbbreviation"], DataType = "NVARCHAR" });
                }

                if (!String.IsNullOrEmpty(formCollection["ReferenceTitle"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "reference_title", SearchOperatorCode = "LIKE", FieldValue = formCollection["ReferenceTitle"], DataType = "NVARCHAR" });
                }

                if (!String.IsNullOrEmpty(formCollection["EditorAuthorName"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "editor_author_name", SearchOperatorCode = "LIKE", FieldValue = formCollection["EditorAuthorName"], DataType = "NVARCHAR" });
                }

                if (!String.IsNullOrEmpty(formCollection["TypeCode"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "literature_type_code", SearchOperatorCode = "=", FieldValue = formCollection["TypeCode"], DataType = "NVARCHAR" });
                }

                if (!String.IsNullOrEmpty(formCollection["ResultsFormat"]))
                {
                    literatureListViewModel.Format = Int32.Parse(formCollection["ResultsFormat"]);
                    if (literatureListViewModel.Format == 2)
                        literatureListViewModel.ListViewName = "Citation/Literature/_SelectList.cshtml";
                }
                literatureListViewModel.LiteratureList = taxonomyService.SearchLiterature(query);
                return PartialView(BASE_PATH + literatureListViewModel.ListViewName, literatureListViewModel);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return PartialView("~/Views/Error/_Error.cshtml");
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
            TempData["page_title"] = "Geography Search";
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
            TempData["page_title"] = "Edit Folder";

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
                        citationListViewModel.Citations = _taxonomyService.GetCitationFolderItems(folderId);
                        return PartialView(BASE_PATH + "Citation/_List.cshtml", citationListViewModel);
                    case "literature":
                        LiteratureListViewModel literatureListViewModel = new LiteratureListViewModel();
                        literatureListViewModel.ReferenceID = folderId;
                        literatureListViewModel.Format = 3;
                        literatureListViewModel.Action = "Folder";
                        literatureListViewModel.LiteratureList = _taxonomyService.GetLiteratureFolderItems(folderId);
                        return PartialView(BASE_PATH + "Citation/Literature/_List.cshtml", literatureListViewModel);
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
                        CWRTraitListViewModel cwrTraitListViewModel = new CWRTraitListViewModel();
                        cwrTraitListViewModel.ReferenceID = folderId;
                        cwrTraitListViewModel.Format = 3;
                        cwrTraitListViewModel.Action = "Folder";
                        cwrTraitListViewModel.CWRTraits = _taxonomyService.GetCWRTraitFolderItems(folderId);
                        return PartialView(BASE_PATH + "CWRTrait/_List.cshtml", cwrTraitListViewModel);
                    case "taxonomy_regulation":
                        RegulationListViewModel regulationListViewModel = new RegulationListViewModel();
                        regulationListViewModel.ReferenceID = folderId;
                        regulationListViewModel.Format = 3;
                        regulationListViewModel.Action = "Folder";
                        regulationListViewModel.Regulations = _taxonomyService.GetRegulationFolderItems(folderId); 
                        return PartialView(BASE_PATH + "Regulation/_List.cshtml", regulationListViewModel);
                    case "taxonomy_regulation_map":
                        //TODO
                        return PartialView(BASE_PATH + "Regulation/RegulationMap/_List.cshtml", genusListViewModel);
                    case "taxonomy_common_name":
                        //TODO
                        return PartialView(BASE_PATH + "CommonName/_List.cshtml", genusListViewModel);
                    case "taxonomy_use":
                        //TODO
                        return PartialView(BASE_PATH + "Species/Use/_List.cshtml", genusListViewModel);
                    case "taxonomy_geography_map":
                        //TODO
                        return PartialView(BASE_PATH + "Species/GeographyMap/_List.cshtml", genusListViewModel);
                    case "taxonomy_ista_seed":
                        //TODO
                        return PartialView(BASE_PATH + "Species/ISTASeed/_List.cshtml", genusListViewModel);
                    case "author":
                        //TODO
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

        public ActionResult RegulationSearch()
        {
            TempData["page_title"] = "Regulation";
            TaxonomyService taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);
            RegulationHomeViewModel regulationHomeViewModel = new RegulationHomeViewModel();

            try
            {
                regulationHomeViewModel.DataSourceName = "taxonomy_regulation";
                regulationHomeViewModel.Cooperators = new SelectList(taxonomyService.GetCreatedByCooperators("taxonomy_regulation"), "ID", "FullName");
                regulationHomeViewModel.RegulationLevelCodes = new SelectList(taxonomyService.GetCodeValues("TAXONOMY_NOXIOUS_LEVEL"), "CodeValue", "Title");
                regulationHomeViewModel.RegulationTypeCodes = new SelectList(taxonomyService.GetCodeValues("TAXONOMY_NOXIOUS_TYPE"), "CodeValue", "Title");
                return View(BASE_PATH + "Regulation/Index.cshtml", regulationHomeViewModel);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return RedirectToAction("InternalServerError", "Error");
            }
        }

        [HttpPost]
        public ActionResult RegulationSearch(FormCollection formCollection)
        {
            string resultsViewName = "Regulation/_List.cshtml";
            string resultsFormat = String.Empty;
            string dataSourceIdFieldName = String.Empty;
            Query query = new Query();
            TaxonomyService taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);
            RegulationListViewModel regulationListViewModel = new RegulationListViewModel();

            try
            {
                if (!String.IsNullOrEmpty(formCollection["CreatedByCooperatorID"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "created_by", SearchOperatorCode = "=", FieldValue = formCollection["CreatedByCooperatorID"], DataType = "INT" });
                }

                if (!String.IsNullOrEmpty(formCollection["RegulationTypeCode"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "regulation_type_code", SearchOperatorCode = "=", FieldValue = formCollection["RegulationTypeCode"], DataType = "NVARCHAR" });
                }

                if (!String.IsNullOrEmpty(formCollection["RegulationLevelCode"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "regulation_level_code", SearchOperatorCode = "=", FieldValue = formCollection["RegulationLevelCode"], DataType = "NVARCHAR" });
                }

                if (!String.IsNullOrEmpty(formCollection["Description"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "description", SearchOperatorCode = "LIKE", FieldValue = formCollection["Description"], DataType = "NVARCHAR" });
                }

                if (!String.IsNullOrEmpty(formCollection["URL"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "url_1", SearchOperatorCode = "LIKE", FieldValue = formCollection["URL"], DataType = "NVARCHAR" });
                }

                if (!String.IsNullOrEmpty(formCollection["Note"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "note", SearchOperatorCode = "LIKE", FieldValue = formCollection["Note"], DataType = "NVARCHAR" });
                }

                if (!String.IsNullOrEmpty(formCollection["ResultsFormat"]))
                {
                    resultsFormat = formCollection["ResultsFormat"];
                    if (resultsFormat == "2")
                        resultsViewName = "Regulation/_SelectList.cshtml";
                }
                regulationListViewModel.Regulations = taxonomyService.RegulationSearch(query); 
                return PartialView(BASE_PATH + resultsViewName, regulationListViewModel);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return PartialView("~/Views/Error/_Error.cshtml");
            }
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

        public ActionResult RegulationMapSearch()
        {
            TempData["page_title"] = "Regulation Map";
            return View(BASE_PATH + "/Regulation/RegulationMap/Index.cshtml");
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