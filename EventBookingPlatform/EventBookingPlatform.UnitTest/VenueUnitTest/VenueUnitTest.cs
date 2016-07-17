using EventBookingPlatform.DAL.Entities;
using EventBookingPlatform.DAL.Repository;
using Microsoft.VisualStudio.TestTools.UnitTesting;

using System.Collections.Generic;

namespace EventBookingPlatform.UnitTest.VenueUnitTest
{
    [TestClass]
    public class VenueUnitTest
    {
        private IEFRepository _repo;

        public VenueUnitTest()
        {
            _repo = new Repository();
        }

        [TestMethod]
        public void Venue_AddVenueName_Test()
        {
            // Arrange
            string hostid = "e43b4071-fc52-47e5-97ad-4bdb9ce100b7";
            string venuename = "DCG Resort";

            VenueInfo venueInfo = new VenueInfo
            {
                Id = hostid,
                Status = 0,
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
                Street1 = "",
                Street2 = "",
                ZipCode = "",
                PBox = ""
            };

            // Act
            if (venueInfo.Status != 0)
                Assert.Fail();
            else if (string.IsNullOrEmpty(venueInfo.Id))
                Assert.Fail();
            else if (string.IsNullOrEmpty(venueInfo.Name))
                Assert.Fail();
            else
            {
                _repo.AddVenueName(hostid, venuename, 0);
                _repo.Save();

                Assert.IsNotNull(venueInfo);
            }
        }

        [TestMethod]
        public void Venue_GetUnapprovedVenues_Test()
        {
            // Arrange
            //string hostid = "89c2500a-18df-4629-9e1a-ed018999556f";

            // Act
            var listOfVenues = _repo.GetUnapprovedVenues();

            // Assert
            Assert.IsNotNull(listOfVenues);
        }

        //[TestMethod]
        //public void Venue_ApproveVenue_Test()
        //{
        //    // Arrange
        //    bool isVenueApproved = false;
        //    int venueid = 1;

        //    // Act
        //    var isApproved = _repo.ApproveVenue(venueid);

        //    if (isApproved)
        //    {
        //        isVenueApproved = true;

        //        Assert.IsTrue(isVenueApproved);
        //    }
        //    else
        //        Assert.Fail();
        //}

        //[TestMethod]
        //public void Venue_GetApprovedVenuesPerHost_Test()
        //{
        //    // Arrange
        //    string hostid = "0675d564-f92f-4e39-a9bb-05ac418d3b2b";

        //    // Act
        //    var listOfVenuesPerHost = _repo.GetApprovedVenues(hostid);

        //    // Assert
        //    Assert.AreNotEqual(0, listOfVenuesPerHost.Count);
        //}

        [TestMethod]
        public void Venue_GetVenuesPerHost_Test()
        {
            // Arrange
            string hostid = "89c2500a-18df-4629-9e1a-ed018999556f";

            // Act
            var venueList = _repo.GetVenuesPerHost(hostid);

            // Assert
            Assert.IsNotNull(venueList.GetEnumerator());
        }

        [TestMethod]
        public void Venue_GetVenueBusinessCertificateDetails_Test()
        {
            // Arrange
            int venueid = 1;

            // Act
            var certificateInfo = _repo.GetVenueBusinessCertificateDetails(venueid);

            // Assert
            Assert.IsNotNull(certificateInfo.BusinessCert);
        }

        [TestMethod]
        public void Venue_GetVenueTypes_Test()
        {
            // Arrange
            // Act
            var venueTypes = _repo.GetVenueTypes();

            // Assert
            Assert.IsNotNull(venueTypes);
        }

