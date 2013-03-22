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
    public class BairroController : Controller
    {
        private TotalDB db = new TotalDB();

        //
        // GET: /Bairro/

        public ActionResult Index()
        {
            var bairros = db.Bairros.Include(a => a.Atz_Mun);
            return View(bairros.ToList());
        }

        //
        // GET: /Bairro/Details/5

        public ActionResult Details(int id = 0)
        {
            Atz_Brr atz_brr = db.Bairros.Find(id);
            if (atz_brr == null)
            {
                return HttpNotFound();
            }
            return View(atz_brr);
        }

        //
        // GET: /Bairro/Create

        public ActionResult Create()
        {
            ViewBag.Brr_IdMun = new SelectList(db.Municipios, "IdMun", "Mun_Cod");
            return View();
        }

        //
        // POST: /Bairro/Create

        [HttpPost]
        public ActionResult Create(Atz_Brr atz_brr)
        {
            if (ModelState.IsValid)
            {
                db.Bairros.Add(atz_brr);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Brr_IdMun = new SelectList(db.Municipios, "IdMun", "Mun_Cod", atz_brr.Brr_IdMun);
            return View(atz_brr);
        }

        //
        // GET: /Bairro/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Atz_Brr atz_brr = db.Bairros.Find(id);
            if (atz_brr == null)
            {
                return HttpNotFound();
            }
            ViewBag.Brr_IdMun = new SelectList(db.Municipios, "IdMun", "Mun_Cod", atz_brr.Brr_IdMun);
            return View(atz_brr);
        }

        //
        // POST: /Bairro/Edit/5

        [HttpPost]
        public ActionResult Edit(Atz_Brr atz_brr)
        {
            if (ModelState.IsValid)
            {
                db.Entry(atz_brr).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Brr_IdMun = new SelectList(db.Municipios, "IdMun", "Mun_Cod", atz_brr.Brr_IdMun);
            return View(atz_brr);
        }

        //
        // GET: /Bairro/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Atz_Brr atz_brr = db.Bairros.Find(id);
            if (atz_brr == null)
            {
                return HttpNotFound();
            }
            return View(atz_brr);
        }

        //
        // POST: /Bairro/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            Atz_Brr atz_brr = db.Bairros.Find(id);
            db.Bairros.Remove(atz_brr);
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