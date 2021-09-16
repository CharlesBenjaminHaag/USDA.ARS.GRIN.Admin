using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Runtime.Caching;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;


namespace USDA.ARS.GRIN.Admin.Repository
{
    public class CropForCwrDAO : BaseDAO, IRepository<CropForCWR>
    {
        protected ReferenceDAO _referenceDAO = null;
               
        public CropForCwrDAO(string context)
        {
            base._context = context;
            _referenceDAO = new ReferenceDAO(context);
        }
        public IQueryable<CropForCWR> Search(Query query)
        {
            string sqlWhereClause = String.Empty;
            IQueryable<CropForCWR> cropForCWRs = new List<CropForCWR>().AsQueryable();

            try
            {
                sqlWhereClause = query.GetSQLSyntax();
                cropForCWRs = Search(sqlWhereClause);
                return cropForCWRs;
            }
            catch (SqlException ex)
            {
                throw ex;
            }
        }

        public IQueryable<CropForCWR> Search(string searchString)
        {
            const string COMMAND_TEXT = "usp_TaxonomyCwrCrops_Search";
            List<CropForCWR> cropForCwrList = new List<CropForCWR>();

            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = cn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = COMMAND_TEXT;

                        cmd.Parameters.AddWithValue("@sql_where_clause", searchString);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                CropForCWR crop = new CropForCWR();
                                crop.ID = GetInt(reader["taxonomy_cwr_crop_id"].ToString());
                                crop.CropName = reader["crop_name"].ToString();
                                crop.Note = reader["note"].ToString();
                                crop.CropWildRelativeCount = GetInt(reader["cwr_count"].ToString());
                                crop.CreatedDate = GetDate(reader["created_date"].ToString());
                                crop.CreatedByCooperatorID = GetInt(reader["created_by"].ToString());
                                crop.CreatedByCooperatorName = reader["created_by_name"].ToString();
                                crop.ModifiedDate = GetDate(reader["modified_date"].ToString());
                                crop.ModifiedByCooperatorID = GetInt(reader["modified_by"].ToString());
                                crop.ModifiedByCooperatorName = reader["modified_by_name"].ToString();
                                crop.ModifiedDate = GetDate(reader["modified_date"].ToString());
                                crop.ModifiedByCooperatorID = GetInt(reader["modified_by"].ToString());

                                if (reader["note"] != DBNull.Value)
                                {
                                    crop.Note = reader["note"].ToString();
                                }
                                cropForCwrList.Add(crop);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return cropForCwrList.AsQueryable();
        }

        public ResultContainer Add(CropForCWR entity)
        {
            const string COMMAND_TEXT = "usp_TaxonomyCwrCrop_Insert";
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

                        cmd.Parameters.AddWithValue("@crop_name", entity.CropName);

                        if (String.IsNullOrEmpty(entity.Note))
                            cmd.Parameters.AddWithValue("@note", DBNull.Value);
                        else
                            cmd.Parameters.AddWithValue("@note", entity.Note);

                        cmd.Parameters.AddWithValue("@created_by", entity.CreatedByCooperatorID);

                        SqlParameter retParam = new SqlParameter();
                        retParam.SqlDbType = System.Data.SqlDbType.Int;
                        retParam.ParameterName = "@out_taxonomy_cwr_crop_id";
                        retParam.Direction = System.Data.ParameterDirection.Output;
                        retParam.Value = 0;
                        cmd.Parameters.Add(retParam);

                        SqlParameter errorParam = new SqlParameter();
                        errorParam.SqlDbType = System.Data.SqlDbType.Int;
                        errorParam.ParameterName = "@out_error_number";
                        errorParam.Direction = System.Data.ParameterDirection.Output;
                        errorParam.Value = 0;
                        cmd.Parameters.Add(errorParam);

                        cmd.ExecuteNonQuery();

                        string resultString = cmd.Parameters["@out_taxonomy_cwr_crop_id"].Value.ToString();
                        if (!String.IsNullOrEmpty(resultString))
                        {
                            resultContainer.EntityID = Int32.Parse(resultString);
                        }
                        resultContainer.ResultCode = cmd.Parameters["@out_error_number"].Value.ToString();

                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return resultContainer;
        }

        public ResultContainer Update(CropForCWR entity)
        {
            const string COMMAND_TEXT = "usp_TaxonomyCwrCrop_Update";
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

                        cmd.Parameters.AddWithValue("@taxonomy_cwr_crop_id", entity.ID);
                        cmd.Parameters.AddWithValue("@crop_name", entity.CropName);

                        if (String.IsNullOrEmpty(entity.Note))
                            cmd.Parameters.AddWithValue("@note", DBNull.Value);
                        else
                            cmd.Parameters.AddWithValue("@note", entity.Note);

                        cmd.Parameters.AddWithValue("@modified_by", entity.ModifiedByCooperatorID);

                        SqlParameter errorParam = new SqlParameter();
                        errorParam.SqlDbType = System.Data.SqlDbType.Int;
                        errorParam.ParameterName = "@out_error_number";
                        errorParam.Direction = System.Data.ParameterDirection.Output;
                        errorParam.Value = 0;
                        cmd.Parameters.Add(errorParam);

                        cmd.ExecuteNonQuery();

                        resultContainer.EntityID = entity.ID;
                        resultContainer.ResultCode = cmd.Parameters["@out_error_number"].Value.ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return resultContainer;
        }

        public ResultContainer Remove(CWRMap cWRMap)
        {
            throw new NotImplementedException();
        }

        public IQueryable<CropForCWR> FindAll()
        {
            throw new NotImplementedException();
        }

