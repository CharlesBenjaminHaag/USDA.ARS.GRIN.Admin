using System.Web.Mvc;

namespace USDA.ARS.GRIN.Admin.WebUI.Controllers
{
    public class ErrorController : Controller
    {
        [HttpGet]
        public ActionResult _Error()
        {
            var exception = Server.GetLastError();
            return PartialView();
        }

        [HttpGet]
        public ActionResult InternalServerError()
        {
            var exception = Server.GetLastError();
            return View();
        }

        [HttpGet]
        public ActionResult NotFound()
        {
            return View();
        }
    }
}
