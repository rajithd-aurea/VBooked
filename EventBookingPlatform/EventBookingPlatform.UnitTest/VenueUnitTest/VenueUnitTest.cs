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
        public async Task Venue_GetVenues_Test()
        {
            // Arrange
            string hostid = "782fc72d-145c-4013-8078-3a6835ba9db1";

            // Act
            var listOfVenues = await _repo.GetVenuesAsync(hostid);

            // Assert
            Assert.IsTrue(listOfVenues.Count > 0);
        }
    }
}