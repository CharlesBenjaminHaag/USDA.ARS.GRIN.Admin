using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Text;

namespace USDA.ARS.GRIN.Admin
{
    public class ConfigurationHelper
    {
        public static string GetConnectionString(string key)
        {
            string val = "NA";

            if (ConfigurationManager.ConnectionStrings[key] != null)
            {
                val = ConfigurationManager.ConnectionStrings[key].ConnectionString;
            }
            return val;
        }
    }
}