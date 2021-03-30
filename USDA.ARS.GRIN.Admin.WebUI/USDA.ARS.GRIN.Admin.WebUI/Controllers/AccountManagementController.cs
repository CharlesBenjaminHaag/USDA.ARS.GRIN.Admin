using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.DirectoryServices;
using System.Runtime.CompilerServices;
using USDA.ARS.GRIN.Admin.WebUI.ViewModels;
using USDA.ARS.GRIN.Admin.Service;
using DocumentFormat.OpenXml.Wordprocessing;
using USDA.ARS.GRIN.Admin.WebUI.ViewModels;
using USDA.ARS.GRIN.Admin.Models;
using NLog;

namespace USDA.ARS.GRIN.Admin.WebUI.Controllers
{
    public class AccountManagementController : BaseController
    {
        UserService _sysUserService = null;
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
            return View("~/Views/AccountManagement/Index.cshtml");
        }

        public PartialViewResult ActiveUsers()
        {
            SysUserListViewModel viewModel = new SysUserListViewModel();
            try
            {
                _sysUserService = new UserService(this.GetUserSession().Environment);
                viewModel.SysUsers = _sysUserService.GetActiveUsers();
                return PartialView("~/Views/AccountManagement/User/_List.cshtml", viewModel);
            }
            catch (Exception ex)
            {
                Log.Error(ex, ex.Message);
                return PartialView("~/Error/_Error.cshtml");
            }
        }

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

        public USDA.ARS.GRIN.Admin.Models.Cooperator FindCooperator(string emailAddress)
        {
            USDA.ARS.GRIN.Admin.Models.Cooperator cooperator = new Models.Cooperator();
            return cooperator;
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

    }
}