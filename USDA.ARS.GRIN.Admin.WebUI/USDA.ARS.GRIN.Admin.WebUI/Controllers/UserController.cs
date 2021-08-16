using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using USDA.ARS.GRIN.Admin.WebUI.ViewModels;
using USDA.ARS.GRIN.Admin.WebUI.ViewModels.AccountManagement;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Service;
//using log4net;
using NLog;
using System.Security.Authentication;
using DocumentFormat.OpenXml.Office2010.PowerPoint;

namespace USDA.ARS.GRIN.Admin.WebUI.Controllers
{
    public class UserController : BaseController
    {
        const string BASE_PATH = "~/Views/User/";
        SecurityService _securityService = null;
        private static readonly Logger Log = LogManager.GetCurrentClassLogger();

        public UserController()
        {
        }

        [HttpGet]
        public ActionResult Login(string loginStatus = "")
        {
            LoginViewModel loginViewModel = new LoginViewModel();
            loginViewModel.Status = loginStatus;
            //string DEBUG_PW = _securityService.GenerateRandomPassword(8);
            return View(loginViewModel);
        }

        [HttpPost]
        public ActionResult Login(LoginViewModel viewModel)
        {
            ResultContainer resultContainer = new ResultContainer();
            UserSession userSession = new UserSession();
           
            try
            {
                _securityService = new SecurityService(viewModel.Environment);
                resultContainer = _securityService.Login(viewModel.UserName, viewModel.Password, out User user);
                if (resultContainer.ResultCode == LoginResult.SUCCESS.ToString())
                {
                    userSession.AuthenticatedUser = user;
                    userSession.AuthenticatedUser.Cooperator.FirstName = user.Cooperator.FirstName;
                    userSession.AuthenticatedUser.Cooperator.LastName = user.Cooperator.LastName;
                    userSession.AuthenticatedUser.Cooperator.EmailAddress = user.Cooperator.EmailAddress;
                    userSession.Environment = viewModel.Environment;
                    Session["USER_SESSION"] = userSession;
                }
                else
                {
                    throw new AuthenticationException(resultContainer.ResultCode);
                }
            }
            catch (AuthenticationException aex)
            {
                Log.Error(aex, aex.Message + resultContainer.ResultDescription);
                viewModel.Status = resultContainer.ResultCode;
                viewModel.ErrorMessage = resultContainer.GetUserFriendlyDescription(resultContainer.ResultCode);
                return View("~/Views/User/Login.cshtml", viewModel);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return RedirectToAction("Login", "User", new { loginStatus = LoginStatusEnum.ERROR });
            }
            //return RedirectToAction("Index", "Home", new { loginStatus = LoginResult.SUCCESS.ToString(), Area = "" });
            return RedirectToAction("Declaration", "User");
        }

        public ActionResult Declaration()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Confirm()
        {
            // TODO Check login status
            return RedirectToAction("Index", "Home", new { loginStatus = LoginResult.SUCCESS.ToString(), Area = "" });
        }

        public ActionResult AccountRequest()
        {
            return View();
        }
        [HttpPost]       
        public ActionResult AccountRequest(LoginViewModel viewModel)
        {
            return View();
        }

        public ActionResult Edit(int id)
        {
            UserEditViewModel userEditViewModel = new UserEditViewModel();

            try 
            {
                // TO DO
                return View(BASE_PATH + "Edit.cshtml", userEditViewModel);
            }
            catch (Exception ex)
            {
                Log.Error(ex, "Error Occurred");
                return RedirectToAction("InternalServerError", "Error");
            }
        }

        [HttpPost]
        public ActionResult PasswordReset(LoginViewModel viewModel)
        {
            _securityService = new SecurityService(viewModel.Environment);
            string password = String.Empty;

            password = _securityService.GenerateRandomPassword(8);
            viewModel.Message = "Your password has been set to " + password + ".";
            return View("~/Views/User/Login.cshtml", viewModel);
        }

        [HttpPost]
        public ActionResult Edit(UserEditViewModel userViewModel)
        {
            return View(userViewModel);
        }

        public ActionResult Logout()
        {
            LoginViewModel viewModel = new LoginViewModel();

            Session.Clear();
            return View("~/Views/User/Login.cshtml", viewModel);
        }

        public ActionResult _Profile()
        {
            UserProfileViewModel viewModel = new UserProfileViewModel();

            try
            {
                viewModel.AuthenticatedUser = AuthenticatedUser;
                return PartialView("~/Views/User/_Profile.cshtml", viewModel);
            }
            catch (Exception ex)
            {
                return RedirectToAction("_Error", "Error");
            }
        }

        public ActionResult _Applications()
        {
            UserApplicationsViewModel viewModel = new UserApplicationsViewModel();

            try
            {
                viewModel.Applications = AuthenticatedUser.Applications;
                return PartialView("~/Views/User/_Applications.cshtml", viewModel);
            }
            catch (Exception ex)
            {
                return RedirectToAction("_Error", "Error");
            }
        }
       
    }
}