using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models.Taxonomy
{
    public class Authority: BaseModel
    {
        public string TableName { get; set; }
        public string ColumnName { get; set; }
        public string AuthorityText { get; set; }
    }
}
