//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ShopPickbazar
{
    using System;
    using System.Collections.Generic;
    
    public partial class CATEGORy
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public CATEGORy()
        {
            this.CATEGORIES1 = new HashSet<CATEGORy>();
        }
    
        public int id { get; set; }
        public string category_name { get; set; }
        public string category_icon { get; set; }
        public string category_slug { get; set; }
        public Nullable<int> parent_id { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CATEGORy> CATEGORIES1 { get; set; }
        public virtual CATEGORy CATEGORy1 { get; set; }
    }
}