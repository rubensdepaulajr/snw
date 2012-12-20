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
using Microsoft.Reporting.WebForms;
using System.Data.SqlClient;

public partial class Atz_pesres : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (globall.papelDaOperadora(Convert.ToInt32(Profile.Seguranca.IdPpl)))
                hdfPapelOperadora.Value = "True";
            else
                hdfPapelOperadora.Value = "False";

            String[] s = PreviousPage.campo.Split(new char[] { '|' });

            //if (!String.IsNullOrEmpty(s[0]))
            dts.SelectParameters["Gia_DatIni"].DefaultValue = s[0];
            //if (!String.IsNullOrEmpty(s[1]))
            dts.SelectParameters["Gia_DatFim"].DefaultValue = s[1];
            if (s[2] != "-1")
                dts.SelectParameters["IdEsp"].DefaultValue = s[2];
            if (s[3] != "-1")
              dts.SelectParameters["Gia_Tip"].DefaultValue = s[3];
            if (s[4] != "-1")
                dts.SelectParameters["IdSit"].DefaultValue = s[4];
            if (s[5] != "-1")
                dts.SelectParameters["Sit_Ind"].DefaultValue = s[5];
            dts.SelectParameters["Pdm_Cod"].DefaultValue = s[6];
            dts.SelectParameters["Gia_Snh"].DefaultValue = s[7];
            dts.SelectParameters["Bnf_Mtr"].DefaultValue = s[8];
            dts.SelectParameters["IdCtt"].DefaultValue = s[9];
            dts.SelectParameters["Prf_Mtr"].DefaultValue = s[10];
            dts.SelectParameters["IdPpl"].DefaultValue = Profile.Seguranca.IdPpl;
            dts.SelectParameters["Ord"].DefaultValue = PreviousPage.ordem;
            grd.DataBind();
            // O valor do procedimento deve ser visualizado somente pela operadora
            if (hdfPapelOperadora.Value == "True")
                grd.Columns[7].Visible = true;
            else
                grd.Columns[7].Visible = false;
        }
    }
    public String campo
    {
        get
        {
            String aux;

            aux = grd.SelectedDataKey.Values["Gia_DatEms"].ToString() + "|" +
                    grd.SelectedDataKey.Values["IdCtt"].ToString() + "|" +
                    grd.SelectedDataKey.Values["Prf_Mtr"].ToString() + "|" +
                    grd.SelectedDataKey.Values["Bnf_Mtr"].ToString() + "|" +
                    grd.SelectedDataKey.Values["Bnf_Nme"].ToString() + "|" +
                    grd.SelectedDataKey.Values["Gia_Tip"].ToString() + "|" +
                    grd.SelectedDataKey.Values["Gia_Crt"].ToString() + "|" +
                    grd.SelectedDataKey.Values["Pdm_Cod"].ToString() + "|" +
                    grd.SelectedDataKey.Values["Pdm_Dsc"].ToString() + "|" +
                    grd.SelectedDataKey.Values["Gpd_QtdSol"].ToString() + "|" +
                    grd.SelectedDataKey.Values["Gpd_QtdAtz"].ToString() + "|" +
                    grd.SelectedDataKey.Values["Sit_Dsc"].ToString() + "|" +
                    grd.SelectedDataKey.Values["Gia_Snh"].ToString() + "|" +
                    grd.SelectedDataKey.Values["Prf_Sol"].ToString() + "|" +
                    grd.SelectedDataKey.Values["Esp_Sol"].ToString() + "|" +
                    grd.SelectedDataKey.Values["Prf_Exe"].ToString() + "|" +
                    grd.SelectedDataKey.Values["Esp_Exe"].ToString() + "|" +
                    grd.SelectedDataKey.Values["Pdm_QtdCh_"].ToString();
             
            return aux;
        }
    }
    protected void gvHover_RowCreated(object sender, GridViewRowEventArgs e)
    {
        //Add CSS class on header row.
        if (e.Row.RowType == DataControlRowType.Header)
            e.Row.CssClass = "header";

        //Add CSS class on normal row.
        if (e.Row.RowType == DataControlRowType.DataRow &&
                  e.Row.RowState == DataControlRowState.Normal)
            e.Row.CssClass = "normal";

        //Add CSS class on alternate row.
        if (e.Row.RowType == DataControlRowType.DataRow &&
                  e.Row.RowState == DataControlRowState.Alternate)
            e.Row.CssClass = "alternate";
    }

    /*preenche informações(dropdown e total de paginas) do paginador do grid da aba SOLICITAÇÕES AUTORIZADAS*/
    protected void grd_DataBound(object sender, EventArgs e)
    {
        GridViewRow gvrPager = grd.BottomPagerRow;
        if (gvrPager == null)
            return;
        // get your controls from the gridview
        DropDownList ddlPages = (DropDownList)gvrPager.Cells[0].FindControl("ddlPages");
        Label lblPageCount = (Label)gvrPager.Cells[0].FindControl("lblPageCount");

        if (ddlPages != null)
        {
            // populate pager
            for (int i = 0; i < grd.PageCount; i++)
            {
                int intPageNumber = i + 1;
                ListItem lstItem = new ListItem(intPageNumber.ToString());
                if (i == grd.PageIndex)
                    lstItem.Selected = true;
                ddlPages.Items.Add(lstItem);
            }
        }
        // populate page count
        if (lblPageCount != null)
            lblPageCount.Text = grd.PageCount.ToString();
    }

    /*dropdown do paginador da aba SOLICITAÇÕES AUTORIZADAS*/
    protected void ddlPages_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow gvrPager = grd.BottomPagerRow;
        DropDownList ddlPages = (DropDownList)gvrPager.Cells[0].FindControl("ddlPages");
        grd.PageIndex = ddlPages.SelectedIndex;
        // a method to populate your grid
        PopulateGridSolAut();
    }

    /*função que controla os botões de paginação da aba SOLICITAÇÕES AUTORIZADAS*/
    protected void Paginategrd(object sender, CommandEventArgs e)
    {
        // get the current page selected
        int intCurIndex = grd.PageIndex;

        switch (e.CommandArgument.ToString().ToLower())
        {
            case "first":
                grd.PageIndex = 0;
                break;
            case "prev":
                if (intCurIndex > 0)
                    grd.PageIndex = intCurIndex - 1;
                break;
            case "next":
                if (intCurIndex <= grd.PageCount - 1)
                    grd.PageIndex = intCurIndex + 1;
                break;
            case "last":
                grd.PageIndex = grd.PageCount;
                break;
        }
        // popultate the gridview control
        PopulateGridSolAut();
    }

    /* dropdown do paginador da aba SOLICITAÇÕES AUTORIZADAS*/
    protected void PopulateGridSolAut()
    {
        grd.DataBind();
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
    protected void btnNewPsq_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Pes.aspx");
    }
    private void renderReport()
    {
        DBASQL db = new DBASQL();
        SqlParameter[] prams =	{
                                    db.MakeInParam("@Gia_DatIni",SqlDbType.SmallDateTime,2,dts.SelectParameters["Gia_DatIni"].DefaultValue),
	                                db.MakeInParam("@Gia_DatFim",SqlDbType.SmallDateTime,2,dts.SelectParameters["Gia_DatFim"].DefaultValue),
                                    db.MakeInParam("@IdSit",SqlDbType.TinyInt,1,dts.SelectParameters["IdSit"].DefaultValue),
                                    db.MakeInParam("@Sit_Ind",SqlDbType.Char,1,dts.SelectParameters["Sit_Ind"].DefaultValue),
                                    db.MakeInParam("@IdEsp",SqlDbType.Int,4,dts.SelectParameters["IdEsp"].DefaultValue),
                                    db.MakeInParam("@Gia_Tip",SqlDbType.TinyInt,1,dts.SelectParameters["Gia_Tip"].DefaultValue),
                                    db.MakeInParam("@Pdm_Cod",SqlDbType.VarChar,20,dts.SelectParameters["Pdm_Cod"].DefaultValue),
                                    db.MakeInParam("@Gia_Snh",SqlDbType.VarChar,20,dts.SelectParameters["Gia_Snh"].DefaultValue),
                                    db.MakeInParam("@Bnf_Mtr",SqlDbType.VarChar,20,dts.SelectParameters["Bnf_Mtr"].DefaultValue),
                                    db.MakeInParam("@IdCtt",SqlDbType.BigInt,8,dts.SelectParameters["IdCtt"].DefaultValue),
                                    db.MakeInParam("@Prf_Mtr",SqlDbType.VarChar,20,dts.SelectParameters["Prf_Mtr"].DefaultValue),
                                    db.MakeInParam("IdPpl",SqlDbType.TinyInt,1, Profile.Seguranca.IdPpl),
                                    db.MakeInParam("@Ord",SqlDbType.NVarChar,20,dts.SelectParameters["Ord"].DefaultValue)
                                };

        DataSet dtset = db.RunProcDataSet("ssAtz_Pes", prams, "setPes");
        LocalReport localReport = new LocalReport();
        if (hdfPapelOperadora.Value == "True")
        {
            if (rblDestino.SelectedValue == "PDF")
                localReport.ReportPath = @"App_Rpt\AtzPesPdf.rdlc";
            else
                localReport.ReportPath = @"App_Rpt\AtzPesExcel.rdlc";
        }
        else
            localReport.ReportPath = @"App_Rpt\AtzPes.rdlc";

        //A method that returns a collection for our report
        //Note: A report can have multiple data sources
        //***List<Employee> employeeCollection = GetData();

        //Give the collection a name (EmployeeCollection) so that we can reference it in our report designer
        //***ReportDataSource reportDataSource = new ReportDataSource("setSolSdt", dtset);

        //***localReport.DataSources.Add(reportDataSource);

        // ###
        //Associa o DataSet com a fonte do ReportViewer
        ReportDataSource reportDataSource = new ReportDataSource("Relatorio_ssAtz_Pes", dtset.Tables[0]);

        localReport.DataSources.Clear();

        localReport.DataSources.Add(reportDataSource);

        // ###
        string reportType = rblDestino.SelectedValue;
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
        Response.AddHeader("content-disposition", "attachment; filename=SMSaude-Pesquisa." + fileNameExtension);
        Response.BinaryWrite(renderedBytes);
        Response.End();
    }
    protected void btnPrint_Click(object sender, ImageClickEventArgs e)
    {
        if (grd.Rows.Count > 0)
            renderReport();
    }
}
