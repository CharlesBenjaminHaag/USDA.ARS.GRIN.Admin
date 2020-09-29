using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;

namespace USDA.ARS.GRIN.Admin.Repository
{
    public class ReportDAO : BaseDAO
    {
        public ReportDAO(string context)
        {
            this._context = context;
        }
        public List<ISTAReportRecord> GetISTAReport()
        {
            String commandText = "usp_GetISTAReportRecords";
            List<ISTAReportRecord> iSTAReportRecords = new List<ISTAReportRecord>();

            try
            {
                using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand(commandText, conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        //cmd.Parameters.AddWithValue("@search_string", searchString);
                        using (SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                        {
                            if (reader.HasRows)
                            {
                                while (reader.Read())
                                {
                                    ISTAReportRecord iSTAReportRecord = new ISTAReportRecord();
                                    iSTAReportRecord.ISTASeedID = Int32.Parse(reader["taxonomy_ista_seed_id"].ToString());
                                    iSTAReportRecord.SpeciesID = Int32.Parse(reader["taxonomy_species_id"].ToString());
                                    iSTAReportRecord.SpeciesName = reader["species_name"].ToString();
                                    iSTAReportRecord.AcceptedSpeciesID = Int32.Parse(reader["accepted_taxonomy_species_id"].ToString());
                                    iSTAReportRecord.DisplayName = reader["display_name"].ToString();
                                    iSTAReportRecord.AcceptedSpeciesName = reader["accepted_species_name"].ToString();
                                    iSTAReportRecord.NameStatusCode = reader["name_status"].ToString();
                                    iSTAReportRecord.SymonymCount = Int32.Parse(reader["synonym_count"].ToString());
                                    iSTAReportRecord.IncludesCount = Int32.Parse(reader["includes_count"].ToString());

                                    // Contruct accepted-name URL.
                                    iSTAReportRecord.AcceptedSpeciesName = "<a href='https://npgsweb.ars-grin.gov/gringlobal/taxonomydetail.aspx?id=" + iSTAReportRecord.AcceptedSpeciesID + "'>" + iSTAReportRecord.AcceptedSpeciesName + "</a>";

                                    if (iSTAReportRecord.NameStatusCode == "accepted")
                                    {
                                        iSTAReportRecord.DisplayName = "<b>" + iSTAReportRecord.AcceptedSpeciesName + "</b>";
                                    }
                                    else
                                    {
                                        iSTAReportRecord.SpeciesName = "<a href='https://npgsweb.ars-grin.gov/gringlobal/taxonomydetail.aspx?id=" + iSTAReportRecord.SpeciesID + "'>" + iSTAReportRecord.SpeciesName + "</a>";

                                        if (iSTAReportRecord.NameStatusCode == "synonym")
                                        {
                                            iSTAReportRecord.DisplayName = iSTAReportRecord.SpeciesName + "<br>&nbsp;&nbsp;&nbsp;=<b> " + iSTAReportRecord.AcceptedSpeciesName + "</b>";
                                        }
                                        else
                                        {
                                            if (iSTAReportRecord.NameStatusCode == "included")
                                            {
                                                // If status is synonym, retrieve species indicated in "taxonomy_species_id" and display its name and authority after
                                                // an = symbol IN BOLD below main name, which is NOT in bold.
                                                iSTAReportRecord.DisplayName = iSTAReportRecord.SpeciesName + "</b><br>&nbsp;&nbsp;&nbsp;included in <b>" + iSTAReportRecord.AcceptedSpeciesName + "</b>";
                                            }
                                        }

                                    }

                                    int i = 0;
                                    if ((iSTAReportRecord.SymonymCount > 0) && (iSTAReportRecord.NameStatusCode == "accepted"))
                                    {
                                        iSTAReportRecord.DisplayName += "<br>&nbsp;&nbsp;&nbsp;[Synonym";
                                        if (iSTAReportRecord.SymonymCount > 1)
                                        {
                                            iSTAReportRecord.DisplayName += "s";
                                        }
                                        iSTAReportRecord.DisplayName += ": ";
                                        var synonyms = GetRelatedSpecies(iSTAReportRecord.AcceptedSpeciesID, "synonym");
                                        foreach (var synonym in synonyms)
                                        {
                                            i++;

                                            iSTAReportRecord.DisplayName += synonym.SpeciesName;

                                            if (i < synonyms.Count())
                                            {
                                                iSTAReportRecord.DisplayName += "; ";
                                            }
                                        }
                                        iSTAReportRecord.DisplayName += "]";
                                    }

                                    i = 0;
                                    if ((iSTAReportRecord.IncludesCount > 0) && (iSTAReportRecord.NameStatusCode == "accepted"))
                                    {
                                        iSTAReportRecord.DisplayName += "<br>&nbsp;&nbsp;&nbsp;[Including: ";
                                        var includes = GetRelatedSpecies(iSTAReportRecord.AcceptedSpeciesID, "included");
                                        foreach (var include in includes)
                                        {
                                            i++;

                                            iSTAReportRecord.DisplayName += include.SpeciesName;

                                            if (i < includes.Count())
                                            {
                                                iSTAReportRecord.DisplayName += "; ";
                                            }
                                        }
                                        iSTAReportRecord.DisplayName += "]";
                                    }

                                    iSTAReportRecord.DisplayName = iSTAReportRecord.DisplayName.Replace(" x ", " &#215; ");

                                    iSTAReportRecord.FamilyName = reader["family_name"].ToString();

                                    if (!String.IsNullOrEmpty(reader["family_name_2"].ToString()))
                                    {
                                        iSTAReportRecord.FamilyName += "<br>[" + reader["family_name_2"].ToString() + "]";
                                    }
                                    iSTAReportRecord.UPOVCropID = Int32.Parse(reader["taxonomy_upov_crop_id"].ToString());

                                    if (iSTAReportRecord.UPOVCropID > 0)
                                    {
                                        iSTAReportRecord.UPOVCode = "<a href='https://www.upov.int/genie/details.xhtml?cropId=" + iSTAReportRecord.UPOVCropID + "'>" + reader["upov_code"].ToString() + "</a>";
                                    }
                                    iSTAReportRecords.Add(iSTAReportRecord);
                                }
                            }
                        }
                    }
                }
            }
            catch (SqlException ex)
            {
                throw ex;
            }


            return iSTAReportRecords;
        }

