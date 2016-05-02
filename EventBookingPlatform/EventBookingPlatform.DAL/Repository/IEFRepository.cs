using EventBookingPlatform.DAL.Entities;

using System.Threading.Tasks;
using System;
using System.Data.Entity;
using System.Collections.Generic;

namespace EventBookingPlatform.DAL.Repository
{
    public interface IEFRepository
    {
        Task<List<VenueInfo>> GetVenuesAsync(string hostid);
    }

    public class Repository : IEFRepository
    {
        private DevEventBookingDBEntities _entity = null;

        public Repository()
        {
            _entity = new DevEventBookingDBEntities();
        }

        public async Task<List<VenueInfo>> GetVenuesAsync(string hostid)
        {
            return await _entity.VenueInfoes.ToListAsync();
        }
    }
}