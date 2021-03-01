using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models.Taxonomy
{
    public class DemoContainer
    {
        public List<CropForCWR> CropsForCWR { get; set; }
        public List<Species> Species { get; set; }
        public List<CWRTrait> CWRTraits { get; set; }
    }
}
