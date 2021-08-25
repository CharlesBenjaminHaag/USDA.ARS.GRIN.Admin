using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using USDA.ARS.GRIN.Admin.Models;

namespace USDA.ARS.GRIN.Admin.Repository.GRINGlobal
{
    public class CooperatorDAO : BaseDAO, IRepository<Cooperator>
    {
        public CooperatorDAO(string context)
        {
            base._context = context;
        }

        public ResultContainer Add(Cooperator entity)
        {
            throw new NotImplementedException();
        }

        public IQueryable<Cooperator> FindAll()
        {
            throw new NotImplementedException();
        }

        public Cooperator Get(int id)
        {
            throw new NotImplementedException();
        }

        public ResultContainer Remove(Cooperator entity)
        {
            throw new NotImplementedException();
        }

        public IQueryable<Cooperator> Search(Query query)
        {
            throw new NotImplementedException();
        }

        public IQueryable<Cooperator> Search(string searchString)
        {
            throw new NotImplementedException();
        }

        public ResultContainer Update(Cooperator entity)
        {
            throw new NotImplementedException();
        }

        Cooperator IRepository<Cooperator>.Get(int id)
        {
            throw new NotImplementedException();
        }
    }
}
