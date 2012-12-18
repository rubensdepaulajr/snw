using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

/// <summary>
/// Summary description for HomeController
/// </summary>
public class HomeController : Controller
{
    public ActionResult Index()
    {
            ViewData["Message"] = "Hello from Home controller";
        return View();
    }
}
