using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models.Taxonomy
{
    public class CropWildRelative : BaseModel, IEntity
    {
        public int ID { get; set; }

        public int SpeciesID { get; set; }
        public string SpeciesName { get; set; }

        public string CropName { get; set; }

        public string DisplayName { get; set; }
        public string CropCommonName { get; set; }
        public bool IsCrop { get; set; }
        public string GenepoolCode { get; set; }
        public bool IsGraftstockGenepool { get; set; }
        public string TraitClassCode { get; set; }
        public bool IsPotential { get; set; }
        public string BreedingTypeCode { get; set; }
        public string BreedingUsage { get; set; }
        public string OntologyTraitIdentifier { get; set; }
        public int CitationID { get; set; }
        public string Note { get; set; }
    }
}
