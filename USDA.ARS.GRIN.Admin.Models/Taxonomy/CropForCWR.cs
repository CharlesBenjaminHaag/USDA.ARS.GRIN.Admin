using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models.Taxonomy
{
    public class CropForCWR : BaseModel
    {
        public int ID { get; set; }
        public string CropName { get; set; }
        public string Note { get; set; }
        public int CropWildRelativeCount { get; set; }
        public IQueryable<CWRMap> CWRMaps { get; set; }
            }
}
