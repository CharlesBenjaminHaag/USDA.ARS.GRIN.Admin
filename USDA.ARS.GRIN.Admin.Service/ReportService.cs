using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using USDA.ARS.GRIN.Admin.Repository;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;

namespace USDA.ARS.GRIN.Admin.Service
{
    public class ReportService
    {
        protected ReportDAO _reportDao = null;

        public ReportService(string context)
        {
            _reportDao = new ReportDAO(context);
        }

        public List<ISTAReportRecord> ISTAReport()
        {
            return _reportDao.GetISTAReport();
        }
    }
}
