using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models.Taxonomy
{
    public class FolderItem : BaseModel
    {
        public int ID { get; set; }
        public int ItemID { get; set; }

        public int FolderID { get; set; }
        public string Category { get; set; }
        public string Note { get; set; }

    }
}
