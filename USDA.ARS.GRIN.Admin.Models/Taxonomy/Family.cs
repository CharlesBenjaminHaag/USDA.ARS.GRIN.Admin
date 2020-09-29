using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models.Taxonomy
{
    public class Family : BaseModel, IEntity
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public IEnumerable<Genus> Genii { get; set; }
    }
}
