using EventBookingPlatform.Helpers;

using System;
using System.Threading.Tasks;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace EventBookingPlatform.UnitTest.EmailUnitTest
{
    [TestClass]
    public class EmailUnitTest
    {
        [TestMethod]
        public async Task Email_SendEmailConfirmation_Test()
        {
            try
            {
                // Arrange
                bool isEmailSent = false;
                EmailHelper emailHelper = new EmailHelper
                {
                    EmailFor = "Registration",
                    RegistrantName = "Lorenz Bahinting",
                    Host = "mail.vbooked.com",
                    Sender = "support@vbooked.com",
                    Recipient = "developer.lorenz@gmail.com",
                    Subject = "VBooked Registration Confirmation",
                    NetworkUser = "support@vbooked.com",
                    NetworkPass = "supportmail123!",
                    UserEmail = "developer.lorenz@gmail.com",
                    UserPassword = "Demo123!",
                    ConfirmationUrl = "http://www.vbooked.com/ConfirmEmail"
                };

                // Act
                await emailHelper.SendEmail();

                isEmailSent = true;

                Assert.IsTrue(isEmailSent);
            }
            catch (Exception ex)
            {
                Assert.Fail(ex.InnerException.ToString());
            }
        }
    }
}