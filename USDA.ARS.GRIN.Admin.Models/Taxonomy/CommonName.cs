using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models.Taxonomy
{
    public class CommonName : BaseModel
    {
        public int SpeciesID { get; set; }
        public string SpeciesName { get; set; }
        public int GenusID { get; set; }
        public string GenusName { get; set; }
        public int LanguageID { get; set; }
        public string LanguageDescription { get; set; }
        public string Name { get; set; }
        public string SimplifiedName { get; set; }
        public string AlternateTranscription { get; set; }
    }
}
