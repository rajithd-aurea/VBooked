using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace EventBookingPlatform.UnitTest.EmailUnitTest
{
    [TestClass]
    public class EmailUnitTest
    {
        [TestMethod]
        public void Email_SendEmailConfirmation_Test()
        {
            // Arrange
            bool isEmailSent = false;
            string host = "smtp.gmail.com";
            int port = 25;
            string user = "lorenz53192@gmail.com";
            string pass = "email53192";
            string sender = "lorenz53192@gmail.com";
            string title = "VBooked Registration Confirmation";
            string recipient = "developer.lorenz@gmail.com";


            // Act
            try
            {
                System.Net.Mail.MailMessage m = new System.Net.Mail.MailMessage();
                m.From = new System.Net.Mail.MailAddress(sender, title);
                m.To.Add(new System.Net.Mail.MailAddress(recipient));
                //m.Body = string.Format("Dear {0} <BR /> Thank you for your registration, please click on the below link to complete your registration: <a href =\"{1}\" title =\"User Email Confirm\">{1}</a>", user.UserName, Url.Action("ConfirmEmail", "Account", new { Token = user.Id, Email = user.Email }, Request.Url.Scheme)) ;
                m.Body = "Test email";
                m.Subject = "Test - VBooked Registration confirmation";
                m.IsBodyHtml = true;

                System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient(host, port);
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new System.Net.NetworkCredential(user, pass);
                smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                smtp.EnableSsl = true;
                smtp.Send(m);

                isEmailSent = true;

                Assert.IsTrue(isEmailSent);
            }
            catch (Exception ex)
            {
                Assert.Fail(ex.Message);
            }
        }
    }
}