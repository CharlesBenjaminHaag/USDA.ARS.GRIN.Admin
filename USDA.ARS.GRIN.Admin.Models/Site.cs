using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models
{
    public class Site : BaseModel, IEntity
    {
        public string ShortName { get; set; }
        public string LongName { get; set; }
        public string DisplayName { get; set; }
        public string EmailAddressList { get; set; }
    }
}
