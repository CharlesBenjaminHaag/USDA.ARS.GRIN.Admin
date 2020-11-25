using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models.GRINGlobal
{
    public class WebOrderRequestItem : BaseModel
    {
        public int ID { get; set; }
        WebCooperator WebCooperator { get; set; }
        public int WebOrderRequestID { get; set; }
        public int SequenceNumber { get; set; }
        public Accession Accession { get; set;}
        public string StatusCode { get; set; }
        public Site Site { get; set; }
        public int QuantityShipped { get; set; }
        public string UnitShipped { get; set; }
        public string DistributionFormCode { get; set; }
        public string DistributionForm { get; set; }
        public Species Species { get; set; }

        public WebOrderRequestItem()
        {
            this.WebCooperator = new WebCooperator();
            this.Site = new Site();
            this.Accession = new Accession();
            this.Species = new Species();
        }
    }
}
