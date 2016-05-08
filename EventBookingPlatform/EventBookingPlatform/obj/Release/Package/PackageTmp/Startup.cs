using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(EventBookingPlatform.Startup))]
namespace EventBookingPlatform
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
