using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models
{
    public class User : BaseModel, IEntity
    {
        public int WebUserID { get; set; }
        public string UserName { get; set; }
        public string WebUserName { get; set; }
        public string Password { get; set; }
        public string WebUserPassword { get; set; } 
        public int CooperatorID { get; set; }
        //public int WebCooperatorID { get; set; }
        //public string FirstName { get; set; }
        //public string LastName { get; set; }
        //public string FullName {
        //    get
        //    {
        //        return LastName + ", " + FirstName;
        //    }
        //}
        //public string Email { get; set; }
        //public string PrimaryPhone { get; set; }
        //public string OrganizationName { get; set; }
        //public string OrganizationAbbreviation { get; set; }
        //public string JobTitle { get; set; }
        public Cooperator Cooperator { get; set; }
        public List<Group> Groups { get; set; }
        public List<Application> Applications { get; set; }

        public User()
        {
            Cooperator = new Cooperator();
            Groups = new List<Group>();
            Applications = new List<Application>();
        }
    }
}
