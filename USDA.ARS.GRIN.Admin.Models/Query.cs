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

        public string GetSQLSyntax()
        {
            int i = 0;
            StringBuilder sbWhereClause = new StringBuilder();
            foreach (QueryCriterion queryCriterion in QueryCriteria)
            {
                if (i == 0)
                    sbWhereClause.Append(" WHERE ");
                else
                    sbWhereClause.Append(" AND ");

                sbWhereClause.Append(queryCriterion.FieldName);
                sbWhereClause.Append(" ");
                sbWhereClause.Append(queryCriterion.SearchOperatorCode);
                sbWhereClause.Append(" ");

                if (queryCriterion.DataType == "NVARCHAR")
                {
                    if (queryCriterion.FieldValue == "NULL")
                    {
                        sbWhereClause.Append(queryCriterion.FieldValue);
                    }
                    else
                    {
                        sbWhereClause.Append("'");
                        if (queryCriterion.SearchOperatorCode == "LIKE")
                        {
                            sbWhereClause.Append("%");
                        }
                        sbWhereClause.Append(queryCriterion.FieldValue);
                        if (queryCriterion.SearchOperatorCode == "LIKE")
                        {
                            sbWhereClause.Append("%");
                        }
                        sbWhereClause.Append("'");
                    }
                }
                else
                {
                    if (queryCriterion.DataType == "DATETIME")
                    {
                        sbWhereClause.Append(queryCriterion.FieldValue);
                    }
                }
                i++;
            }
            return sbWhereClause.ToString();
        }
    }
}
