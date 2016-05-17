using EventBookingPlatform.BusinessLayer;

using System.Web.Mvc;

namespace EventBookingPlatform.Controllers
{
    [Authorize(Roles = "Admin, Host")]
    public class VenueController : Controller
    {
        private VenueBLL _venueBLL;

        public VenueController()
        {
            _venueBLL = new VenueBLL();
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
        public ActionResult Info(string hostid, int venueid)
        {
            Session["VenueId"] = venueid;

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
    }
}