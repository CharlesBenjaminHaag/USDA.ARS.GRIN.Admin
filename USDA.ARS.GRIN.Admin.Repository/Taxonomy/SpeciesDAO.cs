using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;

namespace USDA.ARS.GRIN.Admin.Repository
{
    public class SpeciesDAO : BaseDAO, IRepository<Species>
    {
        private string _context;
        protected ReferenceDAO _referenceDAO = null;

        public SpeciesDAO(string context)
        {
            _context = context;
            _referenceDAO = new ReferenceDAO(context);
        }
        
        public IQueryable<Species> FindSpecies(string searchExpression)
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
                    cmd.Parameters.AddWithValue("search_string", searchExpression);
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        speciesList.Add(new Species { ID = GetInt(reader["taxonomy_species_id"].ToString()), Name = reader["species_text"].ToString(), SpeciesName = reader["species_text"].ToString() }) ;
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return speciesList.AsQueryable();
        }

        public IQueryable<Species> FindAll()
        {
            const string COMMAND_TEXT = "usp_GetSpeciesList";
            List <Species> speciesList = new List<Species>();

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
               
        public int Remove(Species entity)
        {
            return 0;
        }

        public int Update(Species entity)
        {
            return 0;
        }

        public int Add(Species entity)
        {
            throw new NotImplementedException();
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
                                species.NomenNumber = GetInt(reader["nomen_number"].ToString());
                                species.IsSpecificHybrid = ParseBool(reader["is_specific_hybrid"].ToString());
                                species.SpeciesName = reader["species_name"].ToString();
                                species.IsAcceptedName = ParseBool(reader["is_accepted_name"].ToString());
                                species.Authority = reader["species_authority"].ToString();
                                species.NameAuthority = reader["name_authority"].ToString();
                                species.IsSubSpecificHybrid = ParseBool(reader["is_subspecific_hybrid"].ToString());
                                species.SubSpeciesName = reader["subspecies_name"].ToString();
                                species.IsVarietalHybrid = ParseBool(reader["is_varietal_hybrid"].ToString());
                                species.Protologue = reader["protologue"].ToString();
                                species.AccessionCount = GetInt(reader["accession_count"].ToString());
                                species.Citations = _referenceDAO.GetCitations(species.ID);
                                species.CommonNames = _referenceDAO.GetCommonNames(species.ID);
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
            const string COMMAND_TEXT = "usp_TaxonomySpecies_Search";
            List<Species> speciesList = new List<Species>();

            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = cn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = COMMAND_TEXT;

                        cmd.Parameters.AddWithValue("@search_string", searchString);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {       
                                Species species = new Species();
                                species.ID = GetInt(reader["taxonomy_species_id"].ToString());
                                species.NomenNumber = GetInt(reader["nomen_number"].ToString());
                                species.IsSpecificHybrid = ParseBool(reader["is_specific_hybrid"].ToString());
                                species.SpeciesName = reader["species_name"].ToString();
                                species.IsAcceptedName = ParseBool(reader["is_accepted_name"].ToString());
                                species.Authority = reader["species_authority"].ToString();
                                species.NameAuthority = reader["name_authority"].ToString();
                                species.IsSubSpecificHybrid = ParseBool(reader["is_subspecific_hybrid"].ToString());
                                species.SubSpeciesName = reader["subspecies_name"].ToString();
                                species.IsVarietalHybrid = ParseBool(reader["is_varietal_hybrid"].ToString());
                                species.Protologue = reader["protologue"].ToString();





                                species.AccessionCount = GetInt(reader["accession_count"].ToString());

                                //                               taxonomy_species_id,
                                //   current_taxonomy_species_id,
                                //   nomen_number,
                                //   is_specific_hybrid,
                                //   species_name,
                                //   species_authority,
                                //   is_subspecific_hybrid,
                                //   subspecies_name,
                                //   subspecies_authority,
                                //   is_varietal_hybrid,
                                //   variety_name,
                                //   variety_authority,
                                //   is_subvarietal_hybrid,
                                //   subvariety_name,
                                //   subvariety_authority,
                                //   is_forma_hybrid,
                                //   forma_rank_type,
                                //   forma_name,
                                //   forma_authority,
                                //   taxonomy_genus_id,
                                //   priority1_site_id,
                                //   priority2_site_id,
                                //   curator1_cooperator_id,
                                //   curator2_cooperator_id,
                                //   restriction_code,
                                //   life_form_code,
                                //   common_fertilization_code,
                                //   is_name_pending,
                                //   synonym_code,
                                //   verifier_cooperator_id,
                                //   name_verified_date,
                                //   name,
                                //   name_authority,
                                //   protologue,
                                //   protologue_virtual_path,
                                //   note,
                                //   site_note,
                                //   alternate_name,
                                //   created_date,
                                //created_by,
                                //(SELECT first_name + '' '' + last_name FROM cooperator where cooperator_id = ts.created_by) AS created_by_name,
                                //   modified_date,
                                //   modified_by,
                                //(SELECT first_name + '' '' + last_name FROM cooperator where cooperator_id = ts.modified_by) AS modified_by_name,
                                //   owned_date,
                                //   owned_by,
                                //(SELECT first_name + '' '' + last_name FROM cooperator where cooperator_id = ts.owned_by) AS owned_by_name
                                speciesList.Add(species);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return speciesList.AsQueryable();
        }
        public IQueryable<Species> FindUserSpecies(int cooperatorId)
        {
            return Search("WHERE created_by = " + cooperatorId);
        }

        public IQueryable<Species> FindRecentSpecies()
        {
            return Search("WHERE created_date > DATEADD(MONTH, -1, GETDATE())");
        }
    }


}
