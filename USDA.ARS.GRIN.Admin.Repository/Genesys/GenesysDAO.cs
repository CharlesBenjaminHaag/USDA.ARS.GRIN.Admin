using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Genesys;

namespace USDA.ARS.GRIN.Admin.Repository.Genesys
{
    public class GenesysDAO : BaseDAO
    {
        public PassportDataExport GetExport()
        {
            const string COMMAND_TEXT = "usp_GenesysExport_Select";
            const string CONTEXT = "PRODUCTION";
            PassportDataExport passport = new PassportDataExport();

            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(CONTEXT)))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = cn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = COMMAND_TEXT;

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                MCPDAccession mCPDAccession = new MCPDAccession();
                                mCPDAccession.INTERNAL_ID = reader["INTERNAL_ID"].ToString();
                                mCPDAccession.INSTCODE = reader["INSTCODE"].ToString();
                                mCPDAccession.DOI = reader["INSTCODE"].ToString(); 
                                mCPDAccession.ACCNUMB = reader["ACCENUMB"].ToString();
                                mCPDAccession.SPECIES_FULL = reader["SPECIES_FULL"].ToString();
                                mCPDAccession.GENUS = reader["GENUS"].ToString();
                                mCPDAccession.SPECIES = reader["SPECIES"].ToString();
                                mCPDAccession.SPAUTHOR = reader["SPAUTHOR"].ToString();
                                mCPDAccession.SUBTAXA = reader["SUBTAXA"].ToString();
                                mCPDAccession.SUBTAUTHOR = reader["SUBTAUTHOR"].ToString();
                                mCPDAccession.ACCEURL = reader["ACCEURL"].ToString();
                                mCPDAccession.SAMPSTAT = reader["SAMPSTAT"].ToString();
                                mCPDAccession.REMARKS = reader["REMARKS"].ToString();
                                mCPDAccession.ACQDATE = reader["ACQDATE"].ToString();
                                mCPDAccession.HISTORIC = reader["HISTORIC"].ToString();
                                mCPDAccession.COLLSITE = reader["COLLSITE"].ToString();
                                mCPDAccession.GEOREFMETH = reader["GEOREFMETH"].ToString();
                                mCPDAccession.COORDUNCERT = reader["COORDUNCERT"].ToString();
                                mCPDAccession.DECLATITUDE = reader["DECLATITUDE"].ToString();
                                mCPDAccession.DECLONGITUDE = reader["DECLONGITUDE"].ToString();
                                mCPDAccession.ORIGCTY = reader["ORIGCTY"].ToString(); 
                                passport.Accessions.Add(mCPDAccession);
                            }
                        }
                    }
                }
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                //conn.Close();
                //adapter.Dispose();
            }
            return passport;
        }

    }
}
