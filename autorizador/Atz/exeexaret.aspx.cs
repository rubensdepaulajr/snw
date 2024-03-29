﻿using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using Microsoft.Reporting.WebForms;

public partial class Atz_exeexaret : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string bloco1 = Request.QueryString["b1"];
            string bloco2 = Request.QueryString["b2"];
            string idSol = Request.QueryString["Sol"];
            lblSnh.Text = Request.QueryString["Snh"];
            hdfIdGia.Value = Request.QueryString["Gia"];

            if (bloco1 == "0")
                pnlAtz.Visible = false;

            if (bloco2 == "0")
                pnlPen.Visible = false;
        }
    }

    protected void btnPgnIni_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("prf.aspx");
    }
    protected void btnFhaPci_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("fhapci.aspx?Gia=" + hdfIdGia.Value);
    }


    protected void btnNewSol_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("exeexa.aspx");
    }
    private void renderReport(string idGia, string rdlcName, string fileName)
    {
        string idGiaLte = string.Empty;

        if (fileName == "ExeSPSADT")
        {
            idGiaLte = idGia;
            idGia = string.Empty;
        }

        DBASQL db = new DBASQL();

        SqlParameter[] prams =	{
                                    db.MakeInParam("@IdGia", SqlDbType.Int, 4, idGia)
                                };

        SqlParameter[] prams2 =	{
                                    db.MakeInParam("@IdGia", SqlDbType.Int, 4, idGia),
                                    db.MakeInParam("@IdGiaLte", SqlDbType.NVarChar, 20, idGiaLte),
                                };

        DataSet dtset = db.RunProcDataSet("srAtz_GiaSdt", "srAtz_GiaSdtPdm", prams, prams2, "setGuiaSADT", "setGuiaSADTProc");

        LocalReport localReport = new LocalReport();
        localReport.ReportPath = @"App_Rpt\"+ rdlcName;

        //A method that returns a collection for our report
        //Note: A report can have multiple data sources
        //***List<Employee> employeeCollection = GetData();

        //Give the collection a name (EmployeeCollection) so that we can reference it in our report designer
        //***ReportDataSource reportDataSource = new ReportDataSource("setSolSdt", dtset);

        //***localReport.DataSources.Add(reportDataSource);

        // ###
        //Associa o DataSet com a fonte do ReportViewer
        ReportDataSource reportDataSource = new ReportDataSource("guia_srAtz_GiaSdt", dtset.Tables[0]);

        localReport.DataSources.Clear();

        localReport.DataSources.Add(reportDataSource);

        ReportDataSource reportDataSource2 = new ReportDataSource("guia_srAtz_GiaSdtPdm", dtset.Tables[1]);
        localReport.DataSources.Add(reportDataSource2);
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
        Response.AddHeader("content-disposition", "attachment; filename="+ fileName +"." + fileNameExtension);
        Response.BinaryWrite(renderedBytes);
        Response.End();
    }

    protected void btnPrintGuia_Click(object sender, ImageClickEventArgs e)
    {
        string[] vetGia = hdfIdGia.Value.Split(new char[] { ',' });

        foreach (string idGia in vetGia)
        {
            renderReport(idGia, "GiaSPSADT.rdlc", "GuiaSPSADT");
        }        
    }

    protected void btnPgaIni_Click(object sender, ImageClickEventArgs e)
    {
        // Seleciona a página inicial do usuário de acordo com o papel
        string idPpl = Profile.Seguranca.IdPpl;
        if (idPpl == "2")
            Response.Redirect("prf.aspx");
        else if (idPpl == "4")
            Response.Redirect("atd.aspx");
        else if (idPpl == "3")
            Response.Redirect("exeexa.aspx");
        else if (idPpl == "5")
            Response.Redirect("exeexa.aspx");
        else if (idPpl == "6")
            Response.Redirect("exeexa.aspx");
        else
            Response.Redirect("pes.aspx");
    }


    protected void bntPrint_Click(object sender, ImageClickEventArgs e)
    {
        renderReport(hdfIdGia.Value, "ExeSdt.rdlc", "ExeSPSADT"); 
    }
}
