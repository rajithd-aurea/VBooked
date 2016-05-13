using System.Web.Mvc;

namespace EventBookingPlatform.Controllers
{
    [Authorize(Roles = "Host")]
    public class HostController : Controller
    {
        [HttpGet]
        public ActionResult Dashboard(string hostid, string venueid)
        {
            Session["VenueId"] = venueid;

            ViewBag.HostId = Session["UserId"];
            ViewBag.VenueId = Session["VenueId"];

            return View();
        }
    }
}