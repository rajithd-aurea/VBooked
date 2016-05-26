using EventBookingPlatform.DAL.Entities;
using EventBookingPlatform.DAL.Repository;

using System.Collections.Generic;

namespace EventBookingPlatform.BusinessLayer
{
    public class CountryBLL
    {
        private IEFRepository _repo;

        public CountryBLL()
        {
            _repo = new Repository();
        }

        public IEnumerable<Country> GetCountries()
        {
            return _repo.GetCountries();
        }
    }
}