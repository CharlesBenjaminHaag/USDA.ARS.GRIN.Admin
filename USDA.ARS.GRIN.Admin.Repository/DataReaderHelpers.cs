using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace USDA.ARS.GRIN.Admin.Repository
{
    public static class DataReaderHelpers
    {
        public static T GetFieldValue<T>(this SqlDataReader dr, string name)
        {
            T ret = default;
            if (!dr[name].Equals(DBNull.Value))
            {
                ret = (T)dr[name];
            }
            return ret;
        }
    }
}
