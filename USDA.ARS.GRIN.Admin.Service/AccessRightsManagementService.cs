using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.GRINGlobal;
using USDA.ARS.GRIN.Admin.Repository;
using USDA.ARS.GRIN.Admin.Repository.GRINGlobal;

namespace USDA.ARS.GRIN.Admin.Service
{
    public class AccessRightsManagementService : BaseService
    {
        protected CooperatorDAO _cooperatorDAO;
        protected SiteDAO _siteDAO;
        
        public AccessRightsManagementService(string context)
        {
            _cooperatorDAO = new CooperatorDAO(context);
            _siteDAO = new SiteDAO(context);
        }

        #region Cooperator

        public IQueryable<Cooperator> CooperatorSearch(Query query)
        {
            return _cooperatorDAO.Search(query);
        }
        #endregion

        #region Site

        public IQueryable<Site> GetSites()
        {
            return _siteDAO.FindAll();
        }

        #endregion
    }
}
