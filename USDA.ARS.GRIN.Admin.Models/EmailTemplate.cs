using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models
{
    public class EmailTemplate: EmailMessage
    {
        public string Title { get; set; }
        public string Category { get; set; }
        public string MyProperty { get; set; }
    }
}
