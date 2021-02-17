using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using USDA.ARS.GRIN.Admin.Models;

namespace USDA.ARS.GRIN.Admin.WebUI.Controllers
{
    public interface IController<T>
    {
        ActionResult Index();
        ActionResult Edit(int id);
        [HttpPost]
        ActionResult Edit(T viewModel);
        //PartialViewResult Search(Query q);
        //[HttpPost]
        //PartialViewResult Search(T viewModel);

        PartialViewResult ListByUser();
        PartialViewResult ListRecent();
       
    }
}