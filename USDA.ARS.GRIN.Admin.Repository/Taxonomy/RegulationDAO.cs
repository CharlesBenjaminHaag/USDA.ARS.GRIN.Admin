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

        public int AddREFACTOR(Regulation entity)
        {
            throw new NotImplementedException();
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

        public int Remove(Regulation entity)
        {
            throw new NotImplementedException();
        }

        public int Update(Regulation entity)
        {
            throw new NotImplementedException();
        }
    }
}
