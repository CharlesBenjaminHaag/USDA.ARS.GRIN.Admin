using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models.Taxonomy
{
    public class Literature : BaseModel
    {
        public string Abbreviation { get; set; }
        public string StandardAbbreviation { get; set; }
        public string ReferenceTitle { get; set; }
        public string EditorAuthorName  { get; set; }
        public string TypeCode { get; set; }
        public string PublicationYear { get; set; }
        public string PublisherName { get; set; }
        public string URL { get; set; }
    }
}
