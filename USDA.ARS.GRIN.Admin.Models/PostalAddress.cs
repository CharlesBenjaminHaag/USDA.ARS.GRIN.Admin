using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models
{
    public class PostalAddress
    {
        // PostalAddress object getters and setters
        public string CustomerName { get; set; }
        public string Organisation { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string Address3 { get; set; }
        public string Address4 { get; set; }
        public string Address5 { get; set; }
        public string Town { get; set; }
        public string County { get; set; }
        public string Postcode { get; set; }
        public string Country { get; set; }

        public PostalAddress(string customername, string organisation, string address1, string address2, string address3, string address4, string address5, string town, string county, string postcode, string country)
        {
            CustomerName = customername;
            Organisation = organisation;
            Address1 = address1;
            Address2 = address2;
            Address3 = address3;
            Address4 = address4;
            Address5 = address5;
            Town = town;
            County = county;
            Postcode = postcode;
            Country = country;
        }
    }
}
