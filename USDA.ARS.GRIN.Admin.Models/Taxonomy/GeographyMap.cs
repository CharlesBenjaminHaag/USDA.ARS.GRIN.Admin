using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models.Taxonomy
{
    public class GeographyMap : BaseModel
    {
        public int SpeciesID { get; set; }
        public int GeographyID { get; set; }
        public string GeographyStatusCode { get; set; }
        public int CitationID { get; set; }
    }
}
