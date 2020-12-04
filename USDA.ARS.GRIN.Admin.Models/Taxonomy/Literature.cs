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
        public int ID { get; set; }
        public string ReferenceTitle { get; set; }
    }
}
