using System.Net.Mail;
using System.Net;
using System.Text;
using System;
using System.Threading.Tasks;

namespace EventBookingPlatform.Helpers
{
    public class EmailHelper
    {
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

        public EmailHelper(string host, string sender, string recipient, string subject, string networkuser, string networkpass, string useremail, string userpassword, string confirmationurl)
        {
            Host = host;
            NetworkUser = networkuser;
            NetworkPass = networkpass;
            Sender = sender;
            Recipient = recipient;
            UserEmail = useremail;
            UserPassword = userpassword;
            ConfirmationUrl = confirmationurl;
        }

        public async Task SendEmail()
        {
            try
            {
                MailMessage message = new MailMessage(Sender, Recipient);
                message.BodyEncoding = Encoding.Default;
                message.Subject = Subject;
                message.Body = EmailContent();
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

        private string EmailContent()
        {
            StringBuilder content = new StringBuilder();
            content.Append("Dear " + Recipient + "<br />");
            content.Append("Thank you for registering at http://wwww.vbooked.com! Below is your login details. Before you can login, please confirm your email by clicking at " + "<a href=" + ConfirmationUrl + ">Confirm Registration" + "</a>" + "<br />");
            content.Append("<br />");
            content.Append("Login Credentials" + "<br />");
            content.Append("Email: " + UserEmail + "<br />");
            content.Append("Password: " + UserPassword);

            return content.ToString();
        }
    }
}