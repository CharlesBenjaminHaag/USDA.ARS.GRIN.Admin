using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Service;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels
{
    public class SysUserListViewModel : BaseViewModel
    {
        private List<SysUser> _sysUsers;

        public IQueryable<SysUser> SysUsers { get; set; }

        public SysUserListViewModel()
        {
            SysUsers = new List<SysUser>().AsQueryable();
        }
    }
}