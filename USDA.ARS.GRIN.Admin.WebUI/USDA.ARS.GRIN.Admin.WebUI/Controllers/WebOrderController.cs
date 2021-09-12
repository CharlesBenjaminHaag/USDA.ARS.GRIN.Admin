using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.GRINGlobal;
using USDA.ARS.GRIN.Admin.Service;
using USDA.ARS.GRIN.Admin.WebUI.ViewModels.GRINGlobal;
using NLog;

namespace USDA.ARS.GRIN.Admin.WebUI.Controllers
{
    [GrinGlobalAuthentication]
    public class WebOrderController : BaseController
    {
        const string BASE_PATH = "~/Views/GRINGlobal/WebOrder/";
        private static readonly Logger Log = LogManager.GetCurrentClassLogger();

        #region Web Order Request
        public ActionResult Index()
        {
            TempData["context"] = "Home";
            GRINGlobalService grinGlobalService = new GRINGlobalService(this.AuthenticatedUserSession.Environment);
            WebOrderRequestSearchViewModel viewModel = new WebOrderRequestSearchViewModel();

            try
            {
                viewModel.Statuses = grinGlobalService.GetWebOrderRequestStatuses();
                if (viewModel.Statuses.Count() > 0)
                {
                    viewModel.CurrentID = viewModel.Statuses.First().ID;
                }

                viewModel.IntendedUseCodes = new SelectList(grinGlobalService.GetWebOrderRequestIntendedUseCodes(), "Name", "Description");
                return View(BASE_PATH + "Index.cshtml", viewModel);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return RedirectToAction("InternalServerError", "Error");
            }
        }

        public ActionResult Search(int webOrderRequestId = 0, string emailAddress = "", string firstName = "", string lastName = "", string organization = "")
        {
            TempData["context"] = "Web Order Request Search";
            WebOrderRequestSearchViewModel webOrderRequestSearchViewModel = new WebOrderRequestSearchViewModel();
            GRINGlobalService service = new GRINGlobalService(this.AuthenticatedUserSession.Environment);

            try 
            {
                webOrderRequestSearchViewModel.StatusCodes = new SelectList(service.GetWebOrderRequestStatuses(),"Name","Name");
                webOrderRequestSearchViewModel.IntendedUseCodes = new SelectList(service.GetWebOrderRequestIntendedUseCodes(),"Name","Description");

                if (webOrderRequestId > 0)
                {
                    webOrderRequestSearchViewModel.ID = webOrderRequestId;
                }

                if (!String.IsNullOrEmpty(emailAddress))
                {
                    webOrderRequestSearchViewModel.RequestorEmailAddress = emailAddress;
                }

                if (!String.IsNullOrEmpty(firstName))
                {
                    webOrderRequestSearchViewModel.RequestorFirstName = firstName;
                }

                if (!String.IsNullOrEmpty(lastName))
                {
                    webOrderRequestSearchViewModel.RequestorLastName = lastName;
                }

                if (!String.IsNullOrEmpty(organization))
                {
                    webOrderRequestSearchViewModel.RequestorOrganization = organization;
                }

                return View("~/Views/GRINGlobal/WebOrder/Search.cshtml", webOrderRequestSearchViewModel);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return RedirectToAction("InternalServerError", "Error");
            }
        }

