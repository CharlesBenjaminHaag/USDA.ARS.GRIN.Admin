﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Runtime.Caching;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;

namespace USDA.ARS.GRIN.Admin.Repository.Taxonomy
{
    public class CwrMapDAO : BaseDAO, IRepository<CWRMap>
    {
        private string _context;
        protected ReferenceDAO _referenceDAO = null;
        public CwrMapDAO(string context)
        {
            _context = context;
            _referenceDAO = new ReferenceDAO(context);
        }

        public CWRMap Get(int id)
        {
            const string COMMAND_TEXT = "usp_TaxonomyCwrMap_Select";
            CWRMap cwrMap = new CWRMap();

            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand(COMMAND_TEXT, cn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@taxonomy_cwr_map_id", id);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                cwrMap.ID = id;
                                cwrMap.SpeciesID = GetInt(reader["taxonomy_species_id"].ToString());
                                cwrMap.SpeciesName = reader["species_name"].ToString();
                                cwrMap.CropForCWRID = GetInt(reader["taxonomy_cwr_crop_id"].ToString());
                                cwrMap.CropForCWRName = reader["cwr_crop_name"].ToString();
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
                            }
                        }
                        cwrMap.CWRTraits = GetCWRTraits(id);
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return cwrMap;
        }

        public List<CWRTrait> GetCWRTraits(int cwrMapId)
        {
            const string COMMAND_TEXT = "usp_TaxonomyCwrTraits_Select";
            List<CWRTrait> cwrTraits = new List<CWRTrait>();
            CWRTrait cwrTrait = new CWRTrait();

            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = cn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = COMMAND_TEXT;

                        cmd.Parameters.AddWithValue("@taxonomy_cwr_map_id", cwrMapId);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                cwrTrait.ID = GetInt(reader["taxonomy_cwr_trait_id"].ToString());
                                cwrTrait.CWRMapID = GetInt(reader["taxonomy_cwr_map_id"].ToString());
                                cwrTrait.CropForCWRID = GetInt(reader["taxonomy_cwr_crop_id"].ToString());
                                //cwrTrait.CropForCWRName = reader["cwr_crop_name"].ToString();
                                cwrTrait.SpeciesID = GetInt(reader["taxonomy_species_id"].ToString());
                                //cwrTrait.SpeciesName = reader["species_name"].ToString();
                                cwrTrait.TraitClassCode = reader["trait_class_code"].ToString();
                                cwrTrait.TraitClassTitle = reader["trait_class_title"].ToString();
                                cwrTrait.IsPotential = ParseBool(reader["is_potential"].ToString());
                                cwrTrait.BreedingTypeCode = reader["breeding_type_code"].ToString();
                                cwrTrait.BreedingTypeTitle = reader["breeding_type_title"].ToString();
                                cwrTrait.BreedingUsageNote = reader["breeding_usage_note"].ToString();
                                cwrTrait.OntologyTraitIdentifier = reader["ontology_trait_identifier"].ToString();
                                cwrTrait.CitationID = GetInt(reader["citation_id"].ToString());

                                if (reader["note"] != DBNull.Value)
                                {
                                    cwrTrait.Note = reader["note"].ToString();
                                }
                                cwrTrait.CreatedDate = GetDate(reader["created_date"].ToString());
                                cwrTrait.CreatedByCooperatorID = GetInt(reader["created_by"].ToString());
                                cwrTrait.CreatedByCooperatorName = reader["created_by_name"].ToString();
                                cwrTrait.ModifiedDate = GetDate(reader["modified_date"].ToString());
                                cwrTrait.ModifiedByCooperatorID = GetInt(reader["modified_by"].ToString());
                                cwrTrait.ModifiedByCooperatorName = reader["modified_by_name"].ToString();
                                cwrTraits.Add(cwrTrait);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return cwrTraits;
        }
        public IQueryable<CWRMap> Search(Query query)
        {
            throw new NotImplementedException();
        }

