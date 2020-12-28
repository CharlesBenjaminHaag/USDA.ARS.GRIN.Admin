using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models.GRINGlobal
{
    public class WebOrderRequestAction : BaseModel
    {
		public int WebOrderRequestID { get; set; }
		public string ActionCode { get; set; }
		public DateTime ActionDateTime { get; set; }
		public DateTime ActionDate { get; set; }
	}
}
