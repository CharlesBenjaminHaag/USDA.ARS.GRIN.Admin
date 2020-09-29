using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Repository
{
    public interface IRepository<T>
    {
        int AddREFACTOR(T entity);
        int Remove(T entity);
        int Update(T entity);
        IQueryable<T> FindAll();
    }
}
