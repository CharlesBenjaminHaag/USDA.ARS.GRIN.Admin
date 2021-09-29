using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Runtime.Caching;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;
using System.CodeDom;

namespace USDA.ARS.GRIN.Admin.Repository
{
    public class SpeciesDAO : BaseTaxonomyDAO, IRepository<Species>
    {
        protected ReferenceDAO _referenceDAO = null;

        public SpeciesDAO(string context)
        {
            base._context = context;
            _context = context;
            _referenceDAO = new ReferenceDAO(context);
        }
        
        public ResultContainer Remove(Species entity)
        {
            throw new NotImplementedException();
        }

        public List<Species> FindAllCached()
        {
            string CacheKey = "SPECIES";
            List<Species> speciesList = new List<Species>();

            ObjectCache cache = MemoryCache.Default;

            if (cache.Contains(CacheKey))
                speciesList = (List<Species>)cache.Get(CacheKey);
            else
            {
                speciesList = GetSpecies();
                CacheItemPolicy cacheItemPolicy = new CacheItemPolicy();
                cacheItemPolicy.AbsoluteExpiration = DateTime.Now.AddHours(1.0);
                cache.Add(CacheKey, speciesList, cacheItemPolicy);
            }

            return speciesList;
        }

        public IQueryable<Species> FindAll()
        {
            const string COMMAND_TEXT_NAME = "usp_TaxonomySpeciesAcceptedName_Select";

            List<Species> speciesList = new List<Species>();

            try
            {
                using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = COMMAND_TEXT_NAME;
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        speciesList.Add(new Species { ID = GetInt(reader["taxonomy_species_id"].ToString()), SpeciesName = reader["name"].ToString(), IsAcceptedName = ParseBool(reader["is_accepted_name"].ToString()), Authority = reader["authority"].ToString() });
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return speciesList.AsQueryable();
        }

        private List<Species> GetSpecies()
        {
            String commandText = "usp_TaxonomySpeciesAcceptedName_Select";
            List<Species> speciesList = new List<Species>();

            using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
            {
                using (SqlCommand cmd = new SqlCommand(commandText, conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            speciesList.Add(new Species { ID = GetInt(reader["taxonomy_species_id"].ToString()), Name = reader["name"].ToString() });
                        }
                    }
                }
            }
            return speciesList;
        }

        public IQueryable<Species> Search(Query query)
        {
            string sqlWhereClause = String.Empty;
            IQueryable<Species> speciesList = new List<Species>().AsQueryable();

            try 
            {
                sqlWhereClause = query.GetSQLSyntax();
                speciesList = Search(sqlWhereClause);
                return speciesList;
            }
            catch(SqlException ex) 
            {
                throw ex;
            }
        }

