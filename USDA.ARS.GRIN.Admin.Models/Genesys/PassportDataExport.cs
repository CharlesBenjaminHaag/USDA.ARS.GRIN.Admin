using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace USDA.ARS.GRIN.Admin.Models.Genesys
{
    public class PassportDataExport
    {
        public List<MCPDAccession> Accessions {get; set;}

        public PassportDataExport()
        {
            this.Accessions = new List<MCPDAccession>();
        }
    }
}
