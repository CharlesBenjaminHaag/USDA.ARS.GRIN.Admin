using System;
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
    public class CwrTraitDAO : BaseDAO, IRepository<CWRTrait>
    {
        private string _context;
        protected ReferenceDAO _referenceDAO = null;

        public CwrTraitDAO(string context)
        {
            _context = context;
            _referenceDAO = new ReferenceDAO(context);
        }

        public ResultContainer Add(CWRTrait entity)
        {
            const string COMMAND_TEXT = "usp_TaxonomyCwrTrait_Insert";
            ResultContainer resultContainer = new ResultContainer();

            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = cn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = COMMAND_TEXT;

                    cmd.Parameters.AddWithValue("@taxonomy_cwr_map_id", entity.CWRMapID);
                    cmd.Parameters.AddWithValue("@trait_class_code", entity.TraitClassCode);
                    cmd.Parameters.AddWithValue("@is_potential", UnBool(entity.IsPotential));

                    if (String.IsNullOrEmpty(entity.BreedingTypeCode))
                        cmd.Parameters.AddWithValue("@breeding_type_code", DBNull.Value);
                    else
                        cmd.Parameters.AddWithValue("@breeding_type_code", entity.BreedingTypeCode);

                    if (String.IsNullOrEmpty(entity.BreedingUsageNote))
                        cmd.Parameters.AddWithValue("@breeding_usage_note", DBNull.Value);
                    else
                        cmd.Parameters.AddWithValue("@breeding_usage_note", entity.BreedingUsageNote);

                    if (String.IsNullOrEmpty(entity.OntologyTraitIdentifier))
                        cmd.Parameters.AddWithValue("@ontology_trait_identifier", DBNull.Value);
                    else
                        cmd.Parameters.AddWithValue("@ontology_trait_identifier", entity.OntologyTraitIdentifier);

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
                    retParam.ParameterName = "@out_taxonomy_cwr_trait_id";
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

                    string resultString = cmd.Parameters["@out_taxonomy_cwr_trait_id"].Value.ToString();
                    if (!String.IsNullOrEmpty(resultString))
                    {
                        resultContainer.EntityID = Int32.Parse(resultString);
                    }
                    resultContainer.ResultCode = cmd.Parameters["@out_error_number"].Value.ToString();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return resultContainer;
        }

        public ResultContainer Update(CWRTrait entity)
        {
            const string COMMAND_TEXT = "usp_TaxonomyCwrTrait_Update";
            ResultContainer resultContainer = new ResultContainer();

            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = cn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = COMMAND_TEXT;

                    cmd.Parameters.AddWithValue("@taxonomy_cwr_trait_id", entity.ID);
                    cmd.Parameters.AddWithValue("@taxonomy_cwr_map_id", entity.CWRMapID);
                    cmd.Parameters.AddWithValue("@trait_class_code", entity.TraitClassCode);
                    cmd.Parameters.AddWithValue("@is_potential", UnBool(entity.IsPotential));
                    cmd.Parameters.AddWithValue("@breeding_type_code", entity.BreedingTypeCode);

                    if (String.IsNullOrEmpty(entity.BreedingUsageNote))
                        cmd.Parameters.AddWithValue("@breeding_usage_note", DBNull.Value);
                    else
                        cmd.Parameters.AddWithValue("@breeding_usage_note", entity.BreedingUsageNote);

                    if (String.IsNullOrEmpty(entity.OntologyTraitIdentifier))
                        cmd.Parameters.AddWithValue("@ontology_trait_identifier", DBNull.Value);
                    else
                        cmd.Parameters.AddWithValue("@ontology_trait_identifier", entity.OntologyTraitIdentifier);

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
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return resultContainer;
        }

        public IQueryable<CWRTrait> FindAll()
        {
            throw new NotImplementedException();
        }

        public CWRTrait Get(int id)
        {
            const string COMMAND_TEXT = "usp_TaxonomyCwrTrait_Select";
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

                        cmd.Parameters.AddWithValue("@taxonomy_cwr_trait_id", id);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                cwrTrait.ID = GetInt(reader["taxonomy_cwr_trait_id"].ToString());
                                cwrTrait.CWRMapID = GetInt(reader["taxonomy_cwr_map_id"].ToString());
                                cwrTrait.CropForCWRID = GetInt(reader["taxonomy_cwr_crop_id"].ToString());
                                cwrTrait.CropForCWRName = reader["cwr_crop_name"].ToString();
                                cwrTrait.SpeciesID = GetInt(reader["taxonomy_species_id"].ToString());
                                cwrTrait.SpeciesName = reader["species_name"].ToString();
                                cwrTrait.TraitClassCode = reader["trait_class_code"].ToString();
                                cwrTrait.IsPotential = ParseBool(reader["is_potential"].ToString());
                                cwrTrait.BreedingTypeCode = reader["breeding_type_code"].ToString();
                                cwrTrait.BreedingUsageNote = reader["breeding_usage_note"].ToString();
                                cwrTrait.OntologyTraitIdentifier = reader["ontology_trait_identifier"].ToString();
                                cwrTrait.CitationID = GetInt(reader["citation_id"].ToString());

                                if (reader["note"] != DBNull.Value)
                                {
                                    cwrTrait.Note = reader["note"].ToString();
                                }
                                cwrTrait.CreatedDate = GetDate(reader["created_date"].ToString());
                                cwrTrait.CreatedByCooperatorID = GetInt(reader["created_by"].ToString());
                                cwrTrait.ModifiedDate = GetDate(reader["modified_date"].ToString());
                                cwrTrait.ModifiedByCooperatorID = GetInt(reader["modified_by"].ToString());
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return cwrTrait;
        }

        public ResultContainer Remove(CWRTrait entity)
        {
            throw new NotImplementedException();
        }

        public IQueryable<CWRTrait> Search(Query query)
        {
            throw new NotImplementedException();
        }

        public IQueryable<CWRTrait> Search(string searchString)
        {
            const string COMMAND_TEXT = "usp_TaxonomyCwrTraits_Search";
            List<CWRTrait> cWRTraitList = new List<CWRTrait>();

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
                                CWRTrait cWrTrait = new CWRTrait();
                                cWrTrait.ID = GetInt(reader["taxonomy_cwr_trait_id"].ToString());
                                cWrTrait.CWRMapID = GetInt(reader["taxonomy_cwr_map_id"].ToString());
                                cWrTrait.CropForCWRID = GetInt(reader["taxonomy_cwr_crop_id"].ToString());
                                cWrTrait.SpeciesID = GetInt(reader["taxonomy_species_id"].ToString());
                                cWrTrait.TraitClassCode = reader["trait_class_code"].ToString();
                                cWrTrait.TraitClassTitle = reader["trait_class_title"].ToString();
                                cWrTrait.IsPotential = ParseBool(reader["is_potential"].ToString());
                                cWrTrait.TraitClassCode = reader["breeding_type_code"].ToString();
                                cWrTrait.BreedingTypeCode = reader["breeding_type_code"].ToString();
                                cWrTrait.BreedingTypeTitle = reader["breeding_type_title"].ToString();
                                cWrTrait.BreedingUsageNote = reader["breeding_usage_note"].ToString();
                                cWrTrait.OntologyTraitIdentifier = reader["ontology_trait_identifier"].ToString();
                                cWrTrait.CitationID = GetInt(reader["citation_id"].ToString());
                                cWrTrait.CreatedDate = GetDate(reader["created_date"].ToString());
                                cWrTrait.CreatedByCooperatorName = reader["created_by_name"].ToString();
                                cWRTraitList.Add(cWrTrait);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return cWRTraitList.AsQueryable();
        }

       
    }
}
