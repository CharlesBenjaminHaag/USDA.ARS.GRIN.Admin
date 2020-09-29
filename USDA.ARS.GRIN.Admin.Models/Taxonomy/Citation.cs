using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models.Taxonomy
{
    public class Citation : BaseModel, IEntity
    {
        public int ID { get; set; }

        public int SpeciesID { get; set; }
        public int LiteratureID { get; set; }
        public string LiteratureReferenceTitle { get; set; }
        public string CitationTitle { get; set; }
        public string AuthorName { get; set; }
        public int Year { get; set; }
        public string Reference { get; set; }
        public string DOIReference { get; set; }
        public string URL { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public Literature CitationLiterature { get; set; }
    }
}
