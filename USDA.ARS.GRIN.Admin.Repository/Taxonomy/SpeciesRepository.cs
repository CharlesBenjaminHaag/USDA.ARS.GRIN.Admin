using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;

namespace USDA.ARS.GRIN.Admin.Repository
{
    public class SpeciesRepository : IRepository<Species>
    {
        protected string _context = String.Empty;
        protected DataContext _dataContext = null;

        public SpeciesRepository(string context)
        {
            _context = context;
        }

        protected string GetConnectionStringKey(string context)
        {
            switch (context)
            {
                case "LOCAL":
                    return "DataManagerLocal";
                case "PRODCOPY":
                    return "DataManagerProdCopy";
                case "DEVELOPMENT":
                    return "DataManagerDev";
                case "TEST":
                    return "DataManagerTest";
                case "TRAINING":
                    return "DataManagerTraining";
                case "PRODUCTION":
                    return "DataManagerProd";
                default:
                    return "";
            }
        }

        public SpeciesRepository()
        {
            this._dataContext = new DataContext();
        }

        #region Species

        public int AddREFACTOR(Species species)
        {
            int returnCode = 0;
            String commandText = "usp_InsertSpecies";

            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = cn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = commandText;

                    species.ModifiedDate = DateTime.Now;
                    species.NameVerifiedDate = DateTime.Now;
                    species.OwnedDate = DateTime.Now;

                    if (species.CurrentTaxonomySpeciesID == 0)
                        cmd.Parameters.AddWithValue("@current_taxonomy_species_id", DBNull.Value);
                    else
                        cmd.Parameters.AddWithValue("@current_taxonomy_species_id", species.CurrentTaxonomySpeciesID);

                    cmd.Parameters.AddWithValue("@nomen_number", species.NomenNumber);
                    cmd.Parameters.AddWithValue("@is_specific_hybrid", species.IsSpecificHybrid);
                    cmd.Parameters.AddWithValue("@species_name", species.SpeciesName);

                    if (species.Authority == null)
                        cmd.Parameters.AddWithValue("@species_authority", DBNull.Value);
                    else
                        cmd.Parameters.AddWithValue("@species_authority", species.Authority);

                    cmd.Parameters.AddWithValue("@is_subspecific_hybrid", species.IsSubSpecificHybrid);
                    cmd.Parameters.AddWithValue("@is_varietal_hybrid", species.IsVarietalHybrid);
                    cmd.Parameters.AddWithValue("@is_subvarietal_hybrid", species.IsSubVarietalHybrid);
                    cmd.Parameters.AddWithValue("@is_forma_hybrid", species.IsFormaHybrid);
                    cmd.Parameters.AddWithValue("@taxonomy_genus_id", species.GenusID);

                    cmd.Parameters.AddWithValue("@is_name_pending", species.IsNamePending);

                    if (species.SynonymCode == null)
                        cmd.Parameters.AddWithValue("@synonym_code", DBNull.Value);
                    else
                        cmd.Parameters.AddWithValue("@synonym_code", species.SynonymCode);

                    cmd.Parameters.AddWithValue("@verifier_cooperator_id", species.VerifierCooperatorID);
                    cmd.Parameters.AddWithValue("@name_verified_date", species.NameVerifiedDate);

                    if (species.Name == null)
                        cmd.Parameters.AddWithValue("@name", DBNull.Value);
                    else
                        cmd.Parameters.AddWithValue("@name", species.Name);

                    if (species.NameAuthority == null)
                        cmd.Parameters.AddWithValue("@name_authority", DBNull.Value);
                    else
                        cmd.Parameters.AddWithValue("@name_authority", species.NameAuthority);

                    if (species.Protologue == null)
                        cmd.Parameters.AddWithValue("@protologue", DBNull.Value);
                    else
                        cmd.Parameters.AddWithValue("@protologue", species.Protologue);

                    if (species.ProtologueVirtualPath == null)
                        cmd.Parameters.AddWithValue("@protologue_virtual_path", DBNull.Value);
                    else
                        cmd.Parameters.AddWithValue("@protologue_virtual_path", species.ProtologueVirtualPath);

                    if (species.Note == null)
                        cmd.Parameters.AddWithValue("@note", DBNull.Value);
                    else
                        cmd.Parameters.AddWithValue("@note", species.Note);

                    if (species.AlternateName == null)
                        cmd.Parameters.AddWithValue("@alternate_name", DBNull.Value);
                    else
                        cmd.Parameters.AddWithValue("@alternate_name", species.AlternateName);

                    cmd.Parameters.AddWithValue("@created_by", species.CreatedByCooperatorID);

                    SqlParameter retParam = new SqlParameter();
                    retParam.SqlDbType = System.Data.SqlDbType.Int;
                    retParam.ParameterName = "@new_taxonomy_species_id";
                    retParam.Direction = System.Data.ParameterDirection.Output;
                    retParam.Value = 0;
                    cmd.Parameters.Add(retParam);
                    cmd.ExecuteNonQuery();

                    returnCode = Int32.Parse(cmd.Parameters["@new_taxonomy_species_id"].Value.ToString());
                    return returnCode;

                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return returnCode;
        }

