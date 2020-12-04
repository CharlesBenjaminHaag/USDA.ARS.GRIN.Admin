using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels
{
    public class SpeciesEditViewModel : BaseViewModel
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
        public string AlternateName { get; set; }
        public int AccessionCount { get; set; }

        public int AuthorityID { get; set; }
        public int ProtologueID { get; set; }
        public IEnumerable<Citation> Citations { get; set; }
        //public List<Geography> Geographies { get; set; }
        public IEnumerable<CommonName> CommonNames { get; set; }
        public IEnumerable<Usage> Usages { get; set; }
        public IEnumerable<RegulationMapping> RegulationMappings { get; set; }
    }
}