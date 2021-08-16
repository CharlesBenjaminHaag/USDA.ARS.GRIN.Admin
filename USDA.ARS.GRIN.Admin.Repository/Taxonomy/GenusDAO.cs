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
        public GenusDAO(string context)
        {
            base._context = context;
        }

        public IQueryable<Genus> Search(Query query)
        {
            string sqlWhereClause = String.Empty;
            IQueryable<Genus> genusList = new List<Genus>().AsQueryable();

            try
            {
                sqlWhereClause = query.GetSQLSyntax();
                genusList = Search(sqlWhereClause);
                return genusList;
            }
            catch (SqlException ex)
            {
                throw ex;
            }
        }

        public IQueryable<Genus> Search(string searchString)
        {
            const string COMMAND_TEXT_NAME = "usp_TaxonomyGenus_Search";
            List<Genus> genera = new List<Genus>();
            Genus genus = new Genus();

            try
            {
                using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = COMMAND_TEXT_NAME;
                    cmd.Parameters.AddWithValue("@sql_where_clause", searchString);
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        genus = new Genus();
                        genus.ID = GetInt(reader["taxonomy_genus_id"].ToString());
                        genus.ParentID = GetInt(reader["current_taxonomy_genus_id"].ToString());
                        genus.FamilyID = GetInt(reader["taxonomy_family_id"].ToString());
                        genus.HybridCode = reader["hybrid_code"].ToString();
                        genus.Name = reader["genus_name"].ToString();
                        genus.Authority = reader["genus_authority"].ToString();
                        genus.SubGenusName = reader["subgenus_name"].ToString();
                        genus.Note = reader["note"].ToString();
                        genus.CreatedByCooperatorID = GetInt(reader["created_by"].ToString());
                        genus.CreatedByCooperatorName = reader["created_by_name"].ToString();
                        genus.CreatedDate = GetDate(reader["created_date"].ToString());
                        genus.ModifiedByCooperatorID = GetInt(reader["modified_by"].ToString());
                        genus.ModifiedByCooperatorName = reader["modified_by_name"].ToString();
                        genus.ModifiedDate = GetDate(reader["modified_date"].ToString());
                        genera.Add(genus);
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return genera.AsQueryable();
        }

        public Genus Get(int id)
        {
            const string COMMAND_TEXT_NAME = "usp_TaxonomyGenus_Select";
            Genus genus = new Genus();

            try
            {
                using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = COMMAND_TEXT_NAME;
                    cmd.Parameters.AddWithValue("@taxonomy_genus_id", id);
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        genus.ID = GetInt(reader["taxonomy_genus_id"].ToString());
                        genus.ParentID = GetInt(reader["current_taxonomy_genus_id"].ToString());
                        genus.FamilyID = GetInt(reader["taxonomy_family_id"].ToString());
                        genus.HybridCode = reader["hybrid_code"].ToString();
                        genus.Name = reader["genus_name"].ToString();
                        genus.Authority = reader["genus_authority"].ToString();
                        genus.SubGenusName = reader["subgenus_name"].ToString();
                        genus.SectionName = reader["section_name"].ToString();
                        genus.Note = reader["note"].ToString();
                        genus.CreatedByCooperatorID = GetInt(reader["created_by"].ToString());
                        genus.CreatedByCooperatorName = reader["created_by_name"].ToString();
                        genus.CreatedDate = GetDate(reader["created_date"].ToString());
                        genus.ModifiedByCooperatorID = GetInt(reader["modified_by"].ToString());
                        genus.ModifiedByCooperatorName = reader["modified_by_name"].ToString();
                        genus.ModifiedDate = GetDate(reader["modified_date"].ToString());
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return genus;
        }
        public ResultContainer Add(Genus entity)
        {
            throw new NotImplementedException();
        }

        public ResultContainer Update(Genus entity)
        {
            throw new NotImplementedException();
        }
        public ResultContainer Remove(Genus entity)
        {
            throw new NotImplementedException();
        }

        #region REFACTOR
        public IQueryable<Genus> Find(string searchExpression)
        {
            const string COMMAND_TEXT = "usp_TaxonomyGenii_Search";
            List<Genus> genusList = new List<Genus>();

            try
            {
                using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = COMMAND_TEXT;
                    cmd.Parameters.AddWithValue("search_string", searchExpression);
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        genusList.Add(new Genus { ID = GetInt(reader["taxonomy_genus_id"].ToString()), Name = reader["genus_name"].ToString() });
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return genusList.AsQueryable();
        }

        public IQueryable<Genus> Find()
        {
            const string COMMAND_TEXT = "usp_TaxonomyGenera_Select";
            List<Genus> genusList = new List<Genus>();

            try
            {
                using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = COMMAND_TEXT;
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        genusList.Add(new Genus { ID = GetInt(reader["taxonomy_genus_id"].ToString()), Name = reader["genus_name"].ToString() });
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return genusList.AsQueryable();
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
        public IQueryable<Genus> FindAll()
        {
            throw new NotImplementedException();
        }

        public IQueryable<Genus> Search(int parentId)
        {
            throw new NotImplementedException();
        }
        ResultContainer IRepository<Genus>.Add(Genus entity)
        {
            throw new NotImplementedException();
        }

        ResultContainer IRepository<Genus>.Remove(Genus entity)
        {
            throw new NotImplementedException();
        }

        ResultContainer IRepository<Genus>.Update(Genus entity)
        {
            throw new NotImplementedException();
        }
        #endregion REFACTOR
    }
}