        [TestMethod]
        public void Venue_AddPlace_Test()
        {
            // Arrange
            VenueInfo obj = new VenueInfo
            {
                Pk_VenueId = 3,
                Type = "Hotel",
                FoundationYr = "2004",
                RegNo = "19847563998407",
                RenovationYr = "2010",
                Area = "250",
                OpenSpace = "90",
                Service = "Space rent only",
                SeasonActs = "May",
                Country = "Philippines",
                City = "Davao",
                Street1 = "Park Avenue Street",
                Street2 = "",
                ZipCode = "8000",
                PBox = "123456"
            };

            // Act
            _repo.AddPlace(obj);

            // Assert
            Assert.IsNotNull(obj.Type, "Must provide Type");
            Assert.IsNotNull(obj.FoundationYr, "Must provide Foundation Year");
            Assert.IsNotNull(obj.RegNo, "Must provide Registration No");
            Assert.IsNotNull(obj.RenovationYr, "Must provide Renovation Year");
            Assert.IsNotNull(obj.Area, "Must provide Area");
            Assert.IsNotNull(obj.OpenSpace, "Must provide Open Space");
            Assert.IsNotNull(obj.Service, "Must provide Service");
            Assert.IsNotNull(obj.SeasonActs, "Must provide Season acts");
            Assert.IsNotNull(obj.Country, "Must provide Country");
            Assert.IsNotNull(obj.City, "Must provide City");
            Assert.IsNotNull(obj.Street1, "Must provide Street 1");
            Assert.IsNotNull(obj.Street2, "Must provide Street 2");
            Assert.IsNotNull(obj.ZipCode, "Must provide Zip Code");
            Assert.IsNotNull(obj.PBox, "Must provide P.Box");
        }

        [TestMethod]
        public void Venue_AddVenueContact_Test()
        {
            // Arrange
            VenueContact obj = new VenueContact
            {
                Fk_VenueId = 3,
                Phone = "123456789",
                Phone2 = "",
                Fax = "(082) 302-5690",
                Email = "owner@gmail.com",
                Position = "Owner",
                ExtManCompanyName = "DCG Resort"
            };

            // Act
            _repo.AddVenueContact(obj);
            _repo.Save();

            // Assert
            Assert.IsNotNull(obj.Fk_VenueId, "Must provide Venue Id");
            Assert.IsNotNull(obj.Phone, "Must provide Phone");
            Assert.IsNotNull(obj.Phone2, "Must provide Phone 2");
            Assert.IsNotNull(obj.Fax, "Must provide Fax");
            Assert.IsNotNull(obj.Email, "Must provide Email");
            Assert.IsNotNull(obj.Position, "Must provide Position");
            Assert.IsNotNull(obj.ExtManCompanyName, "Must provide External Manage Company Name");
        }

        [TestMethod]
        public void Venue_AddVenueDescription_Test()
        {
            // Arrange
            VenueDescription obj = new VenueDescription
            {
                Fk_VenueId = 1,
                Description = "test",
                DistAdvantage = "test",
                DistAdvantageIn = "test",
            };

            // Act
            _repo.AddVenueDescription(obj);
            _repo.Save();

            // Assert
            Assert.IsNotNull(obj.Fk_VenueId, "Must provide Venue Id");
            Assert.IsNotNull(obj.Description, "Must provide Description");
            Assert.IsNotNull(obj.DistAdvantage, "Must provide Advantage 1");
            Assert.IsNotNull(obj.DistAdvantageIn, "Must provide Advantage 2");
        }

        [TestMethod]
        public void Venue_AddEventsToVenue_Test()
        {
            // Arrange
            List<VenueEvent> eventList = new List<VenueEvent>()
            {
                new VenueEvent { Fk_VenueId = 1, Events = "Birthday Parties" },
                new VenueEvent { Fk_VenueId = 1, Events = "Anniversaries" },
                new VenueEvent { Fk_VenueId = 1, Events = "Weddings" },
                new VenueEvent { Fk_VenueId = 1, Events = "Bachelor/Bachelorette Parties" },
                new VenueEvent { Fk_VenueId = 1, Events = "Holiday Parties" }
            };

            // Act
            foreach (var evt in eventList)
            {
                if (string.IsNullOrEmpty(evt.Events))
                {
                    // Assert
                    Assert.Fail();
                }
                else
                {
                    VenueEvent venueEvt = new VenueEvent
                    {
                        Fk_VenueId = evt.Fk_VenueId,
                        Events = evt.Events
                    };

                    _repo.AddVenueEvents(venueEvt);
                    _repo.Save();

                    // Assert
                    Assert.IsNotNull(venueEvt.Events);
                }
            }
        }

        [TestMethod]
        public void Venue_GetPendingVenueCount_Test()
        {
            // Arrange
            string hostid = "f4865fcd-aec3-48d6-baa8-6b4aea51021b";

            // Act
            int count = _repo.GetPendingVenueCount(hostid);

            // Assert
            Assert.AreNotEqual(0, count);
        }
    }
}