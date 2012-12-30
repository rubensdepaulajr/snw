using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace rptViewer
{
    /// <summary>
    /// Summary description for Relatorio Class
    /// </summary>
    public class reportViewer
    {
        private DataSet dsRpt;
        private string rptPathModelo;
        private string rptPathDataSetMaster;
        private string rptPathDataSetDetail;
        private string pageBack;

        public reportViewer()
        {
            this.dsRpt = new DataSet();
            this.rptPathModelo = string.Empty;
            this.rptPathDataSetMaster = string.Empty;
            this.rptPathDataSetDetail = string.Empty;
            this.pageBack = string.Empty; ;
        }

        public reportViewer(DataSet ds, string rptPath, string rptDataSetMaster, string rptDataSetDetail, string pageBack)
        {
            this.SetRelatorio(ds, rptPath, rptDataSetMaster, rptDataSetDetail, pageBack);
        }

        public void SetRelatorio(DataSet ds, string RptPath, string RptDataSetMaster, string RptDataSetDetail, string PageBack)
        {
            this.dsRpt = ds;
            this.rptPathModelo = RptPath;
            this.rptPathDataSetMaster = RptDataSetMaster;
            this.rptPathDataSetDetail = RptDataSetDetail;
            this.pageBack = PageBack;
        }

        public DataSet GetDataSet()
        {
            return this.dsRpt;
        }

        public string GetRptPathModelo()
        {
            return this.rptPathModelo;
        }

        public string GetRptPathDataSetMaster()
        {
            return this.rptPathDataSetMaster;
        }

        public string GetRptPathDataSetDetail()
        {
            return this.rptPathDataSetDetail;
        }

        public string GetPageBack()
        {
            //string page = this.pageBack;
            string page = this.pageBack.ToString().Substring(4, this.pageBack.ToString().Length - 9);
            page = "../" + page.Replace("_", "/") + ".aspx";


            //Acertar o endereço de retorno
            //page = "../" + page.ToString().Substring(4, page.ToString().Length - 19) + "/" + page.ToString().Substring(8, page.ToString().Length - 13) + ".aspx";

            return page;
        }

    }
}