using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models
{
    public class Geography : IEntity, IReferencedEntity
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Code { get; set; }
        public string CountryCode { get; set; }
        public string StatusCode { get; set; }
        public string CitationTitle { get; set; }

        public string ReferenceTitle { get; set; }
        public string Note { get; set; }
        public DateTime CreatedDate { get; set; }
        public int CreatedByCooperatorID { get; set; }
        public DateTime ModifiedDate { get; set; }
        public int ModifiedByCooperatorID { get; set; }
        public DateTime OwnedDate { get; set; }
        public int OwnedByCooperatorID { get; set; }
    }
}
