using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using USDA.ARS.GRIN.Admin.Models;


namespace USDA.ARS.GRIN.Admin.Repository.GRINGlobal
{
    public class SiteDAO : BaseDAO, IRepository<Site>
    {
        public SiteDAO(string context)
        {
            base._context = context;
        }

        public ResultContainer Add(Site entity)
        {
            throw new NotImplementedException();
        }

        public IQueryable<Site> FindAll()
        {
            const string COMMAND_TEXT = "usp_GRINGlobalSites_Select";
            Dictionary<string, int> dictTotals = new Dictionary<string, int>();
            List<Site> sites = new List<Site>();

            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = cn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = COMMAND_TEXT;

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                sites.Add(new Site { ID = GetInt(reader["site_id"].ToString()), DisplayName = reader["name"].ToString() }) ;
                            }
                        }
                    }
                }
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            return sites.AsQueryable();
        }

        public Site Get(int id)
        {
            throw new NotImplementedException();
        }

        public ResultContainer Remove(Site entity)
        {
            throw new NotImplementedException();
        }

        public IQueryable<Site> Search(Query query)
        {
            throw new NotImplementedException();
        }

        public IQueryable<Site> Search(string searchString)
        {
            throw new NotImplementedException();
        }

        public ResultContainer Update(Site entity)
        {
            throw new NotImplementedException();
        }
    }
}
