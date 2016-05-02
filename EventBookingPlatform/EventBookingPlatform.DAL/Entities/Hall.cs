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
    
    public partial class Hall
    {
        public int Pk_HallId { get; set; }
        public int Fk_VenueId { get; set; }
        public string HallNo { get; set; }
        public string Name { get; set; }
        public string Structure { get; set; }
        public int MinEveCap { get; set; }
        public int MinAftCap { get; set; }
        public int TableSeatCap { get; set; }
        public int StandingCap { get; set; }
        public string EventTime { get; set; }
        public int MaxEvtPerDay { get; set; }
    
        public virtual VenueInfo VenueInfo { get; set; }
    }
}
