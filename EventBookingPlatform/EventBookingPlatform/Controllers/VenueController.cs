﻿using EventBookingPlatform.BusinessLayer;
using EventBookingPlatform.DAL.Entities;

using System.Web.Mvc;

namespace EventBookingPlatform.Controllers
{
    [Authorize(Roles = "Admin, Host")]
    public class VenueController : Controller
    {
        private VenueBLL _venueBLL;
        private CountryBLL _countryBLL;

        public VenueController()
        {
            _venueBLL = new VenueBLL();
            _countryBLL = new CountryBLL();
        }

        [HttpGet]
        public ActionResult ForApproval()
        {
            ViewBag.VenueList = _venueBLL.GetUnapprovedVenueList();

            return View();
        }

        [HttpGet]
        public ActionResult Dashboard(string hostid)
        {
            ViewData["VenueList"] = _venueBLL.GetApprovedVenuesPerHost(Session["UserId"].ToString());

            return View();
        }

        [HttpGet]
        public ActionResult Approve(int venueid)
        {
            _venueBLL.ApproveVenue(venueid);

            return View();
        }
        
        [HttpGet]
        public ActionResult Info(string hostid, int venueid, string venuename)
        {
            Session["VenueId"] = venueid;
            Session["VenueName"] = venuename;

            return View();
        }

        [HttpGet]
        public ActionResult Page(string mainmodule, string parentmodule, string childmodule)
        {
            if (mainmodule == "Settings" && parentmodule == "Main")
            {
                if (childmodule == "AddPlace" ||
                    childmodule == "Contact" ||
                    childmodule == "Characterization" ||
                    childmodule == "Description" ||
                    childmodule == "ActivityTime" ||
                    childmodule == "Halls")
                    return View("~/Views/Settings/" + childmodule + ".cshtml");
            }

            return View();
        }

        [HttpGet]
        public JsonResult GetVenueTypes()
        {
            var venueTypes = _venueBLL.GetVenueTypes();

            return Json(venueTypes, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult GetCountryList()
        {
            var countries = _countryBLL.GetCountries();

            return Json(countries, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public JsonResult UpdatePlaceInitialInfo(VenueInfo obj)
        {
            obj.Id = Session["UserId"].ToString();

            _venueBLL.UpdatePlaceInfo(obj);

            return Json(new { status = 1, message = "Successfully updated place info!" });
        }
    }
}