using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models.GRINGlobal
{
    public class WebCooperator : BaseModel, IPerson, IEntity
    {
        public int ID { get; set; }
        public string Title { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string EmailAddress { get; set; }
        public string PrimaryPhoneNumber { get; set; }
        public string SecondaryPhoneNumber { get; set; }
        public Address PrimaryAddress { get; set; }
        public bool IsActive { get => throw new NotImplementedException(); set => throw new NotImplementedException(); }
    }
}
