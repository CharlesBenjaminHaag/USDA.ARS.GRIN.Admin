using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Threading.Tasks;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Genesys;
using USDA.ARS.GRIN.Admin.Repository.Genesys;

namespace USDA.ARS.GRIN.Admin.Service
{
    public class GenesysService : BaseService
    {
        GenesysDAO _genesysDAO = new GenesysDAO();

        public PassportDataExport GetExport()
        {
            return _genesysDAO.GetExport();
        }
    }
}