        public List<Species> Search(string searchExpression, bool includeSynonyms)
        {
            const string COMMAND_TEXT_NAME = "usp_TaxonomySpeciesAcceptedName_Search";
            const string COMMAND_TEXT_SYN = "usp_TaxonomySpeciesSynonym_Search";
            Species species = null;
            List<Species> speciesList = new List<Species>();

            try
            {
                using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.StoredProcedure;

                    if (includeSynonyms)
                    {
                        cmd.CommandText = COMMAND_TEXT_SYN;
                    }
                    else
                        cmd.CommandText = COMMAND_TEXT_NAME;

                    cmd.Parameters.AddWithValue("@search_text", searchExpression + "%");
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        species = new Species();
                        species.ID = GetInt(reader["taxonomy_species_id"].ToString());
                        species.CurrentID = GetInt(reader["current_taxonomy_species_id"].ToString());
                        species.NomenNumber = GetInt(reader["nomen_number"].ToString());
                        species.IsSpecificHybrid = ParseBool(reader["is_specific_hybrid"].ToString());
                        species.SpeciesName = reader["species_name"].ToString();
                        species.Name = reader["name"].ToString();
                        species.IsAcceptedName = ParseBool(reader["is_accepted_name"].ToString());
                        species.ShowIsAcceptedName = reader["is_accepted_name"].ToString();
                        species.Authority = reader["species_authority"].ToString();
                        species.IsSubSpecificHybrid = ParseBool(reader["is_subspecific_hybrid"].ToString());
                        species.SubSpeciesName = reader["subspecies_name"].ToString();
                        species.SubSpeciesAuthority = reader["subspecies_authority"].ToString();
                        species.IsVarietalHybrid = ParseBool(reader["is_varietal_hybrid"].ToString());
                        species.VarietyName = reader["variety_name"].ToString();
                        species.VarietyAuthority = reader["variety_authority"].ToString();
                        species.FormaRankType = reader["forma_rank_type"].ToString();
                        species.FormaName = reader["forma_name"].ToString();
                        species.FormaAuthority = reader["forma_authority"].ToString();
                        species.GenusID = GetInt(reader["taxonomy_genus_id"].ToString());
                        species.GenusName = reader["genus_name"].ToString();
                        species.SynonymCode = reader["synonym_code"].ToString();
                        species.VerifierCooperatorID = GetInt(reader["verifier_cooperator_id"].ToString());
                        species.VerifiedByCooperatorName = reader["verified_by_name"].ToString();
                        species.NameVerifiedDate = GetDate(reader["name_verified_date"].ToString());
                        species.Protologue = reader["protologue"].ToString();
                        species.NameAuthority = reader["name_authority"].ToString();
                        species.Note = reader["note"].ToString();
                        species.CreatedDate = GetDate(reader["created_date"].ToString());
                        species.CreatedByCooperatorID = GetInt(reader["created_by"].ToString());
                        species.CreatedByCooperatorName = reader["created_by_name"].ToString();
                        species.ModifiedDate = GetDate(reader["modified_date"].ToString());
                        species.ModifiedByCooperatorID = GetInt(reader["modified_by"].ToString());
                        species.ModifiedByCooperatorName = reader["modified_by_name"].ToString();
                        species.AccessionCount = GetInt(reader["accession_count"].ToString());
                        speciesList.Add(species);
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return speciesList;
        }

        public IQueryable<Species> Search(string searchString)
        {
            const string COMMAND_TEXT = "usp_TaxonomySpecies_Search";

            List<Species> speciesList = new List<Species>();

            try
            {
                using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = COMMAND_TEXT;

                    cmd.Parameters.AddWithValue("@sql_where_clause", searchString);
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        Species species = new Species();
                        species.ID = GetInt(reader["taxonomy_species_id"].ToString());
                        species.CurrentID = GetInt(reader["current_taxonomy_species_id"].ToString());
                        species.NomenNumber = GetInt(reader["nomen_number"].ToString());
                        species.ShowIsAcceptedName = reader["nomen_number"].ToString();
                        species.IsAcceptedName = (reader["is_accepted_name"].ToString() == "Y") ? true : false;
                        species.IsSpecificHybrid = (reader["is_specific_hybrid"].ToString() == "Y") ? true : false;
                        species.SpeciesName = reader["species_name"].ToString();
                        species.Name = reader["name"].ToString();
                        species.FullName = reader["full_name"].ToString();
                        species.Authority = reader["species_authority"].ToString();
                        species.IsSubSpecificHybrid = (reader["is_subspecific_hybrid"].ToString() == "Y") ? true : false;
                        species.SubSpeciesName = reader["subspecies_name"].ToString();
                        species.SubSpeciesAuthority = reader["subspecies_authority"].ToString();
                        species.IsVarietalHybrid = (reader["is_varietal_hybrid"].ToString() == "Y") ? true : false;
                        species.VarietyName = reader["variety_name"].ToString();
                        species.VarietyAuthority = reader["variety_authority"].ToString();
                        species.IsSubVarietalHybrid = (reader["is_subvarietal_hybrid"].ToString() == "Y") ? true : false;
                        species.SubVarietyName = reader["subvariety_name"].ToString();
                        species.SubVarietyAuthority = reader["subvariety_authority"].ToString();
                        species.IsFormaHybrid = (reader["is_forma_hybrid"].ToString() == "Y") ? true : false;
                        species.FormaRankType = reader["forma_rank_type"].ToString();
                        species.FormaName = reader["forma_name"].ToString();
                        species.FormaAuthority = reader["forma_authority"].ToString();
                        species.GenusID = GetInt(reader["taxonomy_genus_id"].ToString());
                        species.GenusName = reader["genus_name"].ToString();
                        species.IsNamePending = (reader["is_name_pending"].ToString() == "Y") ? true : false;
                        species.SynonymCode = reader["synonym_code"].ToString();
                        species.VerifierCooperatorID = GetInt(reader["verifier_cooperator_id"].ToString());
                        species.VerifiedByCooperatorName = reader["verified_by_name"].ToString();
                        species.NameVerifiedDate = GetDate(reader["name_verified_date"].ToString());
                        species.Name = reader["name"].ToString();
                        species.NameAuthority = reader["name_authority"].ToString();
                        species.Protologue = reader["protologue"].ToString();
                        species.ProtologueVirtualPath = reader["protologue_virtual_path"].ToString();
                        species.Note = reader["note"].ToString();
                        species.AlternateName = reader["alternate_name"].ToString();
                        species.CreatedDate = GetDate(reader["created_date"].ToString());
                        species.CreatedByCooperatorID = GetInt(reader["created_by"].ToString());
                        species.ModifiedDate = GetDate(reader["modified_date"].ToString());
                        species.ModifiedByCooperatorID = GetInt(reader["modified_by"].ToString());
                        species.OwnedDate = GetDate(reader["owned_date"].ToString());
                        species.OwnedByCooperatorID = GetInt(reader["owned_by"].ToString());
                        speciesList.Add(species);
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return speciesList.AsQueryable();
        }

        public IQueryable<Species> GetFolderItems(int folderId)
        {
            const string COMMAND_TEXT_NAME = "usp_TaxonomyFolderSpeciesItemMaps_Select";
            Species species = null;
            List<Species> speciesList = new List<Species>();

            try
            {
                using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = COMMAND_TEXT_NAME;
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@taxonomy_folder_id", folderId);
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        species = new Species();
                        species.ReferenceID = GetInt(reader["taxonomy_folder_item_id"].ToString());
                        species.ID = GetInt(reader["taxonomy_species_id"].ToString());
                        species.CurrentID = GetInt(reader["current_taxonomy_species_id"].ToString());
                        species.NomenNumber = GetInt(reader["nomen_number"].ToString());
                        species.IsSpecificHybrid = ParseBool(reader["is_specific_hybrid"].ToString());
                        species.SpeciesName = reader["species_name"].ToString();
                        species.Name = reader["name"].ToString();
                        species.IsAcceptedName = ParseBool(reader["is_accepted_name"].ToString());
                        species.ShowIsAcceptedName = reader["is_accepted_name"].ToString();
                        species.Authority = reader["species_authority"].ToString();
                        species.IsSubSpecificHybrid = ParseBool(reader["is_subspecific_hybrid"].ToString());
                        species.SubSpeciesName = reader["subspecies_name"].ToString();
                        species.SubSpeciesAuthority = reader["subspecies_authority"].ToString();
                        species.IsVarietalHybrid = ParseBool(reader["is_varietal_hybrid"].ToString());
                        species.VarietyName = reader["variety_name"].ToString();
                        species.VarietyAuthority = reader["variety_authority"].ToString();
                        species.FormaRankType = reader["forma_rank_type"].ToString();
                        species.FormaName = reader["forma_name"].ToString();
                        species.FormaAuthority = reader["forma_authority"].ToString();
                        species.GenusID = GetInt(reader["taxonomy_genus_id"].ToString());
                        species.GenusName = reader["genus_name"].ToString();
                        species.SynonymCode = reader["synonym_code"].ToString();
                        species.Protologue = reader["protologue"].ToString();
                        species.NameAuthority = reader["name_authority"].ToString();
                        species.Note = reader["note"].ToString();
                        species.CreatedDate = GetDate(reader["created_date"].ToString());
                        species.CreatedByCooperatorID = GetInt(reader["created_by"].ToString());
                        species.CreatedByCooperatorName = reader["created_by_name"].ToString();
                        species.ModifiedDate = GetDate(reader["modified_date"].ToString());
                        species.ModifiedByCooperatorID = GetInt(reader["modified_by"].ToString());
                        species.ModifiedByCooperatorName = reader["modified_by_name"].ToString();
                        species.AccessionCount = GetInt(reader["accession_count"].ToString());
                        speciesList.Add(species);
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return speciesList.AsQueryable();
        }

        public ResultContainer Update(Species entity)
        {
            const string COMMAND_TEXT = "usp_TaxonomySpecies_Update";
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
                        cmd.Parameters.AddWithValue("@taxonomy_species_id", entity.ID);

                        if (entity.CurrentID <= 0)
                            cmd.Parameters.AddWithValue("@current_taxonomy_species_id", DBNull.Value);
                        else
                            cmd.Parameters.AddWithValue("@current_taxonomy_species_id", entity.CurrentID);

                        cmd.Parameters.AddWithValue("@is_specific_hybrid", entity.IsSpecificHybrid);

                        if (!String.IsNullOrEmpty(entity.SpeciesName))
                            cmd.Parameters.AddWithValue("@species_name", entity.SpeciesName);
                        else
                            cmd.Parameters.AddWithValue("@species_name", "Species");

                        if (!String.IsNullOrEmpty(entity.Authority))
                            cmd.Parameters.AddWithValue("@species_authority", entity.Authority);
                        else
                            cmd.Parameters.AddWithValue("@species_authority", DBNull.Value);

                        cmd.Parameters.AddWithValue("@is_subspecific_hybrid", entity.IsSubSpecificHybrid);
                        cmd.Parameters.AddWithValue("@is_varietal_hybrid", entity.IsVarietalHybrid);

                        if (String.IsNullOrEmpty(entity.VarietyName))
                            cmd.Parameters.AddWithValue("@variety_name", DBNull.Value);
                        else
                            cmd.Parameters.AddWithValue("@variety_name", entity.VarietyName);

                        if (String.IsNullOrEmpty(entity.VarietyAuthority))
                            cmd.Parameters.AddWithValue("@variety_authority", DBNull.Value);
                        else
                            cmd.Parameters.AddWithValue("@variety_authority", entity.VarietyAuthority);

                        cmd.Parameters.AddWithValue("@is_subvarietal_hybrid", entity.IsSubVarietalHybrid);
                        cmd.Parameters.AddWithValue("@subvariety_name", String.IsNullOrEmpty(entity.SubVarietyName) ? "" : entity.SubVarietyName);
                        cmd.Parameters.AddWithValue("@subvariety_authority", String.IsNullOrEmpty(entity.SubVarietyAuthority) ? "" : entity.SubVarietyAuthority);
                        cmd.Parameters.AddWithValue("@is_forma_hybrid", entity.IsFormaHybrid);

                        if (String.IsNullOrEmpty(entity.FormaRankType))
                        {
                            cmd.Parameters.AddWithValue("@forma_rank_type", DBNull.Value);
                        }
                        else
                            cmd.Parameters.AddWithValue("@forma_rank_type", entity.FormaRankType);

                        if (String.IsNullOrEmpty(entity.FormaName))
                        {
                            cmd.Parameters.AddWithValue("@forma_name", DBNull.Value);
                        }
                        else
                            cmd.Parameters.AddWithValue("@forma_name", entity.FormaName);

                        if (String.IsNullOrEmpty(entity.FormaAuthority))
                        {
                            cmd.Parameters.AddWithValue("@forma_authority", DBNull.Value);
                        }
                        else
                            cmd.Parameters.AddWithValue("@forma_authority", entity.FormaAuthority);

                        cmd.Parameters.AddWithValue("@taxonomy_genus_id", entity.GenusID);
                        cmd.Parameters.AddWithValue("@life_form_code", "TODO");
                        cmd.Parameters.AddWithValue("@is_name_pending", entity.IsNamePending);
                        cmd.Parameters.AddWithValue("@synonym_code", String.IsNullOrEmpty(entity.SynonymCode) ? "" : entity.SynonymCode);
                        if (entity.NameVerifiedDate> DateTime.MinValue)
                        {
                            cmd.Parameters.AddWithValue("@name_verified_date", entity.NameVerifiedDate);
                        }
                        else
                        {
                            cmd.Parameters.AddWithValue("@name_verified_date", DBNull.Value);
                        }

                        if (entity.VerifierCooperatorID > 0)
                        {
                            cmd.Parameters.AddWithValue("@verifier_cooperator_id", entity.VerifierCooperatorID);
                        }
                        else 
                        {
                            cmd.Parameters.AddWithValue("@verifier_cooperator_id", DBNull.Value);
                        }
                        if (!String.IsNullOrEmpty(entity.Name))
                            cmd.Parameters.AddWithValue("@name", entity.Name);
                        else
                            cmd.Parameters.AddWithValue("@name", "Species");

                        cmd.Parameters.AddWithValue("@name_authority", String.IsNullOrEmpty(entity.NameAuthority) ? "" : entity.NameAuthority);
                        cmd.Parameters.AddWithValue("@protologue", String.IsNullOrEmpty(entity.Protologue) ? "" : entity.Protologue);
                        cmd.Parameters.AddWithValue("@protologue_virtual_path", String.IsNullOrEmpty(entity.ProtologueVirtualPath) ? "" : entity.ProtologueVirtualPath);

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
                        if (!String.IsNullOrEmpty(resultContainer.ResultCode))
                        {
                            if (Int32.Parse(resultContainer.ResultCode) > 0)
                            {
                                throw new Exception(resultContainer.ResultCode);
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

        public ResultContainer Add(Species entity)
        {
            const string COMMAND_TEXT = "usp_TaxonomySpecies_Insert";
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

                        if (entity.CurrentID == 0)
                            cmd.Parameters.AddWithValue("@current_taxonomy_species_id", DBNull.Value);
                        else
                            cmd.Parameters.AddWithValue("@current_taxonomy_species_id", entity.CurrentID);

                        cmd.Parameters.AddWithValue("@is_specific_hybrid", entity.IsSpecificHybrid);
                        cmd.Parameters.AddWithValue("@species_name", entity.SpeciesName);
                        cmd.Parameters.AddWithValue("@species_authority", "TODO");
                        cmd.Parameters.AddWithValue("@is_subspecific_hybrid", entity.IsSubSpecificHybrid);
                        cmd.Parameters.AddWithValue("@is_varietal_hybrid", entity.IsVarietalHybrid);

                        if (String.IsNullOrEmpty(entity.Name))
                            cmd.Parameters.AddWithValue("@name", DBNull.Value);
                        else
                            cmd.Parameters.AddWithValue("@name", entity.Name);

                        if (String.IsNullOrEmpty(entity.VarietyName))
                            cmd.Parameters.AddWithValue("@variety_name", DBNull.Value);
                        else
                            cmd.Parameters.AddWithValue("@variety_name", entity.VarietyName);

                        if (String.IsNullOrEmpty(entity.VarietyAuthority))
                            cmd.Parameters.AddWithValue("@variety_authority", DBNull.Value);
                        else
                            cmd.Parameters.AddWithValue("@variety_authority", entity.VarietyAuthority);

                        if (String.IsNullOrEmpty(entity.FormaRankType))
                        {
                            cmd.Parameters.AddWithValue("@forma_rank_type", DBNull.Value);
                        }
                        else
                            cmd.Parameters.AddWithValue("@forma_rank_type", entity.FormaRankType);

                        if (String.IsNullOrEmpty(entity.FormaName))
                        {
                            cmd.Parameters.AddWithValue("@forma_name", DBNull.Value);
                        }
                        else
                            cmd.Parameters.AddWithValue("@forma_name", entity.FormaName);

                        if (String.IsNullOrEmpty(entity.FormaAuthority))
                        {
                            cmd.Parameters.AddWithValue("@forma_authority", DBNull.Value);
                        }
                        else
                            cmd.Parameters.AddWithValue("@forma_authority", entity.FormaAuthority);

                        cmd.Parameters.AddWithValue("@is_subvarietal_hybrid", entity.IsSubVarietalHybrid);
                        cmd.Parameters.AddWithValue("@subvariety_name", String.IsNullOrEmpty(entity.SubVarietyName) ? "" : entity.SubVarietyName);
                        cmd.Parameters.AddWithValue("@subvariety_authority", String.IsNullOrEmpty(entity.SubVarietyAuthority) ? "" : entity.SubVarietyAuthority);
                        cmd.Parameters.AddWithValue("@is_forma_hybrid", entity.IsFormaHybrid);
                        cmd.Parameters.AddWithValue("@taxonomy_genus_id", entity.GenusID);
                        cmd.Parameters.AddWithValue("@life_form_code", "TODO");
                        cmd.Parameters.AddWithValue("@is_name_pending", entity.IsNamePending);
                        cmd.Parameters.AddWithValue("@synonym_code", String.IsNullOrEmpty(entity.SynonymCode) ? "" : entity.SynonymCode);

                        if (entity.NameVerifiedDate > DateTime.MinValue)
                        {
                            cmd.Parameters.AddWithValue("@name_verified_date", entity.NameVerifiedDate);
                        }
                        else
                        {
                            cmd.Parameters.AddWithValue("@name_verified_date", DBNull.Value);
                        }

                        // TO DO: LOGIC TO CREATE NAME
                        entity.Name = entity.GenusName + " " + entity.SpeciesName;

                        cmd.Parameters.AddWithValue("@name", entity.Name);
                        cmd.Parameters.AddWithValue("@name_authority", String.IsNullOrEmpty(entity.NameAuthority) ? "" : entity.NameAuthority);


                        cmd.Parameters.AddWithValue("@protologue", String.IsNullOrEmpty(entity.Protologue) ? "" : entity.Protologue);
                        cmd.Parameters.AddWithValue("@protologue_virtual_path", String.IsNullOrEmpty(entity.ProtologueVirtualPath) ? "" : entity.ProtologueVirtualPath);

                        if (String.IsNullOrEmpty(entity.Note))
                            cmd.Parameters.AddWithValue("@note", DBNull.Value);
                        else
                            cmd.Parameters.AddWithValue("@note", entity.Note);

                        cmd.Parameters.AddWithValue("@created_by", entity.CreatedByCooperatorID);

                        SqlParameter retParam = new SqlParameter();
                        retParam.SqlDbType = System.Data.SqlDbType.Int;
                        retParam.ParameterName = "@out_taxonomy_species_id";
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

                        string resultString = cmd.Parameters["@out_taxonomy_species_id"].Value.ToString();
                        if (!String.IsNullOrEmpty(resultString))
                        {
                            resultContainer.EntityID = Int32.Parse(resultString);
                        }
                        resultContainer.ResultCode = cmd.Parameters["@out_error_number"].Value.ToString();

                    }
                }
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            return resultContainer;
        }

        public Species Get(int id)
        {
            const string COMMAND_TEXT = "usp_TaxonomySpecies_Select";
            Species species = null;

            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = cn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = COMMAND_TEXT;

                        cmd.Parameters.AddWithValue("@taxonomy_species_id", id);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                species = new Species();
                                species.ID = GetInt(reader["taxonomy_species_id"].ToString());
                                species.CurrentID = GetInt(reader["current_taxonomy_species_id"].ToString());
                                species.NomenNumber = GetInt(reader["nomen_number"].ToString());
                                species.IsSpecificHybrid = ParseBool(reader["is_specific_hybrid"].ToString());
                                species.SpeciesName = reader["species_name"].ToString();
                                species.Name = reader["name"].ToString();
                                species.FullName = reader["full_name"].ToString();
                                species.IsAcceptedName = ParseBool(reader["is_accepted_name"].ToString());
                                species.Authority = reader["species_authority"].ToString();
                                species.IsSubSpecificHybrid = ParseBool(reader["is_subspecific_hybrid"].ToString());
                                species.SubSpeciesName = reader["subspecies_name"].ToString();
                                species.SubSpeciesAuthority = reader["subspecies_authority"].ToString();
                                species.IsVarietalHybrid = ParseBool(reader["is_varietal_hybrid"].ToString());
                                species.VarietyName = reader["variety_name"].ToString();
                                species.VarietyAuthority = reader["variety_authority"].ToString();
                                species.FormaRankType = reader["forma_rank_type"].ToString();
                                species.FormaName = reader["forma_name"].ToString();
                                species.FormaAuthority = reader["forma_authority"].ToString();
                                species.GenusID = GetInt(reader["taxonomy_genus_id"].ToString());
                                species.GenusName = reader["genus_name"].ToString();
                                species.SynonymCode = reader["synonym_code"].ToString();
                                species.VerifierCooperatorID = GetInt(reader["verifier_cooperator_id"].ToString());
                                species.VerifiedByCooperatorName = reader["verified_by_name"].ToString();
                                species.NameVerifiedDate = GetDate(reader["name_verified_date"].ToString());
                                species.Protologue = reader["protologue"].ToString();
                                species.NameAuthority = reader["name_authority"].ToString();
                                species.Note = reader["note"].ToString();
                                species.CreatedDate = GetDate(reader["created_date"].ToString());
                                species.CreatedByCooperatorID = GetInt(reader["created_by"].ToString());
                                species.CreatedByCooperatorName = reader["created_by_name"].ToString();
                                species.ModifiedDate = GetDate(reader["modified_date"].ToString());
                                species.ModifiedByCooperatorID = GetInt(reader["modified_by"].ToString());
                                species.ModifiedByCooperatorName = reader["modified_by_name"].ToString();
                                //species.Citations = _referenceDAO.GetCitations(species.ID);
                                //species.CommonNames = _referenceDAO.GetCommonNames(species.ID);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return species;
        }

        #region Use
        public IQueryable<EconomicUse> EconomicUseSearch(string searchString)
        {
            const string COMMAND_TEXT = "usp_TaxonomyUse_Search";

            List<EconomicUse> economicUsesList = new List<EconomicUse>();

            try
            {
                using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = COMMAND_TEXT;

                    cmd.Parameters.AddWithValue("@sql_where_clause", searchString);
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        EconomicUse economicUse = new EconomicUse();
                        economicUse.ID = GetInt(reader["taxonomy_use_id"].ToString());
                        economicUse.SpeciesID = GetInt(reader["taxonomy_species_id"].ToString());
                        economicUse.SpeciesName = reader["name"].ToString();
                        economicUse.EconomicUsageCode = reader["economic_usage_code"].ToString();
                        economicUse.UsageType = reader["usage_type"].ToString();
                        economicUse.PlantPartCode = reader["plant_part_code"].ToString();
                        economicUse.CitationID = GetInt(reader["citation_id"].ToString());
                        economicUse.Note = reader["note"].ToString();
                        economicUse.CreatedDate = GetDate(reader["created_date"].ToString());
                        economicUse.CreatedByCooperatorID = GetInt(reader["created_by"].ToString());
                        economicUse.ModifiedDate = GetDate(reader["modified_date"].ToString());
                        economicUse.ModifiedByCooperatorID = GetInt(reader["modified_by"].ToString());
                        economicUsesList.Add(economicUse);
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return economicUsesList.AsQueryable();
        }

        public IQueryable<EconomicUse> EconomicUseSearch(Query query)
        {
            string sqlWhereClause = String.Empty;
            IQueryable<EconomicUse> economicUseList = new List<EconomicUse>().AsQueryable();

            try
            {
                sqlWhereClause = query.GetSQLSyntax();
                economicUseList = EconomicUseSearch(sqlWhereClause);
                return economicUseList;
            }
            catch (SqlException ex)
            {
                throw ex;
            }
        }

        public EconomicUse GetEconomicUse(int id)
        {
            const string COMMAND_TEXT = "usp_TaxonomyUse_Select";
            EconomicUse economicUse = new EconomicUse();

            try
            {
                using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = COMMAND_TEXT;

                    cmd.Parameters.AddWithValue("@taxonomy_use_id", id);
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        economicUse = new EconomicUse();
                        economicUse.ID = GetInt(reader["taxonomy_use_id"].ToString());
                        economicUse.SpeciesID = GetInt(reader["taxonomy_species_id"].ToString());
                        economicUse.SpeciesName = reader["name"].ToString();
                        economicUse.EconomicUsageCode = reader["economic_usage_code"].ToString();
                        economicUse.UsageType = reader["usage_type"].ToString();
                        economicUse.PlantPartCode = reader["plant_part_code"].ToString();
                        economicUse.CitationID = GetInt(reader["citation_id"].ToString());
                        economicUse.CitationText = reader["citation_text"].ToString();
                        economicUse.Note = reader["note"].ToString();
                        economicUse.CreatedDate = GetDate(reader["created_date"].ToString());
                        economicUse.CreatedByCooperatorID = GetInt(reader["created_by"].ToString());
                        economicUse.CreatedByCooperatorName = reader["created_by_name"].ToString();
                        economicUse.ModifiedDate = GetDate(reader["modified_date"].ToString());
                        economicUse.ModifiedByCooperatorID = GetInt(reader["modified_by"].ToString());
                        economicUse.ModifiedByCooperatorName = reader["modified_by_name"].ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return economicUse;
        }

        public ResultContainer AddEconomicUse(EconomicUse economicUse)
        {
            const string COMMAND_TEXT = "usp_TaxonomyUse_Insert";
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

                        cmd.Parameters.AddWithValue("@taxonomy_species_id", economicUse.SpeciesID);
               
                        if (String.IsNullOrEmpty(economicUse.EconomicUsageCode))
                            cmd.Parameters.AddWithValue("@economic_usage_code", DBNull.Value);
                        else
                            cmd.Parameters.AddWithValue("@economic_usage_code", economicUse.EconomicUsageCode);

                        if (String.IsNullOrEmpty(economicUse.UsageType))
                            cmd.Parameters.AddWithValue("@usage_type", DBNull.Value);
                        else
                            cmd.Parameters.AddWithValue("@usage_type", economicUse.UsageType);

                        if (String.IsNullOrEmpty(economicUse.PlantPartCode))
                        {
                            cmd.Parameters.AddWithValue("@plant_part_code", DBNull.Value);
                        }
                        else
                            cmd.Parameters.AddWithValue("@plant_part_code", economicUse.PlantPartCode);

                        cmd.Parameters.AddWithValue("@citation_id", economicUse.CitationID);

                        if (String.IsNullOrEmpty(economicUse.Note))
                            cmd.Parameters.AddWithValue("@note", DBNull.Value);
                        else
                            cmd.Parameters.AddWithValue("@note", economicUse.Note);

                        cmd.Parameters.AddWithValue("@created_by", economicUse.CreatedByCooperatorID);

                        SqlParameter retParam = new SqlParameter();
                        retParam.SqlDbType = System.Data.SqlDbType.Int;
                        retParam.ParameterName = "@out_taxonomy_use_id";
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

                        string resultString = cmd.Parameters["@out_taxonomy_use_id"].Value.ToString();
                        if (!String.IsNullOrEmpty(resultString))
                        {
                            resultContainer.EntityID = Int32.Parse(resultString);
                        }
                        resultContainer.ResultCode = cmd.Parameters["@out_error_number"].Value.ToString();

                    }
                }
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            return resultContainer;
        }

        public ResultContainer UpdateEconomicUse(EconomicUse economicUse)
        {
            const string COMMAND_TEXT = "usp_TaxonomyUse_Update";
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

                        cmd.Parameters.AddWithValue("@taxonomy_use_id", economicUse.ID);
                        cmd.Parameters.AddWithValue("@taxonomy_species_id", economicUse.SpeciesID);

                        if (String.IsNullOrEmpty(economicUse.EconomicUsageCode))
                            cmd.Parameters.AddWithValue("@economic_usage_code", DBNull.Value);
                        else
                            cmd.Parameters.AddWithValue("@economic_usage_code", economicUse.EconomicUsageCode);

                        if (String.IsNullOrEmpty(economicUse.UsageType))
                            cmd.Parameters.AddWithValue("@usage_type", DBNull.Value);
                        else
                            cmd.Parameters.AddWithValue("@usage_type", economicUse.UsageType);

                        if (String.IsNullOrEmpty(economicUse.PlantPartCode))
                        {
                            cmd.Parameters.AddWithValue("@plant_part_code", DBNull.Value);
                        }
                        else
                            cmd.Parameters.AddWithValue("@plant_part_code", economicUse.PlantPartCode);

                        if (economicUse.CitationID > 0)
                            cmd.Parameters.AddWithValue("@citation_id", economicUse.CitationID);
                        else
                            cmd.Parameters.AddWithValue("@citation_id", DBNull.Value);

                        if (String.IsNullOrEmpty(economicUse.Note))
                            cmd.Parameters.AddWithValue("@note", DBNull.Value);
                        else
                            cmd.Parameters.AddWithValue("@note", economicUse.Note);

                        cmd.Parameters.AddWithValue("@modified_by", economicUse.ModifiedByCooperatorID);

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
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            return resultContainer;
        }

        public ResultContainer DeleteEconomicUse(int id)
        {
            throw new NotImplementedException();
        }
        #endregion

        #region Common Name

        public IQueryable<CommonName> CommonNameSearch(Query query)
        {
            string sqlWhereClause = String.Empty;
            IQueryable<CommonName> commonNameList = new List<CommonName>().AsQueryable();

            try
            {
                sqlWhereClause = query.GetSQLSyntax();
                commonNameList = CommonNameSearch(sqlWhereClause);
                return commonNameList;
            }
            catch (SqlException ex)
            {
                throw ex;
            }
        }

        public CommonName GetCommonName(int id)
        {
            return CommonNameSearch(" WHERE taxonomy_common_name_id = " + id.ToString()).FirstOrDefault();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="searchString"></param>
        /// <returns></returns>
        /// <remarks>NOTE: Refactor using improved ADO format. (CBH, 9/28/2021)</remarks>
        public IQueryable<CommonName> CommonNameSearch(string searchString)
        {
            const string COMMAND_TEXT = "usp_TaxonomyCommonNames_Search";

            List<CommonName> commonNameList = new List<CommonName>();

            try
            {
                using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = COMMAND_TEXT;

                    cmd.Parameters.AddWithValue("@sql_where_clause", searchString);
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        commonNameList.Add(new CommonName
                        {
                            ID = reader.GetFieldValue<int>("taxonomy_common_name_id"),
                            CitationID = reader.GetFieldValue<int>("taxonomy_common_name_id"),
                            GenusID = reader.GetFieldValue<int>("taxonomy_genus_id"),
                            GenusName = reader.GetFieldValue<string>("genus_name"),
                            SpeciesID = reader.GetFieldValue<int>("taxonomy_species_id"),
                            SpeciesName = reader.GetFieldValue<string>("species_name"),
                            LanguageID = reader.GetFieldValue<int>("taxonomy_language_id"),
                            LanguageDescription = reader.GetFieldValue<string>("language_description"),
                            Name = reader.GetFieldValue<string>("name"),
                            SimplifiedName = reader.GetFieldValue<string>("simplified_name"),
                            AlternateTranscription = reader.GetFieldValue<string>("alternate_transcription"),
                            CreatedDate = reader.GetFieldValue<DateTime>("created_date"),
                            CreatedByCooperatorID = reader.GetFieldValue<int>("created_by"),
                            CreatedByCooperatorName = reader.GetFieldValue<string>("created_by_name"),
                            ModifiedDate = reader.GetFieldValue<DateTime>("modified_date"),
                            ModifiedByCooperatorID = reader.GetFieldValue<int>("modified_by"),
                            ModifiedByCooperatorName = reader.GetFieldValue<string>("modified_by_name")
                        }) ; 
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return commonNameList.AsQueryable();
        }

        public ResultContainer AddCommonName(CommonName commonName)
        {
            const string COMMAND_TEXT = "usp_TaxonomyCommonName_Insert";
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

                        cmd.Parameters.AddWithValue("@taxonomy_species_id", commonName.ID);
                        cmd.Parameters.AddWithValue("@taxonomy_genus_id", commonName.GenusID);
                        cmd.Parameters.AddWithValue("@taxonomy_common_name_id", commonName.ID);

                        //if (String.IsNullOrEmpty(economicUse.EconomicUsageCode))
                        //    cmd.Parameters.AddWithValue("@economic_usage_code", DBNull.Value);
                        //else
                        //    cmd.Parameters.AddWithValue("@economic_usage_code", economicUse.EconomicUsageCode);

                        //if (String.IsNullOrEmpty(economicUse.UsageType))
                        //    cmd.Parameters.AddWithValue("@usage_type", DBNull.Value);
                        //else
                        //    cmd.Parameters.AddWithValue("@usage_type", economicUse.UsageType);

                        //if (String.IsNullOrEmpty(economicUse.PlantPartCode))
                        //{
                        //    cmd.Parameters.AddWithValue("@plant_part_code", DBNull.Value);
                        //}
                        //else
                        //    cmd.Parameters.AddWithValue("@plant_part_code", economicUse.PlantPartCode);

                        //cmd.Parameters.AddWithValue("@citation_id", economicUse.CitationID);

                        //if (String.IsNullOrEmpty(economicUse.Note))
                        //    cmd.Parameters.AddWithValue("@note", DBNull.Value);
                        //else
                        //    cmd.Parameters.AddWithValue("@note", economicUse.Note);

                        cmd.Parameters.AddWithValue("@created_by", commonName.CreatedByCooperatorID);

                        SqlParameter retParam = new SqlParameter();
                        retParam.SqlDbType = System.Data.SqlDbType.Int;
                        retParam.ParameterName = "@out_taxonomy_common_name_id";
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

                        string resultString = cmd.Parameters["@out_taxonomy_use_id"].Value.ToString();
                        if (!String.IsNullOrEmpty(resultString))
                        {
                            resultContainer.EntityID = Int32.Parse(resultString);
                        }
                        resultContainer.ResultCode = cmd.Parameters["@out_error_number"].Value.ToString();

                    }
                }
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            return resultContainer;
        }

        public ResultContainer UpdateCommonName(CommonName commonName)
        {
            const string COMMAND_TEXT = "usp_TaxonomyCommonName_Update";
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

                        cmd.Parameters.AddWithValue("@taxonomy_common_name_id", commonName.ID);

                        if (commonName.GenusID > 0)
                            cmd.Parameters.AddWithValue("@taxonomy_genus_id", commonName.GenusID);
                        else
                            cmd.Parameters.AddWithValue("@taxonomy_genus_id", DBNull.Value);

                        if (commonName.SpeciesID > 0)   
                            cmd.Parameters.AddWithValue("@taxonomy_species_id", commonName.SpeciesID);
                        else
                            cmd.Parameters.AddWithValue("@taxonomy_species_id", DBNull.Value);

                        if (commonName.LanguageID > 0)
                            cmd.Parameters.AddWithValue("@taxonomy_language_id", commonName.LanguageID);
                        else
                            cmd.Parameters.AddWithValue("@taxonomy_language_id", DBNull.Value);

                        if (String.IsNullOrEmpty(commonName.LanguageDescription))
                            cmd.Parameters.AddWithValue("@language_description", DBNull.Value);
                        else
                            cmd.Parameters.AddWithValue("@language_description", commonName.LanguageDescription);

                        if (String.IsNullOrEmpty(commonName.Name))
                            cmd.Parameters.AddWithValue("@name", DBNull.Value);
                        else
                            cmd.Parameters.AddWithValue("@name", commonName.Name);

                        if (String.IsNullOrEmpty(commonName.SimplifiedName))
                            cmd.Parameters.AddWithValue("@simplified_name", DBNull.Value);
                        else
                            cmd.Parameters.AddWithValue("@simplified_name", commonName.SimplifiedName);

                        if (String.IsNullOrEmpty(commonName.AlternateTranscription))
                            cmd.Parameters.AddWithValue("@alternate_transcription", DBNull.Value);
                        else
                            cmd.Parameters.AddWithValue("@alternate_transcription", commonName.AlternateTranscription);
                        
                        if(commonName.CitationID > 0)                          
                            cmd.Parameters.AddWithValue("@citation_id", commonName.CitationID);
                        else
                            cmd.Parameters.AddWithValue("@citation_id", DBNull.Value);

                        if (String.IsNullOrEmpty(commonName.Note))
                            cmd.Parameters.AddWithValue("@note", DBNull.Value);
                        else
                            cmd.Parameters.AddWithValue("@note", commonName.Note);

                        cmd.Parameters.AddWithValue("@modified_by", commonName.ModifiedByCooperatorID);

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
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            return resultContainer;
        }

        public ResultContainer DeleteCommonName(int id)
        {
            throw new NotImplementedException();
        }
        #endregion
        
        #region Geography Map
        public IQueryable<GeographyMap> GeographyMapSearch(Query query)
        {
            string sqlWhereClause = String.Empty;
            IQueryable<GeographyMap> geographyMaps = new List<GeographyMap>().AsQueryable();

            try
            {
                sqlWhereClause = query.GetSQLSyntax();
                geographyMaps = GeographyMapSearch(sqlWhereClause);
                return geographyMaps;
            }
            catch (SqlException ex)
            {
                throw ex;
            }
        }

        public IQueryable<GeographyMap> GeographyMapSearch(string searchString)
        {
            const string COMMAND_TEXT = "usp_TaxonomyGeographyMap_Search";

            List<GeographyMap> geographyMapList = new List<GeographyMap>();

            try
            {
                using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = COMMAND_TEXT;

                    cmd.Parameters.AddWithValue("@sql_where_clause", searchString);
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        GeographyMap geographyMap = new GeographyMap();
                        geographyMap.ID = reader.GetFieldValue<int>("taxonomy_geography_map_id");
                        geographyMap.SpeciesID = reader.GetFieldValue<int>("taxonomy_species_id");
                        geographyMap.SpeciesName = reader.GetFieldValue<string>("full_name");
                        geographyMap.GeographyID = reader.GetFieldValue<int>("geography_id");
                        geographyMap.GeographyText = reader.GetFieldValue<string>("geography_description");
                        geographyMap.GeographyStatusCode = reader.GetFieldValue<string>("geography_status_code");
                        geographyMap.CitationID = reader.GetFieldValue<int>("citation_id");
                        geographyMap.CreatedDate = reader.GetFieldValue<DateTime>("created_date");
                        geographyMap.CreatedByCooperatorID = reader.GetFieldValue<int>("created_by");
                        geographyMap.CreatedByCooperatorName = reader.GetFieldValue<string>("created_by_name");
                        geographyMap.ModifiedDate = reader.GetFieldValue<DateTime>("modified_date");
                        geographyMap.ModifiedByCooperatorID = reader.GetFieldValue<int>("modified_by");
                        geographyMap.ModifiedByCooperatorName = reader.GetFieldValue<string>("modified_by_name");
                        geographyMapList.Add(geographyMap);
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return geographyMapList.AsQueryable();
        }

        public ResultContainer AddGeographyMap(GeographyMap geographyMap)
        {
            const string COMMAND_TEXT = "usp_TaxonomyCommonName_Insert";
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

                        //cmd.Parameters.AddWithValue("@taxonomy_species_id", commonName.ID);
                        //cmd.Parameters.AddWithValue("@taxonomy_genus_id", commonName.GenusID);
                        //cmd.Parameters.AddWithValue("@taxonomy_common_name_id", commonName.ID);

                        //if (String.IsNullOrEmpty(economicUse.EconomicUsageCode))
                        //    cmd.Parameters.AddWithValue("@economic_usage_code", DBNull.Value);
                        //else
                        //    cmd.Parameters.AddWithValue("@economic_usage_code", economicUse.EconomicUsageCode);

                        //if (String.IsNullOrEmpty(economicUse.UsageType))
                        //    cmd.Parameters.AddWithValue("@usage_type", DBNull.Value);
                        //else
                        //    cmd.Parameters.AddWithValue("@usage_type", economicUse.UsageType);

                        //if (String.IsNullOrEmpty(economicUse.PlantPartCode))
                        //{
                        //    cmd.Parameters.AddWithValue("@plant_part_code", DBNull.Value);
                        //}
                        //else
                        //    cmd.Parameters.AddWithValue("@plant_part_code", economicUse.PlantPartCode);

                        //cmd.Parameters.AddWithValue("@citation_id", economicUse.CitationID);

                        //if (String.IsNullOrEmpty(economicUse.Note))
                        //    cmd.Parameters.AddWithValue("@note", DBNull.Value);
                        //else
                        //    cmd.Parameters.AddWithValue("@note", economicUse.Note);

                        //cmd.Parameters.AddWithValue("@created_by", commonName.CreatedByCooperatorID);

                        SqlParameter retParam = new SqlParameter();
                        retParam.SqlDbType = System.Data.SqlDbType.Int;
                        retParam.ParameterName = "@out_taxonomy_common_name_id";
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

                        string resultString = cmd.Parameters["@out_taxonomy_use_id"].Value.ToString();
                        if (!String.IsNullOrEmpty(resultString))
                        {
                            resultContainer.EntityID = Int32.Parse(resultString);
                        }
                        resultContainer.ResultCode = cmd.Parameters["@out_error_number"].Value.ToString();

                    }
                }
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            return resultContainer;
        }

        public ResultContainer UpdateGeographyMap(GeographyMap geographyMap)
        {
            const string COMMAND_TEXT = "usp_TaxonomyGeographyMap_Update";
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
                        cmd.Parameters.AddWithValue("@taxonomy_geography_map_id", geographyMap.ID);
                        cmd.Parameters.AddWithValue("@taxonomy_species_id", geographyMap.SpeciesID);
                        cmd.Parameters.AddWithValue("@geography_id", geographyMap.GeographyID);
                        if (String.IsNullOrEmpty(geographyMap.GeographyStatusCode))
                            cmd.Parameters.AddWithValue("@geography_status_code", DBNull.Value);
                        else
                            cmd.Parameters.AddWithValue("@geography_status_code", geographyMap.GeographyStatusCode);
                        
                        if (geographyMap.CitationID > 0)
                            cmd.Parameters.AddWithValue("@citation_id", geographyMap.CitationID);
                        else
                            cmd.Parameters.AddWithValue("@citation_id", DBNull.Value);

                        if (String.IsNullOrEmpty(geographyMap.Note))
                            cmd.Parameters.AddWithValue("@note", DBNull.Value);
                        else
                            cmd.Parameters.AddWithValue("@note", geographyMap.Note);

                        cmd.Parameters.AddWithValue("@modified_by", geographyMap.ModifiedByCooperatorID);

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
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            return resultContainer;
        }

        public ResultContainer DeleteGeographyMap(int id)
        {
            throw new NotImplementedException();
        }
        #endregion
    }
}
