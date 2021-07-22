using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using USDA.ARS.GRIN.Admin.Models;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.GRINGlobal
{
    public class EmailTemplateHomeViewModel
    {
        public IQueryable<EmailTemplate> EmailTemplates { get; set; }
    }
}