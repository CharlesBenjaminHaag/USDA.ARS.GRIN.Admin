using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models.GRINGlobal
{
    public class AccessionInventoryAttachment : BaseModel, IEntity
    {
        public int ID { get; set; }
        public string VirtualPath { get; set; }
        public string ThumbnailVirtualPath { get; set; }
        public string Title { get; set; }
        public int ImageURLIsValid { get; set; }
        public int ThumbnailImageURLIsValid { get; set; }
        public DateTime ValidatedDate { get; set; }
    }
}
