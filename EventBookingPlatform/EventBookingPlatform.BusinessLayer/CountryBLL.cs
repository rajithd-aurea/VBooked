using EventBookingPlatform.DAL.Entities;
using EventBookingPlatform.DAL.Repository;

namespace EventBookingPlatform.BusinessLayer
{
    public class CountryBLL
    {
        private IEFRepository _repo;

        public CountryBLL()
        {
            _repo = new Repository();
        }
    }
}