using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models.Taxonomy
{
    public class SummaryReport
    {
        public string Title { get; set; }
        public string SubTitle { get; set; }
        public List<SummaryReportRecord> SummaryReportRecords { get; set; }

        public SummaryReport()
        {
            this.SummaryReportRecords = new List<SummaryReportRecord>();
        }
    }
}
