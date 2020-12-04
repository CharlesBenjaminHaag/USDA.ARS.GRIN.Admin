using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models.Taxonomy
{
    public class Species : IEntity
    {
        public int ID { get; set; }
        public int CurrentTaxonomySpeciesID { get; set; }
        public int NomenNumber { get; set; }
        public bool IsSpecificHybrid { get; set; }
        public string SpeciesName { get; set; }
        public bool IsAcceptedName { get; set; }
        public string Authority { get; set; }
        public bool IsSubSpecificHybrid { get; set; }
        public string SubSpeciesName { get; set; }
        public string SubSpeciesAuthority { get; set; }
        public string NameAuthority { get; set; }
        public bool IsVarietalHybrid { get; set; }
        public string VarietyName { get; set; }
        public string VarietyAuthority { get; set; }
        public bool IsSubVarietalHybrid { get; set; }
        public string SubVarietyName { get; set; }
        public string SubVarietyAuthority { get; set; }
        public bool IsFormaHybrid { get; set; }
        public string FormaRankType { get; set; }
        public string FormaName { get; set; }
        public string FormaAuthority { get; set; }
        public string Protologue { get; set; }
        public int GenusID { get; set; }
        public string GenusName { get; set; }
        public bool IsNamePending { get; set; }
        public string SynonymCode { get; set; }
        public int VerifierCooperatorID { get; set; }
        public DateTime NameVerifiedDate { get; set; }
        public string Name { get; set; }
        public string ProtologueVirtualPath { get; set; }

        public string Note { get; set; }

        public string AlternateName { get; set; }
        public int AccessionCount { get; set; }
        public DateTime CreatedDate { get; set; }
        public int CreatedByCooperatorID { get; set; }
        public DateTime ModifiedDate { get; set; }
        public int ModifiedByCooperatorID { get; set; }
        public DateTime OwnedDate { get; set; }
        public int OwnedByCooperatorID { get; set; }

        public List<Citation> Citations { get; set; }
        public IEnumerable<CommonName> CommonNames { get; set; }
        public List<Geography> Geographies { get; set; }
        public List<RegulationMapping> RegulationMappings { get; set; }
        public List<Usage> Usages { get; set; }
    }
}
