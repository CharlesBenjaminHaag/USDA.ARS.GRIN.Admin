using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;
using USDA.ARS.GRIN.Admin.Service;
using WebGrease.Activities;

namespace USDA.ARS.GRIN.Admin.API.Controllers
{
    [RoutePrefix("api/taxonomy/species")]
    public class SpeciesController : ApiController
    {
        private TaxonomyService _taxonomyService = new TaxonomyService("DEVELOPMENT");

        /// <summary>
        /// Returns a list of species records.
        /// </summary>
        /// <param name="includeBasionyms">Indicates whether or not to include related basionym records.</param>
        /// <param name="includeSynonyms">Indicates whether or not to include related synonym records.</param>
        /// <returns></returns>
        [Route]
        public IHttpActionResult Get(bool includeBasionyms = false, bool includeSynonyms = false)
        {
            List<Species> speciesList = null;

            try
            {
                speciesList = _taxonomyService.FindSpecies("malus", includeSynonyms);
                return Ok(speciesList);
            }
            catch (Exception ex)
            {
                // TODO: ADD LOGGING
                return InternalServerError();
            }
        }

        [Route("{ID}")]
        public IHttpActionResult Get(int ID)
        {
            try
            {
                var result = new Species { ID = 999, Name = "Test Species" };
                return Ok(result);
            }
            catch (Exception ex)
            {
                return InternalServerError(ex);
            }
        }
    }
}