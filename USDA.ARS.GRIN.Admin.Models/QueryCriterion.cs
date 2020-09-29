using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models
{
    public class QueryCriterion
    {
        public int ID { get; set; }
        public string Title { get; set; }
        public string FieldName { get; set; }
        public string SearchOperatorCode { get; set; }
        public string FieldValue { get; set; }
        public string SearchSyntax { get; set; }
    }
}
