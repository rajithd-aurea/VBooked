using EventBookingPlatform.DAL.Entities;
using EventBookingPlatform.DAL.Repository;
using EventBookingPlatform.DAL.Models;
using EventBookingPlatform.Helpers;

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

        public void AddVenueName(string hostid, string venuename, int status)
        {
            _repo.AddVenueName(hostid, venuename, status);
            _repo.Save();
        }

        public IEnumerable<UnapproveVenueModel> GetUnapprovedVenueList()
        {
            return _repo.GetUnapprovedVenues();
        }

        public async Task UpdateVenueStatus(int venueid, int status, string email, string venuename)
        {
            switch (status)
            {
                case 1:
                    _repo.UpdateVenueStatus(venueid, status);

                    await SendEmail(email, venuename, "Venue Approval", "VBooked Venue Approval");
                    break;
                case 2:
                    _repo.UpdateVenueStatus(venueid, status);

                    await SendEmail(email, venuename, "Venue Denied", "VBooked Venue Denied");
                    break;
                case 3:
                    _repo.UpdateVenueStatus(venueid, status);

                    await SendEmail(email, venuename, "Venue Suspend", "VBooked Venue Suspend");
                    break;
            }
        }

        //public List<VenueInfo> GetApprovedVenuesPerHost(string hostid)
        //{
        //    return _repo.GetApprovedVenues(hostid);
        //}

        public int GetUnapprovedVenuesCountPerHost(string hostid)
        {
            return _repo.GetUnapprovedVenuesCountPerHost(hostid);
        }

        public IEnumerable<VenueInfo> GetVenuesPerHost(string hostid)
        {
            return _repo.GetVenuesPerHost(hostid);
        }

        #region
        public VenueCertificate GetVenueBusinessCertificateDetails(int venueid)
        {
            return _repo.GetVenueBusinessCertificateDetails(venueid);
        }
        #endregion

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

        #region Save info for Characterization of place sub module
        public void SaveCharacterizationPlaceInfo(VenueCharacterization param)
        {
            VenueCharacterization obj = new VenueCharacterization
            {
                Fk_VenueId = param.Fk_VenueId,
                OptionName = param.OptionName,
                OptionValue = param.OptionValue,
                OptionImageLocation = param.OptionImageLocation,
                OptionSize = param.OptionSize,
                OpenAreasImage = param.OpenAreasImage
            };

            _repo.SaveCharacterizationPlace(obj);
            _repo.Save();
        }
        #endregion

        #region Upload images/documents for Certificates
        public void UploadBusinessCertificate(int venueid, string certificatepath, bool status)
        {
            _repo.SaveBusinessCertificate(venueid, certificatepath, status);
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

        #region Private Methods
        private async Task SendEmail(string email, string venuename, string emailfor, string subject)
        {
            EmailHelper emailHelper = new EmailHelper
            {
                EmailFor = emailfor,
                RegistrantName = email,
                VenueName = venuename,
                Host = "mail.vbooked.com",
                Sender = "support@vbooked.com",
                Recipient = email,
                Subject = subject,
                NetworkUser = "support@vbooked.com",
                NetworkPass = "supportmail123!",
                UserEmail = "",
                UserPassword = "",
                ConfirmationUrl = ""
            };

            await emailHelper.SendEmailAsync();
        }
        #endregion
    }
}