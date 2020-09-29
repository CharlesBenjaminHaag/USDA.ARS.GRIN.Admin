using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models.Taxonomy
{
    public class RegulationMapping: BaseModel, IEntity
    {
        public int ID { get; set; }
        public int GenusID { get; set; }
        public int SpeciesID { get; set; }
        public int RegulationID { get; set; }
        public string RegulationTypeCode { get; set; }
        public string RegulationLevel { get; set; }
        public string URL1 { get; set; }
        public string URL2 { get; set; }

        public string Note { get; set; }
    }
}
