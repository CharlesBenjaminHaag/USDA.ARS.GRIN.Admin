using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Genesys;
using USDA.ARS.GRIN.Admin.Service;
using Newtonsoft.Json;
using System.Data;

namespace USDA.ARS.GRIN.Admin.API.Controllers
{
    /// <summary>
    /// Enables the export of data formatted for use in the Genesys database.
    /// </summary>
    [RoutePrefix("api/genesys")]
    public class GenesysController : ApiController
    {
        GenesysService _genesysService = new GenesysService();

        /// <summary>
        /// Returns a list of accessions updated in GRIN-Global within the last month.
        /// </summary>
        /// <returns>
        /// RETURN HERE
        /// </returns>
        /// <example>
        /// <code>OUTPUT HERE</code>
        /// </example>
   
        [Route]
        public IHttpActionResult Get(int offset = 0, int limit = 0)
        {
            List<MCPDAccession> mCPDAccessions;
          
            try
            {
                mCPDAccessions = _genesysService.GetExport(offset, limit);
                //string json = JsonConvert.SerializeObject(passport, Formatting.None);
                return Ok(mCPDAccessions);
            }
            catch (Exception ex)
            {
                // TODO: ADD LOGGING
                return InternalServerError();
            }
        }

    }
}