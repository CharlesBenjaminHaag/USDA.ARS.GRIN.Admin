using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using USDA.ARS.GRIN.Admin.Repository;
using USDA.ARS.GRIN.Admin.Models;

namespace USDA.ARS.GRIN.Admin.Service
{
    public class CropService
    {
        protected TaxonomyCropDAO _taxonomyCropDAO = new TaxonomyCropDAO();

        public DataTable Find(Query searchObject)
        {
            return _taxonomyCropDAO.Find(searchObject);
        }

        public DataTable FindCropWildRelatives(Query searchObject)
        {
            return _taxonomyCropDAO.FindCropWildRelatives(searchObject);
        }

     
    }
}
