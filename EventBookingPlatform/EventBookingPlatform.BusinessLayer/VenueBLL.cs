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

        public async Task<List<VenueInfo>> GetVenueList(string hostid)
        {
            return await _repo.GetVenuesAsync(hostid);
        }
    }
}