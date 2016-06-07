using EventBookingPlatform.BusinessLayer;
using EventBookingPlatform.DAL.Entities;

using System.Web.Mvc;
using System.Collections.Generic;
using System.Web;
using System.IO;
using System;
using System.Linq;

namespace EventBookingPlatform.Controllers
{
    [Authorize(Roles = "Admin, Host")]
    public class VenueController : Controller
    {
        private VenueBLL _venueBLL;
        private CountryBLL _countryBLL;
        private EventBLL _eventBLL;

        public VenueController()
        {
            _venueBLL = new VenueBLL();
            _countryBLL = new CountryBLL();
            _eventBLL = new EventBLL();
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
        public ActionResult Module(string mainmodule, string parentmodule, int venueid)
        {
            if (mainmodule == "Settings")
            {
                if (parentmodule == "Main" ||
                    parentmodule == "Administrative")
                return View("~/Views/Settings/" + parentmodule + ".cshtml");
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

        [HttpPost]
        [ValidateAntiForgeryToken]
        public JsonResult UpdatePlaceContact(VenueContact obj)
        {
            _venueBLL.UpdateVenueContact(obj);

            return Json(new { status = 1, message = "Successfully added venue contact!" });
        }

        [HttpGet]
        public JsonResult GetPrivateEvents()
        {
            var privateEvents = _eventBLL.GetPrivateEvents();

            return Json(privateEvents, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult GetBusinessEvents()
        {
            var businessEvents = _eventBLL.GetBusinessEvents();

            return Json(businessEvents, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public JsonResult UpdateVenueDescription(VenueDescription obj)
        {
            _venueBLL.UpdateVenueDescription(obj);

            return Json(new { status = 1, message = "Successfully updated venue description!" });
        }

        [HttpPost]
        public JsonResult AddEventsToVenue(VenueEvent obj)
        {
            List<VenueEvent> eventInfo = new List<VenueEvent>();
            eventInfo.Add(obj);

            _venueBLL.AddEventToVenue(eventInfo);

            return Json(new { status = 1 });
        }

        #region Upload images for Characterization of place sub module
        [HttpPost]
        public JsonResult UploadTypeOfConstructionImage()
        {
            string _imgname = string.Empty;

            if (System.Web.HttpContext.Current.Request.Files.AllKeys.Any())
            {
                var pic = System.Web.HttpContext.Current.Request.Files["MyImages"];

                if (pic.ContentLength > 0)
                {
                    var fileName = Path.GetFileName(pic.FileName);
                    
                    var serverPath = Path.Combine(Server.MapPath("/Content/Files/Venues/Images/TypeOfConstruction"), fileName);
                    var imageServerLocation = "~/Content/Files/Venues/Images/TypeOfConstruction/" + fileName;

                    _venueBLL.UploadTypeConstructionImage(Convert.ToInt16(Session["VenueId"]), imageServerLocation);

                    pic.SaveAs(serverPath);
                }
            }

            return Json(new { status = 1, message = "Successfully uploaded Type of Construction Image." });
        }

        [HttpPost]
        public JsonResult UploadOpenAreasImage()
        {
            string _imgname = string.Empty;

            if (System.Web.HttpContext.Current.Request.Files.AllKeys.Any())
            {
                var pic = System.Web.HttpContext.Current.Request.Files["MyImages"];
                if (pic.ContentLength > 0)
                {
                    var fileName = Path.GetFileName(pic.FileName);

                    var serverPath = Path.Combine(Server.MapPath("/Content/Files/Venues/Images/OpenAreas"), fileName);
                    var imageServerLocation = "~/Content/Files/Venues/Images/OpenAreas/" + fileName;

                    _venueBLL.UploadOpenAreasImage(Convert.ToInt16(Session["VenueId"]), imageServerLocation);

                    pic.SaveAs(serverPath);
                }
            }

            return Json(new { status = 1, message = "Successfully uploaded Open Areas Image." });
        }

        [HttpPost]
        public JsonResult UploadAViewImage()
        {
            string _imgname = string.Empty;

            if (System.Web.HttpContext.Current.Request.Files.AllKeys.Any())
            {
                var pic = System.Web.HttpContext.Current.Request.Files["MyImages"];
                if (pic.ContentLength > 0)
                {
                    var fileName = Path.GetFileName(pic.FileName);

                    var serverPath = Path.Combine(Server.MapPath("/Content/Files/Venues/Images/AView"), fileName);
                    var imageServerLocation = "~/Content/Files/Venues/Images/AView/" + fileName;

                    _venueBLL.UploadAViewImage(Convert.ToInt16(Session["VenueId"]), imageServerLocation);

                    pic.SaveAs(serverPath);
                }
            }

            return Json(new { status = 1, message = "Successfully uploaded A View Image." });
        }

        [HttpPost]
        public JsonResult UploadRoomsAreasEnclosuresImage()
        {
            string _imgname = string.Empty;

            if (System.Web.HttpContext.Current.Request.Files.AllKeys.Any())
            {
                var pic = System.Web.HttpContext.Current.Request.Files["MyImages"];
                if (pic.ContentLength > 0)
                {
                    var fileName = Path.GetFileName(pic.FileName);

                    var serverPath = Path.Combine(Server.MapPath("/Content/Files/Venues/Images/RoomsAreasEnclosures"), fileName);
                    var imageServerLocation = "~/Content/Files/Venues/Images/RoomsAreasEnclosures/" + fileName;

                    _venueBLL.UploadRoomsAreasEnclosureImage(Convert.ToInt16(Session["VenueId"]), imageServerLocation);

                    pic.SaveAs(serverPath);
                }
            }

            return Json(new { status = 1, message = "Successfully uploaded Rooms/Areas/Enclosures Image." });
        }

        [HttpPost]
        public JsonResult UploadParkingImage()
        {
            string _imgname = string.Empty;

            if (System.Web.HttpContext.Current.Request.Files.AllKeys.Any())
            {
                var pic = System.Web.HttpContext.Current.Request.Files["MyImages"];
                if (pic.ContentLength > 0)
                {
                    var fileName = Path.GetFileName(pic.FileName);

                    var serverPath = Path.Combine(Server.MapPath("/Content/Files/Venues/Images/Parking"), fileName);
                    var imageServerLocation = "~/Content/Files/Venues/Images/Parking/" + fileName;

                    _venueBLL.UploadParkingImage(Convert.ToInt16(Session["VenueId"]), imageServerLocation);

                    pic.SaveAs(serverPath);
                }
            }

            return Json(new { status = 1, message = "Successfully uploaded Parking Image." });
        }

        [HttpPost]
        public JsonResult UploadPrivacyImage()
        {
            string _imgname = string.Empty;

            if (System.Web.HttpContext.Current.Request.Files.AllKeys.Any())
            {
                var pic = System.Web.HttpContext.Current.Request.Files["MyImages"];
                if (pic.ContentLength > 0)
                {
                    var fileName = Path.GetFileName(pic.FileName);

                    var serverPath = Path.Combine(Server.MapPath("/Content/Files/Venues/Images/Privacy"), fileName);
                    var imageServerLocation = "~/Content/Files/Venues/Images/Privacy/" + fileName;

                    _venueBLL.UploadPrivacyImage(Convert.ToInt16(Session["VenueId"]), imageServerLocation);

                    pic.SaveAs(serverPath);
                }
            }

            return Json(new { status = 1, message = "Successfully uploaded Privacy Image." });
        }

        [HttpPost]
        public JsonResult UploadPagesInImage()
        {
            string _imgname = string.Empty;

            if (System.Web.HttpContext.Current.Request.Files.AllKeys.Any())
            {
                var pic = System.Web.HttpContext.Current.Request.Files["MyImages"];
                if (pic.ContentLength > 0)
                {
                    var fileName = Path.GetFileName(pic.FileName);

                    var serverPath = Path.Combine(Server.MapPath("/Content/Files/Venues/Images/PagesIn"), fileName);
                    var imageServerLocation = "~/Content/Files/Venues/Images/PagesIn/" + fileName;

                    _venueBLL.UploadPagesInImage(Convert.ToInt16(Session["VenueId"]), imageServerLocation);

                    pic.SaveAs(serverPath);
                }
            }

            return Json(new { status = 1, message = "Successfully uploaded Pages In Image." });
        }
        #endregion

        #region Upload images for Certificates
        [HttpPost]
        public JsonResult UploadBusinessCertificate()
        {
            if (System.Web.HttpContext.Current.Request.Files.AllKeys.Any())
            {
                var certificate = System.Web.HttpContext.Current.Request.Files["MyCertificates"];

                var fileName = Path.GetFileName(certificate.FileName);

                var serverPath = Path.Combine(Server.MapPath("/Content/Files/Venues/Certificates/Business"), fileName);
                var imageServerLocation = "~/Content/Files/Venues/Certificates/Business/" + fileName;

                _venueBLL.UploadBusinessCertificate(Convert.ToInt16(Session["VenueId"]), imageServerLocation);

                certificate.SaveAs(serverPath);
            }

            return Json(new { status = 1, message = "Successfully uploaded Certificate Business/Enterprise." });
        }

        [HttpPost]
        public JsonResult UploadTermsAndConditionsCertificate()
        {
            if (System.Web.HttpContext.Current.Request.Files.AllKeys.Any())
            {
                var certificate = System.Web.HttpContext.Current.Request.Files["MyCertificates"];

                var fileName = Path.GetFileName(certificate.FileName);

                var serverPath = Path.Combine(Server.MapPath("/Content/Files/Venues/Certificates/Terms"), fileName);
                var imageServerLocation = "~/Content/Files/Venues/Certificates/Terms/" + fileName;

                _venueBLL.UploadTermsAndConditionsCertificate(Convert.ToInt16(Session["VenueId"]), imageServerLocation);

                certificate.SaveAs(serverPath);
            }

            return Json(new { status = 1, message = "Successfully uploaded Terms and Conditions." });
        }

        [HttpPost]
        public JsonResult UploadBusinessLicenseCertificate()
        {
            if (System.Web.HttpContext.Current.Request.Files.AllKeys.Any())
            {
                var certificate = System.Web.HttpContext.Current.Request.Files["MyCertificates"];

                var fileName = Path.GetFileName(certificate.FileName);

                var serverPath = Path.Combine(Server.MapPath("/Content/Files/Venues/Certificates/BusinessLicense"), fileName);
                var imageServerLocation = "~/Content/Files/Venues/Certificates/BusinessLicense/" + fileName;

                _venueBLL.UploadBusinessLicenseCertificate(Convert.ToInt16(Session["VenueId"]), imageServerLocation);

                certificate.SaveAs(serverPath);
            }

            return Json(new { status = 1, message = "Successfully uploaded Business License." });
        }

        [HttpPost]
        public JsonResult UploadPoliceAuthorizationCertificate()
        {
            if (System.Web.HttpContext.Current.Request.Files.AllKeys.Any())
            {
                var certificate = System.Web.HttpContext.Current.Request.Files["MyCertificates"];

                var fileName = Path.GetFileName(certificate.FileName);

                var serverPath = Path.Combine(Server.MapPath("/Content/Files/Venues/Certificates/PoliceAuthorization"), fileName);
                var imageServerLocation = "~/Content/Files/Venues/Certificates/PoliceAuthorization/" + fileName;

                _venueBLL.UploadPoliceAuthorizationCertificate(Convert.ToInt16(Session["VenueId"]), imageServerLocation);

                certificate.SaveAs(serverPath);
            }

            return Json(new { status = 1, message = "Successfully uploaded Police Authorization." });
        }

        [HttpPost]
        public JsonResult UploadFireDepartmentCertificate()
        {
            if (System.Web.HttpContext.Current.Request.Files.AllKeys.Any())
            {
                var certificate = System.Web.HttpContext.Current.Request.Files["MyCertificates"];

                var fileName = Path.GetFileName(certificate.FileName);

                var serverPath = Path.Combine(Server.MapPath("/Content/Files/Venues/Certificates/FireDepartment"), fileName);
                var imageServerLocation = "~/Content/Files/Venues/Certificates/FireDepartment/" + fileName;

                _venueBLL.UploadFireDepartmentCertificate(Convert.ToInt16(Session["VenueId"]), imageServerLocation);

                certificate.SaveAs(serverPath);
            }

            return Json(new { status = 1, message = "Successfully uploaded Fire Department Certificate." });
        }

        [HttpPost]
        public JsonResult UploadSanitationCertificate()
        {
            if (System.Web.HttpContext.Current.Request.Files.AllKeys.Any())
            {
                var certificate = System.Web.HttpContext.Current.Request.Files["MyCertificates"];

                var fileName = Path.GetFileName(certificate.FileName);

                var serverPath = Path.Combine(Server.MapPath("/Content/Files/Venues/Certificates/Sanitation"), fileName);
                var imageServerLocation = "~/Content/Files/Venues/Certificates/Sanitation/" + fileName;

                _venueBLL.UploadSanitationCertificate(Convert.ToInt16(Session["VenueId"]), imageServerLocation);

                certificate.SaveAs(serverPath);
            }

            return Json(new { status = 1, message = "Successfully uploaded Sanitation Certificate." });
        }

        [HttpPost]
        public JsonResult UploadThirdPartyInsurance()
        {
            if (System.Web.HttpContext.Current.Request.Files.AllKeys.Any())
            {
                var certificate = System.Web.HttpContext.Current.Request.Files["MyCertificates"];

                var fileName = Path.GetFileName(certificate.FileName);

                var serverPath = Path.Combine(Server.MapPath("/Content/Files/Venues/Certificates/ThirdPartyInsurance"), fileName);
                var imageServerLocation = "~/Content/Files/Venues/Certificates/ThirdPartyInsurance/" + fileName;

                _venueBLL.UploadThirdPartyInsurance(Convert.ToInt16(Session["VenueId"]), imageServerLocation);

                certificate.SaveAs(serverPath);
            }

            return Json(new { status = 1, message = "Successfully uploaded Third Party Insurance Certificate." });
        }
        #endregion
    }
}