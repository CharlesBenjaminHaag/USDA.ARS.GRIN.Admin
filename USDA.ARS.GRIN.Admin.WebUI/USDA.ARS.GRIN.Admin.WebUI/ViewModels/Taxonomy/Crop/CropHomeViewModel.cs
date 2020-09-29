using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Caching;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;
using USDA.ARS.GRIN.Admin.Service;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.Taxonomy
{
    public class CropHomeViewModel : BaseSearchViewModel
    {
        //protected TaxonomyService _taxonomyService = new TaxonomyService();

        private IEnumerable<CropForCWR> _recentlyAddedCrops;
        private IEnumerable<CropForCWR> _userCrops;
        private List<Folder> _userFolders;
        public string CropName { get; set; }
        public string CropNameComparisonOperator { get; set; }
        public string Note { get; set; }
        public string NoteComparisonOperator { get; set; }

        public IEnumerable<CropForCWR> UserCrops
        {
            get
            {
                return this._userCrops;
            }
        }
        public IEnumerable<CropForCWR> RecentlyAddedCrops
        {
            get
            {
                return this._recentlyAddedCrops;
            }
        }
    }
}