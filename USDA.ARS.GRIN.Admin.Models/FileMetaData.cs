using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models
{
    public class FileMetaData
    {
        public string SourceURL { get; set; }
        public long FileSize { get; set; }
        public DateTime LastModified { get; set; }
        public bool IsValid { get; set; }
    }
}
