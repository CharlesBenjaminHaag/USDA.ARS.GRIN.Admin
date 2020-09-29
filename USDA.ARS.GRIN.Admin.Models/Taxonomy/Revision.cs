using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Taxonomy.Models.Taxonomy
{
    public class Revision
    {
        public int CooperatorID { get; set; }
        public string Type { get; set; }
        public DateTime RevisionDate { get; set; }
    }
}
