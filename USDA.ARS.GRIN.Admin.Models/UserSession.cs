using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models
{
    public class UserSession
    {
        public User AuthenticatedUser { get; set; }
        public string Environment { get; set; }
        public Application Application { get; set; }
        public List<Cooperator> AuthorizedCooperators { get; set; }
    }
}
