using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using br.com.totaltiss.Model;
using br.com.totaltiss.Autorizador.Models.Repository;

namespace br.com.totaltiss.Autorizador.Controllers
{
    public class EspecialidadeController : Controller
    {
        private UnitOfWork unitOfWork = new UnitOfWork();

        public ActionResult GridData(string sidx, string sord, int page, int rows)
        {
            var jsonData = new
            {
                total = 1, // we'll implement later 
                page = page,
                records = 3, // implement later 
                rows = new[]{
                  new {id = 1, cell = new[] {"1", "-7", "Is this a good question?"}},
                  new {id = 2, cell = new[] {"2", "15", "Is this a blatant ripoff?"}},
                  new {id = 3, cell = new[] {"3", "23", "Why is the sky blue?"}}
                }
            };
            return Json(jsonData, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Lista(string sidx, string sord, int page, int rows)
        {
            int pageIndex = Convert.ToInt32(page) - 1;
            int pageSize = rows;

            int totalRecords = unitOfWork.EspecialidadeRepository.Get().Count();

            var especialidades = unitOfWork.EspecialidadeRepository.Get(
                orderBy: o => o.OrderBy(e => e.Esp_Dsc))
                    .Skip(pageSize*pageIndex)
                    .Take(pageSize);

            int totalPages = (int)Math.Ceiling((float)totalRecords / (float)pageSize);

            var jsonData = new
            {
                total = totalPages,
                page = page,
                records = totalRecords,
                rows = (
                  from e in especialidades
                  select new {
                    id = e.IdEsp,
                    cell = new string[] {
                      e.IdEsp.ToString(), e.Esp_Dsc, e.Esp_Cbo, e.Esp_SisGst, e.Esp_AltCpx.ToString(),
                      e.Esp_Sxo, e.Esp_IddMin.ToString(), e.Esp_IddMax.ToString(), e.Esp_QtdMax.ToString(),
                      e.Esp_QtdDia.ToString(), e.Esp_QtdMes.ToString(), e.Esp_QtdAno.ToString(), e.Esp_Rtn.ToString()
                    }
                }).ToArray()
            };

            return Json(jsonData, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Index()
        {
            return View();
        }

        // GET: /Especialidade/Details/5

        public ActionResult Details(int id = 0)
        {
            Atz_Esp especialidade =  unitOfWork.EspecialidadeRepository.GetByID(id);
            if (especialidade == null)
            {
                return HttpNotFound();
            }
            return View(especialidade);
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
            try
            {
                if (ModelState.IsValid)
                {
                    unitOfWork.EspecialidadeRepository.Insert(atz_esp);
                    unitOfWork.Save();
                    return RedirectToAction("Index");
                }
            }
            catch (DataException)
            {
                //Log the error (add a variable name after DataException)
                ModelState.AddModelError("", "Unable to save changes. Try again, and if the problem persists, see your system administrator.");
            }
            return View(atz_esp);
        }

        //
        // GET: /Especialidade/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Atz_Esp especialidade = unitOfWork.EspecialidadeRepository.GetByID(id);
            if (especialidade == null)
            {
                return HttpNotFound();
            }
            return View(especialidade);
        }

        //
        // POST: /Especialidade/Edit/5

        [HttpPost]
        public ActionResult Edit(Atz_Esp especialidade)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    unitOfWork.EspecialidadeRepository.Update(especialidade);
                    unitOfWork.Save();
                    return RedirectToAction("Index");
                }
            }
            catch (DataException)
            {
                //Log the error (add a variable name after DataException)
                ModelState.AddModelError("", "Unable to save changes. Try again, and if the problem persists, see your system administrator.");
            }
            return View(especialidade);
        }

        //
        // GET: /Especialidade/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Atz_Esp especialidade = unitOfWork.EspecialidadeRepository.GetByID(id);
            if (especialidade == null)
            {
                return HttpNotFound();
            }
            return View(especialidade);
        }

        //
        // POST: /Especialidade/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            Atz_Esp especialidade = unitOfWork.EspecialidadeRepository.GetByID(id);
            unitOfWork.EspecialidadeRepository.Delete(id);
            unitOfWork.Save();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            unitOfWork.Dispose();
            base.Dispose(disposing);
        }
    }
}