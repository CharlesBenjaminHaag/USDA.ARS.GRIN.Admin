using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models.Taxonomy
{
    public class CommonName : BaseModel, IEntity, IReferencedEntity
    {
        public int ID { get; set; }

        public int SpeciesID { get; set; }
        public string LanguageDescription { get; set; }
        public string Name { get; set; }
        public string SimplifiedName { get; set; }
        public string AlternateTranscription { get; set; }
        public string CitationTitle { get; set; }
        public string ReferenceTitle { get; set; }
        public string Note { get; set; }
    }
}
