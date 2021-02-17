using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;
using System.Runtime.InteropServices;

namespace USDA.ARS.GRIN.Admin.Repository.Taxonomy
{
    public class FamilyDAO : BaseDAO, IRepository<Family>
    {
        private string _context;
        public FamilyDAO(string context)
        {
            _context = context;
        }

        public Family Get(int id)
        {
            return null;
        }

        public int AddREFACTOR(Family entity)
        {
            throw new NotImplementedException();
        }

        public IQueryable<Family> Find(Query query = null)
        {
            const string COMMAND_TEXT = "usp_TaxonomyFamilies_Search";
            StringBuilder sqlWhereClause = new StringBuilder();
            List<Family> familyList = new List<Family>();

            try
            {
                if (query != null)
                {
                    foreach (var searchCriterion in query.QueryCriteria)
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

                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = cn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = COMMAND_TEXT;

                        if (sqlWhereClause.Length > 0)
                        { 
                            cmd.Parameters.AddWithValue("@sql_where_clause", sqlWhereClause);
                        }     
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                Family family = new Family();
                                family.ID = GetInt(reader["taxonomy_family_id"].ToString());
                                family.Name = reader["family_name"].ToString();
                                //family.Genii = _genusDAO.Find(family.ID);
                                familyList.Add(family);
                            }
                        }
                    }
                }
            }
            catch (Exception e)
            {
                throw e;
            }
            return familyList.AsQueryable();
        }

        public IQueryable<Family> FindAll()
        {
            throw new NotImplementedException();
        }

        public int Remove(Family entity)
        {
            throw new NotImplementedException();
        }

        public int Update(Family entity)
        {
            throw new NotImplementedException();
        }

        public int Add(Family entity)
        {
            throw new NotImplementedException();
        }

        public IQueryable<Family> Search(Query query)
        {
            throw new NotImplementedException();
        }

        public IQueryable<Family> Search(int parentId)
        {
            throw new NotImplementedException();
        }

        public IQueryable<Family> Search(string searchString)
        {
            throw new NotImplementedException();
        }

        ResultContainer IRepository<Family>.Add(Family entity)
        {
            throw new NotImplementedException();
        }

        ResultContainer IRepository<Family>.Remove(Family entity)
        {
            throw new NotImplementedException();
        }

        ResultContainer IRepository<Family>.Update(Family entity)
        {
            throw new NotImplementedException();
        }
    }
}
