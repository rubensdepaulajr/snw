using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using Microsoft.Reporting.WebForms;
using rptViewer;

public partial class Rpt_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        string thisConnectionString = ConfigurationManager.ConnectionStrings["MedicallConnectionString"].ConnectionString;
        //Conecção com o servidor
        SqlConnection thisConnection = new SqlConnection(thisConnectionString);

        //Torna o Relatório visível
        ReportViewer1.Visible = true;

        //Caminho do formulário modelo do ReportView
        ReportViewer1.LocalReport.ReportPath = setReport.Rpt.GetRptPathModelo();
        
        //Associa o DataSet com a fonte do ReportViewer
        ReportDataSource datasource = new ReportDataSource(setReport.Rpt.GetRptPathDataSetMaster(), setReport.Rpt.GetDataSet().Tables[0]);
        //##

        ReportViewer1.LocalReport.DataSources.Clear();

        ReportViewer1.LocalReport.DataSources.Add(datasource);
        //##
        if (setReport.Rpt.GetRptPathDataSetDetail() != string.Empty)
        {
            ReportDataSource datasource2 = new ReportDataSource(setReport.Rpt.GetRptPathDataSetDetail(), setReport.Rpt.GetDataSet().Tables[1]);
            ReportViewer1.LocalReport.DataSources.Add(datasource2);
        }
        ReportViewer1.LocalReport.Refresh();

    }
    
}
