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
    public class SpeciesController : BaseController
    {
        const string BASE_PATH = "~/Views/Taxonomy/Species";
        private static readonly Logger Log = LogManager.GetCurrentClassLogger();

        // GET: Species
        [Route("taxonomy/species/home")]
        public ActionResult Index()
        {
            SpeciesHomeViewModel viewModel = new SpeciesHomeViewModel();

            try
            {
                TempData["context"] = "Species";
                return View(BASE_PATH + "/Index.cshtml", viewModel);
            }
            catch (Exception ex)
            {
                Log.Error(ex, "Species Controller");
                return RedirectToAction("InternalServerError", "Error");
            }
        }

        [Route("taxonomy/species/edit/{id}")]
        public ActionResult Edit(int id = 0)
        {
            Species species = null;
            SpeciesEditViewModel viewModel = null;

            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            try
            {
                if (id > 0)
                {
                    TempData["context"] = "Edit Species";
                    species = _taxonomyService.GetSpecies(id);
                    viewModel = new SpeciesEditViewModel();
                    viewModel.ID = species.ID;
                    viewModel.CurrentTaxonomySpeciesID = species.CurrentTaxonomySpeciesID;
                    viewModel.NomenNumber = species.NomenNumber;
                    viewModel.IsSpecificHybrid = species.IsSpecificHybrid;
                    viewModel.SpeciesName = species.SpeciesName;
                    viewModel.Name = species.Name;
                    viewModel.IsAcceptedName = species.IsAcceptedName;
                    viewModel.Authority = species.Authority;
                    viewModel.IsSubSpecificHybrid = species.IsSubSpecificHybrid;
                    viewModel.SubSpeciesName = species.SubSpeciesName;
                    viewModel.SubSpeciesAuthority = species.SubSpeciesAuthority;
                    viewModel.IsVarietalHybrid = species.IsVarietalHybrid;
                    viewModel.VarietyName = species.VarietyName;
                    viewModel.VarietyAuthority = species.VarietyAuthority;
                    viewModel.FormaName = species.FormaName;
                    viewModel.FormaAuthority = species.FormaAuthority;
                    viewModel.FormaRankType = species.FormaRankType;
                    viewModel.GenusID = species.GenusID;
                    viewModel.GenusName = species.GenusName;
                    viewModel.Protologue = species.Protologue;
                    viewModel.NameAuthority = species.NameAuthority;
                    viewModel.GenusID = species.GenusID;
                    viewModel.GenusName = species.GenusName;
                    viewModel.Authority = species.Authority;
                    viewModel.CreatedDate = species.CreatedDate;
                    viewModel.CreatedByCooperatorID = species.CreatedByCooperatorID;
                    viewModel.CreatedByCooperatorName = species.CreatedByCooperatorName;
                    viewModel.ModifiedDate = species.ModifiedDate;
                    viewModel.ModifiedByCooperatorID = species.ModifiedByCooperatorID;
                    viewModel.ModifiedByCooperatorName = species.ModifiedByCooperatorName;
                    viewModel.Note = species.Note;
                    viewModel.Citations = species.Citations;
                    viewModel.CommonNames = species.CommonNames;
                    //viewModel.Usages = species.Usages;
                    //viewModel.RegulationMappings = species.RegulationMappings;
                }
                else
                {
                    TempData["context"] = "Add Species";
                    viewModel = new SpeciesEditViewModel();
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message + ex.StackTrace);
                return RedirectToAction("InternalServerError", "Error");
            }
            return View(BASE_PATH + "/Edit.cshtml", viewModel);
        }

        [HttpPost, Route("taxonomy/species/edit")]
        public ActionResult Edit(SpeciesEditViewModel viewModel)
        {
            Species species = new Species();
            ResultContainer resultContainer = new ResultContainer();
            TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);

            if (!ModelState.IsValid)
            {
                return View("~/Views/Taxonomy/Species/Edit.cshtml", viewModel);
            }

            try
            {
                species.ID = viewModel.ID;
                species.SpeciesName = viewModel.SpeciesName;
                species.Name = viewModel.Name;
                species.GenusID = viewModel.GenusID;
                species.GenusName = viewModel.GenusName;
                species.Protologue = viewModel.Protologue;
                species.Authority = viewModel.Authority;
                species.IsSpecificHybrid = viewModel.IsSpecificHybrid;
                species.IsSubSpecificHybrid = viewModel.IsSubSpecificHybrid;
                species.IsVarietalHybrid = viewModel.IsVarietalHybrid;
                species.IsSubVarietalHybrid = viewModel.IsSubVarietalHybrid;
                species.FormaName = viewModel.FormaName;
                species.FormaAuthority = viewModel.FormaAuthority;
                species.FormaRankType = viewModel.FormaRankType;
                species.Note = viewModel.Note;

                if (viewModel.ID > 0)
                {
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

                return RedirectToAction("Edit", "Taxonomy/Species", new { id = viewModel.ID });
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message + ex.StackTrace);
                return RedirectToAction("InternalServerError", "Error");
            }
        }

        [HttpGet]
        [Route("taxonomy/species/addsubtaxa/{id}")]
        public ActionResult AddSubTaxa(int id)
        {
            TempData["context"] = "Add SubTaxa";
            AddSubTaxaViewModel addSubTaxaViewModel = new AddSubTaxaViewModel();
            Species species = null;

            try
            {
                TaxonomyService _taxonomyService = new TaxonomyService(AuthenticatedUserSession.Environment);
                species = _taxonomyService.GetSpecies(id);
                addSubTaxaViewModel.SpeciesName = species.Name;
                addSubTaxaViewModel.GenusName = species.GenusName;
                addSubTaxaViewModel.NameAuthority = species.NameAuthority;
                addSubTaxaViewModel.Protologue = species.Protologue;
                addSubTaxaViewModel.ProtologueURL = species.ProtologueVirtualPath;
            }
            catch (Exception ex)
            { 
            
            }
            return View(BASE_PATH + "/AddSubTaxa.cshtml", addSubTaxaViewModel);
        }
    }
}