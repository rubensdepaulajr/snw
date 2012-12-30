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
using System.Text.RegularExpressions;
using System.Data.SqlClient;
using Snw.WebPage;
using Microsoft.Reporting.WebForms;
using br.com.totaltiss.Web.Autorizador;

public partial class Atz_ace : PageBase
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            lblMun.Visible = false;
            ddlMun.Visible = false;

            DBASQL dba = new DBASQL(); 
            SqlDataReader reader;
            dba.RunSql("SELECT IdSit, Sit_Dsc FROM dbo.Atz_Sit ORDER BY IdSit", out reader);
            ddlSit.DataSource = reader;
            ddlSit.DataBind();            
            dba.Dispose();

            DBASQL dba2 = new DBASQL();
            SqlDataReader reader2;
            dba2.RunSql("SELECT IdEsp, Esp_Dsc FROM dbo.Atz_Esp ORDER BY Esp_Dsc", out reader2);
            ddlEsp.DataSource = reader2;
            ddlEsp.DataBind();
            dba2.Dispose();
        }
    }
    private void renderReportAceEsp()
    {
        string giaCrt = null;
        string idEsp = null;
        string idSit = null;
        string sitInd = null;

        if (ddlCrt.SelectedValue != "-1")
            giaCrt = ddlCrt.SelectedValue;
        if (ddlEsp.SelectedValue != "-1")
            idEsp = ddlEsp.SelectedValue;
        if (ddlSit.SelectedValue != "-1")
            idSit = ddlSit.SelectedValue;
        if (ddlSitInd.SelectedValue != "-1")
            sitInd = ddlSitInd.SelectedValue;
        

        DBASQL db = new DBASQL();
        SqlParameter[] prams =	{
                                    db.MakeInParam("@DatIni",SqlDbType.SmallDateTime,2,txtDatIni.Text + " 00:00:00"),
	                                db.MakeInParam("@DatFim",SqlDbType.SmallDateTime,2,txtDatFim.Text + " 23:59:59"),
                                    db.MakeInParam("@Gia_Crt",SqlDbType.Char,1,giaCrt),
                                    db.MakeInParam("@IdEsp",SqlDbType.Int,4,idEsp),
                                    db.MakeInParam("@IdSit",SqlDbType.TinyInt,1,idSit),
                                    db.MakeInParam("@Sit_Ind",SqlDbType.Char,1,sitInd),
                                    db.MakeInParam("@Bnf_Mtr",SqlDbType.VarChar,20,txtBnf_Mtr.Text),
                                    db.MakeInParam("@IdCtt",SqlDbType.BigInt,8,txtIdCtt.Text),
                                    db.MakeInParam("@Prf_Mtr",SqlDbType.VarChar,20,txtPrf_Mtr.Text),
                                    db.MakeOutParam("@Out_Tot",SqlDbType.Int,4)
                                };
        
        DataSet dtset = db.RunProcDataSet("srAtz_AceEsp", prams, "setAceEsp");
        LocalReport localReport = new LocalReport();
        localReport.ReportPath = @"App_Rpt\AceEsp.rdlc";// Server.MapPath("~/Rpt/SolSdt.rdlc");

        //A method that returns a collection for our report
        //Note: A report can have multiple data sources
        //***List<Employee> employeeCollection = GetData();

        //Give the collection a name (EmployeeCollection) so that we can reference it in our report designer
        //***ReportDataSource reportDataSource = new ReportDataSource("setSolSdt", dtset);

        //***localReport.DataSources.Add(reportDataSource);

        // ###
        //Associa o DataSet com a fonte do ReportViewer
        ReportDataSource reportDataSource = new ReportDataSource("Relatorio_srAtz_AceEsp", dtset.Tables[0]);

        localReport.DataSources.Clear();

        localReport.DataSources.Add(reportDataSource);

        // ###

        string reportType = "EXCEL";
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

        db.Dispose();

        Warning[] warnings;
        string[] streams;
        byte[] renderedBytes;
        //Render the report
        renderedBytes = localReport.Render(reportType, deviceInfo, out mimeType, out encoding, out fileNameExtension, out streams, out warnings);

        //Clear the response stream and write the bytes to the outputstream
        //Set content-disposition to "attachment" so that user is prompted to take an action
        //on the file (open or save)
        Response.Clear();
        Response.ContentType = mimeType;
        Response.AddHeader("content-disposition", "attachment; filename=SMSaude-ACEEsp." + fileNameExtension);
        Response.BinaryWrite(renderedBytes);
        Response.End();
    }
    private void renderReportAcePrf()
    {
        string giaCrt = null;
        string idEsp = null;
        string idSit = null;
        string sitInd = null;

        if (ddlCrt.SelectedValue != "-1")
            giaCrt = ddlCrt.SelectedValue;
        if (ddlEsp.SelectedValue != "-1")
            idEsp = ddlEsp.SelectedValue;
        if (ddlSit.SelectedValue != "-1")
            idSit = ddlSit.SelectedValue;
        if (ddlSitInd.SelectedValue != "-1")
            sitInd = ddlSitInd.SelectedValue;


        DBASQL db = new DBASQL();
        SqlParameter[] prams =	{
                                    //db.MakeInParam("@TipRel",SqlDbType.TinyInt,1,2),
                                    db.MakeInParam("@DatIni",SqlDbType.SmallDateTime,2,txtDatIni.Text + " 00:00:00"),
	                                db.MakeInParam("@DatFim",SqlDbType.SmallDateTime,2,txtDatFim.Text + " 23:59:59"),
                                    db.MakeInParam("@Gia_Crt",SqlDbType.Char,1,giaCrt),
                                    db.MakeInParam("@IdEsp",SqlDbType.Int,4,idEsp),
                                    db.MakeInParam("@IdSit",SqlDbType.TinyInt,1,idSit),
                                    db.MakeInParam("@Sit_Ind",SqlDbType.Char,1,sitInd),
                                    db.MakeInParam("@Bnf_Mtr",SqlDbType.VarChar,20,txtBnf_Mtr.Text),
                                    db.MakeInParam("@IdCtt",SqlDbType.BigInt,8,txtIdCtt.Text),
                                    db.MakeInParam("@Prf_Mtr",SqlDbType.VarChar,20,txtPrf_Mtr.Text),
                                    db.MakeOutParam("@Out_Tot",SqlDbType.Int,4)
                                };

        DataSet dtset = db.RunProcDataSet("srAtz_AcePrf", prams, "setAcePrf");
        LocalReport localReport = new LocalReport();
        localReport.ReportPath = @"App_Rpt\AcePrf.rdlc";// Server.MapPath("~/Rpt/SolSdt.rdlc");

        //A method that returns a collection for our report
        //Note: A report can have multiple data sources
        //***List<Employee> employeeCollection = GetData();

        //Give the collection a name (EmployeeCollection) so that we can reference it in our report designer
        //***ReportDataSource reportDataSource = new ReportDataSource("setSolSdt", dtset);

        //***localReport.DataSources.Add(reportDataSource);

        // ###
        //Associa o DataSet com a fonte do ReportViewer
        ReportDataSource reportDataSource = new ReportDataSource("Relatorio_srAtz_AcePrf", dtset.Tables[0]);

        localReport.DataSources.Clear();

        localReport.DataSources.Add(reportDataSource);

        // ###

        string reportType = "EXCEL";
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
        Response.AddHeader("content-disposition", "attachment; filename=SMSaude-ACEPrf." + fileNameExtension);
        Response.BinaryWrite(renderedBytes);
        Response.End();
    }
    private void renderReportAceEspMes()
    {
        string giaCrt = null;
        string idEsp = null;
        string idSit = null;
        string sitInd = null;

        if (ddlCrt.SelectedValue != "-1")
            giaCrt = ddlCrt.SelectedValue;
        if (ddlEsp.SelectedValue != "-1")
            idEsp = ddlEsp.SelectedValue;
        if (ddlSit.SelectedValue != "-1")
            idSit = ddlSit.SelectedValue;
        if (ddlSitInd.SelectedValue != "-1")
            sitInd = ddlSitInd.SelectedValue;


        DBASQL db = new DBASQL();
        SqlParameter[] prams =	{
                                    db.MakeInParam("@DatIni",SqlDbType.SmallDateTime,2,txtDatIni.Text + " 00:00:00"),
	                                db.MakeInParam("@DatFim",SqlDbType.SmallDateTime,2,txtDatFim.Text + " 23:59:59"),
                                    db.MakeInParam("@Gia_Crt",SqlDbType.Char,1,giaCrt),
                                    db.MakeInParam("@IdEsp",SqlDbType.Int,4,idEsp),
                                    db.MakeInParam("@IdSit",SqlDbType.TinyInt,1,idSit),
                                    db.MakeInParam("@Sit_Ind",SqlDbType.Char,1,sitInd),
                                    db.MakeInParam("@Bnf_Mtr",SqlDbType.VarChar,20,txtBnf_Mtr.Text),
                                    db.MakeInParam("@IdCtt",SqlDbType.BigInt,8,txtIdCtt.Text),
                                    db.MakeInParam("@Prf_Mtr",SqlDbType.VarChar,20,txtPrf_Mtr.Text),
                                    db.MakeOutParam("@Out_Tot",SqlDbType.Int,4)
                                };

        DataSet dtset = db.RunProcDataSet("srAtz_AceEspMes", prams, "setAceEspMes");
        LocalReport localReport = new LocalReport();
        localReport.ReportPath = @"App_Rpt\AceEspMes.rdlc";// Server.MapPath("~/Rpt/SolSdt.rdlc");

        //A method that returns a collection for our report
        //Note: A report can have multiple data sources
        //***List<Employee> employeeCollection = GetData();

        //Give the collection a name (EmployeeCollection) so that we can reference it in our report designer
        //***ReportDataSource reportDataSource = new ReportDataSource("setSolSdt", dtset);

        //***localReport.DataSources.Add(reportDataSource);

        // ###
        //Associa o DataSet com a fonte do ReportViewer
        ReportDataSource reportDataSource = new ReportDataSource("Relatorio_srAtz_AceEspMes", dtset.Tables[0]);

        localReport.DataSources.Clear();

        localReport.DataSources.Add(reportDataSource);

        // ###

        string reportType = "EXCEL";
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
        Response.AddHeader("content-disposition", "attachment; filename=SMSaude-ACEEspMes." + fileNameExtension);
        Response.BinaryWrite(renderedBytes);
        Response.End();
    }
    private void renderReportAcePrfMes()
    {
        string giaCrt = null;
        string idEsp = null;
        string idSit = null;
        string sitInd = null;

        if (ddlCrt.SelectedValue != "-1")
            giaCrt = ddlCrt.SelectedValue;
        if (ddlEsp.SelectedValue != "-1")
            idEsp = ddlEsp.SelectedValue;
        if (ddlSit.SelectedValue != "-1")
            idSit = ddlSit.SelectedValue;
        if (ddlSitInd.SelectedValue != "-1")
            sitInd = ddlSitInd.SelectedValue;


        DBASQL db = new DBASQL();
        SqlParameter[] prams =	{
                                    db.MakeInParam("@DatIni",SqlDbType.SmallDateTime,2,txtDatIni.Text + " 00:00:00"),
	                                db.MakeInParam("@DatFim",SqlDbType.SmallDateTime,2,txtDatFim.Text + " 23:59:59"),
                                    db.MakeInParam("@Gia_Crt",SqlDbType.Char,1,giaCrt),
                                    db.MakeInParam("@IdEsp",SqlDbType.Int,4,idEsp),
                                    db.MakeInParam("@IdSit",SqlDbType.TinyInt,1,idSit),
                                    db.MakeInParam("@Sit_Ind",SqlDbType.Char,1,sitInd),
                                    db.MakeInParam("@Bnf_Mtr",SqlDbType.VarChar,20,txtBnf_Mtr.Text),
                                    db.MakeInParam("@IdCtt",SqlDbType.BigInt,8,txtIdCtt.Text),
                                    db.MakeInParam("@Prf_Mtr",SqlDbType.VarChar,20,txtPrf_Mtr.Text),
                                    db.MakeOutParam("@Out_Tot",SqlDbType.Int,4)
                                };

        DataSet dtset = db.RunProcDataSet("srAtz_AcePrfMes", prams, "setAcePrfMes");
        LocalReport localReport = new LocalReport();
        localReport.ReportPath = @"App_Rpt\AcePrfMes.rdlc";// Server.MapPath("~/Rpt/SolSdt.rdlc");

        //A method that returns a collection for our report
        //Note: A report can have multiple data sources
        //***List<Employee> employeeCollection = GetData();

        //Give the collection a name (EmployeeCollection) so that we can reference it in our report designer
        //***ReportDataSource reportDataSource = new ReportDataSource("setSolSdt", dtset);

        //***localReport.DataSources.Add(reportDataSource);

        // ###
        //Associa o DataSet com a fonte do ReportViewer
        ReportDataSource reportDataSource = new ReportDataSource("Relatorio_srAtz_AcePrfMes", dtset.Tables[0]);

        localReport.DataSources.Clear();

        localReport.DataSources.Add(reportDataSource);

        // ###

        string reportType = "EXCEL";
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
        Response.AddHeader("content-disposition", "attachment; filename=SMSaude-ACEPrfMes." + fileNameExtension);
        Response.BinaryWrite(renderedBytes);
        Response.End();
    }
    private void renderReportAcePto()
    {
        string giaCrt = null;
        string idEsp = null;
        string idSit = null;
        string sitInd = null;

        if (ddlCrt.SelectedValue != "-1")
            giaCrt = ddlCrt.SelectedValue;
        if (ddlEsp.SelectedValue != "-1")
            idEsp = ddlEsp.SelectedValue;
        if (ddlSit.SelectedValue != "-1")
            idSit = ddlSit.SelectedValue;
        if (ddlSitInd.SelectedValue != "-1")
            sitInd = ddlSitInd.SelectedValue;


        DBASQL db = new DBASQL();
        SqlParameter[] prams =	{
                                    db.MakeInParam("@DatIni",SqlDbType.SmallDateTime,2,txtDatIni.Text + " 00:00:00"),
	                                db.MakeInParam("@DatFim",SqlDbType.SmallDateTime,2,txtDatFim.Text + " 23:59:59"),
                                    db.MakeInParam("@GiaCrt",SqlDbType.Char,1,giaCrt),
                                    db.MakeInParam("@IdEsp",SqlDbType.Int,4,idEsp),
                                    db.MakeInParam("@IdSit",SqlDbType.TinyInt,1,idSit),
                                    db.MakeInParam("@SitInd",SqlDbType.Char,1,sitInd),
                                    db.MakeInParam("@BnfMtr",SqlDbType.VarChar,20,txtBnf_Mtr.Text),
                                    db.MakeInParam("@IdCtt",SqlDbType.BigInt,8,txtIdCtt.Text),
                                    db.MakeInParam("@PrfMtr",SqlDbType.VarChar,20,txtPrf_Mtr.Text),
                                    db.MakeInParam("@ParMed",SqlDbType.Real,4,txtMed.Text),
                                    db.MakeInParam("@ParQtd",SqlDbType.Real,4,txtQtd.Text),
                                    db.MakeInParam("@ParVlr",SqlDbType.Real,4,txtVlr.Text),
                                    db.MakeOutParam("@OutTot",SqlDbType.Int,4)
                                };

        DataSet dtset = db.RunProcDataSet("srAtz_AcePto", prams, "setAcePto");
        LocalReport localReport = new LocalReport();
        localReport.ReportPath = @"App_Rpt\AcePto.rdlc";

        //A method that returns a collection for our report
        //Note: A report can have multiple data sources
        //***List<Employee> employeeCollection = GetData();

        //Give the collection a name (EmployeeCollection) so that we can reference it in our report designer
        //***ReportDataSource reportDataSource = new ReportDataSource("setSolSdt", dtset);

        //***localReport.DataSources.Add(reportDataSource);

        // ###
        //Associa o DataSet com a fonte do ReportViewer
        ReportDataSource reportDataSource = new ReportDataSource("Relatorio_srAtz_AcePto", dtset.Tables[0]);

        localReport.DataSources.Clear();

        localReport.DataSources.Add(reportDataSource);

        // ###

        string reportType = "EXCEL";
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
        Response.AddHeader("content-disposition", "attachment; filename=SMSaude-ACEPto." + fileNameExtension);
        Response.BinaryWrite(renderedBytes);
        Response.End();
    }
    private void renderReportAcePtoMun()
    {
        string giaCrt = null;
        string idEsp = null;
        string idSit = null;
        string sitInd = null;
        string IdMun = null;
        

        if (ddlCrt.SelectedValue != "-1")
            giaCrt = ddlCrt.SelectedValue;
        if (ddlEsp.SelectedValue != "-1")
            idEsp = ddlEsp.SelectedValue;
        if (ddlSit.SelectedValue != "-1")
            idSit = ddlSit.SelectedValue;
        if (ddlSitInd.SelectedValue != "-1")
            sitInd = ddlSitInd.SelectedValue;
        if (ddlMun.SelectedValue != "-1")
            IdMun = ddlMun.SelectedValue;


        DBASQL db = new DBASQL();
        SqlParameter[] prams =	{
                                    db.MakeInParam("@DatIni",SqlDbType.SmallDateTime,2,txtDatIni.Text + " 00:00:00"),
	                                db.MakeInParam("@DatFim",SqlDbType.SmallDateTime,2,txtDatFim.Text + " 23:59:59"),
                                    db.MakeInParam("@GiaCrt",SqlDbType.Char,1,giaCrt),
                                    db.MakeInParam("@IdEsp",SqlDbType.Int,4,idEsp),
                                    db.MakeInParam("@IdSit",SqlDbType.TinyInt,1,idSit),
                                    db.MakeInParam("@SitInd",SqlDbType.Char,1,sitInd),
                                    db.MakeInParam("@BnfMtr",SqlDbType.VarChar,20,txtBnf_Mtr.Text),
                                    db.MakeInParam("@IdCtt",SqlDbType.BigInt,8,txtIdCtt.Text),
                                    db.MakeInParam("@PrfMtr",SqlDbType.VarChar,20,txtPrf_Mtr.Text),
                                    db.MakeInParam("@IdMun",SqlDbType.SmallInt,2,IdMun),
                                    db.MakeInParam("@ParMed",SqlDbType.Real,4,txtMed.Text),
                                    db.MakeInParam("@ParQtd",SqlDbType.Real,4,txtQtd.Text),
                                    db.MakeInParam("@ParVlr",SqlDbType.Real,4,txtVlr.Text),
                                    db.MakeOutParam("@OutTot",SqlDbType.Int,4)
                                };

        DataSet dtset = db.RunProcDataSet("srAtz_AcePtoMun", prams, "setAcePtoMun");
        LocalReport localReport = new LocalReport();
        localReport.ReportPath = @"App_Rpt\AcePtoMun.rdlc";

        //A method that returns a collection for our report
        //Note: A report can have multiple data sources
        //***List<Employee> employeeCollection = GetData();

        //Give the collection a name (EmployeeCollection) so that we can reference it in our report designer
        //***ReportDataSource reportDataSource = new ReportDataSource("setSolSdt", dtset);

        //***localReport.DataSources.Add(reportDataSource);

        // ###
        //Associa o DataSet com a fonte do ReportViewer
        ReportDataSource reportDataSource = new ReportDataSource("Relatorio_srAtz_AcePtoMun", dtset.Tables[0]);

        localReport.DataSources.Clear();

        localReport.DataSources.Add(reportDataSource);

        // ###

        string reportType = "EXCEL";
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
        Response.AddHeader("content-disposition", "attachment; filename=SMSaude-ACEPtoMun." + fileNameExtension);
        Response.BinaryWrite(renderedBytes);
        Response.End();
    }
    protected void btnOk_Click(object sender, ImageClickEventArgs e)
    {
        if ((rblTip.SelectedValue == "5" || rblTip.SelectedValue == "6") &&
            ((string.IsNullOrEmpty(txtMed.Text)) || (string.IsNullOrEmpty(txtQtd.Text)) || 
             (string.IsNullOrEmpty(txtVlr.Text))))
            globall.showMessage(imgMsg,lblMsg,"Os parâmetros devem ser informados!");
        else if ((rblTip.SelectedValue == "5" || rblTip.SelectedValue == "6") && (ddlEsp.SelectedValue == "-1"))
            globall.showMessage(imgMsg,lblMsg,"A especialidade deve ser selecioanada!"); 
        else if (string.IsNullOrEmpty(txtDatIni.Text) && string.IsNullOrEmpty(txtDatFim.Text))
            globall.showMessage(imgMsg,lblMsg,"O período deve ser informado!");
        else if (!string.IsNullOrEmpty(txtDatIni.Text) && !globall.isDate(txtDatIni.Text))
            globall.showMessage(imgMsg, lblMsg, "Data Inicial inválida.");
        else if (!string.IsNullOrEmpty(txtDatFim.Text) && !globall.isDate(txtDatFim.Text))
            globall.showMessage(imgMsg, lblMsg, "Data Final inválida.");
        else if (!string.IsNullOrEmpty(txtIdCtt.Text) && !globall.isInteger(txtIdCtt.Text))
            globall.showMessage(imgMsg, lblMsg, "Matrícula do Contratado inválida!");
        else
        {
            if (rblTip.SelectedValue == "1")
            {
                if (rblTipSai.SelectedValue == "1")
                {
                    dtsEsp.SelectParameters["DatIni"].DefaultValue = txtDatIni.Text + " 00:00:00";
                    dtsEsp.SelectParameters["DatFim"].DefaultValue = txtDatFim.Text + " 23:59:59";
                    if (ddlCrt.SelectedValue != "-1")
                        dtsEsp.SelectParameters["Gia_Crt"].DefaultValue = ddlCrt.SelectedValue;
                    else
                        dtsEsp.SelectParameters["Gia_Crt"].DefaultValue = string.Empty;
                    if (ddlEsp.SelectedValue != "-1")
                        dtsEsp.SelectParameters["IdEsp"].DefaultValue = ddlEsp.SelectedValue;
                    else
                        dtsEsp.SelectParameters["IdEsp"].DefaultValue = string.Empty;
                    if (ddlSit.SelectedValue != "-1")
                        dtsEsp.SelectParameters["IdSit"].DefaultValue = ddlSit.SelectedValue;
                    else
                        dtsEsp.SelectParameters["IdSit"].DefaultValue = string.Empty;
                    if (ddlSitInd.SelectedValue != "-1")
                        dtsEsp.SelectParameters["Sit_Ind"].DefaultValue = ddlSitInd.SelectedValue;
                    else
                        dtsEsp.SelectParameters["Sit_Ind"].DefaultValue = string.Empty;
                    dtsEsp.SelectParameters["Bnf_Mtr"].DefaultValue = txtBnf_Mtr.Text;
                    dtsEsp.SelectParameters["IdCtt"].DefaultValue = txtIdCtt.Text;
                    dtsEsp.SelectParameters["Prf_Mtr"].DefaultValue = txtPrf_Mtr.Text;
                    grdEsp.DataBind();
                }
                else
                    renderReportAceEsp();
            }
            else if (rblTip.SelectedValue == "2")
            {
                if (rblTipSai.SelectedValue == "1")
                {
                    //dtsPrf.SelectParameters["TipRel"].DefaultValue = "1";
                    dtsPrf.SelectParameters["DatIni"].DefaultValue = txtDatIni.Text + " 00:00:00";
                    dtsPrf.SelectParameters["DatFim"].DefaultValue = txtDatFim.Text + " 23:59:59";
                    if (ddlCrt.SelectedValue != "-1")
                        dtsPrf.SelectParameters["Gia_Crt"].DefaultValue = ddlCrt.SelectedValue;
                    else
                        dtsPrf.SelectParameters["Gia_Crt"].DefaultValue = string.Empty;
                    if (ddlEsp.SelectedValue != "-1")
                        dtsPrf.SelectParameters["IdEsp"].DefaultValue = ddlEsp.SelectedValue;
                    else
                        dtsPrf.SelectParameters["IdEsp"].DefaultValue = string.Empty;
                    if (ddlSit.SelectedValue != "-1")
                        dtsPrf.SelectParameters["IdSit"].DefaultValue = ddlSit.SelectedValue;
                    else
                        dtsPrf.SelectParameters["IdSit"].DefaultValue = string.Empty;
                    if (ddlSitInd.SelectedValue != "-1")
                        dtsPrf.SelectParameters["Sit_Ind"].DefaultValue = ddlSitInd.SelectedValue;
                    else
                        dtsPrf.SelectParameters["Sit_Ind"].DefaultValue = string.Empty;
                    dtsPrf.SelectParameters["Bnf_Mtr"].DefaultValue = txtBnf_Mtr.Text;
                    dtsPrf.SelectParameters["IdCtt"].DefaultValue = txtIdCtt.Text;
                    dtsPrf.SelectParameters["Prf_Mtr"].DefaultValue = txtPrf_Mtr.Text;
                    dtsPrf.DataBind();
                }
                else
                    renderReportAcePrf();
            }
            else if (rblTip.SelectedValue == "3")
            {
                if (rblTipSai.SelectedValue == "1")
                {
                    dtsEspMes.SelectParameters["DatIni"].DefaultValue = txtDatIni.Text + " 00:00:00";
                    dtsEspMes.SelectParameters["DatFim"].DefaultValue = txtDatFim.Text + " 23:59:59";
                    if (ddlCrt.SelectedValue != "-1")
                        dtsEspMes.SelectParameters["Gia_Crt"].DefaultValue = ddlCrt.SelectedValue;
                    else
                        dtsEspMes.SelectParameters["Gia_Crt"].DefaultValue = string.Empty;
                    if (ddlEsp.SelectedValue != "-1")
                        dtsEspMes.SelectParameters["IdEsp"].DefaultValue = ddlEsp.SelectedValue;
                    else
                        dtsEspMes.SelectParameters["IdEsp"].DefaultValue = string.Empty;
                    if (ddlSit.SelectedValue != "-1")
                        dtsEspMes.SelectParameters["IdSit"].DefaultValue = ddlSit.SelectedValue;
                    else
                        dtsEspMes.SelectParameters["IdSit"].DefaultValue = string.Empty;
                    if (ddlSitInd.SelectedValue != "-1")
                        dtsEspMes.SelectParameters["Sit_Ind"].DefaultValue = ddlSitInd.SelectedValue;
                    else
                        dtsPrfMes.SelectParameters["Sit_Ind"].DefaultValue = string.Empty;
                    dtsEspMes.SelectParameters["Bnf_Mtr"].DefaultValue = txtBnf_Mtr.Text;
                    dtsEspMes.SelectParameters["IdCtt"].DefaultValue = txtIdCtt.Text;
                    dtsEspMes.SelectParameters["Prf_Mtr"].DefaultValue = txtPrf_Mtr.Text;
                    dtsEspMes.DataBind();
                }
                else
                    renderReportAceEspMes();
            }
            else if (rblTip.SelectedValue == "4")
            {
                if (rblTipSai.SelectedValue == "1")
                {
                    dtsPrfMes.SelectParameters["DatIni"].DefaultValue = txtDatIni.Text + " 00:00:00";
                    dtsPrfMes.SelectParameters["DatFim"].DefaultValue = txtDatFim.Text + " 23:59:59";
                    if (ddlCrt.SelectedValue != "-1")
                        dtsPrfMes.SelectParameters["Gia_Crt"].DefaultValue = ddlCrt.SelectedValue;
                    else
                        dtsPrfMes.SelectParameters["Gia_Crt"].DefaultValue = string.Empty;
                    if (ddlEsp.SelectedValue != "-1")
                        dtsPrfMes.SelectParameters["IdEsp"].DefaultValue = ddlEsp.SelectedValue;
                    else
                        dtsPrfMes.SelectParameters["IdEsp"].DefaultValue = string.Empty;
                    if (ddlSit.SelectedValue != "-1")
                        dtsPrfMes.SelectParameters["IdSit"].DefaultValue = ddlSit.SelectedValue;
                    else
                        dtsPrfMes.SelectParameters["IdSit"].DefaultValue = string.Empty;
                    if (ddlSitInd.SelectedValue != "-1")
                        dtsPrfMes.SelectParameters["Sit_Ind"].DefaultValue = ddlSitInd.SelectedValue;
                    else
                        dtsPrfMes.SelectParameters["Sit_Ind"].DefaultValue = string.Empty;
                    dtsPrfMes.SelectParameters["Bnf_Mtr"].DefaultValue = txtBnf_Mtr.Text;
                    dtsPrfMes.SelectParameters["IdCtt"].DefaultValue = txtIdCtt.Text;
                    dtsPrfMes.SelectParameters["Prf_Mtr"].DefaultValue = txtPrf_Mtr.Text;
                    dtsPrfMes.DataBind();
                }
                else
                    renderReportAcePrfMes();
            }
            else if (rblTip.SelectedValue == "5")
            {
                if (rblTipSai.SelectedValue == "1")
                {
                    dtsPto.SelectParameters["DatIni"].DefaultValue = txtDatIni.Text + " 00:00:00";
                    dtsPto.SelectParameters["DatFim"].DefaultValue = txtDatFim.Text + " 23:59:59";
                    if (ddlCrt.SelectedValue != "-1")
                        dtsPto.SelectParameters["GiaCrt"].DefaultValue = ddlCrt.SelectedValue;
                    else
                        dtsPto.SelectParameters["GiaCrt"].DefaultValue = string.Empty;
                    if (ddlEsp.SelectedValue != "-1")
                        dtsPto.SelectParameters["IdEsp"].DefaultValue = ddlEsp.SelectedValue;
                    else
                        dtsPto.SelectParameters["IdEsp"].DefaultValue = string.Empty;
                    if (ddlSit.SelectedValue != "-1")
                        dtsPto.SelectParameters["IdSit"].DefaultValue = ddlSit.SelectedValue;
                    else
                        dtsPto.SelectParameters["IdSit"].DefaultValue = string.Empty;
                    if (ddlSitInd.SelectedValue != "-1")
                        dtsPto.SelectParameters["SitInd"].DefaultValue = ddlSitInd.SelectedValue;
                    else
                        dtsPto.SelectParameters["SitInd"].DefaultValue = string.Empty;
                    dtsPto.SelectParameters["BnfMtr"].DefaultValue = txtBnf_Mtr.Text;
                    dtsPto.SelectParameters["IdCtt"].DefaultValue = txtIdCtt.Text;
                    dtsPto.SelectParameters["PrfMtr"].DefaultValue = txtPrf_Mtr.Text;
                    dtsPto.SelectParameters["ParMed"].DefaultValue = txtMed.Text;
                    dtsPto.SelectParameters["ParQtd"].DefaultValue = txtQtd.Text;
                    dtsPto.SelectParameters["ParVlr"].DefaultValue = txtVlr.Text;
                    dtsPto.DataBind();
                }
                else
                    renderReportAcePto();
            }
            else if (rblTip.SelectedValue == "6")
            {
                if (rblTipSai.SelectedValue == "1")
                {
                    dtsPtoMun.SelectParameters["DatIni"].DefaultValue = txtDatIni.Text + " 00:00:00";
                    dtsPtoMun.SelectParameters["DatFim"].DefaultValue = txtDatFim.Text + " 23:59:59";
                    if (ddlCrt.SelectedValue != "-1")
                        dtsPtoMun.SelectParameters["GiaCrt"].DefaultValue = ddlCrt.SelectedValue;
                    else
                        dtsPtoMun.SelectParameters["GiaCrt"].DefaultValue = string.Empty;
                    if (ddlEsp.SelectedValue != "-1")
                        dtsPtoMun.SelectParameters["IdEsp"].DefaultValue = ddlEsp.SelectedValue;
                    else
                        dtsPtoMun.SelectParameters["IdEsp"].DefaultValue = string.Empty;
                    if (ddlSit.SelectedValue != "-1")
                        dtsPtoMun.SelectParameters["IdSit"].DefaultValue = ddlSit.SelectedValue;
                    else
                        dtsPtoMun.SelectParameters["IdSit"].DefaultValue = string.Empty;
                    if (ddlSitInd.SelectedValue != "-1")
                        dtsPtoMun.SelectParameters["SitInd"].DefaultValue = ddlSitInd.SelectedValue;
                    else
                        dtsPtoMun.SelectParameters["SitInd"].DefaultValue = string.Empty;
                    dtsPtoMun.SelectParameters["BnfMtr"].DefaultValue = txtBnf_Mtr.Text;
                    dtsPtoMun.SelectParameters["IdCtt"].DefaultValue = txtIdCtt.Text;
                    dtsPtoMun.SelectParameters["PrfMtr"].DefaultValue = txtPrf_Mtr.Text;
                    if (ddlMun.SelectedValue != "-1")
                        dtsPtoMun.SelectParameters["IdMun"].DefaultValue = ddlMun.SelectedValue;
                    else
                        dtsPtoMun.SelectParameters["IdMun"].DefaultValue = string.Empty;
                    dtsPtoMun.SelectParameters["ParMed"].DefaultValue = txtMed.Text;
                    dtsPtoMun.SelectParameters["ParQtd"].DefaultValue = txtQtd.Text;
                    dtsPtoMun.SelectParameters["ParVlr"].DefaultValue = txtVlr.Text;
                    dtsPtoMun.DataBind();
                }
                else
                    renderReportAcePtoMun();
            }
            mvw.ActiveViewIndex = Convert.ToInt32(rblTip.SelectedValue);
        }
    }
    protected void btnNewPsq_Click(object sender, ImageClickEventArgs e)
    {
        mvw.ActiveViewIndex = 0;
    }
    #region Grid Navegação
    protected void ddlGrdEspPages_SelectedIndexChanged(object sender, EventArgs e)
    {
        globall.selectPageGrid(grdEsp);
    }
    protected void ddlGrdPrfPages_SelectedIndexChanged(object sender, EventArgs e)
    {
        globall.selectPageGrid(grdPrf);
    }
    protected void ddlGrdEspMesPages_SelectedIndexChanged(object sender, EventArgs e)
    {
        globall.selectPageGrid(grdEspMes);
    }
    protected void ddlGrdPrfMesPages_SelectedIndexChanged(object sender, EventArgs e)
    {
        globall.selectPageGrid(grdPrfMes);
    }
    protected void ddlGrdPtoPages_SelectedIndexChanged(object sender, EventArgs e)
    {
        globall.selectPageGrid(grdPto);
    }
    protected void ddlGrdPtoMunPages_SelectedIndexChanged(object sender, EventArgs e)
    {
        globall.selectPageGrid(grdPtoMun);
    }

    protected void paginateGrdEsp(object sender, CommandEventArgs e)
    {
        globall.getCurrentPageGrid(grdEsp, e.CommandArgument.ToString());
    }
    protected void paginateGrdPrf(object sender, CommandEventArgs e)
    {
        globall.getCurrentPageGrid(grdPrf, e.CommandArgument.ToString());
    }
    protected void paginateGrdEspMes(object sender, CommandEventArgs e)
    {
        globall.getCurrentPageGrid(grdEspMes, e.CommandArgument.ToString());
    }
    protected void paginateGrdPrfMes(object sender, CommandEventArgs e)
    {
        globall.getCurrentPageGrid(grdPrfMes, e.CommandArgument.ToString());
    }
    protected void paginateGrdPto(object sender, CommandEventArgs e)
    {
        globall.getCurrentPageGrid(grdPto, e.CommandArgument.ToString());
    }
    protected void paginateGrdPtoMun(object sender, CommandEventArgs e)
    {
        globall.getCurrentPageGrid(grdPtoMun, e.CommandArgument.ToString());
    }
    #endregion
    protected void btnPgaIni_Click(object sender, ImageClickEventArgs e)    
    {
        WebProfile Profile = WebProfile.GetProfile("username");
        gotoPagInicial(Profile.Seguranca.IdPpl);
    }
    protected void dtsPrf_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        lblTotPrf.Text = "Total de solicitações/Total de Consultas: "+ e.Command.Parameters["@Out_Tot"].Value.ToString();
    }
    protected void dtsEsp_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        lblTotEsp.Text = "Total de solicitações/Total de Consultas: "+ e.Command.Parameters["@Out_Tot"].Value.ToString();
    }
    protected void rblTip_SelectedIndexChanged(object sender, EventArgs e)
    {
        pnlPto.Visible = (rblTip.SelectedValue == "5" || rblTip.SelectedValue == "6");
        lblMun.Visible = (rblTip.SelectedValue == "6");
        ddlMun.Visible = lblMun.Visible;
    }
    protected void dtsPto_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        lblTotPto.Text = "Total de solicitações/Total de Consultas: " + e.Command.Parameters["@OutTot"].Value.ToString();
    }
}
