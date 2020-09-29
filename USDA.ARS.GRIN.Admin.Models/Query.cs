using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models
{
    public class Query
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public int OperatorType { get; set; }
        public string WhereClause { get; set; }
        public List<QueryCriterion> QueryCriteria { get; set; }

        public Query()
        {
            this.QueryCriteria = new List<QueryCriterion>();
        }
    }
}
