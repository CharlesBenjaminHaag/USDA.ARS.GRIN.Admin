using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models.Taxonomy
{
    public class Family : BaseModel, IEntity
    {
        public string Name { get; set; }
        public string Authority { get; set; }
        public int TypeGenusID { get; set; }
        public string SuprafamilyRankCode { get; set; }
        public string SuprafamilyRankName { get; set; }
        public string AlternateName { get; set; }
        public string SubFamilyName { get; set; }
        public string TribeName { get; set; }
        public string SubTribeName { get; set; }

        public IEnumerable<Genus> Genera { get; set; }
        public IEnumerable<Family> SubFamilies { get; set; }
        public IEnumerable<Family> SubTribes { get; set; }

        public Family()
        {
            Genera = new List<Genus>().AsEnumerable();
            SubFamilies = new List<Family>().AsEnumerable();
            SubTribes = new List<Family>().AsEnumerable();
        }
    }
}
