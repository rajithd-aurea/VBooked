using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace EventBookingPlatform
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "UserTypeRegistrationRoute",
                url: "Account/Register/{usertype}",
                defaults: new { usertype = "host" }
            );

            routes.MapRoute(
                name: "RegistrationConfirmationRoute",
                url: "Account/Confirm/{status}",
                defaults: new { status = false }
            );

            routes.MapRoute(
                name: "VenueDashboardRoute",
                url: "Venue/{action}/{hostid}",
                defaults: new { action = "Dashboard", hostid = string.Empty }
            );

            routes.MapRoute(
                name: "ViewVenueInfoRoute",
                url: "Host/Dashboard/{hostid}/{venueid}",
                defaults: new { hostid = string.Empty, venueid = 0 }
            );

            routes.MapRoute(
                name: "ApproveVenueRoute",
                url: "Venue/Approve/{venueid}",
                defaults: new { venueid = 0 }
            );
        }
    }
}