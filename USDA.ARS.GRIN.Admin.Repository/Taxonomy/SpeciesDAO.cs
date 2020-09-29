using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using USDA.ARS.GRIN.Admin.Models;


namespace USDA.ARS.GRIN.Admin.Repository
{
    public class SpeciesDAO : BaseDAO, IRepository<Species>
    {
        private string _context;
        public SpeciesDAO(string context)
        {
            _context = context;
        }
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
            catch (Exception e)
            {
                throw e;
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
    }


}
