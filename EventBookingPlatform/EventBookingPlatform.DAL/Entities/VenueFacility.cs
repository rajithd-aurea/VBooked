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
    
    public partial class VenueFacility
    {
        public int Pk_VenueFacilityId { get; set; }
        public int Fk_VenueId { get; set; }
        public string OptionName { get; set; }
        public string OptionValue { get; set; }
        public string ImgFileName { get; set; }
        public string ImgLocation { get; set; }
    
        public virtual VenueInfo VenueInfo { get; set; }
    }
}
