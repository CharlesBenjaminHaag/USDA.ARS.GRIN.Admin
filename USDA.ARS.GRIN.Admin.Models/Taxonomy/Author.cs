using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models.Taxonomy
{
    public class Author : BaseModel, IEntity
    {
        public int ID { get; set; }
        public string ShortName { get; set; }
        public string FullName { get; set; }
        public string ShortNameExpandedDiacritic { get; set; }
        public string FullNameExpandedDiacritic { get; set; }
        public string Note { get; set; }
    }
}
