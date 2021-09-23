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

        #region Regulation

        public ResultContainer Add(Regulation entity)
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

        public ResultContainer Remove(Regulation entity)
        {
            throw new NotImplementedException();
        }
       
        public IQueryable<Regulation> Search(Query query)
        {
            string sqlWhereClause = String.Empty;
            IQueryable<Regulation> regulations = new List<Regulation>().AsQueryable();

            try
            {
                sqlWhereClause = query.GetSQLSyntax();
                regulations = Search(sqlWhereClause);
                return regulations;
            }
            catch (SqlException ex)
            {
                throw ex;
            }
        }

        public IQueryable<Regulation> GetFolderItems(int folderId)
        {
            const string COMMAND_TEXT = "usp_TaxonomyFolderRegulationItemMaps_Select";
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

                        cmd.Parameters.AddWithValue("@taxonomy_folder_id", folderId);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                Regulation regulation = new Regulation();
                                regulation.ReferenceID = GetInt(reader["taxonomy_folder_item_id"].ToString());
                                regulation.ID = GetInt(reader["taxonomy_regulation_id"].ToString());
                                regulation.RegulationTypeCode = reader["regulation_type_code"].ToString();
                                regulation.RegulationLevelCode = reader["regulation_level_code"].ToString();
                                regulation.GeographyID = GetInt(reader["geography_id"].ToString());
                                regulation.GeographyDescription = reader["geography_description"].ToString();
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
                                regulation.GeographyDescription = reader["geography_description"].ToString();
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

        public ResultContainer Update(Regulation entity)
        {
            throw new NotImplementedException();
        }
    
        #endregion

        #region Regulation Map

        public ResultContainer GetRegulationMap(int id)
        {
            throw new NotImplementedException();
        }

        public ResultContainer AddRegulationMap(RegulationMap regulationMap)
        {
            throw new NotImplementedException();
        }

        public ResultContainer UpdateRegulationMap(RegulationMap regulationMap)
        {
            throw new NotImplementedException();
        }

        public ResultContainer DeleteRegulationMap(int id)
        {
            throw new NotImplementedException();
        }
        public IQueryable<RegulationMap> SearchRegulationMaps(string searchString)
        {
            const string COMMAND_TEXT = "usp_TaxonomyRegulationMaps_Search";
            List<RegulationMap> regulationMapList = new List<RegulationMap>();

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
                                regulationMapList.Add(new RegulationMap { RegulationID = GetInt(""),  });
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return regulationMapList.AsQueryable();
        }
        public IQueryable<RegulationMap> SearchRegulationMaps(Query query)
        {
            string sqlWhereClause = String.Empty;
            IQueryable<RegulationMap> regulationMaps = new List<RegulationMap>().AsQueryable();

            try
            {
                sqlWhereClause = query.GetSQLSyntax();
                regulationMaps = SearchRegulationMaps(sqlWhereClause);
                return regulationMaps;
            }
            catch (SqlException ex)
            {
                throw ex;
            }
        }

        #endregion
    }
}
