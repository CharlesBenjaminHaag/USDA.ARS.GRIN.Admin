using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using USDA.ARS.GRIN.Admin.Repository;
using USDA.ARS.GRIN.Admin.Models;

namespace USDA.ARS.GRIN.Admin.Service
{
    public class SpeciesService
    {
        //private static IRepository<Species> _repository= new SqlRepository<Species>();

        protected SpeciesRepository _speciesRepository = new SpeciesRepository();

        public IQueryable<Species> FindAll()
        {
            IQueryable<Species> speciesList = null;

            //speciesList = _speciesRepository.FindAll();
            return speciesList;
        }

        public Species Get(int taxonomySpeciesId)
        {
            Species species = null;

            try
            {
                //species = _speciesRepository.Get(taxonomySpeciesId);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return species;
        }

        public void Update(Species species)
        {
            //_speciesRepository.Update(species);
        }
    }
}
