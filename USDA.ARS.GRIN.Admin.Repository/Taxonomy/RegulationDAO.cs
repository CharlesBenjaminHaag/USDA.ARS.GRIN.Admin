using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;

namespace USDA.ARS.GRIN.Admin.Repository
{
    public class RegulationDAO : BaseDAO, IRepository<Regulation>
    {
        public RegulationDAO(string context)
        {
            this._context = context;
        }

        #region Regulation

        public ResultContainer Add(Regulation entity)
        {
            const string COMMAND_TEXT = "usp_TaxonomyRegulation_Insert";
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

                        cmd.Parameters.AddWithValue("@geography_id", entity.GeographyID);

                        if (!String.IsNullOrEmpty(entity.RegulationTypeCode))
                            cmd.Parameters.AddWithValue("@regulation_type_code", entity.RegulationTypeCode);
                        else
                            cmd.Parameters.AddWithValue("@regulation_type_code", DBNull.Value);

                        if (!String.IsNullOrEmpty(entity.RegulationLevelCode))
                            cmd.Parameters.AddWithValue("@regulation_level_name", entity.RegulationLevelCode);
                        else
                            cmd.Parameters.AddWithValue("@regulation_level_name", DBNull.Value);

                        if (!String.IsNullOrEmpty(entity.Description))
                            cmd.Parameters.AddWithValue("@description", entity.Description);
                        else
                            cmd.Parameters.AddWithValue("@description", DBNull.Value);

                        if (!String.IsNullOrEmpty(entity.PrimaryURL))
                            cmd.Parameters.AddWithValue("@url", entity.PrimaryURL);
                        else
                            cmd.Parameters.AddWithValue("@url", DBNull.Value);

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

                        SqlParameter regulationIdParam = new SqlParameter();
                        regulationIdParam.SqlDbType = System.Data.SqlDbType.Int;
                        regulationIdParam.ParameterName = "@out_taxonomy_regulation_id";
                        regulationIdParam.Direction = System.Data.ParameterDirection.Output;
                        regulationIdParam.Value = 0;
                        cmd.Parameters.Add(regulationIdParam);

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

        public IQueryable<Regulation> FindAll()
        {
            const string COMMAND_TEXT = "usp_TaxonomyRegulations_Select";
            List<Regulation> taxonomyRegulations = new List<Regulation>();

            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand(COMMAND_TEXT, cn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                Regulation taxonomyRegulation = new Regulation();
                                taxonomyRegulation.ID = GetInt(reader["taxonomy_regulation_id"].ToString());
                                taxonomyRegulation.GeographyID = GetInt(reader["geography_id"].ToString());
                                taxonomyRegulation.RegulationTypeCode = reader["regulation_type_code"].ToString();
                                taxonomyRegulation.RegulationLevelCode = reader["regulation_level_code"].ToString();
                                taxonomyRegulation.Description = reader["description"].ToString();
                                taxonomyRegulation.RegulationTypeCode = reader["regulation_type_code"].ToString();
                                taxonomyRegulation.PrimaryURL = reader["url_1"].ToString();
                                taxonomyRegulation.SecondaryURL = reader["url_2"].ToString();
                                taxonomyRegulation.Note = reader["note"].ToString();
                                taxonomyRegulations.Add(taxonomyRegulation);
                            }
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return taxonomyRegulations.AsQueryable();
        }

        public Regulation Get(int id)
        {
            const string COMMAND_TEXT = "usp_TaxonomyRegulation_Select";
            Regulation regulation = new Regulation();

            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = cn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = COMMAND_TEXT;

                        cmd.Parameters.AddWithValue("@taxonomy_regulation_id", id);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                regulation = new Regulation();
                                regulation.ID = GetInt(reader["taxonomy_regulation_id"].ToString());
                                regulation.RegulationTypeCode = reader["regulation_type_code"].ToString();
                                regulation.RegulationLevelCode = reader["regulation_level_code"].ToString();
                                regulation.GeographyID = GetInt(reader["geography_id"].ToString());
                                regulation.GeographyDescription = reader["geography_description"].ToString();
                                regulation.Description = reader["description"].ToString();
                                regulation.PrimaryURL = reader["url_1"].ToString();
                                regulation.Note = reader["note"].ToString();
                                regulation.CreatedDate = GetDate(reader["created_date"].ToString());
                                regulation.CreatedByCooperatorID = GetInt(reader["created_by"].ToString());
                                regulation.CreatedByCooperatorName = reader["created_by_cooperator_name"].ToString();
                                regulation.ModifiedDate = GetDate(reader["modified_date"].ToString());
                                regulation.ModifiedByCooperatorID = GetInt(reader["modified_by"].ToString());
                                regulation.ModifiedByCooperatorName = reader["modified_by_cooperator_name"].ToString();
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return regulation;
        }

        public ResultContainer Remove(Regulation entity)
        {
            throw new NotImplementedException();
        }
       
        public IQueryable<Regulation> Search(Query query)
        {
            string sqlWhereClause = String.Empty;
            IQueryable<Regulation> regulations = new List<Regulation>().AsQueryable();

            try
            {
                sqlWhereClause = query.GetSQLSyntax();
                regulations = Search(sqlWhereClause);
                return regulations;
            }
            catch (SqlException ex)
            {
                throw ex;
            }
        }

        public IQueryable<Regulation> GetFolderItems(int folderId)
        {
            const string COMMAND_TEXT = "usp_TaxonomyFolderRegulationItemMaps_Select";
            List<Regulation> regulationList = new List<Regulation>();

            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = cn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = COMMAND_TEXT;

                        cmd.Parameters.AddWithValue("@taxonomy_folder_id", folderId);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                Regulation regulation = new Regulation();
                                regulation.ReferenceID = GetInt(reader["taxonomy_folder_item_id"].ToString());
                                regulation.ID = GetInt(reader["taxonomy_regulation_id"].ToString());
                                regulation.RegulationTypeCode = reader["regulation_type_code"].ToString();
                                regulation.RegulationLevelCode = reader["regulation_level_code"].ToString();
                                regulation.GeographyID = GetInt(reader["geography_id"].ToString());
                                regulation.GeographyDescription = reader["geography_description"].ToString();
                                regulation.Description = reader["description"].ToString();
                                regulation.PrimaryURL = reader["url_1"].ToString();
                                regulation.CreatedDate = GetDate(reader["created_date"].ToString());
                                regulation.CreatedByCooperatorID = GetInt(reader["created_by"].ToString());
                                regulationList.Add(regulation);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return regulationList.AsQueryable();
        }

        public IQueryable<Regulation> Search(string searchString)
        {
            const string COMMAND_TEXT = "usp_TaxonomyRegulations_Search";
            List<Regulation> regulationList = new List<Regulation>();

            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = cn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = COMMAND_TEXT;

                        cmd.Parameters.AddWithValue("@search_text", searchString);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                Regulation regulation = new Regulation();
                                regulation.ID = GetInt(reader["taxonomy_regulation_id"].ToString());
                                regulation.RegulationTypeCode = reader["regulation_type_code"].ToString();
                                regulation.RegulationLevelCode = reader["regulation_level_code"].ToString();
                                regulation.GeographyID = GetInt(reader["geography_id"].ToString());
                                regulation.GeographyDescription = reader["geography_description"].ToString();
                                regulation.Description = reader["description"].ToString();
                                regulation.PrimaryURL = reader["url_1"].ToString();
                                regulation.CreatedDate = GetDate(reader["created_date"].ToString());
                                regulation.CreatedByCooperatorID = GetInt(reader["created_by"].ToString());
                                regulationList.Add(regulation);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return regulationList.AsQueryable();
        }

        public ResultContainer Update(Regulation entity)
        {
            const string COMMAND_TEXT = "usp_TaxonomyRegulation_Update";
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

                        cmd.Parameters.AddWithValue("@taxonomy_regulation_id", entity.ID);
                        cmd.Parameters.AddWithValue("@geography_id", entity.GeographyID);

                        if (!String.IsNullOrEmpty(entity.RegulationTypeCode))
                            cmd.Parameters.AddWithValue("@regulation_type_code", entity.RegulationTypeCode);
                        else
                            cmd.Parameters.AddWithValue("@regulation_type_code", DBNull.Value);

                        if (!String.IsNullOrEmpty(entity.RegulationLevelCode))
                            cmd.Parameters.AddWithValue("@regulation_level_code", entity.RegulationLevelCode);
                        else
                            cmd.Parameters.AddWithValue("@regulation_level_code", DBNull.Value);

                        if (!String.IsNullOrEmpty(entity.Description))
                            cmd.Parameters.AddWithValue("@description", entity.Description);
                        else
                            cmd.Parameters.AddWithValue("@description", DBNull.Value);

                        if (!String.IsNullOrEmpty(entity.PrimaryURL))
                            cmd.Parameters.AddWithValue("@url_1", entity.PrimaryURL);
                        else
                            cmd.Parameters.AddWithValue("@url_1", DBNull.Value);

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
    
        #endregion

        #region Regulation Map

        public ResultContainer GetRegulationMap(int id)
        {
            throw new NotImplementedException();
        }

        public ResultContainer AddRegulationMap(RegulationMap regulationMap)
        {
            throw new NotImplementedException();
        }

        public ResultContainer UpdateRegulationMap(RegulationMap regulationMap)
        {
            throw new NotImplementedException();
        }

        public ResultContainer DeleteRegulationMap(int id)
        {
            throw new NotImplementedException();
        }
        public IQueryable<RegulationMap> SearchRegulationMaps(string searchString)
        {
            const string COMMAND_TEXT = "usp_TaxonomyRegulationMaps_Search";
            List<RegulationMap> regulationMapList = new List<RegulationMap>();

            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = cn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = COMMAND_TEXT;

                        cmd.Parameters.AddWithValue("@search_text", searchString);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                regulationMapList.Add(new RegulationMap { RegulationID = GetInt(""),  });
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return regulationMapList.AsQueryable();
        }
        public IQueryable<RegulationMap> SearchRegulationMaps(Query query)
        {
            string sqlWhereClause = String.Empty;
            IQueryable<RegulationMap> regulationMaps = new List<RegulationMap>().AsQueryable();

            try
            {
                sqlWhereClause = query.GetSQLSyntax();
                regulationMaps = SearchRegulationMaps(sqlWhereClause);
                return regulationMaps;
            }
            catch (SqlException ex)
            {
                throw ex;
            }
        }

        #endregion
    }
}
