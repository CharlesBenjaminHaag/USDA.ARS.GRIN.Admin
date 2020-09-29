using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using USDA.ARS.GRIN.Admin.Taxonomy.Models;

namespace USDA.ARS.GRIN.Admin.Repository
{
    public class SqlRepository<T> : IRepository<T> 
    {
        public SqlRepository()
        {
        }

        public IQueryable<T> FindCrops(string searchExpression)
        {
            return null;
        }

        public T GetCropMap(int Id)
        {
            return default(T);
        }

        public int AddREFACTOR(T newEntity)
        {
            return 0;
        }

        public int Update(T newEntity)
        {
            int returnCode = 0;

            return returnCode;
        }

        public int Remove(T entity)
        {
            int returnCode = 0;
            return returnCode;
        }

        public IQueryable<T> FindAll()
        {
            return null;
        }
    }
}
