using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models.Taxonomy
{
    public class EconomicUse: BaseModel
    {
        public int SpeciesID { get; set; }
        public string SpeciesName { get; set; }
        public string EconomicUsageCode { get; set; }
        public string UsageType { get; set; }
        public string PlantPartCode { get; set; }
    }
}
