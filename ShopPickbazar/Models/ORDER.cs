//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ShopPickbazar.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class ORDER
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ORDER()
        {
            this.ORDERDETAILS = new HashSet<ORDERDETAIL>();
        }
    
        public int Id { get; set; }
        public Nullable<int> TotalPrice { get; set; }
        public Nullable<System.DateTime> OrderDate { get; set; }
        public string Status { get; set; }
        public Nullable<int> UserId { get; set; }
        public string Address { get; set; }
        public string Note { get; set; }
        public Nullable<bool> Payment { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ORDERDETAIL> ORDERDETAILS { get; set; }
        public virtual USER USER { get; set; }
    }
}
