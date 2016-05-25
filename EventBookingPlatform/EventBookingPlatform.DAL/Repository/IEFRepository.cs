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
        List<VenueInfo> GetApprovedVenues(string hostid);
        bool ApproveVenue(int venueid);
        IEnumerable<VenueType> GetVenueTypes();
        void AddPlace(VenueInfo obj);
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
                Country = "",
                City = "",
                Street = "",
                ZipCode = ""
            };

            _entity.VenueInfoes.Add(venueInfo);
        }

        public IEnumerable<VenueInfo> GetUnapprovedVenues()
        {
            return _entity.VenueInfoes.Where(status => status.Approved == false).ToList();
        }

        public List<VenueInfo> GetApprovedVenues(string hostid)
        {
            _entity.Configuration.ProxyCreationEnabled = false;

            var venues = (from venue in _entity.VenueInfoes
                          where venue.Id == hostid && venue.Approved == true
                          select venue).ToList();

            return venues;
        }

        public bool ApproveVenue(int venueid)
        {
            VenueInfo venueinfo = _entity.VenueInfoes.Find(venueid);
            venueinfo.Approved = true;

            _entity.Entry(venueinfo).State = EntityState.Modified;
            Save();

            return true;
        }

        public IEnumerable<VenueType> GetVenueTypes()
        {
            return _entity.VenueTypes.ToList();
        }

        public void AddPlace(VenueInfo obj)
        {
            VenueInfo venueInfo = _entity.VenueInfoes.Find(obj.Pk_VenueId);
            venueInfo.Type = obj.Type;
            venueInfo.FoundationYr = obj.FoundationYr;
            venueInfo.RegNo = obj.RegNo;
            venueInfo.RenovationYr = obj.RenovationYr;
            venueInfo.Area = obj.Area;
            venueInfo.OpenSpace = obj.OpenSpace;
            venueInfo.Service = obj.Service;
            venueInfo.SeasonActs = obj.SeasonActs;
            venueInfo.Country = obj.Country;
            venueInfo.City = obj.City;
            venueInfo.Street = obj.Street;
            venueInfo.ZipCode = obj.ZipCode;

            _entity.Entry(venueInfo).State = EntityState.Modified;
            Save();
        }
    }
}