using System.Net.Mail;
using System.Net;
using System.Text;
using System;
using System.Threading.Tasks;

namespace EventBookingPlatform.Helpers
{
    public class EmailHelper
    {
        public string EmailFor { get; set; }
        public string RegistrantName { get; set; }
        public string VenueName { get; set; }
        public string Host { get; set; }
        public string Sender { get; set; }
        public string Recipient { get; set; }
        public string Subject { get; set; }
        public string NetworkUser { get; set; }
        public string NetworkPass { get; set; }
        public string UserEmail { get; set; }
        public string UserPassword { get; set; }
        public string ConfirmationUrl { get; set; }

        public EmailHelper()
        {
        }

        public EmailHelper(string emailfor, string registrantname, string venuename, string host, string sender, string recipient, string subject, string networkuser, string networkpass, string useremail, string userpassword, string confirmationurl)
        {
            EmailFor = emailfor;
            RegistrantName = registrantname;
            VenueName = venuename;
            Host = host;
            NetworkUser = networkuser;
            NetworkPass = networkpass;
            Sender = sender;
            Recipient = recipient;
            UserEmail = useremail;
            UserPassword = userpassword;
            ConfirmationUrl = confirmationurl;
        }

        public async Task SendEmailAsync()
        {
            try
            {
                MailMessage message = new MailMessage(Sender, Recipient);
                message.BodyEncoding = Encoding.Default;
                message.Subject = Subject;

                if (EmailFor == "Registration")
                    message.Body = RegistrationEmailContent();

                if (EmailFor == "Venue Approval")
                    message.Body = VenueApprovalEmailContent();

                message.Priority = MailPriority.High;
                message.IsBodyHtml = true;

                SmtpClient smtp = new SmtpClient(Host);
                smtp.Port = 587;
                smtp.UseDefaultCredentials = false;
                smtp.EnableSsl = false;
                smtp.Credentials = new NetworkCredential(NetworkUser, NetworkPass);
                await smtp.SendMailAsync(message);
            }
            catch (Exception ex)
            {
                Console.Write(ex.InnerException);
            }
        }

        private string RegistrationEmailContent()
        {
            StringBuilder content = new StringBuilder();
            content.Append("Dear " + RegistrantName + "<br /><br />");
            content.Append("Congratulations!<br /><br />");
            content.Append("Your registration was successful. Thank you for registering at http://wwww.vbooked.com!<br /><br />");
            content.Append("Below is your login details. Before you can login, please confirm your email by clicking at " + "<a href=" + ConfirmationUrl + ">Confirm Registration" + "</a>" + "<br />");
            content.Append("<br />");
            content.Append("Login Credentials" + "<br />");
            content.Append("Email: " + UserEmail + "<br />");
            content.Append("Password: " + UserPassword);

            return content.ToString();
        }

        private string VenueApprovalEmailContent()
        {
            StringBuilder content = new StringBuilder();
            content.Append("Dear " + RegistrantName + "<br /><br />");
            content.Append("Congratulations!<br /><br />");
            content.Append("The venue " + VenueName + " has been approved. You can now view it in your venue list under your account.<br /><br />");
            content.Append("Thank you!<br /><br />");
            content.Append("VBOOKED. Copyright " + DateTime.Now.Year);

            return content.ToString();
        }
    }
}