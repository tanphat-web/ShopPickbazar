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
    
    public partial class ORDERDETAIL
    {
        public int Id { get; set; }
        public Nullable<int> ProductId { get; set; }
        public Nullable<int> Quantity { get; set; }
        public Nullable<int> OrderId { get; set; }
    
        public virtual PRODUCT PRODUCT { get; set; }
        public virtual ORDER ORDER { get; set; }
    }
}
