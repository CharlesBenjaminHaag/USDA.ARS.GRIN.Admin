using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace USDA.ARS.GRIN.Admin.API.Controllers
{
    public class RegulationController : Controller
    {
        // GET: Regulation
        public ActionResult Index()
        {
            return View();
        }
    }
}