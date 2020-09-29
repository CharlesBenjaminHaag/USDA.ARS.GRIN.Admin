using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
//using System.Web.Mvc;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Service;

namespace USDA.ARS.GRIN.Admin.API.Controllers
{
    [RoutePrefix("api/species")]
    public class GenesysController : ApiController
    {
        [Route]
        public IHttpActionResult Get()
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

    }
}