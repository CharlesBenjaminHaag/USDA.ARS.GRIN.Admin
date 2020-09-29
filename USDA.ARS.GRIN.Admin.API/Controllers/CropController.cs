using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace USDA.ARS.GRIN.Admin.API.Controllers
{
    public class CropController : Controller
    {
        // GET: CropForCWR
        public ActionResult Index()
        {
            return View();
        }
    }
}