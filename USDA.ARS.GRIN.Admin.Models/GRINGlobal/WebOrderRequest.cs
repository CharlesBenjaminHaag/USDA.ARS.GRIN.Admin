using System;
using System.Collections.Generic;
using System.Linq;
using System.Resources;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models.GRINGlobal
{
	public class WebOrderRequest : BaseModel, IEntity
	{
		public int ID { get; set; }
		public WebCooperator WebCooperator { get; set; }
		public Cooperator Cooperator { get; set; }
		public DateTime OrderDate { get; set; }
		public string IntendedUseCode { get; set; }
		public string IntendedUseNote { get; set; }
		public string StatusCode { get; set; }
		public string Note { get; set; }
		public string SpecialInstruction { get; set; }
		
		public List<Cooperator> Coooperators { get; set; }
		public List<Address> Addresses { get; set; }
		
		public IEnumerable<WebOrderRequestItem> WebOrderRequestItems { get; set; }

		public WebOrderRequest()
		{
			WebCooperator = new WebCooperator();
			WebOrderRequestItems = new List<WebOrderRequestItem>().AsEnumerable();
		}
	}
}
