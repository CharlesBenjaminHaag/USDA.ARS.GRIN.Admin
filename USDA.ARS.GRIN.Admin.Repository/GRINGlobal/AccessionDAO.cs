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
    public class AccessionDAO : BaseDAO, IRepository<Accession>
    {
        public AccessionDAO()
        {
        }

        public int AddREFACTOR(Accession entity)
        {
            throw new NotImplementedException();
        }

        public DataTable Find(Query searchObject)
        {
            const string COMMAND_TEXT = "usp_AccessionInvAttach_Search";

            StringBuilder sqlWhereClause = new StringBuilder();
            DataTable searchResults = new DataTable();
            SqlCommand cmd = new SqlCommand();
            SqlConnection conn = null;

            try
            {
                using (conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = COMMAND_TEXT;

                    if (searchObject != null)
                    {
                        foreach (var searchCriterion in searchObject.QueryCriteria)
                        {
                            searchCriterion.SearchSyntax = GetSearchSyntax(searchCriterion.SearchOperatorCode, searchCriterion.FieldValue);
                            if (sqlWhereClause.Length == 0)
                            {
                                sqlWhereClause.Append(" WHERE ");
                            }
                            else
                            {
                                if (sqlWhereClause.Length > 0)
                                {
                                    sqlWhereClause.Append(" OR ");
                                }
                            }

                            searchCriterion.FieldName = GetDatabaseFieldName(searchCriterion.FieldName);
                            sqlWhereClause.Append(searchCriterion.FieldName);
                            sqlWhereClause.Append(" ");
                            sqlWhereClause.Append(searchCriterion.SearchSyntax);
                        }
                    }
                    cmd.Parameters.AddWithValue("@sql_where_clause", sqlWhereClause);

                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {
                        adapter.Fill(searchResults);
                    }
                }
            }
            catch (Exception e)
            {
                throw e;
            }
            return searchResults;
        }

        public IQueryable<Accession> FindAll()
        {
            throw new NotImplementedException();
        }

        public Dictionary<string, int> FindAccessionInventoryValidationCounts()
        {
            Dictionary<string, int> accessionInventoryValidationCounts = new Dictionary<string, int>();

            const string COMMAND_TEXT = "usp_AccessionInvAttachValidationCounts_Select";

            StringBuilder sqlWhereClause = new StringBuilder();
            DataTable searchResults = new DataTable();
            SqlCommand cmd = new SqlCommand();
            SqlConnection conn = null;

            try
            {
                using (conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = COMMAND_TEXT;

                  
                   
                }
            }
            catch (Exception e)
            {
                throw e;
            }

            return accessionInventoryValidationCounts;
        }

        public int Remove(Accession entity)
        {
            throw new NotImplementedException();
        }

        public int Update(Accession entity)
        {
            throw new NotImplementedException();
        }

        public int Add(Accession entity)
        {
            throw new NotImplementedException();
        }

        public Accession Get(int id)
        {
            throw new NotImplementedException();
        }

        public IQueryable<Accession> Search(Query query)
        {
            throw new NotImplementedException();
        }

        public IQueryable<Accession> Search(int parentId)
        {
            throw new NotImplementedException();
        }

        public IQueryable<Accession> Search(string searchString)
        {
            throw new NotImplementedException();
        }

        ResultContainer IRepository<Accession>.Add(Accession entity)
        {
            throw new NotImplementedException();
        }

        ResultContainer IRepository<Accession>.Remove(Accession entity)
        {
            throw new NotImplementedException();
        }

        ResultContainer IRepository<Accession>.Update(Accession entity)
        {
            throw new NotImplementedException();
        }
    }
}
