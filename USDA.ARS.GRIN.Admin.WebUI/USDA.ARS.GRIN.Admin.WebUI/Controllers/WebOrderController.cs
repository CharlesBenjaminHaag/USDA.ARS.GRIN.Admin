using DocumentFormat.OpenXml.Spreadsheet;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.GRINGlobal;
using USDA.ARS.GRIN.Admin.Service;
using USDA.ARS.GRIN.Admin.WebUI.ViewModels.GRINGlobal;

namespace USDA.ARS.GRIN.Admin.WebUI.Controllers
{
    [GrinGlobalAuthentication]
    public class WebOrderController : BaseController
    {
        public ActionResult Index()
        {
            TempData["context"] = "NRR Review Tool";
            WebOrderRequestSearchViewModel viewModel = new WebOrderRequestSearchViewModel();

            try
            {
                return View("~/Views/GRINGlobal/WebOrder/Index.cshtml", viewModel);
            }
            catch (Exception ex)
            {
                log.Error(ex.Message + ex.StackTrace);
                return RedirectToAction("InternalServerError", "Error");
            }
        }

        public PartialViewResult _List()
        {
            IQueryable<WebOrderRequest> webOrderRequests = null;
            GRINGlobalService service = new GRINGlobalService(this.AuthenticatedUserSession.Environment);

            try
            {
                webOrderRequests = service.GetWebOrderRequests("NRR_FLAGGED");
                return PartialView("~/Views/GRINGlobal/WebOrder/_List.cshtml", webOrderRequests);
            }
            catch (Exception ex)
            {
                log.Error(ex.Message + ex.StackTrace);
                return PartialView("~/Views/Error/_Error.cshtml");
            }
        }

        public PartialViewResult Update(int webOrderRequestId, int webCooperatorId, string statusCode, string actionNote)
        {
            ResultContainer resultContainer = null;
            WebOrderRequest webOrderRequest = new WebOrderRequest();
            IQueryable<WebOrderRequest> webOrderRequests = null;
            GRINGlobalService service = new GRINGlobalService(this.AuthenticatedUserSession.Environment);

            webOrderRequest.ID = webOrderRequestId;
            
            webOrderRequest.StatusCode = statusCode;
            
            webOrderRequest.Note = actionNote;
            webOrderRequest.WebCooperator.ID = webCooperatorId;

            resultContainer = service.UpdateWebOrderRequest(webOrderRequest);
            webOrderRequests = service.GetWebOrderRequests("NRR_FLAGGED");
            return PartialView("~/Views/GRINGlobal/WebOrder/_List.cshtml", webOrderRequests);

        }

        public ActionResult Edit(int id)
        {
            TempData["context"] = "Review Web Order Request";

            WebOrderRequestEditViewModel viewModel = new WebOrderRequestEditViewModel();
            WebOrderRequest webOrderRequest = null;
            GRINGlobalService service = new GRINGlobalService(this.AuthenticatedUserSession.Environment);
            


            return View("~/Views/GRINGlobal/WebOrder/Edit.cshtml", viewModel);
        }

        [HttpPost]
        public ActionResult Edit(WebOrderRequestEditViewModel viewModel)
        {
            return View("~/Views/GRINGlobal/WebOrder/Index.cshtml");
        }
    }
}