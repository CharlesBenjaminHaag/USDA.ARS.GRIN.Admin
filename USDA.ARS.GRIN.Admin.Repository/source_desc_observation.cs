//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace USDA.ARS.GRIN.Admin.Repository
{
    using System;
    using System.Collections.Generic;
    
    public partial class source_desc_observation
    {
        public int source_desc_observation_id { get; set; }
        public int accession_source_id { get; set; }
        public int source_descriptor_id { get; set; }
        public Nullable<int> source_descriptor_code_id { get; set; }
        public Nullable<decimal> numeric_value { get; set; }
        public string string_value { get; set; }
        public string original_value { get; set; }
        public string note { get; set; }
        public System.DateTime created_date { get; set; }
        public int created_by { get; set; }
        public Nullable<System.DateTime> modified_date { get; set; }
        public Nullable<int> modified_by { get; set; }
        public System.DateTime owned_date { get; set; }
        public int owned_by { get; set; }
    
        public virtual accession_source accession_source { get; set; }
        public virtual cooperator cooperator { get; set; }
        public virtual cooperator cooperator1 { get; set; }
        public virtual cooperator cooperator2 { get; set; }
        public virtual source_descriptor source_descriptor { get; set; }
        public virtual source_descriptor_code source_descriptor_code { get; set; }
    }
}
