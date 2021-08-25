using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using USDA.ARS.GRIN.Admin.Models;

namespace USDA.ARS.GRIN.Admin.Repository
{
    public class SysUserDAO : BaseDAO, IRepository<SysUser>
    {
        public ResultContainer Add(SysUser entity)
        {
            throw new NotImplementedException();
        }

        public IQueryable<SysUser> FindAll()
        {
            throw new NotImplementedException();
        }

        public SysUser Get(int id)
        {
            throw new NotImplementedException();
        }

        public ResultContainer Remove(SysUser entity)
        {
            throw new NotImplementedException();
        }

        public IQueryable<SysUser> Search(Query query)
        {
            throw new NotImplementedException();
        }

        public IQueryable<SysUser> Search(string searchString)
        {
            throw new NotImplementedException();
        }

        public ResultContainer Update(SysUser entity)
        {
            throw new NotImplementedException();
        }
    }
}
