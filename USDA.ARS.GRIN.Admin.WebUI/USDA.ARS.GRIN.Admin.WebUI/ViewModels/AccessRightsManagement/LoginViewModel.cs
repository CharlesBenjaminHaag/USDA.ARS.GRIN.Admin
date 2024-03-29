﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels
{
    public class LoginViewModel
    {
        public string Action { get; set; }
        public string UserName { get; set; }
        public string ResetUserName { get; set; }
        public string Password { get; set; }
        public string Environment { get; set; }
        public string Status { get; set; }
        public string Message { get; set; }
        public string ErrorMessage { get; set; }
    }
}