using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.Taxonomy
{
    public class FolderItemListViewModel 
    {
        public int FolderID { get; set; }
        public DataTable Results { get; set; }
    }
}