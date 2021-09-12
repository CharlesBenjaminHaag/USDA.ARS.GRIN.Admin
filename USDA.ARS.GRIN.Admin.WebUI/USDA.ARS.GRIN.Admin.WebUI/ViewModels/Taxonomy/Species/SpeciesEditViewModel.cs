using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels
{
    public class SpeciesEditViewModel : BaseViewModel
    {
        public int CurrentTaxonomySpeciesID { get; set; }
        public int NomenNumber { get; set; }
        public bool IsSpecificHybrid { get; set; }
        [Required]
        public string SpeciesName { get; set; }
        public bool IsAcceptedName { get; set; }
        public string Authority { get; set; }
        public bool IsSynonym { get; set; }
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
        [Range(1, Int32.MaxValue, ErrorMessage = "The Genus is required.")]
        public int GenusID { get; set; }
        public string GenusName { get; set; }
        public bool IsNamePending { get; set; }
        public string SynonymCode { get; set; }
        public string InfraspecificTypeCode { get; set; }
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
        public Species CurrentSpecies { get; set; }

        public SpeciesEditViewModel()
        {
            CurrentSpecies = new Species();
            Citations = new List<Citation>().AsEnumerable();
            Usages = new List<Usage>().AsEnumerable();
            RegulationMappings = new List<RegulationMapping>().AsEnumerable();
        }

        public SpeciesEditViewModel(Species species): base()
        {
            ID = species.ID;
            CurrentID = species.CurrentTaxonomySpeciesID;
            CurrentTaxonomySpeciesID = species.CurrentTaxonomySpeciesID;
            NomenNumber = species.NomenNumber;
            IsSpecificHybrid = species.IsSpecificHybrid;
            SpeciesName = species.SpeciesName;
            Name = species.Name;
            IsAcceptedName = species.IsAcceptedName;
            Authority = species.Authority;
            IsSubSpecificHybrid = species.IsSubSpecificHybrid;
            SubSpeciesName = species.SubSpeciesName;
            SubSpeciesAuthority = species.SubSpeciesAuthority;
            IsVarietalHybrid = species.IsVarietalHybrid;
            VarietyName = species.VarietyName;
            VarietyAuthority = species.VarietyAuthority;
            FormaName = species.FormaName;
            FormaAuthority = species.FormaAuthority;
            FormaRankType = species.FormaRankType;
            GenusID = species.GenusID;
            GenusName = species.GenusName;
            Protologue = species.Protologue;
            NameAuthority = species.NameAuthority;
            GenusID = species.GenusID;
            GenusName = species.GenusName;
            Authority = species.Authority;
            SynonymCode = species.SynonymCode;
            CreatedDate = species.CreatedDate;
            CreatedByCooperatorID = species.CreatedByCooperatorID;
            CreatedByCooperatorName = species.CreatedByCooperatorName;
            ModifiedDate = species.ModifiedDate;
            ModifiedByCooperatorID = species.ModifiedByCooperatorID;
            ModifiedByCooperatorName = species.ModifiedByCooperatorName;
            Note = species.Note;
            Citations = species.Citations;
            CommonNames = species.CommonNames;
        }
    }
}