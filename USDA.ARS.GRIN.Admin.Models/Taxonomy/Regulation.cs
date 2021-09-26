using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models.Taxonomy
{
    public class Regulation : BaseModel, IEntity
    {
        public int GeographyID { get; set; }
        public string GeographyDescription { get; set; }
        public string Description { get; set; }
        public string RegulationTypeCode { get; set; }
        public string RegulationLevelCode { get; set; }
        public string PrimaryURL { get; set; }
        public string SecondaryURL { get; set; }
    }
}
