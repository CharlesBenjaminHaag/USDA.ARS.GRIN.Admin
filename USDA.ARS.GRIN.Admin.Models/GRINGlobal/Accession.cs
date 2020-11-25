using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models.GRINGlobal
{
    public class Accession : BaseModel
    {
        public int ID { get; set; }
        public string Descriptor { get; set; }
    }
}
