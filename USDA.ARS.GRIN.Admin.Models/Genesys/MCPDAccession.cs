using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models.Genesys
{
    public class MCPDAccession
    {
        public string INTERNAL_ID { get; set; }
        public string INSTCODE { get; set; }
        public string DOI { get; set; }
        public string ACCNUMB { get; set; }
        public string SPECIES_FULL { get; set; }
        public string GENUS { get; set; }
        public string SPECIES { get; set; }
        public string SPAUTHOR { get; set; }
        public string SUBTAXA { get; set; }
        public string SUBTAUTHOR { get; set; }
        public string ACCEURL { get; set; }
        public string SAMPSTAT { get; set; }
        public string REMARKS { get; set; }
        public string ACQDATE { get; set; }
        public string HISTORIC { get; set; }
        public string COLLSITE { get; set; }
        public string GEOREFMETH { get; set; }
        public string COORDUNCERT { get; set; }
        public string DECLATITUDE { get; set; }
        public string DECLONGITUDE { get; set; }
        public string ORIGCTY { get; set; }
    }
}
