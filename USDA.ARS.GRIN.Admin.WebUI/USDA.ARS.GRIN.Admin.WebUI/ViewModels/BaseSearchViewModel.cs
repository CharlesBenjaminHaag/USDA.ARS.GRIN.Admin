using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.WebUI.ViewModels.Taxonomy;


namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels
{
    public abstract class BaseSearchViewModel
    {
        public User AuthenticatedUser
        {
            get; set;
        }
        public int DefaultCooperatorID { get; set; }
        protected List<SearchComparisonOperatorViewModel> _textSearchComparisonOperators;
        protected List<SearchComparisonOperatorViewModel> _numericSearchComparisonOperators;

        public IEnumerable<SelectListItem> TextSearchComparisonOperators
        {
            get { return new SelectList(_textSearchComparisonOperators, "ID", "Name"); }
        }

        public IEnumerable<SelectListItem> NumericSearchComparisonOperators
        {
            get { return new SelectList(_numericSearchComparisonOperators, "ID", "Name"); }
        }
        public Query SearchData { get; set; }
        public DataTable SearchResults { get; set; }

        public BaseSearchViewModel()
        {
            // TODO: SHOULD BE DYNAMIC CBH 2/20/2020
            this.SearchData = new Query();
            this._numericSearchComparisonOperators = new List<SearchComparisonOperatorViewModel>();
            this._textSearchComparisonOperators = new List<SearchComparisonOperatorViewModel>();
            this._textSearchComparisonOperators.Add(new SearchComparisonOperatorViewModel { ID = "CNT", Name = "Contains" });
            this._textSearchComparisonOperators.Add(new SearchComparisonOperatorViewModel { ID = "STW", Name = "Starts With" });
            this._textSearchComparisonOperators.Add(new SearchComparisonOperatorViewModel { ID = "EIN", Name = "Ends In" });
            this._textSearchComparisonOperators.Add(new SearchComparisonOperatorViewModel { ID = "MTE", Name = "Matches" });
        }
    }
}