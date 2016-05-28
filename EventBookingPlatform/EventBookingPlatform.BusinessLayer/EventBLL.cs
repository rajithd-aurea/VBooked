using EventBookingPlatform.DAL.Entities;
using EventBookingPlatform.DAL.Repository;

using System.Collections.Generic;

namespace EventBookingPlatform.BusinessLayer
{
    public class EventBLL
    {
        private IEFRepository _repo;

        public EventBLL()
        {
            _repo = new Repository();
        }

        public IEnumerable<PrivateEvent> GetPrivateEvents()
        {
            return _repo.GetPrivateEvents();
        }
    }
}