using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using br.com.totaltiss.Model;

namespace br.com.totaltiss.Autorizador.Controllers
{
    public class MunicipioController : Controller
    {
        private TotalDB db = new TotalDB();

        //
        // GET: /Municipio/

        public ActionResult Index()
        {
            return View(db.Municipios.ToList());
        }

        //
        // GET: /Municipio/Details/5

        public ActionResult Details(short id = 0)
        {
            Atz_Mun atz_mun = db.Municipios.Find(id);
            if (atz_mun == null)
            {
                return HttpNotFound();
            }
            return View(atz_mun);
        }

        //
        // GET: /Municipio/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Municipio/Create

        [HttpPost]
        public ActionResult Create(Atz_Mun atz_mun)
        {
            if (ModelState.IsValid)
            {
                db.Municipios.Add(atz_mun);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(atz_mun);
        }

        //
        // GET: /Municipio/Edit/5

        public ActionResult Edit(short id = 0)
        {
            Atz_Mun atz_mun = db.Municipios.Find(id);
            if (atz_mun == null)
            {
                return HttpNotFound();
            }
            return View(atz_mun);
        }

        //
        // POST: /Municipio/Edit/5

        [HttpPost]
        public ActionResult Edit(Atz_Mun atz_mun)
        {
            if (ModelState.IsValid)
            {
                db.Entry(atz_mun).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(atz_mun);
        }

        //
        // GET: /Municipio/Delete/5

        public ActionResult Delete(short id = 0)
        {
            Atz_Mun atz_mun = db.Municipios.Find(id);
            if (atz_mun == null)
            {
                return HttpNotFound();
            }
            return View(atz_mun);
        }

        //
        // POST: /Municipio/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(short id)
        {
            Atz_Mun atz_mun = db.Municipios.Find(id);
            db.Municipios.Remove(atz_mun);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}