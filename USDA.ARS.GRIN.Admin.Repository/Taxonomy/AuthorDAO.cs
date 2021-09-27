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
    public class AuthorDAO : BaseDAO, IRepository<Author>
    {
        public AuthorDAO(string context)
        {
            base._context = context;
        }
        public ResultContainer Add(Author entity)
        {
            throw new NotImplementedException();
        }

        public IQueryable<Author> FindAll()
        {
            throw new NotImplementedException();
        }

        public Author Get(int id)
        {
            throw new NotImplementedException();
        }

        public ResultContainer Remove(Author entity)
        {
            throw new NotImplementedException();
        }

        public IQueryable<Author> Search(Query query)
        {
            throw new NotImplementedException();
        }

        public IQueryable<Author> Search(string searchString)
        {
            throw new NotImplementedException();
        }

        public ResultContainer Update(Author entity)
        {
            throw new NotImplementedException();
        }
    }
}
