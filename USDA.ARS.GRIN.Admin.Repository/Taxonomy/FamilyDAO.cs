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
        CitationDAO _citationDAO;

        public FamilyDAO(string context)
        {
            base._context = context;
            _citationDAO = new CitationDAO(context);
        }
        public IQueryable<Family> Search(Query query)
        {
            string sqlWhereClause = String.Empty;
            IQueryable<Family> familyList = new List<Family>().AsQueryable();

            try
            {
                sqlWhereClause = query.GetSQLSyntax();
                familyList = Search(sqlWhereClause);
                return familyList;
            }
            catch (SqlException ex)
            {
                throw ex;
            }
        }
        public IQueryable<Family> Search(string searchString)
        {
            const string COMMAND_TEXT_NAME = "usp_TaxonomyFamily_Search";
            List<Family> families = new List<Family>();

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
                        Family family = new Family();
                        family.ID = GetInt(reader["taxonomy_family_id"].ToString());
                        family.Name = reader["name"].ToString();
                        family.FullName = reader["full_name"].ToString();
                        family.Authority = reader["family_authority"].ToString();
                        family.TribeName = reader["tribe_name"].ToString();
                        family.SubTribeName = reader["subtribe_name"].ToString();
                        family.Note = reader["note"].ToString();
                        family.CreatedByCooperatorID = GetInt(reader["created_by"].ToString());
                        family.CreatedByCooperatorName = reader["created_by_name"].ToString();
                        family.CreatedDate = GetDate(reader["created_date"].ToString());
                        family.ModifiedByCooperatorID = GetInt(reader["modified_by"].ToString());
                        family.ModifiedByCooperatorName = reader["modified_by_name"].ToString();
                        family.ModifiedDate = GetDate(reader["modified_date"].ToString());
                        families.Add(family);
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return families.AsQueryable();
        }
        public Family Get(int id)
        {
            const string COMMAND_TEXT_NAME = "usp_TaxonomyFamily_Select";
            Family family = new Family();
            Query query = new Query();

            try
            {
                using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = COMMAND_TEXT_NAME;
                    cmd.Parameters.AddWithValue("@taxonomy_family_id", id);
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        family.ID = GetInt(reader["taxonomy_family_id"].ToString());
                        family.ParentID = GetInt(reader["current_taxonomy_family_id"].ToString());
                        family.TypeGenusID = GetInt(reader["type_taxonomy_genus_id"].ToString());
                        family.SuprafamilyRankCode = reader["suprafamily_rank_code"].ToString();
                        family.SuprafamilyRankName = reader["suprafamily_rank_name"].ToString();
                        family.Name = reader["name"].ToString();
                        family.FullName = reader["full_name"].ToString();
                        family.Authority = reader["family_authority"].ToString();
                        family.AlternateName = reader["alternate_name"].ToString();
                        family.SubFamilyName = reader["subfamily_name"].ToString();
                        family.TribeName = reader["tribe_name"].ToString();
                        family.SubTribeName = reader["subtribe_name"].ToString();
                        family.Note = reader["note"].ToString();
                        family.CreatedByCooperatorID = GetInt(reader["created_by"].ToString());
                        family.CreatedByCooperatorName = reader["created_by_name"].ToString();
                        family.CreatedDate = GetDate(reader["created_date"].ToString());
                        family.ModifiedByCooperatorID = GetInt(reader["modified_by"].ToString());
                        family.ModifiedByCooperatorName = reader["modified_by_name"].ToString();
                        family.ModifiedDate = GetDate(reader["modified_date"].ToString());
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return family;
        }

        public IQueryable<Family> GetFolderItems(int folderId)
        {
            const string COMMAND_TEXT_NAME = "usp_TaxonomyFolderFamilyItemMaps_Select";
            List<Family> families = new List<Family>();

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
                        Family family = new Family();
                        family.ReferenceID = GetInt(reader["taxonomy_folder_item_id"].ToString());
                        family.ID = GetInt(reader["taxonomy_family_id"].ToString());
                        family.Name = reader["name"].ToString();
                        family.FullName = reader["full_name"].ToString();
                        family.Authority = reader["family_authority"].ToString();
                        family.TribeName = reader["tribe_name"].ToString();
                        family.SubTribeName = reader["subtribe_name"].ToString();
                        family.Note = reader["note"].ToString();
                        family.CreatedByCooperatorID = GetInt(reader["created_by"].ToString());
                        family.CreatedByCooperatorName = reader["created_by_name"].ToString();
                        family.CreatedDate = GetDate(reader["created_date"].ToString());
                        family.ModifiedByCooperatorID = GetInt(reader["modified_by"].ToString());
                        family.ModifiedByCooperatorName = reader["modified_by_name"].ToString();
                        family.ModifiedDate = GetDate(reader["modified_date"].ToString());
                        families.Add(family);
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return families.AsQueryable();
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

        public IQueryable<Family> Search(int parentId)
        {
            throw new NotImplementedException();
        }

        public ResultContainer Add(Family entity)
        {
            const string COMMAND_TEXT = "usp_TaxonomyFamily_Insert";
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
                            cmd.Parameters.AddWithValue("@current_taxonomy_family_id", DBNull.Value);
                        else
                            cmd.Parameters.AddWithValue("@current_taxonomy_family_id", entity.ParentID);

                        cmd.Parameters.AddWithValue("@type_taxonomy_genus_id", entity.TypeGenusID);

                        if (!String.IsNullOrEmpty(entity.SuprafamilyRankCode))
                            cmd.Parameters.AddWithValue("@suprafamily_rank_code", entity.SuprafamilyRankCode);
                        else
                            cmd.Parameters.AddWithValue("@suprafamily_rank_code", DBNull.Value);

                        if (!String.IsNullOrEmpty(entity.SuprafamilyRankName))
                            cmd.Parameters.AddWithValue("@suprafamily_rank_name", entity.SuprafamilyRankName);
                        else
                            cmd.Parameters.AddWithValue("@suprafamily_rank_name", DBNull.Value);

                        if (!String.IsNullOrEmpty(entity.Name))
                            cmd.Parameters.AddWithValue("@family_name", entity.Name);
                        else
                            cmd.Parameters.AddWithValue("@family_name", DBNull.Value);

                        if (!String.IsNullOrEmpty(entity.Authority))
                            cmd.Parameters.AddWithValue("@family_authority", entity.Authority);
                        else
                            cmd.Parameters.AddWithValue("@family_authority", DBNull.Value);

                        if (!String.IsNullOrEmpty(entity.AlternateName))
                            cmd.Parameters.AddWithValue("@alternate_name", entity.AlternateName);
                        else
                            cmd.Parameters.AddWithValue("@alternate_name", DBNull.Value);

                        if (!String.IsNullOrEmpty(entity.SubFamilyName))
                            cmd.Parameters.AddWithValue("@subfamily_name", entity.SubFamilyName);
                        else
                            cmd.Parameters.AddWithValue("@subfamily_name", DBNull.Value);

                        if (!String.IsNullOrEmpty(entity.TribeName))
                            cmd.Parameters.AddWithValue("@tribe_name", entity.TribeName);
                        else
                            cmd.Parameters.AddWithValue("@tribe_name", DBNull.Value);

                        if (!String.IsNullOrEmpty(entity.SubTribeName))
                            cmd.Parameters.AddWithValue("@subtribe_name", entity.SubTribeName);
                        else
                            cmd.Parameters.AddWithValue("@subtribe_name", DBNull.Value);

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

                        SqlParameter familyIdParam = new SqlParameter();
                        familyIdParam.SqlDbType = System.Data.SqlDbType.Int;
                        familyIdParam.ParameterName = "@out_taxonomy_family_id";
                        familyIdParam.Direction = System.Data.ParameterDirection.Output;
                        familyIdParam.Value = 0;
                        cmd.Parameters.Add(familyIdParam);

                        cmd.ExecuteNonQuery();
                        resultContainer.ResultCode = cmd.Parameters["@out_error_number"].Value.ToString();
                        if (!String.IsNullOrEmpty(resultContainer.ResultCode))
                        {
                            if (Int32.Parse(resultContainer.ResultCode) > 0)
                            {
                                throw new Exception(resultContainer.ResultCode + resultContainer.ResultMessage);
                            }
                        }
                        resultContainer.EntityID = GetInt(cmd.Parameters["@out_taxonomy_family_id"].Value.ToString());
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

        public ResultContainer Remove(Family entity)
        {
            throw new NotImplementedException();
        }

        public ResultContainer Update(Family entity)
        {
            const string COMMAND_TEXT = "usp_TaxonomyFamily_Update";
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

                        cmd.Parameters.AddWithValue("@taxonomy_family_id", entity.ID);
                        if (entity.ParentID == 0)
                            cmd.Parameters.AddWithValue("@current_taxonomy_family_id", DBNull.Value);
                        else
                            cmd.Parameters.AddWithValue("@current_taxonomy_family_id", entity.ParentID);

                        cmd.Parameters.AddWithValue("@type_taxonomy_genus_id", entity.TypeGenusID);

                        if (!String.IsNullOrEmpty(entity.SuprafamilyRankCode))
                            cmd.Parameters.AddWithValue("@suprafamily_rank_code", entity.SuprafamilyRankCode);
                        else
                            cmd.Parameters.AddWithValue("@suprafamily_rank_code", DBNull.Value);

                        if (!String.IsNullOrEmpty(entity.SuprafamilyRankName))
                            cmd.Parameters.AddWithValue("@suprafamily_rank_name", entity.SuprafamilyRankName);
                        else
                            cmd.Parameters.AddWithValue("@suprafamily_rank_name", DBNull.Value);

                        if (!String.IsNullOrEmpty(entity.Name))
                            cmd.Parameters.AddWithValue("@family_name", entity.Name);
                        else
                            cmd.Parameters.AddWithValue("@family_name", DBNull.Value);

                        if (!String.IsNullOrEmpty(entity.Authority))
                            cmd.Parameters.AddWithValue("@family_authority", entity.Authority);
                        else
                            cmd.Parameters.AddWithValue("@family_authority", DBNull.Value);

                        if (!String.IsNullOrEmpty(entity.AlternateName))
                            cmd.Parameters.AddWithValue("@alternate_name", entity.AlternateName);
                        else
                            cmd.Parameters.AddWithValue("@alternate_name", DBNull.Value);

                        if (!String.IsNullOrEmpty(entity.SubFamilyName))
                            cmd.Parameters.AddWithValue("@subfamily_name", entity.SubFamilyName);
                        else
                            cmd.Parameters.AddWithValue("@subfamily_name", DBNull.Value);

                        if (!String.IsNullOrEmpty(entity.TribeName))
                            cmd.Parameters.AddWithValue("@tribe_name", entity.TribeName);
                        else
                            cmd.Parameters.AddWithValue("@tribe_name", DBNull.Value);

                        if (!String.IsNullOrEmpty(entity.SubTribeName))
                            cmd.Parameters.AddWithValue("@subtribe_name", entity.SubTribeName);
                        else
                            cmd.Parameters.AddWithValue("@subtribe_name", DBNull.Value);

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
            catch (Exception ex)
            {
                throw ex;
            }
            return resultContainer;
        }
    }
}
