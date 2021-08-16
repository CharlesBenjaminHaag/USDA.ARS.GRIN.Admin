using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;


namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.Taxonomy
{
    public class GenusEditViewModel : BaseViewModel
    {
        public int FamilyID { get; set; }
        public string FamilyName { get; set; }
        public string QualifyingCode { get; set; }
        public string HybridCode { get; set; }
        public string Name { get; set; }
        public string Authority { get; set; }
        public string SubGenusName { get; set; }
        public string SectionName { get; set; }
        public string SubSectionName { get; set; }
        public string SeriesName { get; set; }
        public string SubSeriesName { get; set; }
        public int CitationID { get; set; }
        public string CitationText { get; set; }
        IEnumerable<Species> SpeciesGenera { get; set; }

        public GenusEditViewModel()
        {
            SysTable = new SysTable();
            SysTable.Name = "taxonomy_genus";
            SpeciesGenera = new List<Species>().AsEnumerable();
        }

        public GenusEditViewModel(Genus genus)
        {
            base.TableName = "taxonomy_genus";
            SpeciesGenera = new List<Species>().AsEnumerable();

            ID = genus.ID;
            ParentID = genus.ParentID;
            Name = genus.Name;
            Authority = genus.Authority;
            HybridCode = genus.HybridCode;
            SubGenusName = genus.SubGenusName;
            SubSectionName = genus.SubSectionName;
            SubSeriesName = genus.SubSeriesName;
            Note = genus.Note;
            CreatedByCooperatorID = genus.CreatedByCooperatorID;
            CreatedByCooperatorName = genus.CreatedByCooperatorName;
            CreatedDate = genus.CreatedDate;
            ModifiedByCooperatorID = genus.ModifiedByCooperatorID;
            ModifiedByCooperatorName = genus.CreatedByCooperatorName;
            ModifiedDate = genus.ModifiedDate;
        }
    }
}