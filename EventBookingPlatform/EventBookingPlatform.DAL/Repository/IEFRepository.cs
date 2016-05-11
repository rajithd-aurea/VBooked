using EventBookingPlatform.DAL.Entities;

using System.Threading.Tasks;
using System;
using System.Data.Entity;
using System.Collections.Generic;
using System.Linq;

namespace EventBookingPlatform.DAL.Repository
{
    public interface IEFRepository
    {
        IEnumerable<VenueInfo> GetUnapprovedVenues();
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

        public IEnumerable<VenueInfo> GetUnapprovedVenues()
        {
            return _entity.VenueInfoes.Where(status => status.Approved == false).ToList();
        }
    }
}