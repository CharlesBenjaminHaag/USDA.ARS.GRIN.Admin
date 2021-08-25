using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.GRINGlobal;
using USDA.ARS.GRIN.Admin.Service;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.AccessRightsManagement
{
    public class AccessRightsManagementHomeViewModel
    {
        public string SysUserName { get; set; }
        public string CooperatorEmailAddress { get; set; }
        public string CooperatorFirstName { get; set; }
        public string CooperatorLastName { get; set; }
        public string Organization { get; set; }
        public string StatusCode { get; set; }
        public int SiteID { get; set; }


        public Cooperator Cooperator { get; set; }
        public DateTime CreatedDateFrom { get; set; }
        public DateTime CreatedDateTo { get; set; }
        public IQueryable<User> Users { get; set; }
        public SysUser SysUser { get; set; }
        public User WebUser { get; set; }
        public SelectList CooperatorStatuses { get; set; }
        public SelectList Sites { get; set; }
        public SelectList AvailableGroups { get; set; }
        public List<Group> SelectedGroups { get; set; }

        public AccessRightsManagementHomeViewModel()
        {
            SysUser = new SysUser();
            WebUser = new User();
            Cooperator = new Cooperator();
            Users = new List<User>().AsQueryable();
            SelectedGroups = new List<Group>();
        }
    }
}