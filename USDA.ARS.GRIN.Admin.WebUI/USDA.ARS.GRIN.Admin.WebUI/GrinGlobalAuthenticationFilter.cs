using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Filters;
using USDA.ARS.GRIN.Admin.Models;

namespace USDA.ARS.GRIN.Admin.WebUI
{
    public class GrinGlobalAuthentication : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            UserSession userSession = filterContext.HttpContext.Session["USER_SESSION"] as UserSession;

            if (userSession == null)
            {
                filterContext.Result = new RedirectToRouteResult(new System.Web.Routing.RouteValueDictionary(new { controller = "User", action = "Login" }));
            }
          
            base.OnActionExecuting(filterContext);
        }

        //public override void OnActionExecuting(ActionExecutingContext filterContext)
        ////{
        ////    string DEBUG = filterContext.RouteData.ToString();
        ////    filterContext.Result = new RedirectToRouteResult(new System.Web.Routing.RouteValueDictionary(new { controller = "User", action = "Login" }));
        ////    filterContext.Result.ExecuteResult(filterContext.Controller.ControllerContext);
        ////}

        //public override void OnActionExecuting(ActionExecutingContext filterContext)
        //{
        //    HttpSessionStateBase session = filterContext.HttpContext.Session;
        //    Controller controller = filterContext.Controller as Controller;

        //    if (controller != null)
        //    {
        //        if (session["Login"] == null)
        //        {
        //            filterContext.Cancel = true;
        //            controller.HttpContext.Response.Redirect("./Login");
        //        }
        //    }

        //    base.OnActionExecuting(filterContext);
        //}


    }
}