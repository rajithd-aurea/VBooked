using EventBookingPlatform.DAL.Entities;

namespace EventBookingPlatform.DAL.Models
{
    public class UnapproveVenueModel
    {
        public AspNetUser User { get; set; }
        public VenueInfo VenueInfo { get; set; }
    }
}