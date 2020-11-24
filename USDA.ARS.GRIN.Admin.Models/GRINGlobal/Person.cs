using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models.GRINGlobal
{
    public interface IPerson 
    {
         int ID { get; set; }
         string Title { get; set; }
         string FirstName { get; set; }
         string LastName { get; set; }
         string EmailAddress { get; set; }
         string PrimaryPhoneNumber { get; set; }
         string SecondaryPhoneNumber { get; set; }
        bool IsActive { get; set; }
    }
}
