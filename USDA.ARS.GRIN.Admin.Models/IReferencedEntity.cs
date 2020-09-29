using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models
{
    public interface IReferencedEntity
    {
        string CitationTitle { get; set; }
        string ReferenceTitle { get; set; }
    }
}
