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
    
    public partial class ChefSpokenLanguage
    {
        public int Pk_LanguageId { get; set; }
        public Nullable<int> Fk_VenueChefId { get; set; }
        public string Language { get; set; }
    
        public virtual Chef Chef { get; set; }
    }
}
