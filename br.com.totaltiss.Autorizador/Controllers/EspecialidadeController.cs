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
    public class EspecialidadeController : Controller
    {
        private TotalDB db = new TotalDB();

        //
        // GET: /Especialidade/

        public ActionResult Index()
        {
            return View(db.Atz_Esp.ToList());
        }

        //
        // GET: /Especialidade/Details/5

        public ActionResult Details(int id = 0)
        {
            Atz_Esp atz_esp = db.Atz_Esp.Find(id);
            if (atz_esp == null)
            {
                return HttpNotFound();
            }
            return View(atz_esp);
        }

        //
        // GET: /Especialidade/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Especialidade/Create

        [HttpPost]
        public ActionResult Create(Atz_Esp atz_esp)
        {
            if (ModelState.IsValid)
            {
                db.Atz_Esp.Add(atz_esp);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(atz_esp);
        }

        //
        // GET: /Especialidade/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Atz_Esp atz_esp = db.Atz_Esp.Find(id);
            if (atz_esp == null)
            {
                return HttpNotFound();
            }
            return View(atz_esp);
        }

        //
        // POST: /Especialidade/Edit/5

        [HttpPost]
        public ActionResult Edit(Atz_Esp atz_esp)
        {
            if (ModelState.IsValid)
            {
                db.Entry(atz_esp).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(atz_esp);
        }

        //
        // GET: /Especialidade/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Atz_Esp atz_esp = db.Atz_Esp.Find(id);
            if (atz_esp == null)
            {
                return HttpNotFound();
            }
            return View(atz_esp);
        }

        //
        // POST: /Especialidade/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            Atz_Esp atz_esp = db.Atz_Esp.Find(id);
            db.Atz_Esp.Remove(atz_esp);
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