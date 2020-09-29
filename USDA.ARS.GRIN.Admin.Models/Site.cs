using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models
{
    public class Site : BaseModel, IEntity
    {
        public int ID { get; set; }
        public string ShortName { get; set; }
        public string LongName { get; set; }
    }
}
