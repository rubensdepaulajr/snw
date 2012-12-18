using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using Sweb.TotalTiss.Xml;
using Sweb.TotalTiss.Model;
using System.IO;

namespace Sweb.TotalTiss.Web.Controllers
{
    public class TissController : ControllerBase
    {
        #region Fields

        private TissFacade tissFacade = new TissFacade();

        #endregion

        #region Properties

        public IList<dynamic> Messages 
        {
            get { return this.Session["Messages"] as IList<dynamic>; }
            set {
                    this.Session.Clear();
                    this.Session.Add("Messages", value); 
                }
        }

        #endregion

        #region Methods

        [Authorize]
        public JsonResult GetCompetencia(string sidx, string sord, int page, int rows, int? pCompetencia = null, int? pOperadora = null)
        {
            try
            {
                int totalRecords = 0;
                int totalPages = 0;

                IList<Competencia> competencias = tissFacade.GetCompetenciaEmAberto(rows, page, out totalRecords, out totalPages, this.Contratado, pCompetencia, pOperadora);

                var jsonData = new
                {

                    total = totalPages,
                    page = page,
                    records = totalRecords,
                    rows = (
                             from competencia in competencias
                             select new
                             {
                                 id = competencia.Id,
                                 cell = new string[]{
                                                        competencia.Operadora.Nome,
                                                        String.Concat(competencia.Mes,"/", competencia.Ano),
                                                        competencia.DataInicio.ToShortDateString(),
                                                        competencia.DataFim.ToShortDateString(),
                                                        competencia.Id.ToString()
                                                    }
                             }
                           ).ToArray()

                };

                return Json(jsonData, JsonRequestBehavior.AllowGet);
            }
            catch (Exception exception)
            {
                return Json(new { msg = exception.Message });
            }
        }

        [Authorize]
        public JsonResult GetLote(string sidx, string sord, int page, int rows, int? pCompetencia=null, int? pOperadora=null)
        {
            try
            {
                int totalRecords = 0;
                int totalPages = 0;

                IList<Lote> lotes = tissFacade.GetLote(rows, page, out totalRecords, out totalPages, this.Contratado, pCompetencia, pOperadora);

                var jsonData = new
                {

                    total = totalPages,
                    page = page,
                    records = totalRecords,
                    rows = (
                             from lote in lotes
                             select new
                             {
                                 id = lote.Id,
                                 cell = new string[]{
                                                        lote.Competencia.Operadora.Nome,
                                                        lote.Nome,
                                                        String.Concat(lote.Competencia.Mes,"/", lote.Competencia.Ano),
                                                        lote.DataCriacao.ToShortDateString(),
                                                        lote.Id.ToString()
                                                    }
                             }
                           ).ToArray()

                };

                return Json(jsonData, JsonRequestBehavior.AllowGet);
            }
            catch (Exception exception)
            {
                return Json(new { msg = exception.Message });
            }
        }

        [Authorize]
        [HttpGet]
        public ActionResult GetArquivo(int pIdLote)
        {
            Lote lote = tissFacade.GetLote(pIdLote);

            return File(lote.Arquivo, "text/xml", lote.Nome);
        }

        [Authorize]
        [HttpPost]
        public int BuildLote(int pId)
        {
            try
            {
                int totalRecords;

                tissFacade.BuildLote(this.Contratado, pId, out totalRecords);

                var jsonResult = new { totalRecords = totalRecords };

                //return Json(jsonResult, JsonRequestBehavior.AllowGet);
                return totalRecords;
            }
            catch (Exception ex)
            {
                //ToDo: Tratar erros
                return 0;
            }
        }

        [Authorize]
        public ActionResult ListaCompetencia()
        {   
            return View();
        }

        [Authorize]
        public ActionResult ListaLote()
        {   
            return View();
        }

        [Authorize]
        public ActionResult UploadXmlAvulso()
        {
            this.Session.Add("Key", 0);
            return View();
        }

        [Authorize]
        public JsonResult GetCompetenciaFinalizada(int pIdOperadora, bool pIsFinalizada) 
        {
            IList<Competencia> competencias;

            if (pIsFinalizada)
                competencias = tissFacade.GetCompetenciaFinalizada(this.Contratado, pIdOperadora);
            else
                competencias = tissFacade.GetCompetenciaEmAberto(this.Contratado, pIdOperadora);
            
            var jsonData = new
            {
                rows = competencias.ToList().ConvertAll<SelectListItem>((n) => new SelectListItem{ Text = n.CompetenciaFormatada, Value = n.Id.ToString() })
            };

            return Json(jsonData, JsonRequestBehavior.AllowGet);
        }

        [Authorize]
        public JsonResult GetOperadora()
        {
            var jsonData = new
            {
                rows = tissFacade.GetOperadoras().ToList().ConvertAll<SelectListItem>((n) => new SelectListItem { Text = n.Nome, Value = n.Id.ToString() })
            };

            return Json(jsonData, JsonRequestBehavior.AllowGet);

        }

        [AcceptVerbs(HttpVerbs.Post)]
        public void Upload(HttpPostedFileBase fileData, FormCollection formCollection)
        {
            try
            {
                if (fileData.ContentLength > 0)
                {
                    byte[] file = new byte[fileData.InputStream.Length];

                    fileData.InputStream.Read(file, 0, file.Length);

                    this.Messages = tissFacade.LoadLote(file, this.Contratado, this.UsuarioLogado, this.Endereco);

                    Response.Write(true);
                }
            }
            catch (HashException ex)
            {
                Response.StatusCode = Sweb.TotalTiss.Util.HttpStatusCode.NOT_IMPLEMENTED;
            }
            catch (Exception ex)
            {
                Response.StatusCode = Sweb.TotalTiss.Util.HttpStatusCode.FORBIDDEN;
            }
        }

        [Authorize]
        public JsonResult LoadMessages(string sidx, string sord, int page, int rows)
        {
            try
            {
                var jsonData = new
                {
                    total = 1,
                    page = page,
                    records = this.Messages.Count,
                    rows = (
                             from message in this.Messages
                             select new
                             {
                                 id = message.Out_IdGia,
                                 cell = new string[]{
                                                        "0",
                                                        message.Out_Atz ? "Sim" : "Não",
                                                        message.Out_Atz ? "Sim" : "Não",
                                                        message.Out_IdMsg
                                                    }
                             }
                           ).ToArray()

                };

                return Json(jsonData, JsonRequestBehavior.AllowGet);
            }
            catch (Exception exception)
            {
                return Json(new { msg = exception.Message });
            }
        }

        #endregion

    }
}