        public int Remove(Species species)
        {
            int returnCode = 0;


            return returnCode;
        }

        public int Update(Species species)
        {
            int returnCode = 0;
            String commandText = "usp_updateSpecies";
        
            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = cn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = commandText;

                    species.ModifiedDate = DateTime.Now;
                    species.NameVerifiedDate = DateTime.Now;
                    species.OwnedDate = DateTime.Now;

                    cmd.Parameters.AddWithValue("@taxonomy_species_id", species.ID);
                    cmd.Parameters.AddWithValue("@current_taxonomy_species_id", species.CurrentTaxonomySpeciesID);
                    cmd.Parameters.AddWithValue("@nomen_number", species.NomenNumber  );
                    cmd.Parameters.AddWithValue("@is_specific_hybrid", species.IsSpecificHybrid);
                    cmd.Parameters.AddWithValue("@species_name", species.SpeciesName);

                    if (species.Authority == null)
                        cmd.Parameters.AddWithValue("@species_authority", DBNull.Value);
                    else
                        cmd.Parameters.AddWithValue("@species_authority", species.Authority);

                    cmd.Parameters.AddWithValue("@is_subspecific_hybrid", species.IsSubSpecificHybrid);
                    cmd.Parameters.AddWithValue("@is_varietal_hybrid", species.IsVarietalHybrid);
                    cmd.Parameters.AddWithValue("@is_subvarietal_hybrid", species.IsSubVarietalHybrid);
                    cmd.Parameters.AddWithValue("@is_forma_hybrid", species.IsFormaHybrid);
                    cmd.Parameters.AddWithValue("@taxonomy_genus_id", species.GenusID);

                    cmd.Parameters.AddWithValue("@is_name_pending", species.IsNamePending);

                    if (species.SynonymCode == null)
                        cmd.Parameters.AddWithValue("@synonym_code", DBNull.Value);
                    else
                        cmd.Parameters.AddWithValue("@synonym_code", species.SynonymCode);

                    cmd.Parameters.AddWithValue("@verifier_cooperator_id", species.VerifierCooperatorID);
                    cmd.Parameters.AddWithValue("@name_verified_date", species.NameVerifiedDate);
                    
                    if (species.Name == null)
                        cmd.Parameters.AddWithValue("@name", DBNull.Value);
                    else
                        cmd.Parameters.AddWithValue("@name", species.Name);

                    if (species.NameAuthority == null)
                        cmd.Parameters.AddWithValue("@name_authority", DBNull.Value);
                    else
                        cmd.Parameters.AddWithValue("@name_authority", species.NameAuthority);

                    if (species.Protologue == null)
                        cmd.Parameters.AddWithValue("@protologue", DBNull.Value);
                    else
                        cmd.Parameters.AddWithValue("@protologue", species.Protologue);

                    if (species.ProtologueVirtualPath == null)
                        cmd.Parameters.AddWithValue("@protologue_virtual_path", DBNull.Value);
                    else
                        cmd.Parameters.AddWithValue("@protologue_virtual_path", species.ProtologueVirtualPath);

                    if (species.Note == null)
                        cmd.Parameters.AddWithValue("@note", DBNull.Value);
                    else
                        cmd.Parameters.AddWithValue("@note", species.Note);

                    if (species.AlternateName == null)
                        cmd.Parameters.AddWithValue("@alternate_name", DBNull.Value);
                    else
                        cmd.Parameters.AddWithValue("@alternate_name", species.AlternateName);
                                       
                    cmd.Parameters.AddWithValue("@modified_by", species.ModifiedByCooperatorID);
                    cmd.Parameters.AddWithValue("@owned_date", species.OwnedDate);
                    cmd.Parameters.AddWithValue("@owned_by", species.OwnedByCooperatorID);

                    returnCode = cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return returnCode;
        }