        public CropForCWR Get(int id)
        {
            const string COMMAND_TEXT = "usp_TaxonomyCwrCrop_Select";
            CropForCWR crop = new CropForCWR();

            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = cn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = COMMAND_TEXT;

                        cmd.Parameters.AddWithValue("@taxonomy_cwr_crop_id", id);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                crop.ID = GetInt(reader["taxonomy_cwr_crop_id"].ToString());
                                crop.CropName = reader["crop_name"].ToString();
                                crop.Note = reader["note"].ToString();
                                crop.CreatedDate = GetDate(reader["created_date"].ToString());
                                crop.CreatedByCooperatorID = GetInt(reader["created_by"].ToString());
                                crop.CreatedByCooperatorName = reader["created_by_name"].ToString();
                                crop.ModifiedDate = GetDate(reader["modified_date"].ToString());
                                crop.ModifiedByCooperatorID = GetInt(reader["modified_by"].ToString());
                                crop.ModifiedByCooperatorName = reader["modified_by_name"].ToString();
                                crop.ModifiedDate = GetDate(reader["modified_date"].ToString());
                                crop.ModifiedByCooperatorID = GetInt(reader["modified_by"].ToString());
                            }
                        }
                        crop.CWRMaps = GetCWRMaps(crop.ID);
                    }
                }   
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return crop;
            
        }

        public IQueryable<CropForCWR> GetFolderItems(int folderId)
        {
            const string COMMAND_TEXT = "usp_TaxonomyFolderCropForCWRItemMaps_Select";
            List<CropForCWR> cropForCwrList = new List<CropForCWR>();

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
                                CropForCWR cropForCWR = new CropForCWR();
                                cropForCWR.ReferenceID = GetInt(reader["taxonomy_folder_item_id"].ToString());
                                cropForCWR.ID = GetInt(reader["taxonomy_cwr_crop_id"].ToString());
                                cropForCWR.CropName = reader["crop_name"].ToString();
                                cropForCWR.Note = reader["note"].ToString();
                                cropForCWR.CropWildRelativeCount = GetInt(reader["cwr_count"].ToString());
                                cropForCWR.CreatedDate = GetDate(reader["created_date"].ToString());
                                cropForCWR.CreatedByCooperatorID = GetInt(reader["created_by"].ToString());
                                cropForCWR.CreatedByCooperatorName = reader["created_by_name"].ToString();
                                cropForCWR.ModifiedDate = GetDate(reader["modified_date"].ToString());
                                cropForCWR.ModifiedByCooperatorID = GetInt(reader["modified_by"].ToString());
                                cropForCWR.ModifiedByCooperatorName = reader["modified_by_name"].ToString();
                                cropForCWR.ModifiedDate = GetDate(reader["modified_date"].ToString());
                                cropForCWR.ModifiedByCooperatorID = GetInt(reader["modified_by"].ToString());

                                if (reader["note"] != DBNull.Value)
                                {
                                    cropForCWR.Note = reader["note"].ToString();
                                }
                                cropForCwrList.Add(cropForCWR);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return cropForCwrList.AsQueryable();
        }
        public ResultContainer Remove(CropForCWR entity)
        {
            throw new NotImplementedException();
        }

        public IQueryable<CWRMap> GetCWRMaps(int cropForCwrId)
        {
            const string COMMAND_TEXT = "usp_TaxonomyCwrMapsByCrop_Select";
            List<CWRMap> cwrMapList = new List<CWRMap>();

            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = cn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = COMMAND_TEXT;

                        cmd.Parameters.AddWithValue("@taxonomy_cwr_crop_id ", cropForCwrId);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                CWRMap cwrMap = new CWRMap();
                                cwrMap.ID = GetInt(reader["taxonomy_cwr_map_id"].ToString());
                                cwrMap.SpeciesID = GetInt(reader["taxonomy_species_id"].ToString());
                                cwrMap.SpeciesName = reader["species_name"].ToString();
                                cwrMap.CropForCWRID = GetInt(reader["taxonomy_cwr_crop_id"].ToString());
                                cwrMap.CommonName = reader["crop_common_name"].ToString();
                                cwrMap.IsCrop = ParseBool(reader["is_crop"].ToString());
                                cwrMap.GenepoolCode = reader["genepool_code"].ToString();
                                cwrMap.IsGraftStock = ParseBool(reader["is_graftstock"].ToString());
                                cwrMap.IsPotential = ParseBool(reader["is_potential"].ToString());
                                cwrMap.CitationID = GetInt(reader["citation_id"].ToString());

                                if (reader["note"] != DBNull.Value)
                                {
                                    cwrMap.Note = reader["note"].ToString();
                                }

                                cwrMap.CreatedDate = GetDate(reader["created_date"].ToString());
                                cwrMap.CreatedByCooperatorID = GetInt(reader["created_by"].ToString());
                                cwrMap.CreatedByCooperatorName = reader["created_by_name"].ToString();
                                cwrMap.ModifiedDate = GetDate(reader["modified_date"].ToString());
                                cwrMap.ModifiedByCooperatorID = GetInt(reader["modified_by"].ToString());
                                cwrMap.ModifiedByCooperatorName = reader["modified_by_name"].ToString();
                                cwrMap.ModifiedDate = GetDate(reader["modified_date"].ToString());
                                cwrMap.ModifiedByCooperatorID = GetInt(reader["modified_by"].ToString());
                                cwrMap.CWRTraitCount = GetInt(reader["taxonomy_cwr_trait_count"].ToString());
                                cwrMapList.Add(cwrMap);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return cwrMapList.AsQueryable();
        }

        public List<CodeValueReferenceItem> GetCodeValueReferenceItems()
        {
            string CacheKey = "CodeValueReferenceItems";
            List<CodeValueReferenceItem> codeValueReferenceItems = new List<CodeValueReferenceItem>();
            ObjectCache cache = MemoryCache.Default;

            if (cache.Contains(CacheKey))
                codeValueReferenceItems = (List<CodeValueReferenceItem>)cache.Get(CacheKey);
            else
            {
                codeValueReferenceItems = GetAllCodeValueReferenceItems();
                CacheItemPolicy cacheItemPolicy = new CacheItemPolicy();
                cacheItemPolicy.AbsoluteExpiration = DateTime.Now.AddHours(1.0);
                cache.Add(CacheKey, codeValueReferenceItems, cacheItemPolicy);
            }
            return codeValueReferenceItems;
        }

        public List<CodeValueReferenceItem> GetAllCodeValueReferenceItems()
        {
            const string COMMAND_TEXT = "usp_DataMgmtCodeValues_Select";
            List<CodeValueReferenceItem> codeValueReferenceItems = new List<CodeValueReferenceItem>();

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
                        codeValueReferenceItems.Add(new CodeValueReferenceItem { GroupName = reader["group_name"].ToString(), CodeValueID = Int32.Parse(reader["code_value_id"].ToString()), CodeValue = reader["value"].ToString(), Title = reader["title"].ToString(), Description = reader["description"].ToString() });
                    }
                }
            }
            catch (Exception e)
            {
                throw e;
            }
            return codeValueReferenceItems;
        }


        //#region Crop for CWR

       

    

      

       

        //public ResultContainer AddCropForCWR(CropForCWR crop)
        //{
        //    const string COMMAND_TEXT = "usp_TaxonomyCwrCrop_Insert";
        //    ResultContainer resultContainer = new ResultContainer();

        //    try
        //    {
        //        using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
        //        {
        //            using (SqlCommand cmd = new SqlCommand())
        //            {
        //                cmd.Connection = cn;
        //                cmd.CommandType = CommandType.StoredProcedure;
        //                cmd.CommandText = COMMAND_TEXT;

        //                cmd.Parameters.AddWithValue("@crop_name", crop.CropName);

        //                if (String.IsNullOrEmpty(crop.Note))
        //                    cmd.Parameters.AddWithValue("@note", DBNull.Value);
        //                else
        //                    cmd.Parameters.AddWithValue("@note", crop.Note);

        //                cmd.Parameters.AddWithValue("@created_by", crop.CreatedByCooperatorID);

        //                SqlParameter retParam = new SqlParameter();
        //                retParam.SqlDbType = System.Data.SqlDbType.Int;
        //                retParam.ParameterName = "@out_taxonomy_cwr_crop_id";
        //                retParam.Direction = System.Data.ParameterDirection.Output;
        //                retParam.Value = 0;
        //                cmd.Parameters.Add(retParam);

        //                SqlParameter errorParam = new SqlParameter();
        //                errorParam.SqlDbType = System.Data.SqlDbType.Int;
        //                errorParam.ParameterName = "@out_error_number";
        //                errorParam.Direction = System.Data.ParameterDirection.Output;
        //                errorParam.Value = 0;
        //                cmd.Parameters.Add(errorParam);

        //                cmd.ExecuteNonQuery();

        //                string resultString = cmd.Parameters["@out_taxonomy_cwr_crop_id"].Value.ToString();
        //                if (!String.IsNullOrEmpty(resultString))
        //                {
        //                    resultContainer.EntityID = Int32.Parse(resultString);
        //                }
        //                resultContainer.ResultCode = cmd.Parameters["@out_error_number"].Value.ToString();

        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //    return resultContainer;
        //}
      

        //public int Remove(CropForCWR entity)
        //{
        //    return 0;
        //}

        //public ResultContainer RemoveCrops(string cropIdList)
        //{
        //    ResultContainer resultContainer = new ResultContainer();
        //    const string COMMAND_TEXT = "usp_TaxonomyCwrCrops_Delete";

        //    try
        //    {
        //        using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
        //        {
        //            using (SqlCommand cmd = new SqlCommand(COMMAND_TEXT, cn))
        //            {
        //                cmd.CommandType = CommandType.StoredProcedure;
        //                cmd.Parameters.AddWithValue("@taxonomy_crop_id_list", cropIdList);

        //                SqlParameter errorParam = new SqlParameter();
        //                errorParam.SqlDbType = System.Data.SqlDbType.Int;
        //                errorParam.ParameterName = "@out_error_number";
        //                errorParam.Direction = System.Data.ParameterDirection.Output;
        //                errorParam.Value = 0;
        //                cmd.Parameters.Add(errorParam);
        //                cmd.ExecuteNonQuery();

        //                string resultString = cmd.Parameters["@out_taxonomy_cwr_map_id"].Value.ToString();
        //                if (!String.IsNullOrEmpty(resultString))
        //                {
        //                    resultContainer.EntityID = Int32.Parse(resultString);
        //                }
        //                resultContainer.ResultCode = cmd.Parameters["@out_error_number"].Value.ToString();
        //            }
        //        }
        //    }
        //    catch (SqlException ex)
        //    {
        //        throw ex;
        //    }
        //    return resultContainer;
        //}

        //public ResultContainer UpdateCropForCWR(CropForCWR crop)
        //{
        //    const string COMMAND_TEXT = "usp_TaxonomyCwrCrop_Update";
        //    ResultContainer resultContainer = new ResultContainer();

        //    try
        //    {
        //        using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
        //        {
        //            using (SqlCommand cmd = new SqlCommand())
        //            {
        //                cmd.Connection = cn;
        //                cmd.CommandType = CommandType.StoredProcedure;
        //                cmd.CommandText = COMMAND_TEXT;

        //                cmd.Parameters.AddWithValue("@taxonomy_cwr_crop_id", crop.ID);
        //                cmd.Parameters.AddWithValue("@crop_name", crop.CropName);

        //                if (String.IsNullOrEmpty(crop.Note))
        //                    cmd.Parameters.AddWithValue("@note", DBNull.Value);
        //                else
        //                    cmd.Parameters.AddWithValue("@note", crop.Note);

        //                cmd.Parameters.AddWithValue("@modified_by", crop.ModifiedByCooperatorID);

        //                SqlParameter errorParam = new SqlParameter();
        //                errorParam.SqlDbType = System.Data.SqlDbType.Int;
        //                errorParam.ParameterName = "@out_error_number";
        //                errorParam.Direction = System.Data.ParameterDirection.Output;
        //                errorParam.Value = 0;
        //                cmd.Parameters.Add(errorParam);

        //                cmd.ExecuteNonQuery();

        //                resultContainer.EntityID = crop.ID;
        //                resultContainer.ResultCode = cmd.Parameters["@out_error_number"].Value.ToString();
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //    return resultContainer;
        //}

      

        //#region CWR Map


        //public List<CWRMap> FindCWRMaps(int cropForCwrId)
        //{
        //    const string COMMAND_TEXT = "usp_TaxonomyCwrMapsByCrop_Select";
        //    List<CWRMap> cwrMapList = new List<CWRMap>();

        //    try
        //    {
        //        using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
        //        {
        //            using (SqlCommand cmd = new SqlCommand())
        //            {
        //                cmd.Connection = cn;
        //                cmd.CommandType = CommandType.StoredProcedure;
        //                cmd.CommandText = COMMAND_TEXT;

        //                cmd.Parameters.AddWithValue("@taxonomy_cwr_crop_id ", cropForCwrId);

        //                using (SqlDataReader reader = cmd.ExecuteReader())
        //                {
        //                    while (reader.Read())
        //                    {
        //                        CWRMap cwrMap = new CWRMap();
        //                        cwrMap.ID = GetInt(reader["taxonomy_cwr_map_id"].ToString());
        //                        cwrMap.SpeciesID = GetInt(reader["taxonomy_species_id"].ToString());
        //                        cwrMap.SpeciesName = reader["species_name"].ToString();
        //                        cwrMap.CropID = GetInt(reader["taxonomy_cwr_crop_id"].ToString());
        //                        cwrMap.CommonName = reader["crop_common_name"].ToString();
        //                        cwrMap.IsCrop = ParseBool(reader["is_crop"].ToString());
        //                        cwrMap.GenepoolCode = reader["genepool_code"].ToString();
        //                        cwrMap.IsGraftStock = ParseBool(reader["is_graftstock"].ToString());
        //                        cwrMap.IsPotential = ParseBool(reader["is_potential"].ToString());
        //                        cwrMap.CitationID = GetInt(reader["citation_id"].ToString());

        //                        if (reader["note"] != DBNull.Value)
        //                        {
        //                            cwrMap.Note = reader["note"].ToString();
        //                        }

        //                        cwrMap.CreatedDate = GetDate(reader["created_date"].ToString());
        //                        cwrMap.CreatedByCooperatorID = GetInt(reader["created_by"].ToString());
        //                        cwrMap.CreatedByCooperatorName = reader["created_by_name"].ToString();
        //                        cwrMap.ModifiedDate = GetDate(reader["modified_date"].ToString());
        //                        cwrMap.ModifiedByCooperatorID = GetInt(reader["modified_by"].ToString());
        //                        cwrMap.ModifiedByCooperatorName = reader["modified_by_name"].ToString();
        //                        cwrMap.ModifiedDate = GetDate(reader["modified_date"].ToString());
        //                        cwrMap.ModifiedByCooperatorID = GetInt(reader["modified_by"].ToString());
        //                        cwrMapList.Add(cwrMap);
        //                    }
        //                }
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //    return cwrMapList;
        //}

        //public List<CWRMap> FindCWRMaps(string sqlWhereClause)
        //{
        //    const string COMMAND_TEXT = "usp_TaxonomyCwrMaps_Search";
        //    List<CWRMap> cwrMapList = new List<CWRMap>();

        //    try
        //    {
        //        using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
        //        {
        //            using (SqlCommand cmd = new SqlCommand())
        //            {
        //                cmd.Connection = cn;
        //                cmd.CommandType = CommandType.StoredProcedure;
        //                cmd.CommandText = COMMAND_TEXT;

        //                cmd.Parameters.AddWithValue("@sql_where_clause", sqlWhereClause);

        //                using (SqlDataReader reader = cmd.ExecuteReader())
        //                {
        //                    while (reader.Read())
        //                    {
        //                        CWRMap cwrMap = new CWRMap();
        //                        cwrMap.ID = GetInt(reader["taxonomy_cwr_map_id"].ToString());
        //                        cwrMap.SpeciesID = GetInt(reader["taxonomy_species_id"].ToString());
        //                        cwrMap.SpeciesName = reader["species_name"].ToString();
        //                        cwrMap.CropID = GetInt(reader["taxonomy_cwr_crop_id"].ToString());
        //                        cwrMap.CommonName = reader["crop_common_name"].ToString();
        //                        cwrMap.IsCrop = ParseBool(reader["is_crop"].ToString());
        //                        cwrMap.GenepoolCode = reader["genepool_code"].ToString();
        //                        cwrMap.IsGraftStock = ParseBool(reader["is_graftstock"].ToString());
        //                        cwrMap.IsPotential = ParseBool(reader["is_potential"].ToString());
        //                        cwrMap.CitationID = GetInt(reader["citation_id"].ToString());

        //                        if (reader["note"] != DBNull.Value)
        //                        {
        //                            cwrMap.Note = reader["note"].ToString();
        //                        }

        //                        cwrMap.CreatedDate = GetDate(reader["created_date"].ToString());
        //                        cwrMap.CreatedByCooperatorID = GetInt(reader["created_by"].ToString());
        //                        cwrMap.CreatedByCooperatorName = reader["created_by_name"].ToString();
        //                        cwrMap.ModifiedDate = GetDate(reader["modified_date"].ToString());
        //                        cwrMap.ModifiedByCooperatorID = GetInt(reader["modified_by"].ToString());
        //                        cwrMap.ModifiedByCooperatorName = reader["modified_by_name"].ToString();
        //                        cwrMap.ModifiedDate = GetDate(reader["modified_date"].ToString());
        //                        cwrMap.ModifiedByCooperatorID = GetInt(reader["modified_by"].ToString());
        //                        cwrMapList.Add(cwrMap);
        //                    }
        //                }
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //    return cwrMapList;




        //}

        //public DataTable FindCWRMaps(Query searchObject)
        //{
        //    const string COMMAND_TEXT = "usp_Search";
        //    string sqlStatement = "SELECT taxonomy_cwr_map_id,taxonomy_species_id,tcm.taxonomy_cwr_crop_id, crop_common_name, (SELECT crop_name FROM taxonomy_cwr_crop WHERE taxonomy_cwr_crop_id = tcm.taxonomy_cwr_crop_id) AS crop_name, is_crop, genepool_code, is_graftstock, is_potential, citation_id, tcm.note,created_date,created_by,(SELECT first_name + ' ' + last_name FROM cooperator where cooperator_id = tcm.created_by) AS created_by_name, modified_date, modified_by,	(SELECT first_name + ' ' + last_name FROM cooperator where cooperator_id = tcm.modified_by) AS modified_by_name FROM taxonomy_cwr_map tcm";
        //    StringBuilder sqlWhereClause = new StringBuilder();
        //    DataTable searchResults = new DataTable();

        //    try
        //    {
        //        using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
        //        {
        //            using (SqlCommand cmd = new SqlCommand(COMMAND_TEXT, conn))
        //            {
        //                cmd.CommandType = CommandType.StoredProcedure;
        //                if (searchObject != null)
        //                {
        //                    foreach (var searchCriterion in searchObject.QueryCriteria)
        //                    {
        //                        // TO DO: Get SQL "translation" of each criterion.
        //                        searchCriterion.SearchSyntax = GetSearchSyntax(searchCriterion.SearchOperatorCode, searchCriterion.FieldValue);
        //                        //searchCriterion.FieldName = "crop_name";
        //                        if (sqlWhereClause.Length == 0)
        //                        {
        //                            sqlWhereClause.Append(" WHERE ");
        //                        }
        //                        else
        //                        {
        //                            if (sqlWhereClause.Length > 0)
        //                            {
        //                                sqlWhereClause.Append(" OR ");
        //                            }
        //                        }

        //                        searchCriterion.FieldName = GetDatabaseFieldName(searchCriterion.FieldName);
        //                        sqlWhereClause.Append(searchCriterion.FieldName);
        //                        sqlWhereClause.Append(" ");
        //                        sqlWhereClause.Append(searchCriterion.SearchSyntax);
        //                    }
        //                }
        //                sqlStatement = sqlStatement + sqlWhereClause.ToString();

        //                cmd.Parameters.AddWithValue("@sql_statement", sqlStatement);
        //                using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
        //                {
        //                    adapter.Fill(searchResults);
        //                }
        //            }
        //        }
        //    }
        //    catch (Exception e)
        //    {
        //        throw e;
        //    }
        //    return searchResults;
        //}

        //public List<CWRMap> FindUserCWRMaps(int cooperatorId)
        //{
        //    return FindCWRMaps("WHERE created_by = " + cooperatorId);
        //}

        //public List<CWRMap> FindRecentCWRMaps()
        //{
        //    return FindCWRMaps("WHERE modified_date > DATEADD(MONTH, -1, GETDATE())");
        //}

     

        //public ResultContainer AddCWRMap(CWRMap cropMap)
        //{
        
        //}

        //public ResultContainer UpdateCWRMap(CWRMap cropMap)
        //{
        //    
        //}

        //public ResultContainer RemoveCWRpMap(int cropMapId)
        //{
        //    ResultContainer resultContainer = new ResultContainer();
        //    const string COMMAND_TEXT = "usp_TaxonomyCwrMap_Delete";

        //    try
        //    {
        //        using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
        //        {
        //            using (SqlCommand cmd = new SqlCommand(COMMAND_TEXT, cn))
        //            {
        //                cmd.CommandType = CommandType.StoredProcedure;
        //                cmd.Parameters.AddWithValue("@taxonomy_cwr_map_id", cropMapId);

        //                SqlParameter errorParam = new SqlParameter();
        //                errorParam.SqlDbType = System.Data.SqlDbType.Int;
        //                errorParam.ParameterName = "@out_error_number";
        //                errorParam.Direction = System.Data.ParameterDirection.Output;
        //                errorParam.Value = 0;
        //                cmd.Parameters.Add(errorParam);
        //                cmd.ExecuteNonQuery();

        //                resultContainer.ResultCode = cmd.Parameters["@out_error_number"].Value.ToString();
        //            }
        //        }
        //    }
        //    catch (SqlException ex)
        //    {
        //        throw ex;
        //    }
        //    return resultContainer;
        //}

        //public ResultContainer RemoveCWRMaps(string cropMapIdList)
        //{
        //    ResultContainer resultContainer = new ResultContainer();

        //    try
        //    {
        //        string[] cropMapIdArray = cropMapIdList.Split(',');
        //        foreach (string cropMapId in cropMapIdArray)
        //        {
        //            int convertedCropMapId = Int32.Parse(cropMapId);
        //            RemoveCWRpMap(convertedCropMapId);
        //        }
        //    }
        //    catch (SqlException ex)
        //    {
        //        throw ex;
        //    }
        //    return resultContainer;
        //}

        //#endregion CWRMap

        //#region CWRTrait

      

      

        //public ResultContainer RemoveCropTrait(int cropTraitId)
        //{
        //    ResultContainer resultContainer = new ResultContainer();
        //    const string COMMAND_TEXT = "usp_TaxonomyCwrTrait_Delete";

        //    try
        //    {
        //        using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
        //        {
        //            SqlCommand cmd = new SqlCommand();
        //            cmd.Connection = cn;
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            cmd.CommandText = COMMAND_TEXT;

        //            cmd.Parameters.AddWithValue("@taxonomy_cwr_trait_id", cropTraitId);

        //            SqlParameter errorParam = new SqlParameter();
        //            errorParam.SqlDbType = System.Data.SqlDbType.Int;
        //            errorParam.ParameterName = "@out_error_number";
        //            errorParam.Direction = System.Data.ParameterDirection.Output;
        //            errorParam.Value = 0;
        //            cmd.Parameters.Add(errorParam);
        //            cmd.ExecuteNonQuery();

        //            resultContainer.ResultCode = cmd.Parameters["@out_error_number"].Value.ToString();
        //        }
        //    }
        //    catch (SqlException ex)
        //    {
        //        throw ex;
        //    }
        //    return resultContainer;
        //}

        //public ResultContainer RemoveCropTraits(string cropTraitIdList)
        //{
        //    ResultContainer resultContainer = new ResultContainer();

        //    try
        //    {
        //        string[] cropTraitIdArray = cropTraitIdList.Split(',');
        //        foreach (string cropTraitId in cropTraitIdArray)
        //        {
        //            int convertedCropTraitId = Int32.Parse(cropTraitId);
        //            RemoveCropTrait(convertedCropTraitId);
        //        }
        //    }
        //    catch (SqlException ex)
        //    {
        //        throw ex;
        //    }
        //    return resultContainer;
        //}

        //#endregion

        //#region CWR
        //public DataTable FindCropWildRelatives(Query searchObject)
        //{
        //    const string COMMAND_TEXT = "usp_GetSearchResults";
        //    string sqlStatement = "SELECT [taxonomy_cwr_id], ts.taxonomy_species_id, ts.name ,[crop_name],[display_name]     ,[crop_common_name]     ,[is_crop]      ,[genepool_code]      ,[is_graftstock_genepool]      ,[trait_class_code]      ,[is_potential]      ,[breeding_type_code]      ,[breeding_usage]      ,[ontology_trait_identifier]      ,[citation_id]      ,tc.note      ,tc.created_date      ,tc.created_by      ,tc.modified_date      ,tc.modified_by      ,tc.owned_date      ,tc.owned_by    FROM        [$(DatabaseName)].[taxonomy_cwr] tc JOIN taxonomy_species ts  ON  tc.taxonomy_species_id = ts.taxonomy_species_id";
        //    StringBuilder sqlWhereClause = new StringBuilder();
        //    List<CropWildRelative> taxonomyCropWildRelatives = new List<CropWildRelative>();
        //    DataTable searchResults = new DataTable();
        //    SqlCommand cmd = new SqlCommand();
        //    SqlDataAdapter adapter = null;
        //    SqlConnection conn = null;

        //    try
        //    {
        //        using (conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
        //        {
        //            cmd.Connection = conn;
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            cmd.CommandText = COMMAND_TEXT;

        //            // Construct dynamic WHERE clause, based on search criteria.
        //            if (searchObject != null)
        //            {
        //                foreach (var searchCriterion in searchObject.QueryCriteria)
        //                {
        //                    // TO DO: Get SQL "translation" of each criterion.
        //                    searchCriterion.SearchSyntax = GetSearchSyntax(searchCriterion.SearchOperatorCode, searchCriterion.FieldValue);
        //                    //searchCriterion.FieldName = "crop_name";
        //                    if (sqlWhereClause.Length == 0)
        //                    {
        //                        sqlWhereClause.Append(" WHERE ");
        //                    }
        //                    else
        //                    {
        //                        if (sqlWhereClause.Length > 0)
        //                        {
        //                            sqlWhereClause.Append(" OR ");
        //                        }
        //                    }

        //                    searchCriterion.FieldName = GetDatabaseFieldName(searchCriterion.FieldName);
        //                    sqlWhereClause.Append(searchCriterion.FieldName);

        //                    sqlWhereClause.Append(" ");
        //                    sqlWhereClause.Append(searchCriterion.SearchSyntax);
        //                }
        //                sqlStatement = sqlStatement + sqlWhereClause.ToString();
        //            }
        //            cmd.Parameters.AddWithValue("@sql_statement", sqlStatement);
        //            adapter = new SqlDataAdapter(cmd);
        //            adapter.Fill(searchResults);


        //            //     string query = "DECLARE @sqlQuery varchar(max); " +
        //            //" SELECT @sqlQuery = 'select distinct [@columnName] from [" +
        //            //    Globals.REPORTING_SCHEMA + "].[@tableName]'; " +
        //            //" exec(@sqlQuery);";

        //            //     List<SqlParameter> parametersList = new List<SqlParameter>();

        //            //     SqlParameter param = new SqlParameter();
        //            //     param.ParameterName = "tableName";
        //            //     param.SqlDbType = System.Data.SqlDbType.VarChar;
        //            //     param.Value = request.TableName;
        //            //     parametersList.Add(param);

        //            //     param = new SqlParameter();
        //            //     param.ParameterName = "columnName";
        //            //     param.SqlDbType = System.Data.SqlDbType.VarChar;
        //            //     param.Value = request.ColumnName;
        //            //     parametersList.Add(param);

        //            //     SQLHelpher sqlHelper = new SQLHelpher(networkConnectionString);
        //            //     SqlDataReader dataReader = sqlHelper.ExecuteReader(query, parametersList);
        //            //           string query = "DECLARE @sqlQuery varchar(max); " +
        //            //" SELECT @sqlQuery = 'select distinct [' + @columnName + '] from [" +
        //            //     Globals.REPORTING_SCHEMA + "].[' + @tableName + ']'; " +
        //            //" exec(@sqlQuery);";

        //            // OR

        //            //public void Insert_Data_generic(DataSet dsins)
        //            //{
        //            //    SqlConnection con = new SqlConnection(connectionstring);
        //            //    string Result = "insert into TableName (";
        //            //    SqlCommand cmd = new SqlCommand();
        //            //    con.Open();
        //            //    string columns = string.Join(",", dsins.Tables[0].Columns.Cast<DataColumn>().Select(c => c.ColumnName));
        //            //    string values = string.Join(",", dsins.Tables[0].Columns.Cast<DataColumn>().Select(c => string.Format("@{0}", c.ColumnName)));

        //            //    Result += columns + ") values(" + values + ")";
        //            //    foreach (DataRow row in dsins.Tables[0].Rows)
        //            //    {
        //            //        cmd = new SqlCommand(Result, con);
        //            //        cmd.Parameters.Clear();
        //            //        foreach (DataColumn col in dsins.Tables[0].Columns)
        //            //        {
        //            //            cmd.Parameters.AddWithValue("@" + col.ColumnName, row[col]);

        //            //        }
        //            //        cmd.ExecuteNonQuery();
        //            //    }
        //            //}

        //            // TO DO: FIlter results according to search criteria.


        //            //SqlDataReader reader = cmd.ExecuteReader();
        //            //while (reader.Read())
        //            //{
        //            //    TaxonomyCropWildRelative taxonomyCropWildRelative = new TaxonomyCropWildRelative();
        //            //    taxonomyCropWildRelative.ID = Int32.Parse(reader["taxonomy_cwr_id"].ToString());
        //            //    taxonomyCropWildRelative.SpeciesID = Int32.Parse(reader["taxonomy_species_id"].ToString());
        //            //    taxonomyCropWildRelative.CropName = reader["crop_name"].ToString();
        //            //    taxonomyCropWildRelative.DisplayName = reader["display_name"].ToString();
        //            //    taxonomyCropWildRelative.CropCommonName = reader["crop_common_name"].ToString();

        //            //    if (reader["modified_date"] != DBNull.Value)
        //            //    {
        //            //        taxonomyCropWildRelative.ModifiedDate = ParseDate(reader["modified_date"].ToString());
        //            //    }

        //            //    if (reader["modified_by"] != DBNull.Value)
        //            //    {
        //            //        taxonomyCropWildRelative.ModifiedByCooperatorID = Int32.Parse(reader["modified_by"].ToString());
        //            //    }

        //            //    taxonomyCropWildRelatives.Add(taxonomyCropWildRelative);
        //            //}
        //        }
        //    }
        //    catch (Exception e)
        //    {
        //        throw e;
        //    }
        //    finally
        //    {
        //        conn.Close();
        //        adapter.Dispose();
        //    }
        //    return searchResults;
        //}

        //public CropWildRelative GetCropWildRelative(int id)
        //{
        //    string databaseFieldName = String.Empty;
        //    const string COMMAND_TEXT = "usp_GetCropWildRelative";
        //    CropWildRelative result = null;

        //    try
        //    {
        //        using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
        //        {
        //            SqlCommand cmd = new SqlCommand();
        //            cmd.Connection = conn;
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            cmd.CommandText = COMMAND_TEXT;
        //            cmd.Parameters.AddWithValue("taxonomy_cwr_id", id);

        //            SqlDataReader reader = cmd.ExecuteReader();
        //            while (reader.Read())
        //            {
        //                result = new CropWildRelative();
        //                result.ID = Int32.Parse(reader["taxonomy_cwr_id"].ToString());
        //                result.SpeciesID = Int32.Parse(reader["taxonomy_species_id"].ToString());
        //                result.SpeciesName = reader["name"].ToString();
        //                result.CropName = reader["crop_name"].ToString();
        //                result.DisplayName = reader["display_name"].ToString();
        //                result.CropCommonName = reader["crop_common_name"].ToString();
        //                result.IsCrop = ParseBool(reader["is_crop"].ToString());
        //                result.GenepoolCode = reader["genepool_code"].ToString();
        //                result.IsGraftstockGenepool = ParseBool(reader["is_graftstock_genepool"].ToString());
        //                result.TraitClassCode = reader["trait_class_code"].ToString();
        //                result.IsPotential = ParseBool(reader["is_potential"].ToString());
        //                result.BreedingTypeCode = reader["breeding_type_code"].ToString();
        //                result.BreedingUsage = reader["breeding_usage"].ToString();
        //                result.OntologyTraitIdentifier = reader["ontology_trait_identifier"].ToString();
        //                result.CitationID = GetInt(reader["citation_id"].ToString());
        //                result.Note = reader["note"].ToString();
        //                result.CreatedDate = GetDate(reader["created_date"].ToString());
        //                result.CreatedByCooperatorID = GetInt(reader["created_by"].ToString());
        //                result.CreatedByCooperatorName = reader["created_by_name"].ToString();
        //                result.ModifiedDate = GetDate(reader["modified_date"].ToString());
        //                result.ModifiedByCooperatorID = GetInt(reader["modified_by"].ToString());
        //                result.ModifiedByCooperatorName = reader["modified_by_name"].ToString();
        //                result.ModifiedDate = GetDate(reader["modified_date"].ToString());
        //                result.ModifiedByCooperatorID = GetInt(reader["modified_by"].ToString());
        //                result.OwnedDate = GetDate(reader["owned_date"].ToString());
        //                result.OwnedByCooperatorID = GetInt(reader["owned_by"].ToString());
        //            }
        //        }
        //    }
        //    catch (Exception e)
        //    {
        //        throw e;
        //    }

        //    return result;
        //}

        //public int AddCropWildRelative(CropWildRelative cropWildRelative)
        //{
        //    int returnCode = 0;
        //    const string COMMAND_TEXT = "usp_InsertCropWildRelative";

        //    try
        //    {
        //        using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
        //        {
        //            SqlCommand cmd = new SqlCommand();
        //            cmd.Connection = cn;
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            cmd.CommandText = COMMAND_TEXT;

        //            cmd.Parameters.AddWithValue("@taxonomy_species_id", cropWildRelative.SpeciesID);

        //            if (String.IsNullOrEmpty(cropWildRelative.CropName))
        //                cmd.Parameters.AddWithValue("@crop_name", DBNull.Value);
        //            else
        //                cmd.Parameters.AddWithValue("@crop_name", cropWildRelative.CropName);

        //            if (String.IsNullOrEmpty(cropWildRelative.DisplayName))
        //                cmd.Parameters.AddWithValue("@display_name", DBNull.Value);
        //            else
        //                cmd.Parameters.AddWithValue("@display_name", cropWildRelative.DisplayName);

        //            if (String.IsNullOrEmpty(cropWildRelative.CropCommonName))
        //                cmd.Parameters.AddWithValue("@crop_common_name", DBNull.Value);
        //            else
        //                cmd.Parameters.AddWithValue("@crop_common_name", cropWildRelative.CropCommonName);

        //            cmd.Parameters.AddWithValue("@is_crop", UnBool(cropWildRelative.IsCrop));

        //            if (String.IsNullOrEmpty(cropWildRelative.GenepoolCode))
        //                cmd.Parameters.AddWithValue("@genepool_code", DBNull.Value);
        //            else
        //                cmd.Parameters.AddWithValue("@genepool_code", cropWildRelative.GenepoolCode);

        //            cmd.Parameters.AddWithValue("@is_graftstock_genepool", UnBool(cropWildRelative.IsGraftstockGenepool));

        //            if (String.IsNullOrEmpty(cropWildRelative.TraitClassCode))
        //                cmd.Parameters.AddWithValue("@trait_class_code", DBNull.Value);
        //            else
        //                cmd.Parameters.AddWithValue("@trait_class_code", cropWildRelative.TraitClassCode);

        //            cmd.Parameters.AddWithValue("@is_potential", UnBool(cropWildRelative.IsPotential));

        //            if (String.IsNullOrEmpty(cropWildRelative.BreedingTypeCode))
        //                cmd.Parameters.AddWithValue("@breeding_type_code", DBNull.Value);
        //            else
        //                cmd.Parameters.AddWithValue("@breeding_type_code", cropWildRelative.BreedingTypeCode);

        //            if (String.IsNullOrEmpty(cropWildRelative.BreedingUsage))
        //                cmd.Parameters.AddWithValue("@breeding_usage", DBNull.Value);
        //            else
        //                cmd.Parameters.AddWithValue("@breeding_usage", cropWildRelative.BreedingUsage);

        //            if (String.IsNullOrEmpty(cropWildRelative.OntologyTraitIdentifier))
        //                cmd.Parameters.AddWithValue("@ontology_trait_identifier", DBNull.Value);
        //            else
        //                cmd.Parameters.AddWithValue("@ontology_trait_identifier", cropWildRelative.OntologyTraitIdentifier);

        //            if (cropWildRelative.CitationID == 0)
        //                cmd.Parameters.AddWithValue("@citation_id", DBNull.Value);
        //            else
        //                cmd.Parameters.AddWithValue("@citation_id", cropWildRelative.CitationID);

        //            if (String.IsNullOrEmpty(cropWildRelative.Note))
        //                cmd.Parameters.AddWithValue("@note", DBNull.Value);
        //            else
        //                cmd.Parameters.AddWithValue("@note", cropWildRelative.Note);

        //            cmd.Parameters.AddWithValue("@created_by", cropWildRelative.ModifiedByCooperatorID);

        //            SqlParameter retParam = new SqlParameter();
        //            retParam.SqlDbType = System.Data.SqlDbType.Int;
        //            retParam.ParameterName = "@new_taxonomy_cwr_id";
        //            retParam.Direction = System.Data.ParameterDirection.Output;
        //            retParam.Value = 0;
        //            cmd.Parameters.Add(retParam);
        //            cmd.ExecuteNonQuery();

        //            returnCode = Int32.Parse(cmd.Parameters["@new_taxonomy_cwr_id"].Value.ToString());
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //    return returnCode;
        //}

        //public int UpdateCropWildRelative(CropWildRelative cropWildRelative)
        //{
        //    const string COMMAND_TEXT = "usp_UpdateCropWildRelative";
        //    int returnCode = 0;

        //    try
        //    {
        //        using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
        //        {
        //            SqlCommand cmd = new SqlCommand();
        //            cmd.Connection = cn;
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            cmd.CommandText = COMMAND_TEXT;

        //            cmd.Parameters.AddWithValue("@taxonomy_cwr_id", cropWildRelative.ID);
        //            cmd.Parameters.AddWithValue("@taxonomy_species_id", cropWildRelative.SpeciesID);

        //            if (String.IsNullOrEmpty(cropWildRelative.CropName))
        //                cmd.Parameters.AddWithValue("@crop_name", DBNull.Value);
        //            else
        //                cmd.Parameters.AddWithValue("@crop_name", cropWildRelative.CropName);

        //            if (String.IsNullOrEmpty(cropWildRelative.DisplayName))
        //                cmd.Parameters.AddWithValue("@display_name", DBNull.Value);
        //            else
        //                cmd.Parameters.AddWithValue("@display_name", cropWildRelative.DisplayName);

        //            if (String.IsNullOrEmpty(cropWildRelative.CropCommonName))
        //                cmd.Parameters.AddWithValue("@crop_common_name", DBNull.Value);
        //            else
        //                cmd.Parameters.AddWithValue("@crop_common_name", cropWildRelative.CropCommonName);

        //            cmd.Parameters.AddWithValue("@is_crop", UnBool(cropWildRelative.IsCrop));

        //            if (String.IsNullOrEmpty(cropWildRelative.GenepoolCode))
        //                cmd.Parameters.AddWithValue("@genepool_code", DBNull.Value);
        //            else
        //                cmd.Parameters.AddWithValue("@genepool_code", cropWildRelative.GenepoolCode);

        //            cmd.Parameters.AddWithValue("@is_graftstock_genepool", UnBool(cropWildRelative.IsGraftstockGenepool));

        //            if (String.IsNullOrEmpty(cropWildRelative.TraitClassCode))
        //                cmd.Parameters.AddWithValue("@trait_class_code", DBNull.Value);
        //            else
        //                cmd.Parameters.AddWithValue("@trait_class_code", cropWildRelative.TraitClassCode);

        //            cmd.Parameters.AddWithValue("@is_potential", UnBool(cropWildRelative.IsPotential));

        //            if (String.IsNullOrEmpty(cropWildRelative.BreedingTypeCode))
        //                cmd.Parameters.AddWithValue("@breeding_type_code", DBNull.Value);
        //            else
        //                cmd.Parameters.AddWithValue("@breeding_type_code", cropWildRelative.BreedingTypeCode);

        //            if (String.IsNullOrEmpty(cropWildRelative.BreedingUsage))
        //                cmd.Parameters.AddWithValue("@breeding_usage", DBNull.Value);
        //            else
        //                cmd.Parameters.AddWithValue("@breeding_usage", cropWildRelative.BreedingUsage);

        //            if (String.IsNullOrEmpty(cropWildRelative.OntologyTraitIdentifier))
        //                cmd.Parameters.AddWithValue("@ontology_trait_identifier", DBNull.Value);
        //            else
        //                cmd.Parameters.AddWithValue("@ontology_trait_identifier", cropWildRelative.OntologyTraitIdentifier);

        //            if (cropWildRelative.CitationID == 0)
        //                cmd.Parameters.AddWithValue("@citation_id", DBNull.Value);
        //            else
        //                cmd.Parameters.AddWithValue("@citation_id", cropWildRelative.CitationID);

        //            if (String.IsNullOrEmpty(cropWildRelative.Note))
        //                cmd.Parameters.AddWithValue("@note", DBNull.Value);
        //            else
        //                cmd.Parameters.AddWithValue("@note", cropWildRelative.Note);

        //            cmd.Parameters.AddWithValue("@modified_by", cropWildRelative.ModifiedByCooperatorID);

        //            returnCode = cmd.ExecuteNonQuery();
        //            return returnCode;
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}

        //#endregion

        //protected string GetSearchSyntax(string searchOperatorCode, string searchCriterion)
        //{
        //    string searchSyntax = String.Empty;
        //    IEnumerable<SearchOperator> searchOperators = null;
        //    searchOperators = this.GetAllSearchOperators().AsEnumerable();

        //    searchSyntax = searchOperators.Where(x => x.Code == searchOperatorCode).First().SearchOperatorSyntax.Replace(":search_criterion", searchCriterion);
        //    return searchSyntax;
        //}


        //int Update(CropForCWR entity)
        //{
        //    throw new NotImplementedException();
        //}

        //public int Add(CropForCWR entity)
        //{
        //    throw new NotImplementedException();
        //}

        //public CropForCWR Get(int id)
        //{
        //    throw new NotImplementedException();
        //}

        //public IQueryable<CropForCWR> Search(Query query)
        //{
        //    throw new NotImplementedException();
        //}

        //public IQueryable<CropForCWR> Search(int parentId)
        //{
        //    throw new NotImplementedException();
        //}

        //public IQueryable<CropForCWR> Search(string searchString)
        //{
        //    throw new NotImplementedException();
        //}


    }
}
