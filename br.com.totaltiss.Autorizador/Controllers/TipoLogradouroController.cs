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
    public class TipoLogradouroController : Controller
    {
        private TotalDB db = new TotalDB();

        //
        // GET: /TipoLogradouro/

        public ActionResult Index()
        {
            return View(db.TiposLogradouro.ToList());
        }

        //
        // GET: /TipoLogradouro/Details/5

        public ActionResult Details(short id = 0)
        {
            Atz_Tpl atz_tpl = db.TiposLogradouro.Find(id);
            if (atz_tpl == null)
            {
                return HttpNotFound();
            }
            return View(atz_tpl);
        }

        //
        // GET: /TipoLogradouro/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /TipoLogradouro/Create

        [HttpPost]
        public ActionResult Create(Atz_Tpl atz_tpl)
        {
            if (ModelState.IsValid)
            {
                db.TiposLogradouro.Add(atz_tpl);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(atz_tpl);
        }

        //
        // GET: /TipoLogradouro/Edit/5

        public ActionResult Edit(short id = 0)
        {
            Atz_Tpl atz_tpl = db.TiposLogradouro.Find(id);
            if (atz_tpl == null)
            {
                return HttpNotFound();
            }
            return View(atz_tpl);
        }

        //
        // POST: /TipoLogradouro/Edit/5

        [HttpPost]
        public ActionResult Edit(Atz_Tpl atz_tpl)
        {
            if (ModelState.IsValid)
            {
                db.Entry(atz_tpl).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(atz_tpl);
        }

        //
        // GET: /TipoLogradouro/Delete/5

        public ActionResult Delete(short id = 0)
        {
            Atz_Tpl atz_tpl = db.TiposLogradouro.Find(id);
            if (atz_tpl == null)
            {
                return HttpNotFound();
            }
            return View(atz_tpl);
        }

        //
        // POST: /TipoLogradouro/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(short id)
        {
            Atz_Tpl atz_tpl = db.TiposLogradouro.Find(id);
            db.TiposLogradouro.Remove(atz_tpl);
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