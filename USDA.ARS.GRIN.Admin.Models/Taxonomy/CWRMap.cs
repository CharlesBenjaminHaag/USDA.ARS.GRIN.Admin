using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models.Taxonomy
{
    public class CWRMap : BaseModel
    {
        public int SpeciesID { get; set; }
        public string SpeciesName { get; set; }
        public int CropForCWRID { get; set; }
        public string CropForCWRName { get; set; }
        public string CommonName { get; set; }
        public bool IsCrop { get; set; }
        public string GenepoolCode { get; set; }
        public bool IsGraftStock { get; set; }
        public bool IsPotential { get; set; }
        public int CitationID { get; set; }
        public string Note { get; set; }

        public CropForCWR CropForCWR { get; set; }
        public Species Species { get; set; }
        public int CWRTraitCount { get; set; }
        public List<CWRTrait> CWRTraits { get; set; }

        public CWRMap()
        {
            CropForCWR = new CropForCWR();
            Species = new Species();
            CWRTraits = new List<CWRTrait>();
        }
    }
}
