using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;
using USDA.ARS.GRIN.Admin.Models;

namespace USDA.ARS.GRIN.Admin.Repository.Taxonomy
{
    public class GenusDAO : BaseDAO, IRepository<Genus>
    {
        private string _context;
        public GenusDAO(string context)
        {
            _context = context;
        }
        public IQueryable<Family> Find(Query query = null)
        {
            const string COMMAND_TEXT = "usp_Taxonomy_Search";
            StringBuilder sqlWhereClause = new StringBuilder();
            List<Family> familyList = new List<Family>();

            //try
            //{
            //    if (query != null)
            //    {
            //        foreach (var searchCriterion in query.QueryCriteria)
            //        {
            //            searchCriterion.SearchSyntax = GetSearchSyntax(searchCriterion.SearchOperatorCode, searchCriterion.FieldValue);
            //            if (sqlWhereClause.Length == 0)
            //            {
            //                sqlWhereClause.Append(" WHERE ");
            //            }
            //            else
            //            {
            //                if (sqlWhereClause.Length > 0)
            //                {
            //                    sqlWhereClause.Append(" OR ");
            //                }
            //            }

            //            searchCriterion.FieldName = GetDatabaseFieldName(searchCriterion.FieldName);
            //            sqlWhereClause.Append(searchCriterion.FieldName);
            //            sqlWhereClause.Append(" ");
            //            sqlWhereClause.Append(searchCriterion.SearchSyntax);
            //        }
            //    }

            //    using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
            //    {
            //        using (SqlCommand cmd = new SqlCommand())
            //        {
            //            cmd.Connection = cn;
            //            cmd.CommandType = CommandType.StoredProcedure;
            //            cmd.CommandText = COMMAND_TEXT;

            //            if (sqlWhereClause.Length > 0)
            //            {
            //                cmd.Parameters.AddWithValue("@sql_where_clause", sqlWhereClause);
            //            }
            //            using (SqlDataReader reader = cmd.ExecuteReader())
            //            {
            //                while (reader.Read())
            //                {
            //                    Family family = new Family();
            //                    family.Name = reader["family_name"].ToString();
            //                    family.Genii =
            //                    familyList.Add(family);
            //                }
            //            }
            //        }
            //    }
            //}
            //catch (Exception e)
            //{
            //    throw e;
            //}
            return familyList.AsQueryable();
        }

        public IQueryable<Genus> Find(int familyId)
        {
            const string COMMAND_TEXT = "usp_TaxonomyGenii_Select";
            List<Genus> genii = new List<Genus>();
            
            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(this._context)))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = cn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = COMMAND_TEXT;
                        cmd.Parameters.AddWithValue("@taxonomy_family_id", familyId);
                        
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                Genus genus = new Genus();
                                genus.Name = reader["genus_name"].ToString();
                                genii.Add(genus);
                            }
                        }
                    }
                }
            }
            catch (Exception e)
            {
                throw e;
            }
            return genii.AsQueryable();

        }

        public int AddREFACTOR(Genus entity)
        {
            throw new NotImplementedException();
        }

        public IQueryable<Genus> FindAll()
        {
            throw new NotImplementedException();
        }

        public int Remove(Genus entity)
        {
            throw new NotImplementedException();
        }

        public int Update(Genus entity)
        {
            throw new NotImplementedException();
        }
    }
}
