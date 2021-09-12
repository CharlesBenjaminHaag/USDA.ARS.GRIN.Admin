using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models
{
    public abstract class BaseModel
    {
        public int ReferenceID { get; set; }
        public int ParentID { get; set; }
        public int ID { get; set; }
        public DateTime CreatedDate { get; set; }
        public int CreatedByCooperatorID { get; set; }
        public string CreatedByCooperatorName { get; set; }
        public DateTime ModifiedDate { get; set; }
        public int ModifiedByCooperatorID { get; set; }
        public string ModifiedByCooperatorName { get; set; }
        public int OwnedByCooperatorID { get; set; }
        public string OwnedByCooperatorName { get; set; }
        public DateTime OwnedDate { get; set; }
        public string Note { get; set; }
    }
}
