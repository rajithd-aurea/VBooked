﻿using EventBookingPlatform.DAL.Entities;
using EventBookingPlatform.DAL.Repository;
using EventBookingPlatform.DAL.Models;

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

        public void ApproveVenue(int venueid)
        {
            _repo.ApproveVenue(venueid);
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
    }
}