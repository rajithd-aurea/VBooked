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

        public IEnumerable<VenueType> GetVenueTypes()
        {
            return _repo.GetVenueTypes();
        }

        public void UpdatePlaceInfo(VenueInfo obj)
        {
            _repo.AddPlace(obj);
        }

        public void UpdateVenueContact(VenueContact obj)
        {
            _repo.AddVenueContact(obj);
            _repo.Save();
        }

        public void UpdateVenueDescription(VenueDescription obj)
        {
            _repo.AddVenueDescription(obj);
            _repo.Save();
        }

        public void AddEventToVenue(List<VenueEvent> eventList)
        {
            foreach (var evt in eventList)
            {
                if (string.IsNullOrEmpty(evt.Events)) { }
                else
                {
                    VenueEvent venueEvt = new VenueEvent
                    {
                        Fk_VenueId = evt.Fk_VenueId,
                        Events = evt.Events
                    };

                    _repo.AddVenueEvents(venueEvt);
                    _repo.Save();
                }
            }
        }

        #region Upload images for Characterization of place sub module
        public void UploadTypeConstructionImage(int venueid, string imagepath)
        {
            _repo.SaveTypeOfContructionImage(venueid, imagepath);
            _repo.Save();
        }

        public void UploadOpenAreasImage(int venueid, string imagepath)
        {
            _repo.SaveOpenAreasImage(venueid, imagepath);
            _repo.Save();
        }

        public void UploadAViewImage(int venueid, string imagepath)
        {
            _repo.SaveAViewImage(venueid, imagepath);
            _repo.Save();
        }

        public void UploadRoomsAreasEnclosureImage(int venueid, string imagepath)
        {
            _repo.SaveRoomsAreasEnclosureImage(venueid, imagepath);
            _repo.Save();
        }

        public void UploadParkingImage(int venueid, string imagepath)
        {
            _repo.SaveParkingImage(venueid, imagepath);
            _repo.Save();
        }

        public void UploadPrivacyImage(int venueid, string imagepath)
        {
            _repo.SavePrivacyImage(venueid, imagepath);
            _repo.Save();
        }

        public void UploadPagesInImage(int venueid, string imagepath)
        {
            _repo.SavePagesInImage(venueid, imagepath);
            _repo.Save();
        }
        #endregion

        #region Upload images/documents for Certificates
        public void UploadBusinessCertificate(int venueid, string certificatepath)
        {
            _repo.SaveBusinessCertificate(venueid, certificatepath);
            _repo.Save();
        }

        public void UploadTermsAndConditionsCertificate(int venueid, string certificatepath)
        {
            _repo.SaveTermsAndConditionsCertificate(venueid, certificatepath);
            _repo.Save();
        }

        public void UploadBusinessLicenseCertificate(int venueid, string certificatepath)
        {
            _repo.SaveBusinessLicense(venueid, certificatepath);
            _repo.Save();
        }

        public void UploadPoliceAuthorizationCertificate(int venueid, string certificatepath)
        {
            _repo.SavePoliceAuthorization(venueid, certificatepath);
            _repo.Save();
        }

        public void UploadFireDepartmentCertificate(int venueid, string certificatepath)
        {
            _repo.SaveFireDeptCertificate(venueid, certificatepath);
            _repo.Save();
        }

        public void UploadSanitationCertificate(int venueid, string certificatepath)
        {
            _repo.SaveSanitationCertificate(venueid, certificatepath);
            _repo.Save();
        }

        public void UploadThirdPartyInsurance(int venueid, string certificatepath)
        {
            _repo.SaveThirdPartyInsurance(venueid, certificatepath);
            _repo.Save();
        }
        #endregion
    }
}