using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models
{
    public class Usage: BaseModel, IEntity, IReferencedEntity
    {
        public int ID { get; set; }
        public int SpeciesID { get; set; }
        public string EconomicUsageCode { get; set; }
        public string UsageType { get; set; }
        public string PlantPartCode { get; set; }
        public string CitationTitle { get; set; }
        public string ReferenceTitle { get; set; }
    }
}
