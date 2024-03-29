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
    
    public partial class accession_source
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public accession_source()
        {
            this.accession_source_map = new HashSet<accession_source_map>();
            this.source_desc_observation = new HashSet<source_desc_observation>();
        }
    
        public int accession_source_id { get; set; }
        public int accession_id { get; set; }
        public Nullable<int> geography_id { get; set; }
        public string acquisition_source_code { get; set; }
        public string source_type_code { get; set; }
        public Nullable<System.DateTime> source_date { get; set; }
        public string source_date_code { get; set; }
        public string is_origin { get; set; }
        public Nullable<decimal> quantity_collected { get; set; }
        public string unit_quantity_collected_code { get; set; }
        public string collected_form_code { get; set; }
        public Nullable<int> number_plants_sampled { get; set; }
        public Nullable<int> elevation_meters { get; set; }
        public string collector_verbatim_locality { get; set; }
        public Nullable<decimal> latitude { get; set; }
        public Nullable<decimal> longitude { get; set; }
        public Nullable<int> uncertainty { get; set; }
        public string formatted_locality { get; set; }
        public string georeference_datum { get; set; }
        public string georeference_protocol_code { get; set; }
        public string georeference_annotation { get; set; }
        public string environment_description { get; set; }
        public string associated_species { get; set; }
        public string is_web_visible { get; set; }
        public string note { get; set; }
        public System.DateTime created_date { get; set; }
        public int created_by { get; set; }
        public Nullable<System.DateTime> modified_date { get; set; }
        public Nullable<int> modified_by { get; set; }
        public System.DateTime owned_date { get; set; }
        public int owned_by { get; set; }
    
        public virtual accession accession { get; set; }
        public virtual cooperator cooperator { get; set; }
        public virtual geography geography { get; set; }
        public virtual cooperator cooperator1 { get; set; }
        public virtual cooperator cooperator2 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<accession_source_map> accession_source_map { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<source_desc_observation> source_desc_observation { get; set; }
    }
}
