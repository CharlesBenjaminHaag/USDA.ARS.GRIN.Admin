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
    public class SpeciesDAO : BaseDAO, IRepository<Species>
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

        public List<ReferenceItem> FindSpeciesAuthors(string searchText)
        {
            List<ReferenceItem> referenceItems = new List<ReferenceItem>();

            return referenceItems;
        }

        public List<ReferenceItem> FindSpeciesProtologues(string searchText)
        {
            List<ReferenceItem> referenceItems = new List<ReferenceItem>();

            return referenceItems;
        }

        public List<ReferenceItem> FindSpeciesNotes(string searchText)
        {
            List<ReferenceItem> referenceItems = new List<ReferenceItem>();

            return referenceItems;
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
                        cmd.Parameters.AddWithValue("@species_name", entity.SpeciesName);
                        cmd.Parameters.AddWithValue("@species_authority", "TODO");
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

                        cmd.Parameters.AddWithValue("@name", entity.SpeciesName);
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
    }
}