        public SummaryReport GetAnnualReport()
        {
            String commandText = "usp_GetISTAReportRecords";
            SummaryReport summaryReport = null;
           
            try
            {
                using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand(commandText, conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        //cmd.Parameters.AddWithValue("@search_string", searchString);
                        using (SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                        {
                            if (reader.HasRows)
                            {
                                while (reader.Read())
                                {

                                }
                            }
                        }
                    }
                }
            }
            catch (SqlException ex)
            {


            }
            return summaryReport;
        }

        private List<ISTAReportRecord> GetRelatedSpecies(int speciesId, string nameStatus)
        {
            List<ISTAReportRecord> iSTAReportRecords = new List<ISTAReportRecord>();

            try
            {
                String commandText = "usp_GetISTAReportRelatedSpecies";

                using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand(commandText, conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@taxonomy_species_id", speciesId);
                        cmd.Parameters.AddWithValue("@name_status", nameStatus);
                        SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                ISTAReportRecord iSTAReportRecord = new ISTAReportRecord();
                                iSTAReportRecord.SpeciesID = Int32.Parse(reader["taxonomy_species_id"].ToString());
                                iSTAReportRecord.SpeciesName = reader["species_name"].ToString();
                                iSTAReportRecords.Add(iSTAReportRecord);
                            }
                        }
                    }
                }
            }
            catch (SqlException ex)
            { }
            return iSTAReportRecords;
        }
    }
}
