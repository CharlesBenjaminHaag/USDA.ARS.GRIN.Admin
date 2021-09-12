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
    public class FamilyEditViewModel : BaseViewModel
    {
        [Required]
        public string Name { get; set; }
        public string Authority { get; set; }
        public int TypeGenusID { get; set; }
        public string TypeGenusName { get; set; }
        public string SuprafamilyRankCode { get; set; }
        public string SuprafamilyRankName { get; set; }
        public string AlternateName { get; set; }
        public string SubFamilyName { get; set; }
        public string TribeName { get; set; }
        public string SubTribeName { get; set; }
        public int CitationID { get; set; }
        public string CitationText { get; set; }
        public IEnumerable<Genus> Genera { get; set; }
        public IEnumerable<Family> SubFamilies { get; set; }
        public IEnumerable<Family> SubTribes { get; set; }
        public IEnumerable<Citation> Citations { get; set; }
        public SelectList SuprafamilyRankCodes { get; set; }
        public FamilyEditViewModel()
        {
            SysTable = new SysTable();
            SysTable.Name = "taxonomy_family";
            base.TableName = "taxonomy_family";
            Genera = new List<Genus>().AsEnumerable();
            SubFamilies = new List<Family>().AsEnumerable();
            SubTribes = new List<Family>().AsEnumerable();
            Citations = new List<Citation>().AsEnumerable();
        }

        public FamilyEditViewModel(Family family)
        {
            SysTable = new SysTable();
            SysTable.Name = "taxonomy_family";
            base.TableName = "taxonomy_family";

            ID = family.ID;
            CurrentID = family.ParentID;
            Name = family.Name;
            Authority = family.Authority;
            TypeGenusID = family.TypeGenusID;
            TypeGenusName = family.TypeGenus.Name;
            SuprafamilyRankCode = family.SuprafamilyRankCode;
            SuprafamilyRankName = family.SuprafamilyRankName;
            AlternateName = family.AlternateName;
            SubFamilyName = family.SubFamilyName;
            TribeName = family.TribeName;
            SubTribeName = family.SubTribeName;
            Note = family.Note;
            CreatedByCooperatorID = family.CreatedByCooperatorID;
            CreatedByCooperatorName = family.CreatedByCooperatorName;
            CreatedDate = family.CreatedDate;
            ModifiedByCooperatorID = family.ModifiedByCooperatorID;
            ModifiedByCooperatorName = family.ModifiedByCooperatorName;
            ModifiedDate = family.ModifiedDate;
            Genera = family.Genera;
            SubFamilies = family.SubFamilies;
            SubTribes = family.SubTribes;

        }
    }
}