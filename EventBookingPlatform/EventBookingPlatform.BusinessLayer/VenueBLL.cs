using EventBookingPlatform.DAL.Entities;
using EventBookingPlatform.DAL.Repository;

using System.Threading.Tasks;
using System.Collections.Generic;

namespace EventBookingPlatform.BusinessLayer
{
    public class VenueBLL
    {
        private IEFRepository _repo;

        public VenueBLL()
        {
            _repo = new Repository();
        }

        public void AddVenueName(string hostid, string venuename, bool approval)
        {
            _repo.AddVenueName(hostid, venuename, approval);
            _repo.Save();
        }

        public IEnumerable<VenueInfo> GetUnapprovedVenueList()
        {
            return _repo.GetUnapprovedVenues();
        }

        public void ApproveVenue(int venueid)
        {
            _repo.ApproveVenue(venueid);
        }

        public List<VenueInfo> GetApprovedVenuesPerHost(string hostid)
        {
            return _repo.GetApprovedVenues(hostid);
        }
    }
}