        public Species GetCropMap(int speciesId)
        {
            const string COMMAND_TEXT = "usp_GetSpecies";
            Species species = new Species();

            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand(COMMAND_TEXT, cn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@taxonomy_species_id", speciesId);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                species.ID = GetInt(reader["taxonomy_species_id"].ToString());
                                species.CurrentTaxonomySpeciesID = GetInt(reader["current_taxonomy_species_id"].ToString());
                                species.NomenNumber = GetInt(reader["nomen_number"].ToString());
                                species.IsSpecificHybrid = (reader["is_specific_hybrid"].ToString() == "Y") ? true : false;
                                species.SpeciesName = reader["species_name"].ToString();
                                species.Authority = reader["species_authority"].ToString();
                                species.IsSubSpecificHybrid = (reader["is_subspecific_hybrid"].ToString() == "Y") ? true : false;
                                //species.SubSpeciesName = reader["subspecies_name"].ToString();
                                //species.SubSpeciesAuthority = reader["subspecies_authority"].ToString();
                                species.IsVarietalHybrid = (reader["is_varietal_hybrid"].ToString() == "Y") ? true : false;
                                //species.VarietyName = reader["variety_name"].ToString();
                                //species.VarietyAuthority = reader["variety_authority"].ToString();
                                species.IsSubVarietalHybrid = (reader["is_subvarietal_hybrid"].ToString() == "Y") ? true : false;
                                //species.SubVarietyName = reader["subvariety_name"].ToString();
                                //species.SubVarietyAuthority = reader["subvariety_authority"].ToString();
                                species.IsFormaHybrid = (reader["is_forma_hybrid"].ToString() == "Y") ? true : false;
                                //species.FormaRankType = reader["forma_rank_type"].ToString();
                                //species.FormaName = reader["forma_name"].ToString();
                                //species.FormaAuthority = reader["forma_authority"].ToString();
                                species.GenusID = GetInt(reader["taxonomy_genus_id"].ToString());
                                species.GenusName = reader["genus_name"].ToString();
                                species.IsNamePending = (reader["is_name_pending"].ToString() == "Y") ? true : false;
                                species.SynonymCode = reader["synonym_code"].ToString();
                                species.VerifierCooperatorID = GetInt(reader["verifier_cooperator_id"].ToString());
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

        public IQueryable<Species> FindCrops(string searchExpression)
        {
            return null;
        }

        public IQueryable<Species> FindAll()
        {
            const string COMMAND_TEXT = "usp_GetSpeciesList";
            List<Species> speciesList = new List<Species>();

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
                                Species species = new Species();
                                species.ID = GetInt(reader["taxonomy_species_id"].ToString());
                                species.CurrentTaxonomySpeciesID = GetInt(reader["current_taxonomy_species_id"].ToString());
                                species.NomenNumber = GetInt(reader["nomen_number"].ToString());
                                species.IsSpecificHybrid = (reader["is_specific_hybrid"].ToString() == "Y") ? true : false;
                                species.SpeciesName = reader["species_name"].ToString();
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
                }
            }
            catch (Exception e)
            {
                throw e;
            }

            return speciesList.AsQueryable();
        }

