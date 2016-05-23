using EventBookingPlatform.DAL.Entities;
using EventBookingPlatform.DAL.Repository;
using Microsoft.VisualStudio.TestTools.UnitTesting;

using System.Threading.Tasks;

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
            string hostid = "782fc72d-145c-4013-8078-3a6835ba9db1";
            string venuename = "DCG Resort";
            bool approval = false;

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

            // Act
            if (venueInfo.Approved != false)
                Assert.Fail();
            else if (string.IsNullOrEmpty(venueInfo.Id))
                Assert.Fail();
            else if (string.IsNullOrEmpty(venueInfo.Name))
                Assert.Fail();
            else
            {
                _repo.AddVenueName(hostid, venuename, approval);
                _repo.Save();

                Assert.IsNotNull(venueInfo);
            }
        }

        [TestMethod]
        public void Venue_GetUnapprovedVenues_Test()
        {
            // Arrange
            //string hostid = "782fc72d-145c-4013-8078-3a6835ba9db1";

            // Act
            var listOfVenues = _repo.GetUnapprovedVenues();

            // Assert
            Assert.IsNotNull(listOfVenues);
        }

        [TestMethod]
        public void Venue_ApproveVenue_Test()
        {
            // Arrange
            bool isVenueApproved = false;
            int venueid = 1;

            // Act
            var isApproved = _repo.ApproveVenue(venueid);

            if (isApproved)
            {
                isVenueApproved = true;

                Assert.IsTrue(isVenueApproved);
            }
            else
                Assert.Fail();
        }

        [TestMethod]
        public void Venue_GetApprovedVenuesPerHost_Test()
        {
            // Arrange
            string hostid = "0675d564-f92f-4e39-a9bb-05ac418d3b2b";

            // Act
            var listOfVenuesPerHost = _repo.GetApprovedVenues(hostid);

            // Assert
            Assert.AreNotEqual(0, listOfVenuesPerHost.Count);
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
    }
}