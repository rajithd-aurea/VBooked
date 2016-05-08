using System.Web.Mvc;

namespace EventBookingPlatform.Controllers
{
    [Authorize(Roles = "User")]
    public class RenterController : Controller
    {
        [HttpGet]
        public ActionResult Dashboard()
        {
            return View();
        }
    }
}