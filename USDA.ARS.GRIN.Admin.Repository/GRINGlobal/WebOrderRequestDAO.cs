using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.GRINGlobal;

namespace USDA.ARS.GRIN.Admin.Repository.GRINGlobal
{
    public class WebOrderRequestDAO : BaseDAO, IRepository<WebOrderRequest>
    {
        public WebOrderRequestDAO(string context)
        {
            _context = context;
        }

        public int Add(WebOrderRequest entity)
        {
            throw new NotImplementedException();
        }

        public IQueryable<WebOrderRequest> FindAll()
        {
            throw new NotImplementedException();
        }

        public WebOrderRequest Get(int id)
        {
            throw new NotImplementedException();
        }

        public int Remove(WebOrderRequest entity)
        {
            throw new NotImplementedException();
        }

        public IQueryable<WebOrderRequest> Search(Query query)
        {
            const string COMMAND_TEXT = "usp_WebOrderRequests_Select";
            string sqlWhereClause = String.Empty;
            List<WebOrderRequest> webOrderRequests = new List<WebOrderRequest>();

            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = cn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = COMMAND_TEXT;
                        //cmd.Parameters.AddWithValue("@sql_where_clause", sqlWhereClause);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                // TO DO
                            }                            }
                        }
                    }
                
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            return webOrderRequests.AsQueryable();
        }

        public IQueryable<WebOrderRequest> Search(string statusCode)
        {
            const string COMMAND_TEXT = "usp_WebOrderRequestsByStatus_Select";
            string sqlWhereClause = String.Empty;
            List<WebOrderRequest> webOrderRequests = new List<WebOrderRequest>();

            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = cn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = COMMAND_TEXT;
                        cmd.Parameters.AddWithValue("@status_code", sqlWhereClause);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                // TO DO
                            }
                        }
                    }
                }

            }
            catch (SqlException ex)
            {
                throw ex;
            }
            return webOrderRequests.AsQueryable();
        }

        public int Update(WebOrderRequest entity)
        {
            throw new NotImplementedException();
        }
    }
}
