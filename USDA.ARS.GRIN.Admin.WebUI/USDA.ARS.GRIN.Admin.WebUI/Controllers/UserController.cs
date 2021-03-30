using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using USDA.ARS.GRIN.Admin.WebUI.ViewModels;
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
        SecurityService _securityService = null;
        private static readonly Logger Log = LogManager.GetCurrentClassLogger();

        public UserController()
        {
            //UserService _userService = new UserService(this.GetUserSession().Environment);
        }

        // GET: User
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
                    log.Info("USER LOGGED IN: " + user.UserName);
                    userSession.AuthenticatedUser = user;
                    userSession.Environment = viewModel.Environment;

                    // TO DO : GET LIST OF USERS AUTHD TO ACCESS APP
                    //userSession.AuthorizedCooperators = 

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
            return RedirectToAction("Index", "Home", new { loginStatus = LoginResult.SUCCESS.ToString(), Area = "" });
        }

        public ActionResult AccountRequest()
        {
            return View();
        }

        public ActionResult Edit(string userName)
        {
            // TO DO
            return View();
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
        public ActionResult Edit(UserViewModel userViewModel)
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
            viewModel.AuthenticatedUser = AuthenticatedUser;
            return PartialView("~/Views/User/_Profile.cshtml", viewModel);
        }

        public ActionResult _Applications()
        {
            UserApplicationsViewModel viewModel = new UserApplicationsViewModel();
            viewModel.Applications = AuthenticatedUser.Applications;
            return PartialView("~/Views/User/_Applications.cshtml", viewModel);
        }
       
    }
}