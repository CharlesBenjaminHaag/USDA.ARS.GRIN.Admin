using System.Web.Mvc;
using System.Web.Routing;

namespace USDA.ARS.GRIN.Admin.WebUI
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.MapMvcAttributeRoutes();

        //    routes.MapRoute(
        //    "Taxonomy",    // Route name
        //    "taxonomy/{controller}/{action}",// URL with parameters
        //    new
        //    {
        //        controller = "Species",
        //        action =
        //            "Home"
        //    }  // Parameter defaults
        //);

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