        #endregion Species

        #region Citation
        public List<Citation> FindAllCitations(int speciesId)
        {
            String commandText = "usp_GetSpeciesCitations";

            List<Citation> citations = new List<Citation>();
            try
            {
                using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand(commandText, conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@taxonomy_species_id", speciesId);
                        SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                Citation citation = new Citation();
                                citation.ID = GetInt(reader["citation_id"].ToString());
                                citation.LiteratureReferenceTitle = reader["reference_title"].ToString();
                                citation.AuthorName = reader["author_name"].ToString();
                                citation.Year = GetInt(reader["citation_year"].ToString());
                                citation.Reference = reader["reference"].ToString();
                                citation.DOIReference = reader["doi_reference"].ToString();
                                citation.URL = reader["url"].ToString();
                                citations.Add(citation);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return citations;
        }

        public Citation GetCitation(int citationId)
        {
            String commandText = "usp_GetSpeciesCitation";
            Citation citation = new Citation();

            using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
            {
                using (SqlCommand cmd = new SqlCommand(commandText, conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@taxonomy_common_name_id", citationId);
                    SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            citation = new Citation();
                            citation.ID = Int32.Parse(reader["citation_id"].ToString());
                            citation.LiteratureID = Int32.Parse(reader["literature_id"].ToString());
                            citation.LiteratureReferenceTitle = reader["reference_title"].ToString();
                            citation.Title = reader["citation_title"].ToString();
                            citation.AuthorName = reader["author_name"].ToString();
                            citation.Year = Int32.Parse(reader["citation_year"].ToString());
                        }
                    }
                }
            }
            return citation;
        }

        public void AddCitation(Citation citation)
        { }

        public void UpdateCitation(Citation citation)
        { }

        public void RemoveCitation(int citationId)
        { }

        #endregion Citation

        #region Geography

        public List<Geography> FindAllGeographies(int speciesId)
        {
            String commandText = "usp_GetSpeciesGeographies";

            List<Geography> geographies = new List<Geography>();
            try
            {
                using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand(commandText, conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@taxonomy_species_id", speciesId);
                        SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                Geography geography = new Geography();
                                geography.ID = Int32.Parse(reader["geography_id"].ToString());
                                geography.Name = reader["adm1"].ToString();
                                geography.CountryCode = reader["country_code"].ToString();
                                geography.CitationTitle = reader["citation_title"].ToString();
                                geography.ReferenceTitle = reader["reference_title"].ToString();
                                geography.Note = reader["note"].ToString();
                                geographies.Add(geography);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return geographies;
        }

        public Geography GetGeography(int GeographyId)
        {
            return null;
        }

        public void AddGeography(Geography Geography)
        { }

        public void UpdateGeography(Geography Geography)
        { }

        public void RemoveGeography(int GeographyId)
        { }

        #endregion Geography

        #region Common Name

        public List<CommonName> FindAllCommonNames(int speciesId)
        {
            String commandText = "usp_GetSpeciesCommonNames";

            List<CommonName> commonNames = new List<CommonName>();
            try
            {
                using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand(commandText, conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@taxonomy_species_id", speciesId);
                        SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                CommonName commonName = new CommonName();
                                commonName.ID = Int32.Parse(reader["taxonomy_common_name_id"].ToString());
                                commonName.LanguageDescription = reader["language_description"].ToString();
                                commonName.Name = reader["name"].ToString();
                                commonName.SimplifiedName = reader["simplified_name"].ToString();
                                commonName.AlternateTranscription = reader["alternate_transcription"].ToString();
                                commonName.CitationTitle = reader["citation_title"].ToString();
                                commonName.ReferenceTitle = reader["citation_title"].ToString();

                                if (reader["modified_date"] != DBNull.Value)
                                {
                                    commonName.ModifiedDate = DateTime.Parse(reader["modified_date"].ToString());
                                }
                                commonNames.Add(commonName);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return commonNames;
        }

        public CommonName GetCommonName(int commonNameId)
        {
            String commandText = "usp_GetSpeciesCommonName";
            CommonName commonName = new CommonName();

            using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
            {
                using (SqlCommand cmd = new SqlCommand(commandText, conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@taxonomy_common_name_id", commonNameId);
                    SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            commonName = new CommonName();
                            commonName.ID = Int32.Parse(reader["taxonomy_common_name_id"].ToString());
                            commonName.LanguageDescription = reader["language_description"].ToString();
                            commonName.Name = reader["name"].ToString();
                            commonName.SimplifiedName = reader["simplified_name"].ToString();
                            commonName.AlternateTranscription = reader["alternate_transcription"].ToString();
                            commonName.CitationTitle = reader["citation_title"].ToString();
                            commonName.ReferenceTitle = reader["citation_title"].ToString();

                            if (reader["modified_date"] != DBNull.Value)
                            {
                                commonName.ModifiedDate = DateTime.Parse(reader["modified_date"].ToString());
                            }
                        }
                    }
                }
            }

            return commonName;
        }

        public int AddCommonName(CommonName commonName)
        {
            int returnCode = 0;
            String commandText = "usp_InsertSpeciesCommonName";

            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = cn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = commandText;

                    cmd.Parameters.AddWithValue("@taxonomy_species_id", commonName.SpeciesID);
                    cmd.Parameters.AddWithValue("@language_description", commonName.LanguageDescription);
                    cmd.Parameters.AddWithValue("@name", commonName.Name);
                    cmd.Parameters.AddWithValue("@simplified_name", commonName.SimplifiedName);

                    if (commonName.AlternateTranscription == null)
                        cmd.Parameters.AddWithValue("@alternate_transcription", DBNull.Value);
                    else
                        cmd.Parameters.AddWithValue("@alternate_transcription", commonName.AlternateTranscription);

                    //cmd.Parameters.AddWithValue("@citation_id", commonName);
                    cmd.Parameters.AddWithValue("@citation_id", DBNull.Value);

                    if (commonName.Note == null)
                        cmd.Parameters.AddWithValue("@note", DBNull.Value);
                    else
                        cmd.Parameters.AddWithValue("@note", commonName.Note);
                    
                    cmd.Parameters.AddWithValue("@created_by", commonName.CreatedByCooperatorID);

                    SqlParameter retParam = new SqlParameter();
                    retParam.SqlDbType = System.Data.SqlDbType.Int;
                    retParam.ParameterName = "@new_taxonomy_common_name_id ";
                    retParam.Direction = System.Data.ParameterDirection.Output;
                    retParam.Value = 0;
                    cmd.Parameters.Add(retParam);
                    cmd.ExecuteNonQuery();

                    returnCode = Int32.Parse(cmd.Parameters["@new_taxonomy_common_name_id "].Value.ToString());
                    return returnCode;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return returnCode;
        }

        public int UpdateCommonName(CommonName commonName)
        {
            int returnCode = 0;
            String commandText = "usp_UpdateSpeciesCommonName";

            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = cn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = commandText;

                    cmd.Parameters.AddWithValue("@taxonomy_common_name_id", commonName.ID);
                    cmd.Parameters.AddWithValue("@taxonomy_species_id", commonName.SpeciesID);
                    cmd.Parameters.AddWithValue("@language_description", commonName.LanguageDescription);
                    cmd.Parameters.AddWithValue("@name", commonName.Name);
                    cmd.Parameters.AddWithValue("@simplified_name", commonName.SimplifiedName);

                    if (commonName.AlternateTranscription == null)
                        cmd.Parameters.AddWithValue("@alternate_transcription", DBNull.Value);
                    else
                        cmd.Parameters.AddWithValue("@alternate_transcription", commonName.AlternateTranscription);

                    //cmd.Parameters.AddWithValue("@citation_id", commonName);
                    cmd.Parameters.AddWithValue("@citation_id", DBNull.Value);

                    if (commonName.Note == null)
                        cmd.Parameters.AddWithValue("@note", DBNull.Value);
                    else
                        cmd.Parameters.AddWithValue("@note", commonName.Note);

                    cmd.Parameters.AddWithValue("@modified_by", commonName.ModifiedByCooperatorID);
                    returnCode = cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return returnCode;
        }

        public int RemoveCommonName(int CommonNameId)
        {
            int returnCode = 0;

            return returnCode;
        }

        #endregion Common Name

        #region Usage

        public List<Usage> FindAllUsages(int speciesId)
        {
            String commandText = "usp_GetSpeciesUsages";
            List<Usage> usages = new List<Usage>();
            try
            {
                using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand(commandText, conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@taxonomy_species_id", speciesId);
                        SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                Usage usage = new Usage();
                                usage.ID = Int32.Parse(reader["taxonomy_use_id"].ToString());
                                usage.SpeciesID = Int32.Parse(reader["taxonomy_species_id"].ToString());
                                usage.EconomicUsageCode = reader["economic_usage_code"].ToString();
                                usage.UsageType = reader["usage_type"].ToString();
                                usage.PlantPartCode = reader["plant_part_code"].ToString();
                                usage.CitationTitle = reader["citation_title"].ToString();
                                usage.ReferenceTitle = reader["reference_title"].ToString();
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return usages;

        }

        public Usage GetUsage(int UsageId)
        {
            return null;
        }

        public void AddUsage(Usage Usage)
        { }

        public void UpdateUsage(Usage Usage)
        { }

        public void RemoveUsage(int UsageId)
        { }

        #endregion Usage

        #region Regulation

        public List<RegulationMapping> FindAllRegulations(int speciesId)
        {
            String commandText = "usp_GetSpeciesRegulations";

            List<RegulationMapping> regulationMappings = new List<RegulationMapping>();
            try
            {
                using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand(commandText, conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@taxonomy_species_id", speciesId);
                        SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                RegulationMapping regulationMapping = new RegulationMapping();
                                regulationMapping.ID = Int32.Parse(reader["taxonomy_regulation_map_id"].ToString());
                                regulationMapping.RegulationTypeCode = reader["regulation_type_code"].ToString();
                                regulationMapping.RegulationLevel = reader["regulation_level"].ToString();
                                regulationMapping.URL1 = reader["url_1"].ToString();
                                regulationMapping.URL1 = reader["url_2"].ToString();
                                regulationMapping.ModifiedDate = DateTime.Parse(reader["modified_date"].ToString());
                                regulationMappings.Add(regulationMapping);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return regulationMappings;
        }

        #endregion Regulation

        #region Utilities 
        private int GetInt(string intValue)
        {
            int convertedInt = 0;

            if (Int32.TryParse(intValue, out convertedInt))
            {
                return convertedInt;
            }
            else
            {
                return -9;
            }
        }

        private DateTime GetDate(string dateTime)
        {
            DateTime convertedDateTime;

            if (DateTime.TryParse(dateTime, out convertedDateTime))
            {
                return convertedDateTime;
            }
            else
                return DateTime.MinValue;
        }

        public int Add(Species entity)
        {
            throw new NotImplementedException();
        }

        public Species Get(int id)
        {
            throw new NotImplementedException();
        }

        public IQueryable<Species> Search(Query query)
        {
            throw new NotImplementedException();
        }

        public IQueryable<Species> Search(int parentId)
        {
            throw new NotImplementedException();
        }

        public IQueryable<Species> Search(string searchString)
        {
            throw new NotImplementedException();
        }
        #endregion Utilities
    }
}
