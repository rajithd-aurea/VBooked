//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace EventBookingPlatform.DAL.Entities
{
    using System;
    using System.Collections.Generic;
    
    public partial class DisabledOptionValue
    {
        public int Pk_DisabledOptValId { get; set; }
        public int Fk_DisabledOptionId { get; set; }
        public string Value { get; set; }
    
        public virtual DisabledOption DisabledOption { get; set; }
    }
}