        public IQueryable<CWRMap> Search(string searchString)
        {
            const string COMMAND_TEXT = "usp_TaxonomyCwrMaps_Search";
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

                        cmd.Parameters.AddWithValue("@sql_where_clause", searchString);

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
                                cwrMap.CropForCWRName = reader["crop_name"].ToString();
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
                                //cwrMap.CWRTraits = GetCWRTraits(cwrMap.ID);
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

        public IQueryable<CWRMap> FindAll()
        {
            throw new NotImplementedException();
        }

        public ResultContainer Add(CWRMap entity)
        {
            ResultContainer resultContainer = new ResultContainer();
            const string COMMAND_TEXT = "usp_TaxonomyCwrMap_Insert";

            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand(COMMAND_TEXT, cn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@taxonomy_species_id", entity.SpeciesID);
                        cmd.Parameters.AddWithValue("@taxonomy_cwr_crop_id", entity.CropForCWRID);

                        if (entity.IsCrop)
                        {
                            cmd.Parameters.AddWithValue("@crop_common_name", entity.CommonName);
                        }
                        else
                        {
                            cmd.Parameters.AddWithValue("@crop_common_name", DBNull.Value);
                        }

                        cmd.Parameters.AddWithValue("@is_crop", UnBool(entity.IsCrop));

                        if (String.IsNullOrEmpty(entity.GenepoolCode))
                            cmd.Parameters.AddWithValue("@genepool_code", DBNull.Value);
                        else
                            cmd.Parameters.AddWithValue("@genepool_code", entity.GenepoolCode);

                        cmd.Parameters.AddWithValue("@is_graftstock", UnBool(entity.IsGraftStock));
                        cmd.Parameters.AddWithValue("@is_potential", UnBool(entity.IsPotential));

                        if (entity.CitationID == 0)
                            cmd.Parameters.AddWithValue("@citation_id", DBNull.Value);
                        else
                            cmd.Parameters.AddWithValue("@citation_id", entity.CitationID);

                        if (String.IsNullOrEmpty(entity.Note))
                            cmd.Parameters.AddWithValue("@note", DBNull.Value);
                        else
                            cmd.Parameters.AddWithValue("@note", entity.Note);

                        cmd.Parameters.AddWithValue("@created_by", entity.CreatedByCooperatorID);

                        SqlParameter retParam = new SqlParameter();
                        retParam.SqlDbType = System.Data.SqlDbType.Int;
                        retParam.ParameterName = "@out_taxonomy_cwr_map_id";
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

                        string resultString = cmd.Parameters["@out_taxonomy_cwr_map_id"].Value.ToString();
                        if (!String.IsNullOrEmpty(resultString))
                        {
                            resultContainer.EntityID = Int32.Parse(resultString);
                        }
                        resultContainer.ResultCode = cmd.Parameters["@out_error_number"].Value.ToString();
                    }
                }
            }
            catch (SqlException se)
            {

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return resultContainer;
        }
        
        public ResultContainer Update(CWRMap entity)
        {
            const string COMMAND_TEXT = "usp_TaxonomyCwrMap_Update";
            ResultContainer resultContainer = new ResultContainer();

            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand(COMMAND_TEXT, cn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@taxonomy_cwr_map_id", entity.ID);
                        cmd.Parameters.AddWithValue("@taxonomy_species_id", entity.SpeciesID);
                        cmd.Parameters.AddWithValue("@taxonomy_cwr_crop_id", entity.CropForCWRID);

                        if (String.IsNullOrEmpty(entity.CommonName))
                            cmd.Parameters.AddWithValue("@crop_common_name", DBNull.Value);
                        else
                            cmd.Parameters.AddWithValue("@crop_common_name", entity.CommonName);

                        cmd.Parameters.AddWithValue("@is_crop", UnBool(entity.IsCrop));

                        if (String.IsNullOrEmpty(entity.GenepoolCode))
                            cmd.Parameters.AddWithValue("@genepool_code", DBNull.Value);
                        else
                            cmd.Parameters.AddWithValue("@genepool_code", entity.GenepoolCode);

                        cmd.Parameters.AddWithValue("@is_graftstock", UnBool(entity.IsGraftStock));
                        cmd.Parameters.AddWithValue("@is_potential", UnBool(entity.IsPotential));

                        if (entity.CitationID <= 0)
                            cmd.Parameters.AddWithValue("@citation_id", DBNull.Value);
                        else
                            cmd.Parameters.AddWithValue("@citation_id", entity.CitationID);

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

                        resultContainer.ResultCode = cmd.Parameters["@out_error_number"].Value.ToString();
                        return resultContainer;
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public ResultContainer Remove(CWRMap entity)
        {
            throw new NotImplementedException();
        }

        public ResultContainer Remove(int[] idList)
        {
            throw new NotImplementedException();
        }
    }
}
