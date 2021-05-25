using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.Taxonomy
{
    public class CWRTraitHomeViewModel: BaseViewModel
    {
        public CWRTraitHomeViewModel()
        {
            this.DataSourceName = "taxonomy_cwr_trait";
        }
    }
}