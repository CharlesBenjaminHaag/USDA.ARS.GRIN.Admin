using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;


namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.Taxonomy
{
    public class GenusEditViewModel : BaseViewModel
    {
        [Required]
        public int FamilyID { get; set; }
        [Required]
        public string FamilyName { get; set; }
        [Required]
        public string FamilyFullName { get; set; }
        public int AcceptedGenusID { get; set; }
        public string AcceptedGenusName { get; set; }
        [Required]
        public string Name { get; set; }
        public string FullName { get; set; }
        public bool IsSynonym { get; set; }
        public string FamilyTypeGenusName { get; set; }
        public string QualifyingCode { get; set; }
        public string HybridCode { get; set; }
        public string Authority { get; set; }
        public string SubGenusName { get; set; }
        public string SectionName { get; set; }
        public string SubSectionName { get; set; }
        public string SeriesName { get; set; }
        public string SubSeriesName { get; set; }
        public int CitationID { get; set; }
        public string CitationText { get; set; }
        IEnumerable<Species> SpeciesGenera { get; set; }
        public SelectList HybridCodes { get; set; }
        public SelectList QualifyingCodes { get; set; }


        public GenusEditViewModel() 
        {
            DataSourceName = "taxonomy_genus";
            SpeciesGenera = new List<Species>().AsEnumerable();
        }

        public GenusEditViewModel(Genus genus) : base()
        {
            DataSourceName = "taxonomy_genus";
            SpeciesGenera = new List<Species>().AsEnumerable();

            ID = genus.ID;

            if (genus.ParentID > 0)
            {
                CurrentID = genus.ParentID;
                CurrentName = genus.AcceptedGenus.FullName;
            }
            IsSynonym = genus.IsSynonym;
            FamilyID = genus.FamilyID;
            FamilyName = genus.FamilyName;
            FamilyFullName = genus.FamilyFullName;
            Name = genus.Name;
            FullName = genus.FullName;
            Name = genus.Name;
            Authority = genus.Authority;
            QualifyingCode = genus.QualifyingCode;
            HybridCode = genus.HybridCode;
            SubGenusName = genus.SubGenusName;
            SectionName = genus.SectionName;
            SubSectionName = genus.SubSectionName;
            SeriesName = genus.SeriesName;
            SubSeriesName = genus.SubSeriesName;
            Note = genus.Note;
            CreatedByCooperatorID = genus.CreatedByCooperatorID;
            CreatedByCooperatorName = genus.CreatedByCooperatorName;
            CreatedDate = genus.CreatedDate;
            ModifiedByCooperatorID = genus.ModifiedByCooperatorID;
            ModifiedByCooperatorName = genus.ModifiedByCooperatorName;
            ModifiedDate = genus.ModifiedDate;
        }
    }
}