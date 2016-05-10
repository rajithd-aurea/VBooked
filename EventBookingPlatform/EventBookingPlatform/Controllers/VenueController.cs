using System.Web.Mvc;

namespace EventBookingPlatform.Controllers
{
    [Authorize(Roles = "Admin, Host")]
    public class VenueController : Controller
    {
        [HttpGet]
        public ActionResult Dashboard(string hostid)
        {
            return View();
        }

        [HttpGet]
        public ActionResult ForApproval()
        {
            return View();
        }
    }
}