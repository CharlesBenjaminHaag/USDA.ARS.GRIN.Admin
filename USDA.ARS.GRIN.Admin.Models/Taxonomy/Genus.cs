using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models.Taxonomy
{
    public class Genus : BaseModel, IEntity
    {
        public int ID { get; set; }
        public int CurrentGenusID { get; set; }
        public int FamilyID { get; set; }
        public string FamilyName { get; set; }
        public string QualifyingCode { get; set; }
        public string HybridCode { get; set; }
        public string Name { get; set; }
        public int AuthorID { get; set; }
        public string SubGenusName { get; set; }
        public string SectionName { get; set; }
        public string SubSectionName { get; set; }
        public string SeriesName { get; set; }
        public string SubSeriesName { get; set; }
        public string Note { get; set; } 
        public List<Species> Species { get; set; }
    }
}
