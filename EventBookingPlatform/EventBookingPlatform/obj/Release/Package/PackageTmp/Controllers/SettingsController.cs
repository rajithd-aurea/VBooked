using System.Web.Mvc;

namespace EventBookingPlatform.Controllers
{
    [Authorize(Roles = "Host")]
    public class SettingsController : Controller
    {
        [HttpGet]
        public ActionResult Main()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Administrative()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Operative()
        {
            return View();
        }

        [HttpGet]
        public ActionResult FoodDrinks()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Design()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Multimedia()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Extras()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Gallery()
        {
            return View();
        }
    }
}