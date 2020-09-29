using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models.Taxonomy
{
    public class CropTrait : BaseModel
    {
        public int ID { get; set; }
        public int CropMapID { get; set; }
        public int CropID { get; set; }
        public int SpeciesID { get; set; }
        public string TraitClassCode { get; set; }
        public string TraitClassTitle { get; set; }
        public bool IsPotential { get; set; }
        public string BreedingTypeCode { get; set; }
        public string BreedingTypeTitle { get; set; }
        public string BreedingUsageNote { get; set; }
        public string OntologyTraitIdentifier { get; set; }
        public int CitationID { get; set; }
        public string Note { get; set; }
    }
}
