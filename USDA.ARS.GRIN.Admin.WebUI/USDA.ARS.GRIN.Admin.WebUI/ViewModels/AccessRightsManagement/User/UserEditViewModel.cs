using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using USDA.ARS.GRIN.Admin.Models;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.AccessRightsManagement
{
    public class UserEditViewModel : BaseViewModel
    {
        public string ActiveContext { get; set; }
        public string AppName1 { get; set; }
        public string AppName2 { get; set; }
        public string AppAbbrev { get; set; }
        public int SysUserID { get; set; }
        public string SysUserName { get; set; }
        public string SysUserPassword { get; set; }
        public string Title { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string FullName { get; set; }
        public string Organization { get; set; }
        public string Job { get; set; }
        public string EmailAddress { get; set; }
        public string PrimaryPhoneNumber { get; set; }
        public string SecondaryPhoneNumber { get; set; }
        public bool IsActive { get; set; }
        public string AddressLine1 { get; set; }
        public string AddressLine2 { get; set; }
        public string AddressLine3 { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string ZIP { get; set; }
        public List<Group> SelectedGroups { get; set; }
        public List<Group> AvailableGroups { get; set; }
    }
}