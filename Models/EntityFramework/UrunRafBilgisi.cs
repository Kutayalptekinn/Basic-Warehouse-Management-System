//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PersonelMVCUII.Models.EntityFramework
{
    using System;
    using System.Collections.Generic;
    
    public partial class UrunRafBilgisi
    {
        public int Id { get; set; }
        public int UrunId { get; set; }
        public int RafId { get; set; }
    
        public virtual Raf Raf { get; set; }
        public virtual Urun Urun { get; set; }
    }
}
