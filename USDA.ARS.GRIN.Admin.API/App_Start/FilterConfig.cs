using System.Web;
using System.Web.Mvc;

namespace USDA.ARS.GRIN.Admin.API
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
