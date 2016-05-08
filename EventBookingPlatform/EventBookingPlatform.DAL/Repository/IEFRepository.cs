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
        void AddVenueName(string hostid, string venuename, bool approval);
        void Save();
    }

    public class Repository : IEFRepository
    {
        private DevEventBookingDBEntities _entity = null;

        public Repository()
        {
            _entity = new DevEventBookingDBEntities();
        }

        public void Save()
        {
            _entity.SaveChanges();
        }

        public void AddVenueName(string hostid, string venuename, bool approval)
        {
            VenueInfo venueInfo = new VenueInfo
            {
                Approved = approval,
                Id = hostid,
                Name = venuename,
                Type = "",
                FoundationYr = "",
                RegNo = "",
                RenovationYr = "",
                Area = "",
                OpenSpace = "",
                Service = "",
                SeasonActs = "",
                Location = "",
                Settlement = ""
            };

            _entity.VenueInfoes.Add(venueInfo);
        }

        public async Task<List<VenueInfo>> GetVenuesAsync(string hostid)
        {
            return await _entity.VenueInfoes.ToListAsync();
        }
    }
}