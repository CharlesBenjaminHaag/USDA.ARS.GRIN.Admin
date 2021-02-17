using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.GRINGlobal;

namespace USDA.ARS.GRIN.Admin.Repository
{
    public class InventoryDAO : BaseDAO, IRepository<Inventory>
    {
        public int Add(Inventory entity)
        {
            throw new NotImplementedException();
        }

        public int AddREFACTOR(Inventory entity)
        {
            throw new NotImplementedException();
        }

        public Inventory Get(int id)
        {
            throw new NotImplementedException();
        }

        public int Remove(Inventory entity)
        {
            throw new NotImplementedException();
        }

        public IQueryable<Inventory> Search(Query query)
        {
            throw new NotImplementedException();
        }

        public IQueryable<Inventory> Search(int parentId)
        {
            throw new NotImplementedException();
        }

        public IQueryable<Inventory> Search(string searchString)
        {
            throw new NotImplementedException();
        }

        public int Update(Inventory entity)
        {
            throw new NotImplementedException();
        }

        ResultContainer IRepository<Inventory>.Add(Inventory entity)
        {
            throw new NotImplementedException();
        }

        IQueryable<Inventory> IRepository<Inventory>.FindAll()
        {
            throw new NotImplementedException();
        }

        ResultContainer IRepository<Inventory>.Remove(Inventory entity)
        {
            throw new NotImplementedException();
        }

        ResultContainer IRepository<Inventory>.Update(Inventory entity)
        {
            throw new NotImplementedException();
        }
    }
}
