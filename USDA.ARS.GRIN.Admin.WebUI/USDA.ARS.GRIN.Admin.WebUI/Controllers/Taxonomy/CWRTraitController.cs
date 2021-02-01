using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using NLog;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.WebUI.ViewModels.Taxonomy;

namespace USDA.ARS.GRIN.Admin.WebUI.Controllers.Taxonomy
{
    public class CWRTraitController : BaseController, IController<CWRTraitViewModel>
    {
        const string BASE_PATH = "~/Views/Taxonomy/CWRTrait";
        private static readonly Logger Log = LogManager.GetCurrentClassLogger();

        public ActionResult Edit(int id)
        {
            throw new NotImplementedException();
        }

        [HttpPost]
        public ActionResult Edit(CWRTraitViewModel viewModel)
        {
            throw new NotImplementedException();
        }

        [Route("taxonomy/cwr/map/trait/home")]
        public ActionResult Index()
        {
            return View();
        }

        public PartialViewResult ListByUser()
        {
            throw new NotImplementedException();
        }

        public PartialViewResult ListRecent()
        {
            throw new NotImplementedException();
        }

        [HttpGet]
        [Route("Taxonomy/CWRTrait/List/{cwrMapId}")]
        public PartialViewResult List(int cwrMapId)
        {
            throw new NotImplementedException();
        }

        public PartialViewResult Search(Query q)
        {
            throw new NotImplementedException();
        }

        [HttpPost]
        public PartialViewResult Search(CWRTraitViewModel viewModel)
        {
            throw new NotImplementedException();
        }
    }
}