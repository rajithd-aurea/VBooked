using System.Net.Mail;
using System.Net;
using System.Text;

namespace EventBookingPlatform.Helpers
{
    public class EmailHelper
    {
        public string host { get; set; }
        public int port { get; set; }
        public string networkUser { get; set; }
        public string networkPass { get; set; }
        public string sender { get; set; }
        public string title { get; set; }
        public string recipient { get; set; }
        public string acctUsername { get; set; }
        public string acctPassword { get; set; }
        public string confirmationUrl { get; set; }

        public EmailHelper()
        {
        }

        public EmailHelper(string host, int port, string networkuser, string networkpass, string sender, string title, string recipient, string acctusername, string acctpass, string confirmationurl)
        {
            this.host = host;
            this.port = port;
            this.networkUser = networkuser;
            this.networkPass = networkpass;
            this.sender = sender;
            this.title = title;
            this.recipient = recipient;
            this.acctUsername = acctusername;
            this.acctPassword = acctPassword;
            this.confirmationUrl = confirmationurl;
        }

        public void SendEmail()
        {
            MailMessage message = new MailMessage();
            message.From = new MailAddress(this.sender, this.title);
            message.To.Add(new MailAddress(this.confirmationUrl));
            message.Body = EmailContent();
            message.Subject = "VBooked Registration Confirmation";
            message.IsBodyHtml = true;

            SmtpClient smtp = new SmtpClient(this.host, this.port);
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new NetworkCredential(this.networkUser, this.networkPass);
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.EnableSsl = true;
            smtp.Send(message);
        }

        private string EmailContent()
        {
            StringBuilder content = new StringBuilder();
            content.Append("Dear " + this.recipient + "<br />");
            content.Append("Thank you for registering at http://wwww.vbooked.com! Below is your login details. Before you can login, please confirm your email by clicking at " + "<a href=" + this.confirmationUrl + ">THIS LINK" + "</a>" + "<br />");
            content.Append("<br />");
            content.Append("Login Credentials" + "<br />");
            content.Append("Email: " + this.acctUsername + "<br />");
            content.Append("Password: " + this.acctPassword);

            return content.ToString();
        }
    }
}