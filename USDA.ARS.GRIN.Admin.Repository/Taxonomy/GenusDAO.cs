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
        private FamilyDAO _familyDAO = null;    
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
                        genus.QualifyingCode = reader["qualifying_code"].ToString();
                        genus.Name = reader["name"].ToString();
                        genus.FullName = reader["full_name"].ToString();
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

        public IQueryable<Genus> GetFolderItems(int folderId)
        {
            const string COMMAND_TEXT_NAME = "usp_TaxonomyFolderGenusItemMaps_Select";
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
                    cmd.Parameters.AddWithValue("@taxonomy_folder_id", folderId);
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        genus = new Genus();
                        genus.ReferenceID = GetInt(reader["taxonomy_folder_item_id"].ToString());
                        genus.ID = GetInt(reader["taxonomy_genus_id"].ToString());
                        genus.ParentID = GetInt(reader["current_taxonomy_genus_id"].ToString());
                        genus.FamilyID = GetInt(reader["taxonomy_family_id"].ToString());
                        genus.HybridCode = reader["hybrid_code"].ToString();
                        genus.QualifyingCode = reader["qualifying_code"].ToString();
                        genus.Name = reader["name"].ToString();
                        genus.FullName = reader["full_name"].ToString();
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
            // Not optimal. Refactor. --CBH, 9/10/21
            genus.AcceptedGenus = new Genus();

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

                        if (reader["current_taxonomy_genus_id"] == DBNull.Value)
                            genus.ParentID = 0;
                        else
                            genus.ParentID = GetInt(reader["current_taxonomy_genus_id"].ToString());

                        if ((genus.ID != genus.ParentID) && (genus.ParentID > 0))
                        {
                            genus.IsSynonym = true;
                        }

                        genus.FamilyID = GetInt(reader["taxonomy_family_id"].ToString());
                        genus.FamilyName = reader["family_name"].ToString();
                        genus.FamilyFullName = reader["family_full_name"].ToString();
                        genus.QualifyingCode = reader["qualifying_code"].ToString();
                        genus.HybridCode = reader["hybrid_code"].ToString();
                        genus.Name = reader["name"].ToString();
                        genus.FullName = reader["full_name"].ToString();
                        genus.Authority = reader["genus_authority"].ToString();
                        genus.SubGenusName = reader["subgenus_name"].ToString();
                        genus.SectionName = reader["section_name"].ToString();
                        genus.SubSectionName = reader["subsection_name"].ToString();
                        genus.SeriesName = reader["series_name"].ToString();
                        genus.SubSeriesName = reader["subseries_name"].ToString();
                        genus.Note = reader["note"].ToString();
                        genus.CreatedByCooperatorID = GetInt(reader["created_by"].ToString());
                        genus.CreatedByCooperatorName = reader["created_by_name"].ToString();
                        genus.CreatedDate = GetDate(reader["created_date"].ToString());
                        genus.ModifiedByCooperatorID = GetInt(reader["modified_by"].ToString());
                        genus.ModifiedByCooperatorName = reader["modified_by_name"].ToString();
                        genus.ModifiedDate = GetDate(reader["modified_date"].ToString());
                        if (genus.IsSynonym)
                        {
                            genus.AcceptedGenus = Get(genus.ParentID);
                        }
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
            const string COMMAND_TEXT = "usp_TaxonomyGenus_Insert";
            ResultContainer resultContainer = new ResultContainer();

            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = cn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = COMMAND_TEXT;

                        if (entity.ParentID == 0)
                            cmd.Parameters.AddWithValue("@current_taxonomy_genus_id", entity.ID);
                        else
                            cmd.Parameters.AddWithValue("@current_taxonomy_genus_id", entity.ParentID);

                        cmd.Parameters.AddWithValue("@taxonomy_family_id", entity.FamilyID);

                        if (!String.IsNullOrEmpty(entity.QualifyingCode))
                            cmd.Parameters.AddWithValue("@qualifying_code", entity.QualifyingCode);
                        else
                            cmd.Parameters.AddWithValue("@qualifying_code", DBNull.Value);

                        if (!String.IsNullOrEmpty(entity.HybridCode))
                            cmd.Parameters.AddWithValue("@hybrid_code", entity.HybridCode);
                        else
                            cmd.Parameters.AddWithValue("@hybrid_code", DBNull.Value);

                        if (!String.IsNullOrEmpty(entity.Name))
                            cmd.Parameters.AddWithValue("@genus_name", entity.Name);
                        else
                            cmd.Parameters.AddWithValue("@genus_name", DBNull.Value);

                        if (!String.IsNullOrEmpty(entity.Authority))
                            cmd.Parameters.AddWithValue("@genus_authority", entity.Authority);
                        else
                            cmd.Parameters.AddWithValue("@genus_authority", DBNull.Value);

                        if (!String.IsNullOrEmpty(entity.SubGenusName))
                            cmd.Parameters.AddWithValue("@subgenus_name", entity.SubGenusName);
                        else
                            cmd.Parameters.AddWithValue("@subgenus_name", DBNull.Value);

                        if (!String.IsNullOrEmpty(entity.SectionName))
                            cmd.Parameters.AddWithValue("@section_name", entity.SectionName);
                        else
                            cmd.Parameters.AddWithValue("@section_name", DBNull.Value);

                        if (!String.IsNullOrEmpty(entity.SubSectionName))
                            cmd.Parameters.AddWithValue("@subsection_name", entity.SubSectionName);
                        else
                            cmd.Parameters.AddWithValue("@subsection_name", DBNull.Value);

                        if (!String.IsNullOrEmpty(entity.SeriesName))
                            cmd.Parameters.AddWithValue("@series_name", entity.SeriesName);
                        else
                            cmd.Parameters.AddWithValue("@series_name", DBNull.Value);

                        if (!String.IsNullOrEmpty(entity.SubSeriesName))
                            cmd.Parameters.AddWithValue("@subseries_name", entity.SubSeriesName);
                        else
                            cmd.Parameters.AddWithValue("@subseries_name", DBNull.Value);

                        if (!String.IsNullOrEmpty(entity.Note))
                            cmd.Parameters.AddWithValue("@note", entity.Note);
                        else
                            cmd.Parameters.AddWithValue("@note", DBNull.Value);

                        cmd.Parameters.AddWithValue("@created_by", entity.CreatedByCooperatorID);

                        SqlParameter errorParam = new SqlParameter();
                        errorParam.SqlDbType = System.Data.SqlDbType.Int;
                        errorParam.ParameterName = "@out_error_number";
                        errorParam.Direction = System.Data.ParameterDirection.Output;
                        errorParam.Value = 0;
                        cmd.Parameters.Add(errorParam);

                        SqlParameter genusIdParam = new SqlParameter();
                        genusIdParam.SqlDbType = System.Data.SqlDbType.Int;
                        genusIdParam.ParameterName = "@out_taxonomy_genus_id";
                        genusIdParam.Direction = System.Data.ParameterDirection.Output;
                        genusIdParam.Value = 0;
                        cmd.Parameters.Add(genusIdParam);

                        cmd.ExecuteNonQuery();
                        resultContainer.ResultCode = cmd.Parameters["@out_error_number"].Value.ToString();
                        if (!String.IsNullOrEmpty(resultContainer.ResultCode))
                        {
                            if (Int32.Parse(resultContainer.ResultCode) > 0)
                            {
                                throw new Exception(resultContainer.ResultCode + resultContainer.ResultMessage);
                            }
                        }
                        resultContainer.EntityID = GetInt(cmd.Parameters["@out_taxonomy_genus_id"].Value.ToString());
                    }
                }
            }
            catch (SqlException ex)
            {
                switch (ex.Errors[0].Number)
                {
                    case 547: // Foreign Key violation
                        string s = ex.Message;
                        s = s.Substring(s.IndexOf("column "));
                        string[] array = s.Split('.');
                        s = array[0].Substring(array[0].IndexOf('\''));
                        break;
                }
                throw ex;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return resultContainer;
        }

        public ResultContainer Update(Genus entity)
        {
            const string COMMAND_TEXT = "usp_TaxonomyGenus_Update";
            ResultContainer resultContainer = new ResultContainer();

            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = cn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = COMMAND_TEXT;

                        cmd.Parameters.AddWithValue("@taxonomy_genus_id", entity.ID);
                        if (entity.ParentID == 0)
                            cmd.Parameters.AddWithValue("@current_taxonomy_genus_id", DBNull.Value);
                        else
                            cmd.Parameters.AddWithValue("@current_taxonomy_genus_id", entity.ParentID);

                        cmd.Parameters.AddWithValue("@taxonomy_family_id", entity.FamilyID);

                        if (!String.IsNullOrEmpty(entity.QualifyingCode))
                            cmd.Parameters.AddWithValue("@qualifying_code", entity.QualifyingCode);
                        else
                            cmd.Parameters.AddWithValue("@qualifying_code", DBNull.Value);

                        if (!String.IsNullOrEmpty(entity.HybridCode))
                            cmd.Parameters.AddWithValue("@hybrid_code", entity.HybridCode);
                        else
                            cmd.Parameters.AddWithValue("@hybrid_code", DBNull.Value);

                        if (!String.IsNullOrEmpty(entity.Name))
                            cmd.Parameters.AddWithValue("@genus_name", entity.Name);
                        else
                            cmd.Parameters.AddWithValue("@genus_name", DBNull.Value);

                        if (!String.IsNullOrEmpty(entity.Authority))
                            cmd.Parameters.AddWithValue("@genus_authority", entity.Authority);
                        else
                            cmd.Parameters.AddWithValue("@genus_authority", DBNull.Value);

                        if (!String.IsNullOrEmpty(entity.SubGenusName))
                            cmd.Parameters.AddWithValue("@subgenus_name", entity.SubGenusName);
                        else
                            cmd.Parameters.AddWithValue("@subgenus_name", DBNull.Value);

                        if (!String.IsNullOrEmpty(entity.SectionName))
                            cmd.Parameters.AddWithValue("@section_name", entity.SectionName);
                        else
                            cmd.Parameters.AddWithValue("@section_name", DBNull.Value);

                        if (!String.IsNullOrEmpty(entity.SubSectionName))
                            cmd.Parameters.AddWithValue("@subsection_name", entity.SubSectionName);
                        else
                            cmd.Parameters.AddWithValue("@subsection_name", DBNull.Value);

                        if (!String.IsNullOrEmpty(entity.SeriesName))
                            cmd.Parameters.AddWithValue("@series_name", entity.SeriesName);
                        else
                            cmd.Parameters.AddWithValue("@series_name", DBNull.Value);

                        if (!String.IsNullOrEmpty(entity.SubSeriesName))
                            cmd.Parameters.AddWithValue("@subseries_name", entity.SubSeriesName);
                        else
                            cmd.Parameters.AddWithValue("@subseries_name", DBNull.Value);

                        if (!String.IsNullOrEmpty(entity.Note))
                            cmd.Parameters.AddWithValue("@note", entity.Note);
                        else
                            cmd.Parameters.AddWithValue("@note", DBNull.Value);

                        cmd.Parameters.AddWithValue("@modified_by", entity.ModifiedByCooperatorID);

                        SqlParameter errorParam = new SqlParameter();
                        errorParam.SqlDbType = System.Data.SqlDbType.Int;
                        errorParam.ParameterName = "@out_error_number";
                        errorParam.Direction = System.Data.ParameterDirection.Output;
                        errorParam.Value = 0;
                        cmd.Parameters.Add(errorParam);
                        cmd.ExecuteNonQuery();
                        resultContainer.ResultCode = cmd.Parameters["@out_error_number"].Value.ToString();
                        if (!String.IsNullOrEmpty(resultContainer.ResultCode))
                        {
                            if (Int32.Parse(resultContainer.ResultCode) > 0)
                            {
                                throw new Exception(resultContainer.ResultCode + resultContainer.ResultMessage);
                            }
                        }
                    }
                }
            }
            catch (SqlException ex)
            {
                switch (ex.Errors[0].Number)
                {
                    case 547: // Foreign Key violation
                        string s = ex.Message;
                        s = s.Substring(s.IndexOf("column "));
                        string[] array = s.Split('.');
                        s = array[0].Substring(array[0].IndexOf('\''));
                        break;
                }
                throw ex;
            }
            return resultContainer;
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
