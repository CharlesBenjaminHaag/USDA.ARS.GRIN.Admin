using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using USDA.ARS.GRIN.Admin.Models;

namespace USDA.ARS.GRIN.Admin.Repository
{
    public interface IRepository<T>
    {
        int Add(T entity);
        T Get(int id);
        int Remove(T entity);
        int Update(T entity);
        IQueryable<T> FindAll();
        IQueryable<T> Search(Query query);
        IQueryable<T> Search(string searchString);
    }
}
