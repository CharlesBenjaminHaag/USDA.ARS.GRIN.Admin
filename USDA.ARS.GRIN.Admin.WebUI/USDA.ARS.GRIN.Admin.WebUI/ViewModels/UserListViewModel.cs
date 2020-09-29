using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Service;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels
{
    public class UserListViewModel : BaseViewModel
    {
        private List<User> _users;

        public IQueryable<User> Users { get; set; }

        public UserListViewModel()
        {
            Users = new List<User>().AsQueryable();
        }
    }
}