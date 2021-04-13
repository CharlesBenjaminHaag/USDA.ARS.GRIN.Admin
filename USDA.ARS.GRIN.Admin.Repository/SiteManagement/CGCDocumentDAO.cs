using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.SiteManagement;

namespace USDA.ARS.GRIN.Admin.Repository.SiteManagement
{
    public class CGCDocumentDAO : BaseDAO, IRepository<CGCDocument>
    {
        public ResultContainer Add(CGCDocument entity)
        {
            throw new NotImplementedException();
        }

        public IQueryable<CGCDocument> FindAll()
        {
            throw new NotImplementedException();
        }

        public CGCDocument Get(int id)
        {
            throw new NotImplementedException();
        }

        public ResultContainer Remove(CGCDocument entity)
        {
            throw new NotImplementedException();
        }

        public IQueryable<CGCDocument> Search(Query query)
        {
            throw new NotImplementedException();
        }

        public IQueryable<CGCDocument> Search(string searchString)
        {
            throw new NotImplementedException();
        }

        public ResultContainer Update(CGCDocument entity)
        {
            throw new NotImplementedException();
        }
    }
}
