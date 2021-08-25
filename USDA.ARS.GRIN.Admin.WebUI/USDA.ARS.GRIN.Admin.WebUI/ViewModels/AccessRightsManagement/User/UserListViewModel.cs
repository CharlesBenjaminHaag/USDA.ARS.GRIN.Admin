using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using USDA.ARS.GRIN.Admin.Models;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.AccessRightsManagement
{
    public class UserListViewModel
    {
        public IQueryable<User> Users { get; set; }
    }
}