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

        public int Add(Regulation entity)
        {
            throw new NotImplementedException();
        }

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

        public Regulation Get(int id)
        {
            throw new NotImplementedException();
        }

        public int Remove(Regulation entity)
        {
            throw new NotImplementedException();
        }

        public IQueryable<Regulation> FindUserRegulations(int cooperatorId)
        {
            return Search("WHERE tr.created_by = " + cooperatorId);
        }

        public IQueryable<Regulation> FindRecentRegulations()
        {
            return Search("WHERE tr.created_date > DATEADD(MONTH, -1, GETDATE())");
        }

        public IQueryable<Regulation> Search(Query query)
        {
            throw new NotImplementedException();
        }

        public IQueryable<Regulation> Search(int parentId)
        {
            throw new NotImplementedException();
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

        public int Update(Regulation entity)
        {
            throw new NotImplementedException();
        }
    }
}
