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
        public ActionResult Dashboard(string hostid)
        {
            return View();
        }

        [HttpGet]
        public ActionResult ForApproval()
        {
            ViewBag.VenueList = _venueBLL.GetUnapprovedVenueList();

            return View();
        }
    }
}