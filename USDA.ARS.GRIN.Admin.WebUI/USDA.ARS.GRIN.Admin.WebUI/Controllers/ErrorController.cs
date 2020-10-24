using System.Web.Mvc;

namespace USDA.ARS.GRIN.Admin.WebUI.Controllers
{
    public class ErrorController : Controller
    {
        [HttpGet]
        public ActionResult _Error()
        {
            return PartialView();
        }

        [HttpGet]
        public ActionResult InternalServerError()
        {
            return View();
        }

        [HttpGet]
        public ActionResult NotFound()
        {
            return View();
        }
    }
}
