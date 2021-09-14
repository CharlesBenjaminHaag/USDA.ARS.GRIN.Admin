using System;
using System.Text;
using System.Text.RegularExpressions;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using USDA.ARS.GRIN.Admin.Models;

namespace USDA.ARS.GRIN.Admin.WebUI.ViewModels
{
    public class BaseViewModel
    {
        public int AuthenticatedUserCooperatorID { get; set; }
        public int DefaultCooperatorID { get; set; }
        public int ReferenceID { get; set; }
        public int Format { get; set; }
        public string ListViewName { get; set; }
        public int ID { get; set; }
        public int CurrentID { get; set; }
        public string CurrentName { get; set; }
        public string CurrentCodeValue { get; set; }
        public string Action { get; set; }
        public string Context { get; set; }
        public SysTable SysTable { get; set; }
        public string TableName { get; set; }
        public string DataSourceName { get; set; }
        public string DataSourceTitle { get; set; }
        public User AuthenticatedUser
        {
            get; set;
        }
        public string ErrorMessage { get; set; }
        [AllowHtml]
        public string Note { get; set; }
        public DateTime CreatedDate { get; set; }
        public int CreatedByCooperatorID { get; set; }
        public string CreatedByCooperatorName { get; set; }
        public DateTime ModifiedDate { get; set; }
        public int ModifiedByCooperatorID { get; set; }
        public string ModifiedByCooperatorName { get; set; }
        public int OwnedByCooperatorID { get; set; }
        public string OwnedByCooperatorName { get; set; }
        public DateTime OwnedDate { get; set; }
        protected List<Cooperator> AuthorizedCooperators { get; set; }
        public SelectList Cooperators { get; set; }
        public string RevisionHistoryText
        { 
            get
            {
                StringBuilder sbRevisionHistoryText = new StringBuilder();
                sbRevisionHistoryText.Append("<strong>");
                sbRevisionHistoryText.Append("Created by ");
                sbRevisionHistoryText.Append("</strong>");
                sbRevisionHistoryText.Append(CreatedByCooperatorName);
                sbRevisionHistoryText.Append(" on ");
                sbRevisionHistoryText.Append(CreatedDate.ToShortDateString());
                sbRevisionHistoryText.Append(" at ");
                sbRevisionHistoryText.Append(CreatedDate.ToShortTimeString());

                if (ModifiedDate != DateTime.MinValue && ModifiedByCooperatorID > 0)
                {
                    sbRevisionHistoryText.Append("<strong>");
                    sbRevisionHistoryText.Append(", Modified by ");
                    sbRevisionHistoryText.Append("</strong>");
                    sbRevisionHistoryText.Append(ModifiedByCooperatorName);
                    sbRevisionHistoryText.Append(" on ");
                    sbRevisionHistoryText.Append(ModifiedDate.ToShortDateString());
                    sbRevisionHistoryText.Append(" at ");
                    sbRevisionHistoryText.Append(ModifiedDate.ToShortTimeString());
                }
                return sbRevisionHistoryText.ToString();
            }
        }
       
        public BaseViewModel()
        {
        }
    }
}
