using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models.Taxonomy
{
    public class Citation : BaseModel, IEntity
    {
        public int SpeciesID { get; set; }
        public string SpeciesName { get; set; }
        public int FamilyID { get; set; }
        public string FamilyName { get; set; }
        public int GenusID { get; set; }
        public string GenusName { get; set; }
        public int AccessionID { get; set; }
        public string AccessionName { get; set; }
        public string TaxonName { get; set; }
        public int LiteratureID { get; set; }
        public string LiteratureAbbreviation { get; set; }
        public string LiteratureReferenceTitle { get; set; }
        public string TypeCode { get; set; }
        public string CitationTitle { get; set; }
        public string CitationText { get; set; }
        public string AuthorName { get; set; }
        public string CitationYear { get; set; }
        public string Reference { get; set; }
        public string DOIReference { get; set; }
        public string URL { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public bool IsAcceptedName { get; set; }
        public Literature Literature { get; set; }
      
        public Citation()
        {
            Literature = new Literature();
        }
    }
}