        [HttpPost]
        public ActionResult Search(FormCollection formCollection)
        {
            GRINGlobalService grinGlobalService = new GRINGlobalService(this.AuthenticatedUserSession.Environment);
            WebOrderRequestListViewModel webOrderRequestListViewModel = new WebOrderRequestListViewModel();
            Models.Query query = new Models.Query();

            try
            {
                if (!String.IsNullOrEmpty(formCollection["ID"].Trim()))
                {
                    if (Int32.Parse(formCollection["ID"]) > 0)
                    {
                        query.QueryCriteria.Add(new QueryCriterion { FieldName = "web_order_request_id", SearchOperatorCode = "=", FieldValue = formCollection["ID"], DataType = "INT" });
                    }
                }

                if (!String.IsNullOrEmpty(formCollection["RequestorEmailAddress"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "web_cooperator_email", SearchOperatorCode = "LIKE", FieldValue = formCollection["RequestorEmailAddress"], DataType = "NVARCHAR" });
                }

                if (!String.IsNullOrEmpty(formCollection["RequestorFirstName"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "web_cooperator_first_name", SearchOperatorCode = "LIKE", FieldValue = formCollection["RequestorFirstName"], DataType = "NVARCHAR" });
                }

                if (!String.IsNullOrEmpty(formCollection["RequestorLastName"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "web_cooperator_last_name", SearchOperatorCode = "LIKE", FieldValue = formCollection["RequestorLastName"], DataType = "NVARCHAR" });
                }

                if (!String.IsNullOrEmpty(formCollection["RequestorOrganization"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "web_cooperator_organization", SearchOperatorCode = "LIKE", FieldValue = formCollection["RequestorOrganization"], DataType = "NVARCHAR" });
                }

                if (!String.IsNullOrEmpty(formCollection["IntendedUseCode"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "intended_use_code", SearchOperatorCode = "=", FieldValue = formCollection["IntendedUseCode"], DataType = "NVARCHAR" });
                }

                if (!String.IsNullOrEmpty(formCollection["SelectedStatusCode"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "status_code", SearchOperatorCode = "=", FieldValue = formCollection["SelectedStatusCode"], DataType = "NVARCHAR" });
                }

                if (!String.IsNullOrEmpty(formCollection["SelectedStartDate"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "ordered_date", SearchOperatorCode = ">=", FieldValue = formCollection["SelectedStartDate"], DataType = "DATETIME" });
                }

                if (!String.IsNullOrEmpty(formCollection["SelectedEndDate"]))
                {
                    query.QueryCriteria.Add(new QueryCriterion { FieldName = "ordered_date", SearchOperatorCode = "<=", FieldValue = formCollection["SelectedEndDate"], DataType = "DATETIME" });
                }

                webOrderRequestListViewModel.WebOrderRequests = grinGlobalService.SearchWebOrderRequests(query);
                return PartialView(BASE_PATH + "/_SearchResults.cshtml", webOrderRequestListViewModel);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return RedirectToAction("InternalServerError", "Error");
            }
        }
        public PartialViewResult _List(string status, int timeFrameCode)
        {
            WebOrderRequestListViewModel webOrderRequestListViewModel = new WebOrderRequestListViewModel();
            webOrderRequestListViewModel.AuthenticatedUser = AuthenticatedUser;
            GRINGlobalService service = new GRINGlobalService(this.AuthenticatedUserSession.Environment);

            try
            {
                webOrderRequestListViewModel.WebCooperatorID = AuthenticatedUser.Cooperator.WebCooperator.ID;
                webOrderRequestListViewModel.WebOrderRequests = service.GetWebOrderRequests(status, timeFrameCode);
                return PartialView("~/Views/GRINGlobal/WebOrder/_List.cshtml", webOrderRequestListViewModel);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return PartialView("~/Views/Error/_Error.cshtml");
            }
        }

        public PartialViewResult Update(int webOrderRequestId, int webCooperatorId, string statusCode, string actionNote)
        {
            TempData["context"] = "Review";
            ResultContainer resultContainer = null;
            WebOrderRequest webOrderRequest = new WebOrderRequest();
            List<WebOrderRequest> webOrderRequests = null;
            GRINGlobalService service = new GRINGlobalService(this.AuthenticatedUserSession.Environment);

            webOrderRequest.ID = webOrderRequestId;
            webOrderRequest.WebCooperatorID = webCooperatorId;
            webOrderRequest.StatusCode = statusCode;
            webOrderRequest.Note = actionNote;

            resultContainer = service.UpdateWebOrderRequest(webOrderRequest);
            //webOrderRequests = service.GetWebOrderRequests("NRR_FLAGGED");
            return PartialView("~/Views/GRINGlobal/WebOrder/_List.cshtml", webOrderRequests);

        }

        public ActionResult SetStatus(string statusCode)
        {
            WebOrderRequestEditViewModel viewModel = null;
            //TO DO
            return View("~/Views/GRINGlobal/WebOrder/Edit.cshtml", viewModel);
        }

