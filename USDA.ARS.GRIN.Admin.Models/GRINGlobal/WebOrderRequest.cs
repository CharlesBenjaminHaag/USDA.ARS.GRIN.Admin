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
		public bool IsLocked { get; set; }
		public int WebCooperatorID { get; set; }
		public DateTime OrderDate { get; set; }
		public string IntendedUseCode { get; set; }
		public string IntendedUseNote { get; set; }
		public string StatusCode { get; set; }
		public string SpecialInstruction { get; set; }
        public string EmailAddressList { get; set; }
        public Cooperator WebCooperator { get; set; }
		public List<Cooperator> Cooperators { get; set; }
		public List<Address> Addresses { get; set; }
		
		public IEnumerable<WebOrderRequestItem> WebOrderRequestItems { get; set; }
		public IEnumerable<WebOrderRequestAction> WebOrderRequestActions { get; set; }

		public string GetRelatedAccessions()
		{
			StringBuilder sbAccessionList = new StringBuilder();
			foreach (var item in this.WebOrderRequestItems)
			{
				if (sbAccessionList.Length > 0)
				{
					sbAccessionList.Append(",");
				}
				sbAccessionList.Append(item.Accession.ID);
			}
			return sbAccessionList.ToString();
		}

		public WebOrderRequest()
		{
			WebCooperator = new Cooperator();
			Cooperators = new List<Cooperator>();
			WebOrderRequestItems = new List<WebOrderRequestItem>().AsEnumerable();
			WebOrderRequestActions = new List<WebOrderRequestAction>().AsEnumerable();
		}
	}
}
