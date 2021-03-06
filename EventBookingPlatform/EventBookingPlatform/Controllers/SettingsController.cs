﻿using System.Web.Mvc;

namespace EventBookingPlatform.Controllers
{
    [Authorize(Roles = "Host")]
    public class SettingsController : Controller
    {
        [HttpGet]
        public void Main()
        {
            return View();
        }

        [HttpGet]
        public void Administrative()
        {
            return View();
        }

        [HttpGet]
        public void Operative()
        {
            return View();
        }

        [HttpGet]
        public ActionResult FoodDrinks()
        {
            save();
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
            drop();
            return View();
        }

        [HttpGet]
        public ActionResult Gallery()
        {
            return View();
        }
        
        [HttpPost]
        public ActionResult GallerySave()
        {
            save();
            return View();
        }
        
        [HttpPost]
        public ActionResult GalleryFind()
        {
            find();
            return View();
        }
        
        [HttpPost]
        public ActionResult GalleryDrop()
        {
            drop();
            return View();
        }
        
        private void save()
        {
        }
        
        private void drop()
        {
        }
        
        private String find()
        {
        }
        
        
    }
}