        public ActionResult View(int id)
        {
            TempData["context"] = "View Web Order Request #" + id;
            WebOrderRequestEditViewModel viewModel = new WebOrderRequestEditViewModel();
            viewModel = GetData(id, false);
            return View("~/Views/GRINGlobal/WebOrder/Edit.cshtml", viewModel);
        }
        public ActionResult Edit(int id)
        {
            TempData["context"] = "Review Web Order Request #" + id;
            WebOrderRequestEditViewModel viewModel = new WebOrderRequestEditViewModel();

            try
            {
                viewModel = GetData(id, true);
                return View("~/Views/GRINGlobal/WebOrder/Edit.cshtml", viewModel);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return RedirectToAction("InternalServerError", "Error");
            }
        }

        [HttpPost]
        public ActionResult Edit(WebOrderRequestEditViewModel viewModel)
        {
            string emailRecipientList = String.Empty;
            ResultContainer resultContainer = null;
            GRINGlobalService grinGlobalService = new GRINGlobalService(this.AuthenticatedUserSession.Environment);
            SmtpService smtpService = new SmtpService();

            try
            {
                WebOrderRequest webOrderRequest = new WebOrderRequest();
                webOrderRequest.ID = viewModel.ID;
                webOrderRequest.StatusCode = viewModel.Action;

                if (viewModel.Action == OrderRequestAction.NRRReviewEnd)
                {
                    grinGlobalService.SetReviewStatus(viewModel.ID, AuthenticatedUser.Cooperator.WebCooperator.ID, false);
                }
                else
                {
                    if ((viewModel.Action != "NRR_NOTE") && (viewModel.Action != "NRR_INFO"))
                    {
                        resultContainer = grinGlobalService.UpdateWebOrderRequest(webOrderRequest);
                    }
                    resultContainer = grinGlobalService.AddWebOrderRequestAction(new WebOrderRequestAction { WebOrderRequestID = viewModel.ID, ActionCode = viewModel.Action, Note = viewModel.ActionNote, CreatedByCooperatorID = AuthenticatedUser.WebUserID });

                    if (viewModel.Action == "NRR_APPROVE")
                    {
                        emailRecipientList = grinGlobalService.GetEmailNotificationList(viewModel.ID);
                        grinGlobalService.SendEmail(viewModel.ID, "CAP", emailRecipientList);
                        resultContainer = grinGlobalService.AddWebOrderRequestAction(new WebOrderRequestAction { WebOrderRequestID = viewModel.ID, ActionCode = viewModel.Action, Note = viewModel.ActionNote, CreatedByCooperatorID = AuthenticatedUser.WebUserID });
                    }
                    else
                        if (viewModel.Action == "NRR_REJECT")
                    {
                        emailRecipientList = grinGlobalService.GetEmailNotificationList(viewModel.ID);
                        grinGlobalService.SendEmail(viewModel.ID, "CCL", emailRecipientList);
                        grinGlobalService.SendEmail(viewModel.ID, "RRJ", viewModel.WebCooperator.EmailAddress);
                        resultContainer = grinGlobalService.AddWebOrderRequestAction(new WebOrderRequestAction { WebOrderRequestID = viewModel.ID, ActionCode = viewModel.Action, Note = viewModel.ActionNote, CreatedByCooperatorID = AuthenticatedUser.WebUserID });
                    }
                    else
                            if (viewModel.Action == "NRR_INFO")
                    {
                        grinGlobalService.SendEmail(viewModel.ID, "RQI", viewModel.WebCooperator.EmailAddress);
                    }

                    if (resultContainer.ResultCode == ResultContainer.ResultCodeValue.Error.ToString())
                    {
                        throw new Exception("Error sending mail: " + resultContainer.ResultMessage + resultContainer.ResultDescription);
                    }

                }
                if ((viewModel.Action != "NRR_NOTE") && (viewModel.Action != "NRR_INFO"))
                {
                    return RedirectToAction("Index", "WebOrder");
                }
                else
                {
                    return RedirectToAction("Edit", "WebOrder", new { id = viewModel.ID });
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return RedirectToAction("InternalServerError", "Error");
            }
        }
        private WebOrderRequestEditViewModel GetData(int id, bool reviewMode)
        {
            ResultContainer resultContainer = null;
            WebOrderRequest webOrderRequest = null;
            GRINGlobalService grinGlobalService = new GRINGlobalService(this.AuthenticatedUserSession.Environment);
            WebOrderRequestEditViewModel viewModel = new WebOrderRequestEditViewModel();

            try
            {
                if (reviewMode)
                {
                    resultContainer = grinGlobalService.SetReviewStatus(id, AuthenticatedUser.Cooperator.WebCooperator.ID, true);
                    resultContainer = grinGlobalService.AddWebOrderRequestAction(new WebOrderRequestAction { WebOrderRequestID = id, ActionCode = "NRR_REVIEW", CreatedByCooperatorID = AuthenticatedUser.WebUserID });
                }

                webOrderRequest = grinGlobalService.GetWebOrderRequest(id);
                if (webOrderRequest == null)
                {
                    throw new NullReferenceException(String.Format("Null web order request returned for ID {0}", id));
                }
                viewModel.AuthenticatedUser = AuthenticatedUser;
                viewModel.WebCooperatorID = AuthenticatedUser.Cooperator.WebCooperator.ID;
                viewModel.StatusCode = webOrderRequest.StatusCode;
                viewModel.OrderDate = webOrderRequest.OrderDate;
                viewModel.WebCooperator = webOrderRequest.Cooperators.First();
                viewModel.IsReviewMode = reviewMode;
                viewModel.IsLocked = webOrderRequest.IsLocked;
                viewModel.ID = webOrderRequest.ID;
                viewModel.OrderDate = webOrderRequest.OrderDate;
                viewModel.IntendedUseCode = webOrderRequest.IntendedUseCode;
                viewModel.IntendedUseNote = webOrderRequest.IntendedUseNote;
                viewModel.Note = webOrderRequest.Note;
                viewModel.SpecialInstruction = webOrderRequest.SpecialInstruction;
                viewModel.OwnedDate = webOrderRequest.OwnedDate;
                viewModel.OwnedByCooperatorID = webOrderRequest.OwnedByCooperatorID;
                viewModel.OwnedByCooperatorName = webOrderRequest.OwnedByCooperatorName;
                viewModel.WebOrderRequestItems = webOrderRequest.WebOrderRequestItems;
                viewModel.WebOrderRequestAddresses = webOrderRequest.Addresses;
                viewModel.EmailAddressList = webOrderRequest.EmailAddressList;
                viewModel.EmailTemplates = grinGlobalService.GetEmailTemplates();

                var queryWebOrderRequestDates =
                    from action in webOrderRequest.WebOrderRequestActions
                    group action by action.ActionDate into webOrderRequestActionGroup
                    orderby webOrderRequestActionGroup.Key descending
                    select webOrderRequestActionGroup;

                foreach (var group in queryWebOrderRequestDates)
                {
                    WebOrderRequestActionGroupViewModel webOrderRequestActionGroupViewModel = new WebOrderRequestActionGroupViewModel();
                    webOrderRequestActionGroupViewModel.ActionDate = DateTime.Parse(group.Key.ToString());
                    foreach (var subGroup in group)
                    {
                        WebOrderRequestAction webOrderRequestAction = new WebOrderRequestAction();
                        webOrderRequestAction.ID = subGroup.ID;
                        webOrderRequestAction.ActionCode = subGroup.ActionCode;
                        webOrderRequestAction.Title = subGroup.Title;
                        webOrderRequestAction.Description = subGroup.Description;
                        webOrderRequestAction.Note = subGroup.Note;
                        webOrderRequestAction.ActionDate = subGroup.ActionDateTime;
                        webOrderRequestAction.CreatedByCooperatorName = subGroup.CreatedByCooperatorName;
                        webOrderRequestActionGroupViewModel.WebOrderRequestActions.Add(webOrderRequestAction);
                    }
                    viewModel.WebOrderRequestActionGroupViewModels.Add(webOrderRequestActionGroupViewModel);
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
            }
            return viewModel;
        }

        #endregion

        #region Email Templates

        public ActionResult EmailTemplateHome()
        {
            TempData["context"] = "Email Templates";
            try
            {
                GRINGlobalService grinGlobalService = new GRINGlobalService(this.AuthenticatedUserSession.Environment);
                EmailTemplateHomeViewModel emailTemplateHomeViewModel = new EmailTemplateHomeViewModel();
                emailTemplateHomeViewModel.EmailTemplates = grinGlobalService.GetEmailTemplates();
                if (emailTemplateHomeViewModel.EmailTemplates.Count() > 0)
                {
                    emailTemplateHomeViewModel.CurrentID = emailTemplateHomeViewModel.EmailTemplates.First().ID;
                }
                return View("~/Views/GRINGlobal/WebOrder/Email/Index.cshtml", emailTemplateHomeViewModel);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return PartialView("~/Views/Error/_Error.cshtml");
            }
        }

        public PartialViewResult _EmailTemplateView(int id)
        {
            TempData["context"] = "View Email Template";
            GRINGlobalService grinGlobalService = new GRINGlobalService(this.AuthenticatedUserSession.Environment);
            EmailTemplateEditViewModel emailTemplateEditViewModel = new EmailTemplateEditViewModel();
            EmailTemplate emailTemplate = new EmailTemplate();

            try
            {
                emailTemplate = grinGlobalService.GetEmailTemplate(id);
                if (emailTemplate == null)
                {
                    throw new NullReferenceException(String.Format("No email template found for id {0}", id));
                }
                emailTemplateEditViewModel.ID = emailTemplate.ID;
                emailTemplateEditViewModel.Title = emailTemplate.Title;
                emailTemplateEditViewModel.SenderAddress = emailTemplate.From;
                emailTemplateEditViewModel.Subject = emailTemplate.Subject;
                emailTemplateEditViewModel.Body = emailTemplate.Body;
                return PartialView("~/Views/GRINGlobal/WebOrder/Email/_Detail.cshtml", emailTemplateEditViewModel);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return PartialView("~/Views/Error/_Error.cshtml");
            }
        }

        public ActionResult EmailTemplateEdit(int id)
        {
            TempData["context"] = "Edit Email Template";
            GRINGlobalService grinGlobalService = new GRINGlobalService(this.AuthenticatedUserSession.Environment);
            EmailTemplateEditViewModel emailTemplateEditViewModel = new EmailTemplateEditViewModel();
            EmailTemplate emailTemplate = new EmailTemplate();

            try
            {
                emailTemplate = grinGlobalService.GetEmailTemplate(id);
                if (emailTemplate == null)
                {
                    throw new NullReferenceException(String.Format("No email template found for id {0}", id));
                }
                emailTemplateEditViewModel.ID = emailTemplate.ID;
                emailTemplateEditViewModel.Title = emailTemplate.Title;
                emailTemplateEditViewModel.SenderAddress = emailTemplate.From;
                emailTemplateEditViewModel.Subject = emailTemplate.Subject;
                emailTemplateEditViewModel.Body = emailTemplate.Body;
                emailTemplateEditViewModel.CreatedDate = emailTemplate.CreatedDate;
                emailTemplateEditViewModel.CreatedByCooperatorID = emailTemplate.CreatedByCooperatorID;
                emailTemplateEditViewModel.CreatedByCooperatorName = emailTemplate.CreatedByCooperatorName;
                emailTemplateEditViewModel.ModifiedDate = emailTemplate.ModifiedDate;
                emailTemplateEditViewModel.ModifiedByCooperatorID = emailTemplate.ModifiedByCooperatorID;
                emailTemplateEditViewModel.ModifiedByCooperatorName = emailTemplate.ModifiedByCooperatorName;
                return View("~/Views/GRINGlobal/WebOrder/Email/Edit.cshtml", emailTemplateEditViewModel);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return RedirectToAction("InternalServerError", "Error");
            }
        }

        [HttpPost]
        public ActionResult EmailTemplateEdit(EmailTemplateEditViewModel emailTemplateEditViewModel)
        {
            GRINGlobalService grinGlobalService = new GRINGlobalService(this.AuthenticatedUserSession.Environment);
            EmailTemplate emailTemplate = new EmailTemplate();
            ResultContainer resultContainer = new ResultContainer();
            try
            {
                emailTemplate.ID = emailTemplateEditViewModel.ID;
                emailTemplate.Title = emailTemplateEditViewModel.Title;
                emailTemplate.Subject = emailTemplateEditViewModel.Subject;
                emailTemplate.From = emailTemplateEditViewModel.SenderAddress;
                emailTemplate.To = emailTemplateEditViewModel.RecipientAddress;
                emailTemplate.Body = emailTemplateEditViewModel.Body;
                resultContainer = grinGlobalService.UpdateEmailTemplate(emailTemplate);
                return RedirectToAction("EmailTemplateEdit", "WebOrder", new { id = emailTemplateEditViewModel.ID });
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return RedirectToAction("InternalServerError", "Error");
            }
        }

        #endregion Email Templates
    }
}