using DocumentFormat.OpenXml.Wordprocessing;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels.GRINGlobal.Inventory
{
    public class ValidationStatisticsViewModel
    {
        private Dictionary<string, int> _validationTotals;

        public int NotValidated {
            get 
            {
                return GetTotal("NV");
            } 
        }

        public string NotValidatedDisplayPercentage 
        { 
            get
            {
                return ((double)(NotValidated / GrandTotal)).ToString("0.0%");
            }
        }

        public int Validated {
            get
            {
                return GetTotal("VL");
            }
        }

        public string ValidatedDisplayPercentage
        {
            get
            {
                return ((double)(Validated / GrandTotal)).ToString("0.0%");
            }
        }

        public int Errors {
            get
            {
                return GetTotal("ER");
            }
        }
        public string ErrorsDisplayPercentage
        {
            get
            {
                return ((double)(Errors / GrandTotal)).ToString("0.0%");
            }
        }

        public int GrandTotal {
            get
            {
                return NotValidated + Validated + Errors;
            }
        }

        public Dictionary<string, int> ValidationTotals { get; set; }

        public ValidationStatisticsViewModel(Dictionary<string, int> validationTotals)
        {
            this._validationTotals = validationTotals;
        }

        private int GetTotal(string key)
        {
            int retVal = 0;
            this._validationTotals.TryGetValue(key, out retVal);
            return retVal;
        }

    }
}