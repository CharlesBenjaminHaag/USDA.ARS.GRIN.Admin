using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Repository
{
    public class TaxonomyContext 
    {
        public List<taxonomy_species> GetSpeciesList()
        {
            using (var context = new gringlobal_Entities())
            {
                return context.taxonomy_species.AsNoTracking().ToList();
            }
        }

    }
}
