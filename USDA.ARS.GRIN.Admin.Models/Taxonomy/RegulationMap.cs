using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models.Taxonomy
{
    public class RegulationMap: BaseModel, IEntity
    {
        public int RegulationID { get; set; }
        public string RegulationDescription { get; set; }
        public int SpeciesID { get; set; }
        public string SpeciesName { get; set; }
        public int FamilyID { get; set; }
        public string FamilyName { get; set; }
        public int GenusID { get; set; }
        public string GenusName { get; set; }
        public string TaxonType { get; set; }
        public int TaxonID { get; set; }
        public string TaxonName { get; set; }
        public string RegulationTypeCode { get; set; }
        public string RegulationLevelCode { get; set; }
        public string URL1 { get; set; }
        public string URL2 { get; set; }

        public string Note { get; set; }
    }
}
