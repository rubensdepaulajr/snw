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
using System.Text.RegularExpressions;
using Microsoft.Reporting.WebForms;
using br.com.totaltiss.Data;


public partial class Atz_exeqtd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {       
    }
    private void renderReport()
    {
        string idCtt = null;
        string seqEnd = null;


        idCtt = Profile.Local.IdCtt;
        if (!chkAll.Checked)
            seqEnd = Profile.Local.Cte_SeqEnd;

        DBASQL db = new DBASQL();
        SqlParameter[] prams =	{
	                                db.MakeInParam("@IdFch", SqlDbType.SmallInt,1,grd.SelectedValue),
	                                db.MakeInParam("@IdCtt", SqlDbType.BigInt,8,idCtt),
	                                db.MakeInParam("@Cte_SeqEnd", SqlDbType.TinyInt,1,seqEnd),                                                                    
                                };
        DataSet dtset = db.RunProcDataSet("srAtz_GiaExeQtd", prams, "setGiaExe");
        LocalReport localReport = new LocalReport();
        localReport.ReportPath = @"App_Rpt\GiaExeQtd.rdlc";// Server.MapPath("~/Rpt/SolSdt.rdlc");

        //A method that returns a collection for our report
        //Note: A report can have multiple data sources
        //***List<Employee> employeeCollection = GetData();

        //Give the collection a name (EmployeeCollection) so that we can reference it in our report designer
        //***ReportDataSource reportDataSource = new ReportDataSource("setSolSdt", dtset);

        //***localReport.DataSources.Add(reportDataSource);

        // ###
        //Associa o DataSet com a fonte do ReportViewer
        ReportDataSource reportDataSource = new ReportDataSource("guia_srAtz_GiaExeQtd", dtset.Tables[0]);

        localReport.DataSources.Clear();

        localReport.DataSources.Add(reportDataSource);

        // ###

        string reportType = "PDF";
        string mimeType;
        string encoding;
        string fileNameExtension;

        //The DeviceInfo settings should be changed based on the reportType
        //http://msdn2.microsoft.com/en-us/library/ms155397.aspx
        string deviceInfo = null;
        //"<DeviceInfo>" +
        //"  <OutputFormat>PDF</OutputFormat>" +
        //"  <PageWidth>8.5in</PageWidth>" +
        //"  <PageHeight>11in</PageHeight>" +
        //"  <MarginTop>0.5in</MarginTop>" +
        //"  <MarginLeft>1in</MarginLeft>" +
        //"  <MarginRight>1in</MarginRight>" +
        //"  <MarginBottom>0.5in</MarginBottom>" +
        //"</DeviceInfo>";

        Warning[] warnings;
        string[] streams;
        byte[] renderedBytes;
        //Render the report
        renderedBytes = localReport.Render(reportType, deviceInfo, out mimeType, out encoding, out fileNameExtension, out streams, out warnings);
        db.Dispose();
        //Clear the response stream and write the bytes to the outputstream
        //Set content-disposition to "attachment" so that user is prompted to take an action
        //on the file (open or save)
        Response.Clear();
        Response.ContentType = mimeType;
        Response.AddHeader("content-disposition", "attachment; filename=SMSaude-ResumoFaturamento." + fileNameExtension);
        Response.BinaryWrite(renderedBytes);
        Response.End();
    }
    protected void lbtBuscar_Click(object sender, EventArgs e)
    {

    }
    protected void btnPrint_Click(object sender, ImageClickEventArgs e)
    {
        if (grd.SelectedIndex == -1)
            globall.showMessage(imgMsg, lblMsg, "A competência deve ser selecionada!");
        else
        {
            globall.showMessage(imgMsg, lblMsg, "");
            renderReport();
        }
    }
}
