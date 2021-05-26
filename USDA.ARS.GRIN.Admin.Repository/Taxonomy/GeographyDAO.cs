using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;

namespace USDA.ARS.GRIN.Admin.Repository.Taxonomy
{
    public class GeographyDAO: BaseDAO
    {
        private string _context;

        public GeographyDAO(string context)
        {
            _context = context;
        }
        public List<Region> SearchRegions(string idList)
        {
            List<Region> regions = new List<Region>();

            try 
            {
                String commandText = "usp_TaxonomyRegions_Select";

                using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand(commandText, conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@continent_id_list", idList);
                        SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                Region region = new Region();
                                region.ID = Int32.Parse(reader["region_id"].ToString());
                                region.Name = reader["subcontinent"].ToString();
                                regions.Add(region);
                            }
                        }
                    }
                }
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            return regions;
        }

        public List<Country> SearchCountries(string idList)
        {
            List<Country> countries = new List<Country>();

            try
            {
                String commandText = "usp_TaxonomyCountries_Select";

                using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand(commandText, conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@region_id_list", idList);
                        SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                countries.Add(new Country { Code = reader["country_code"].ToString(), Title = reader["title"].ToString() });   
                            }
                        }
                    }
                }
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            return countries;
        }

        public List<Geography> SearchMunicipalities(string countryCodeList)
        {
            string convertedToken = String.Empty;
            string convertedTokenList = String.Empty;
            List<Geography> geographies = new List<Geography>();

            try
            {
                string[] tokens = countryCodeList.Split(',');
                foreach (var token in tokens)
                {
                    convertedToken = "'" + token + "'";

                    if (convertedTokenList.Length > 0)
                    {
                        convertedTokenList = convertedTokenList + ",";
                    }
                    convertedTokenList = convertedTokenList + convertedToken;
                }

                String commandText = "usp_TaxonomyMunicipalities_Select";

                using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand(commandText, conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@country_code_list", convertedTokenList);
                        SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                               geographies.Add(new Geography { ID = GetInt(reader["geography_id"].ToString()), Name = reader["adm1"].ToString(), Code = reader["title"].ToString() });
                            }
                        }
                    }
                }
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            return geographies;
        }
    }
}
