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
    
    public partial class WaitingRoomOptionComment
    {
        public int Pk_WaitingRoomOptCommentId { get; set; }
        public int Fk_VenueId { get; set; }
        public string Comment { get; set; }
    
        public virtual VenueInfo VenueInfo { get; set; }
    }
}
