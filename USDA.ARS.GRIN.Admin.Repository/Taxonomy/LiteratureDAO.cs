using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Runtime.Caching;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;

namespace USDA.ARS.GRIN.Admin.Repository.Taxonomy
{
    public class LiteratureDAO : BaseDAO, IRepository<Literature>
    {
        public ResultContainer Add(Literature entity)
        {
            throw new NotImplementedException();
        }

        public IQueryable<Literature> FindAll()
        {
            throw new NotImplementedException();
        }

        public Literature Get(int id)
        {
            throw new NotImplementedException();
        }

     


        public ResultContainer Remove(Literature entity)
        {
            throw new NotImplementedException();
        }

        public IQueryable<Literature> Search(Query query)
        {
            throw new NotImplementedException();
        }

        public IQueryable<Literature> Search(string searchString)
        {
            throw new NotImplementedException();
        }

        public ResultContainer Update(Literature entity)
        {
            throw new NotImplementedException();
        }
    }
}
