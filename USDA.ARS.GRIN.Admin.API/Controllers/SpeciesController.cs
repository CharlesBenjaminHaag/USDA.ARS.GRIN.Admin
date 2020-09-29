using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;
//using System.Web.Mvc;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Service;
using WebGrease.Activities;

namespace USDA.ARS.GRIN.Admin.API.Controllers
{
    [RoutePrefix("api/species")]
    public class SpeciesController : ApiController
    {
        private TaxonomyService _taxonomyService = new TaxonomyService("DEVELOPMENT");

        [Route]
        public IHttpActionResult Get(bool includeBasionyms = false)
        {
            IQueryable<Species> speciesList = null;

            try
            {
                speciesList = _taxonomyService.FindSpecies("malus");
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