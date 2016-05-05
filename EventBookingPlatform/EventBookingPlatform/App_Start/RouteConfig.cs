﻿using System;
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
        }
    }
}
