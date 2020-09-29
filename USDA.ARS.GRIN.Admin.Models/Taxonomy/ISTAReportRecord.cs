using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models.Taxonomy
{
    public class ISTAReportRecord
    {
        //     tis.taxonomy_species_id
        //   ,accepted_taxonomy_species_id
        //,ts.name
        //,ts.name_authority
        //   ,name_status
        //,primary_family_id
        //   ,alternate_family_id_1
        //   ,alternate_family_id_2
        //   ,alternate_family_id_3
        //   ,url
        //   ,tis.note
        //   ,comment
        //   ,taxonomy_upov_crop_map_id
        //   ,tis.created_date
        //   ,tis.created_by
        //   ,tis.modified_date
        //   ,tis.modified_by
        //   ,tis.owned_date
        //   ,tis.owned_by
        //   ,family_id_2
        //   ,family_id_3
        //   ,tis.taxonomy_genus_id
        //   ,taxonomy_upov_crop_id

        private int iSTASeedID;
        private int speciesID;
        private string speciesName;
        private string acceptedSpeciesName;

        public int ISTASeedID { get; set; }
        public int SpeciesID { get; set; }
        public string SpeciesName { get; set; }
        public int AcceptedSpeciesID { get; set; }
        public string AcceptedSpeciesName
        {
            get
            {
                return "<a href=''>" + this.speciesName + "</a>";
            }
            set
            {
                this.speciesName = value;
            }
        }
       
        public string NameStatusCode { get; set; }

        public int SymonymCount { get; set; }
        public int IncludesCount { get; set; }
        public string Name { get; set; }
        public string NameAuthority { get; set; }
        public string DisplayName { get; set; }
        public string FamilyName { get; set; }
        public int UPOVCropID { get; set; }
        public string UPOVCode { get; set; }
    }
}
