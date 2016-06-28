using EventBookingPlatform.DAL.Entities;
using EventBookingPlatform.DAL.Models;

using System.Threading.Tasks;
using System;
using System.Data.Entity;
using System.Collections.Generic;
using System.Linq;
using System.Data.Entity.Validation;
using System.Diagnostics;

namespace EventBookingPlatform.DAL.Repository
{
    public interface IEFRepository
    {
        void Save();
        IEnumerable<VenueType> GetVenueTypes();
        void AddPlace(VenueInfo obj);
        IEnumerable<Country> GetCountries();
        void AddVenueContact(VenueContact obj);
        IEnumerable<PrivateEvent> GetPrivateEvents();
        IEnumerable<BusinessEvent> GetBusinessEvents();
        void AddVenueDescription(VenueDescription obj);
        void AddVenueEvents(VenueEvent obj);

        #region Venue methods
        void AddVenueName(string hostid, string venuename, int status);
        IEnumerable<UnapproveVenueModel> GetUnapprovedVenues();
        //List<VenueInfo> GetApprovedVenues(string hostid);
        bool UpdateVenueStatus(int venueid, int status);
        int GetUnapprovedVenuesCountPerHost(string hostid);
        IEnumerable<VenueInfo> GetVenuesPerHost(string hostid);
        #endregion

        #region
        VenueCertificate GetVenueBusinessCertificateDetails(int venueid);
        #endregion

        #region Upload images for Characterization of place sub module
        void SaveCharacterizationPlace(VenueCharacterization obj);
        #endregion

        #region Upload images for Certificates
        void SaveBusinessCertificate(int venueid, string certificatepath, bool status);
        void SaveTermsAndConditionsCertificate(int venueid, string certificatepath);
        void SaveBusinessLicense(int venueid, string certificatepath);
        void SavePoliceAuthorization(int venueid, string certificatepath);
        void SaveFireDeptCertificate(int venueid, string certificatepath);
        void SaveSanitationCertificate(int venueid, string certificatepath);
        void SaveThirdPartyInsurance(int venueid, string certificatepath);
        #endregion
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

        #region Venue Methods
        //public List<VenueInfo> GetApprovedVenues(string hostid)
        //{
        //    _entity.Configuration.ProxyCreationEnabled = false;

        //    var venues = (from venue in _entity.VenueInfoes
        //                  where venue.Id == hostid && venue.Approved == true
        //                  select venue).ToList();

        //    return venues;
        //}

