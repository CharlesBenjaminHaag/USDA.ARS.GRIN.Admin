using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.GRINGlobal;
using USDA.ARS.GRIN.Admin.Service;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.AccountManagement
{
    public class AccountManagementHomeViewModel
    {
        public IQueryable<User> Users { get; set; }
        public SysUser SysUser { get; set; }
        public User WebUser { get; set; }
        public Cooperator Cooperator { get; set; }
        public WebCooperator WebCooperator { get; set; }
        public SelectList AvailableGroups { get; set; }
        public List<Group> SelectedGroups { get; set; }

        public AccountManagementHomeViewModel()
        {
            SysUser = new SysUser();
            WebUser = new User();
            Cooperator = new Cooperator();
            Users = new List<User>().AsQueryable();
            SelectedGroups = new List<Group>();
        }
    }
}