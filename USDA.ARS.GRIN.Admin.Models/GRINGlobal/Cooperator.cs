﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace USDA.ARS.GRIN.Admin.Models
//namespace USDA.ARS.GRIN.Admin.Models.GRINGlobal
{
    public class Cooperator : BaseModel, IEntity
    {
        public int ID { get; set; }
        public int Type { get; set; }
        public string Title { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string FullName { get; set; }
        public string Organization { get; set; }
        public string EmailAddress { get; set; }
        public string PrimaryPhoneNumber { get; set; }
        public string SecondaryPhoneNumber { get; set; }
        public bool IsActive { get; set; }
        public User User { get; set; }
        
        public Address Address { get; set; }

        public Cooperator()
        {
            User = new User();
            Address = new Address();
        }
    }
}