        public void AddVenueName(string hostid, string venuename, int status)
        {
            VenueInfo obj = new VenueInfo
            {
                Id = hostid,
                Status = status,
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

            _entity.VenueInfoes.Add(obj);
        }

        public IEnumerable<UnapproveVenueModel> GetUnapprovedVenues()
        {
            var venueinfo = (from vinfo in _entity.VenueInfoes
                             join aspnetuser in _entity.AspNetUsers on vinfo.Id equals aspnetuser.Id
                             where vinfo.Status == 0
                             select new UnapproveVenueModel
                             {
                                 User = aspnetuser,
                                 VenueInfo = vinfo
                             }).ToList();

            return venueinfo;
        }

        public bool UpdateVenueStatus(int venueid, int status)
        {
            VenueInfo venueinfo = _entity.VenueInfoes.Find(venueid);
            venueinfo.Status = status;

            _entity.Entry(venueinfo).State = EntityState.Modified;
            Save();

            return true;
        }

        public int GetUnapprovedVenuesCountPerHost(string hostid)
        {
            return _entity.VenueInfoes.Where(venue => venue.Status == 0 && venue.Id == hostid).Count();
        }

        public IEnumerable<VenueInfo> GetVenuesPerHost(string hostid)
        {
            return _entity.VenueInfoes.Where(venue => venue.Id == hostid).AsEnumerable();
        }
        #endregion

        #region Get Venue Business Certificate Detials
        public VenueCertificate GetVenueBusinessCertificateDetails(int venueid)
        {
            return _entity.VenueCertificates.Where(venue => venue.Fk_VenueId == venueid).First();
        }
        #endregion

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

        public IEnumerable<Country> GetCountries()
        {
            return _entity.Countries.ToList();
        }

        public void AddVenueContact(VenueContact obj)
        {
            _entity.VenueContacts.Add(obj);
        }

        public IEnumerable<PrivateEvent> GetPrivateEvents()
        {
            return _entity.PrivateEvents.ToList();
        }

        public IEnumerable<BusinessEvent> GetBusinessEvents()
        {
            return _entity.BusinessEvents.ToList();
        }

        public void AddVenueDescription(VenueDescription obj)
        {
            _entity.VenueDescriptions.Add(obj);
        }

        public void AddVenueEvents(VenueEvent obj)
        {
            _entity.VenueEvents.Add(obj);
        }

        public void SaveCharacterizationPlace(VenueCharacterization obj)
        {
            VenueCharacterization characterization = new VenueCharacterization
            {
                Fk_VenueId = obj.Fk_VenueId,
                OptionName = obj.OptionName,
                OptionValue = obj.OptionValue,
                OptionImageLocation = obj.OptionImageLocation,
                OptionSize = obj.OptionSize,
                OpenAreasImage = obj.OpenAreasImage
            };

            _entity.VenueCharacterizations.Add(characterization);
        }

        //public void SaveTypeOfContructionImage(int venueid, string imagepath)
        //{
        //    VenueCharacterization typeOfConstruction = new VenueCharacterization
        //    {
        //        Fk_VenueId = venueid,
        //        TypeOfConstruction = imagepath,
        //        OpenAreas = "",
        //        AView = "",
        //        MaxNoRoomsAreas = "",
        //        Parking = "",
        //        Privacy = "",
        //        PagesIn = ""
        //    };

        //    _entity.VenueCharacterizations.Add(typeOfConstruction);
        //}

        //public void SaveOpenAreasImage(int venueid, string imagepath)
        //{
        //    VenueCharacterization openAreas = new VenueCharacterization
        //    {
        //        Fk_VenueId = venueid,
        //        TypeOfConstruction = "",
        //        OpenAreas = imagepath,
        //        AView = "",
        //        MaxNoRoomsAreas = "",
        //        Parking = "",
        //        Privacy = "",
        //        PagesIn = ""
        //    };

        //    _entity.VenueCharacterizations.Add(openAreas);
        //}

        //public void SaveAViewImage(int venueid, string imagepath)
        //{
        //    VenueCharacterization aView = new VenueCharacterization
        //    {
        //        Fk_VenueId = venueid,
        //        TypeOfConstruction = "",
        //        OpenAreas = "",
        //        AView = imagepath,
        //        MaxNoRoomsAreas = "",
        //        Parking = "",
        //        Privacy = "",
        //        PagesIn = ""
        //    };

        //    _entity.VenueCharacterizations.Add(aView);
        //}

        //public void SaveRoomsAreasEnclosureImage(int venueid, string imagepath)
        //{
        //    VenueCharacterization roomsAreasEnclosure = new VenueCharacterization
        //    {
        //        Fk_VenueId = venueid,
        //        TypeOfConstruction = "",
        //        OpenAreas = "",
        //        AView = "",
        //        MaxNoRoomsAreas = imagepath,
        //        Parking = "",
        //        Privacy = "",
        //        PagesIn = ""
        //    };

        //    _entity.VenueCharacterizations.Add(roomsAreasEnclosure);
        //}

        //public void SaveParkingImage(int venueid, string imagepath)
        //{
        //    VenueCharacterization parking = new VenueCharacterization
        //    {
        //        Fk_VenueId = venueid,
        //        TypeOfConstruction = "",
        //        OpenAreas = "",
        //        AView = "",
        //        MaxNoRoomsAreas = "",
        //        Parking = imagepath,
        //        Privacy = "",
        //        PagesIn = ""
        //    };

        //    _entity.VenueCharacterizations.Add(parking);
        //}

        //public void SavePrivacyImage(int venueid, string imagepath)
        //{
        //    VenueCharacterization privacy = new VenueCharacterization
        //    {
        //        Fk_VenueId = venueid,
        //        TypeOfConstruction = "",
        //        OpenAreas = "",
        //        AView = "",
        //        MaxNoRoomsAreas = "",
        //        Parking = "",
        //        Privacy = imagepath,
        //        PagesIn = ""
        //    };

        //    _entity.VenueCharacterizations.Add(privacy);
        //}

        //public void SavePagesInImage(int venueid, string imagepath)
        //{
        //    VenueCharacterization pagesIn = new VenueCharacterization
        //    {
        //        Fk_VenueId = venueid,
        //        TypeOfConstruction = "",
        //        OpenAreas = "",
        //        AView = "",
        //        MaxNoRoomsAreas = "",
        //        Parking = "",
        //        Privacy = "",
        //        PagesIn = imagepath
        //    };

        //    _entity.VenueCharacterizations.Add(pagesIn);
        //}

        #region Methods to upload Certificates
        public void SaveBusinessCertificate(int venueid, string certificatepath, bool status)
        {
            VenueCertificate businessCertificate = new VenueCertificate
            {
                Fk_VenueId = venueid,
                BusinessCert = certificatepath,
                BusinessCertStatus = status,
                TermsConditionsCert = "",
                TermsConditionsCertStatus = false,
                BusinessLicCert = "",
                BusinessLicCertStatus = false,
                PoliceAuthCert = "",
                PoliceAuthCertStatus = false,
                FireDeptCert = "",
                FireDeptCertStatus = false,
                SanitationCert = "",
                SanitationCertStatus = false,
                ThirdPtInsuranceCert = "",
                ThirdPtInsuranceCertStatus = false
            };

            _entity.VenueCertificates.Add(businessCertificate);
        }

        public void SaveTermsAndConditionsCertificate(int venueid, string certificatepath)
        {
            VenueCertificate termsAndConditionCertificate = new VenueCertificate
            {
                Fk_VenueId = venueid,
                BusinessCert = "",
                TermsConditionsCert = certificatepath,
                BusinessLicCert = "",
                PoliceAuthCert = "",
                FireDeptCert = "",
                SanitationCert = "",
                ThirdPtInsuranceCert = ""
            };

            _entity.VenueCertificates.Add(termsAndConditionCertificate);
        }

        public void SaveBusinessLicense(int venueid, string certificatepath)
        {
            VenueCertificate termsAndConditionCertificate = new VenueCertificate
            {
                Fk_VenueId = venueid,
                BusinessCert = "",
                TermsConditionsCert = "",
                BusinessLicCert = certificatepath,
                PoliceAuthCert = "",
                FireDeptCert = "",
                SanitationCert = "",
                ThirdPtInsuranceCert = ""
            };

            _entity.VenueCertificates.Add(termsAndConditionCertificate);
        }

        public void SavePoliceAuthorization(int venueid, string certificatepath)
        {
            VenueCertificate termsAndConditionCertificate = new VenueCertificate
            {
                Fk_VenueId = venueid,
                BusinessCert = "",
                TermsConditionsCert = "",
                BusinessLicCert = "",
                PoliceAuthCert = certificatepath,
                FireDeptCert = "",
                SanitationCert = "",
                ThirdPtInsuranceCert = ""
            };

            _entity.VenueCertificates.Add(termsAndConditionCertificate);
        }

        public void SaveFireDeptCertificate(int venueid, string certificatepath)
        {
            VenueCertificate termsAndConditionCertificate = new VenueCertificate
            {
                Fk_VenueId = venueid,
                BusinessCert = "",
                TermsConditionsCert = "",
                BusinessLicCert = "",
                PoliceAuthCert = "",
                FireDeptCert = certificatepath,
                SanitationCert = "",
                ThirdPtInsuranceCert = ""
            };

            _entity.VenueCertificates.Add(termsAndConditionCertificate);
        }

        public void SaveSanitationCertificate(int venueid, string certificatepath)
        {
            VenueCertificate termsAndConditionCertificate = new VenueCertificate
            {
                Fk_VenueId = venueid,
                BusinessCert = "",
                TermsConditionsCert = "",
                BusinessLicCert = "",
                PoliceAuthCert = "",
                FireDeptCert = "",
                SanitationCert = certificatepath,
                ThirdPtInsuranceCert = ""
            };

            _entity.VenueCertificates.Add(termsAndConditionCertificate);
        }

        public void SaveThirdPartyInsurance(int venueid, string certificatepath)
        {
            VenueCertificate termsAndConditionCertificate = new VenueCertificate
            {
                Fk_VenueId = venueid,
                BusinessCert = "",
                TermsConditionsCert = "",
                BusinessLicCert = "",
                PoliceAuthCert = "",
                FireDeptCert = "",
                SanitationCert = "",
                ThirdPtInsuranceCert = certificatepath
            };

            _entity.VenueCertificates.Add(termsAndConditionCertificate);
        }
        #endregion
    }
}