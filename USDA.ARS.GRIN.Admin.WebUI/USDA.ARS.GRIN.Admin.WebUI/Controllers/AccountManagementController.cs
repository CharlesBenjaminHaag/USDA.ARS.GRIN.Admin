using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.DirectoryServices;
using System.Runtime.CompilerServices;
using USDA.ARS.GRIN.Admin.WebUI.ViewModels;
using USDA.ARS.GRIN.Admin.Service;
//using DocumentFormat.OpenXml.Wordprocessing;
using USDA.ARS.GRIN.Admin.WebUI.ViewModels;
using USDA.ARS.GRIN.Admin.WebUI.ViewModels.AccountManagement;
using USDA.ARS.GRIN.Admin.Models;
using NLog;

namespace USDA.ARS.GRIN.Admin.WebUI.Controllers
{
    [GrinGlobalAuthentication]
    public class AccountManagementController : BaseController
    {
        const string BASE_PATH = "~/Views/AccountManagement/";
        SmtpService _smtpService = new SmtpService();
        private static readonly Logger Log = LogManager.GetCurrentClassLogger();

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
                Log.Error(ex, ex.Message);
            }
            return userSession;
        }

        // GET: AccountManagement
        public ActionResult Index()
        {
            UserService userService = new UserService(AuthenticatedUserSession.Environment);
            AccountManagementHomeViewModel accountManagementHomeViewModel = new AccountManagementHomeViewModel();
            // Query query = new Query();


            //accountManagementHomeViewModel.Users = userService.Search(query);
            return View(BASE_PATH + "Index.cshtml", accountManagementHomeViewModel);
        }

        [OutputCache(NoStore = true, Duration = 0, VaryByParam = "*")]
        public PartialViewResult _RecentlyAdded()
        {
            UserService userService = new UserService(AuthenticatedUserSession.Environment);
            UserListViewModel userListViewModel = new UserListViewModel();

            Query query = new Query();
            query.QueryCriteria.Add(new QueryCriterion { FieldName = "su.created_date", SearchOperatorCode = ">=", DataType="DATETIME", FieldValue = "DATEADD(DAY, -30, GETDATE())" });
            userListViewModel.Users = userService.Search(query);
            return PartialView(BASE_PATH + "User/_List.cshtml", userListViewModel);
        }

        [OutputCache(NoStore = true, Duration = 0, VaryByParam = "*")]
        public PartialViewResult _RecentlyModified()
        {
            UserService userService = new UserService(AuthenticatedUserSession.Environment);
            UserListViewModel userListViewModel = new UserListViewModel();

            Query query = new Query();
            query.QueryCriteria.Add(new QueryCriterion { FieldName = "su.created_date", SearchOperatorCode = ">=", DataType = "DATETIME", FieldValue = "DATEADD(DAY, -30, GETDATE())" });
            userListViewModel.Users = userService.Search(query);
            return PartialView(BASE_PATH + "User/_List.cshtml", userListViewModel);
        }

        public ActionResult UserEdit(int id)
        {
            UserService userService = new UserService(AuthenticatedUserSession.Environment);
            UserEditViewModel userEditViewModel = new UserEditViewModel();
            User user = new User();

            try 
            {
                user = userService.GetUser(id);
                userEditViewModel.SysUserID = user.ID;
                userEditViewModel.SysUserName = user.UserName;
                userEditViewModel.SysUserPassword = user.Password;
                userEditViewModel.ID = user.ID;
                userEditViewModel.Title = user.Cooperator.Job;
                userEditViewModel.FirstName = user.Cooperator.FirstName;
                userEditViewModel.LastName = user.Cooperator.LastName;
                userEditViewModel.EmailAddress = user.Cooperator.EmailAddress;
                userEditViewModel.Organization = user.Cooperator.Organization;
                //abbrev
                userEditViewModel.Job = user.Cooperator.Job;
                userEditViewModel.AddressLine1 = user.Cooperator.Address.AddressLine1;
                userEditViewModel.AddressLine2 = user.Cooperator.Address.AddressLine2;
                userEditViewModel.AddressLine3 = user.Cooperator.Address.AddressLine3;
                userEditViewModel.City = user.Cooperator.Address.City;
                userEditViewModel.State = user.Cooperator.Address.State;
                userEditViewModel.ZIP = user.Cooperator.Address.ZIP; 
                userEditViewModel.PrimaryPhoneNumber = user.Cooperator.PrimaryPhoneNumber;
                userEditViewModel.SelectedGroups = user.Groups;
            }
            catch (Exception ex)
            { }
            return View(BASE_PATH + "User/Edit.cshtml", userEditViewModel);
        }

        [HttpPost]
        public ActionResult UserEdit(UserEditViewModel userEditViewModel)
        {
            UserService userService = new UserService(AuthenticatedUserSession.Environment);
            ResultContainer resultContainer = new ResultContainer();

            try 
            { 
                //resultContainer = userService.
            }
            catch (Exception ex)
            { }
            return View(BASE_PATH + "");
        }

        [HttpGet]
        public ActionResult GeneratePassword()
        {
            string password = String.Empty;
            SecurityService securityService = new SecurityService(AuthenticatedUserSession.Environment);
            password = securityService.GenerateRandomPassword(8);
            return Json(password, JsonRequestBehavior.AllowGet);
        }

        public ActionResult UpdatePassword(int userId, string userName, string password)
        {
            ResultContainer resultContainer = new ResultContainer();
            SecurityService securityService = new SecurityService(AuthenticatedUserSession.Environment);
            User user = new User { ID = userId, UserName = userName, Password = password };
            resultContainer = securityService.UpdatePassword(user);
            return Json(resultContainer, JsonRequestBehavior.AllowGet);
        }

        #region Active Directory
        private string GetCurrentDomainPath()
        {
            DirectoryEntry de =
               new DirectoryEntry("LDAP://RootDSE");

            return "LDAP://" +
               de.Properties["defaultNamingContext"][0].
                   ToString();
        }

        private void FindADUser(string userName)
        {
            SearchResultCollection results;
            DirectorySearcher ds = null;
            DirectoryEntry de = new
                  DirectoryEntry(GetCurrentDomainPath());

            ds = new DirectorySearcher(de);
            ds.Filter = "(&(objectCategory=User)(objectClass=person)(sAMAccountName=*" + userName + "*))";

            results = ds.FindAll();

            foreach (SearchResult sr in results)
            {
                // Using the index zero (0) is required!
                string TEST = sr.Properties["name"][0].ToString();
                TEST = sr.Properties["sn"][0].ToString();
                TEST = sr.Properties["givenname"][0].ToString();
                TEST = sr.Properties["mail"][0].ToString();
                //TEST = sr.Properties["title"][0].ToString();
                //TEST = sr.Properties["streetAddress"][0].ToString();
            }
        }

        private void GetAUser(string userName)
        {
            DirectorySearcher ds = null;
            DirectoryEntry de = new
              DirectoryEntry(GetCurrentDomainPath());
            SearchResult sr;

            // Build User Searcher
            ds = BuildUserSearcher(de);
            // Set the filter to look for a specific user
            ds.Filter = "(&(objectClass=user)(cn = " + userName + ")";
            sr = ds.FindOne();

            if (sr != null)
            {
                string DEBUG;
                //DEBUG =  sr.GetDir.GetPropertyValue("name");
                //Debug.WriteLine(sr.GetPropertyValue("mail"));
                //Debug.WriteLine(sr.GetPropertyValue("givenname"));
                //Debug.WriteLine(sr.GetPropertyValue("sn"));
                //Debug.WriteLine(sr.GetPropertyValue(
                //                  "userPrincipalName"));
                //Debug.WriteLine(sr.GetPropertyValue(
                //                  "distinguishedName"));
            }
        }

        private DirectorySearcher BuildUserSearcher(DirectoryEntry de)
        {
            DirectorySearcher ds = null;

            ds = new DirectorySearcher(de);
            // Full Name
            ds.PropertiesToLoad.Add("name");
            // Email Address
            ds.PropertiesToLoad.Add("mail");
            // First Name
            ds.PropertiesToLoad.Add("givenname");
            // Last Name (Surname)
            ds.PropertiesToLoad.Add("sn");
            // Login Name
            ds.PropertiesToLoad.Add("userPrincipalName");
            // Distinguished Name
            ds.PropertiesToLoad.Add("distinguishedName");

            return ds;
        }
        #endregion Active Directory
    }
}