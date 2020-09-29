using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Caching;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.GRINGlobal;
using DocumentFormat.OpenXml.Drawing;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.GRINGlobal.Inventory
{
    public class HomeViewModel : BaseViewModel
    {
        public int BatchSize { get; set; }
    }
}