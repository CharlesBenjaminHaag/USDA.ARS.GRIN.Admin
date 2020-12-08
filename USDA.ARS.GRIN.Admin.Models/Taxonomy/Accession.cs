using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models.Taxonomy
{
    public class Accession : BaseModel
    {
        public int ID { get; set; }
        public string Name { get; set; }
    }
}
