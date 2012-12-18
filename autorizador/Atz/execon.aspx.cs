using System;
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

public partial class Atz_execon : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Desabilita o botão durante o post, tem que ficar fora do IsPostBack
        btnExe.Attributes.Add("onclick", "this.disabled=true;" + ClientScript.GetPostBackEventReference(btnExe, "").ToString());
        
        if (!Page.IsPostBack)
        {
            hdfIdGia.Value = Request.QueryString["Gia"];
            hdfIdBnf.Value = Request.QueryString["Bnf"];
            // Data da realização
            txtDatRel.Text = DateTime.Now.ToShortDateString();
            // Definindo o horário da realização
            DateTime horSol = DateTime.Now;
            txtHor.Text = horSol.Hour.ToString();
            txtMin.Text = horSol.Minute.ToString();

            // DataTable que conterá os CID10
            DataTable dtb = new DataTable();
            // Adiciona os nomes e tipos das colunas
            dtb.Columns.Add("IdCid").Unique = true;
            dtb.Columns.Add("Cid_Dsc");

            ViewState["dtbCID"] = dtb;

            dtb.Dispose();

            // Selecionando os dados da Guia de Consulta
            DBASQL dba = new DBASQL();
            SqlParameter[] param = 
            {
                dba.MakeInParam("@IdGia",SqlDbType.Int,4,hdfIdGia.Value)
            };
            SqlDataReader reader;
            reader = dba.runProcDataReader("ssAtz_GiaConExe", param);
            while (reader.Read())
            {
                hdfIdBnf.Value = reader["IdBnf"].ToString();
                lblBnf.Text = reader["Bnf_Mtr"].ToString() +" - "+ reader["Bnf_Nme"].ToString();
                lblPdm_Dsc.Text = reader["Pdm_Dsc"].ToString();
            }
            dba.Dispose();
        }
    }
    protected void btnAdicionarCid_Click(object sender, ImageClickEventArgs e)
    {
        string idCid = string.Empty;
        string cidDsc = string.Empty;
        // Selecionando a consulta relacionada à especialidade
        DBASQL dba = new DBASQL();
        SqlParameter[] param = 
            {
                dba.MakeInParam("@IdCid",SqlDbType.Char,5,txtIdCid.Text)
            };
        SqlDataReader reader;
        reader = dba.runProcDataReader("ssAtz_Cid", param);
        while (reader.Read())
        {
            idCid = reader["IdCid"].ToString();
            cidDsc = HttpUtility.HtmlDecode(reader["Cid_Dsc"].ToString());
        }
        dba.Dispose();

        if (string.IsNullOrEmpty(idCid))
        {
            globall.showMessage(ImgErr, lblErr, "CID não econtrado!");
        }
        else
        {
            ImgErr.Visible = false;
            lblErr.Text = string.Empty;

            DataTable dtb = new DataTable();
            dtb = (DataTable)ViewState["dtbCID"];

            if (dtb.Rows.Count > 3)
            {
                globall.showMessage(ImgErr, lblErr, "O número máximo de CIDs permitido por consulta é 4(quatro).");
            }
            else
            {
                // Cria uma nova linha no DataTable
                DataRow drw = dtb.NewRow();
                // Adiciona os dados à nova linha criada
                drw[0] = idCid;
                drw[1] = cidDsc;

                try
                {
                    // Adiciona a linha no DataTable
                    dtb.Rows.Add(drw);
                }
                catch
                {
                    globall.showMessage(ImgErr, lblErr, "Este CID10 já foi selecionado!");
                }

                ViewState["dtbCID"] = dtb;

                grdCID.DataSource = dtb;
                grdCID.DataBind();
            }
            dtb.Dispose();
        }
    }

    #region Popup CID10

    protected void btnBuscar_Click(object sender, ImageClickEventArgs e)
    {
        ModalPopupExtender1.Show();
        dtsCID.SelectParameters["Cid_Cod"].DefaultValue = txtBnf_MtrPop.Text;
        dtsCID.SelectParameters["Cid_Dsc"].DefaultValue = txtBnf_NmePop.Text;
        grd.DataBind();
        if (grd.Rows.Count == 0)
            lblEmptyGrid.Text = "Nenhum registro encontrado!";
        else
            lblEmptyGrid.Text = string.Empty;
    }

    protected void grd_PageIndexChanged(object sender, EventArgs e)
    {
        ModalPopupExtender1.Show();
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

    /* 1 - Codigos da paginação da aba SOLICITAÇÕS AUTORIZADAS---------------------------------------------------------*/


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
        ModalPopupExtender1.Show();
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
        ModalPopupExtender1.Show();
    }
    /* dropdown do paginador da aba SOLICITAÇÕES AUTORIZADAS*/
    protected void PopulateGridSolAut()
    {
        grd.DataBind();
    }
    protected void grd_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataTable dtb = new DataTable();
        dtb = (DataTable)ViewState["dtbCID"];

        if (dtb.Rows.Count > 3)
        {
            globall.showMessage(ImgErr, lblErr, "O número máximo de CIDs permitido por consulta é 4(quatro).");
        }
        else
        {
            ImgErr.Visible = false;
            lblErr.Text = string.Empty;

            // Cria uma nova linha no DataTable
            DataRow drw = dtb.NewRow();
            // Adiciona os dados à nova linha criada
            drw[0] = grd.DataKeys[grd.SelectedIndex].Values["IdCid"].ToString();
            drw[1] = HttpUtility.HtmlDecode(grd.DataKeys[grd.SelectedIndex].Values["Cid_Dsc"].ToString());

            try
            {
                // Adiciona a linha no DataTable
                dtb.Rows.Add(drw);
            }
            catch
            {
                lblErr.Text = "Este CID10 já foi selecionado!";
            }

            ViewState["dtbCID"] = dtb;

            grdCID.DataSource = dtb;
            grdCID.DataBind();            
        }

        dtb.Dispose();
        limpaPopup();
    }

    protected void btn_fechar_Click(object sender, ImageClickEventArgs e)
    {
        limpaPopup();
    }

    protected void limpaPopup()
    {
        txtBnf_NmePop.Text = "";
        txtBnf_MtrPop.Text = "";
        dtsCID.SelectParameters["IdCid"].DefaultValue = String.Empty;
        dtsCID.SelectParameters["Cid_Dsc"].DefaultValue = String.Empty;
        dtsCID.DataBind();
        grd.DataBind();

        ModalPopupExtender1.Hide();
        grd.SelectedIndex = -1;
    }

    #endregion

    /// <summary>
    /// Remove procedimento do grid
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void grdCID_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataTable dtb = new DataTable();
        dtb = (DataTable)ViewState["dtbCID"];
        //DataRow drw = dtb.Rows.Find(grdPdm.Rows[grdPdm.SelectedIndex].Cells[0].Text);                        
        DataRow drw = dtb.NewRow();
        // procura na tabela pelo procedimento a ser removido
        foreach (DataRow dr in dtb.Rows)
        {
            if (dr["IdCid"].ToString() == grdCID.Rows[grdCID.SelectedIndex].Cells[0].Text)
            {
                drw = dr;
            }
        }
        //remove da tabela a linha que contém o procedimento
        if (!drw.IsNull("IdCid"))
            drw.Delete();
        grdCID.DataSource = dtb;
        grdCID.DataBind();
        ViewState["dtbCID"] = dtb;
        dtb.Dispose();
        grdCID.SelectedIndex = -1;
        globall.showMessage(ImgErr, lblErr, string.Empty);       
    }

    protected void btnFhaPci_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("fhapci.aspx?Bnf=" + hdfIdBnf.Value);
    }
    protected void btnExe_Click(object sender, ImageClickEventArgs e)
    {
        if (String.IsNullOrEmpty(lblBnf.Text))
            globall.showMessage(ImgErr, lblErr, "Nenhum Beneficiário selecionado!");
        else if (ddlTipCon.SelectedValue == "0")
            globall.showMessage(ImgErr, lblErr, "O Tipo de Consulta deve ser selecionado!");
        else if (ddlTipSai.SelectedValue == "0")
            globall.showMessage(ImgErr, lblErr, "O Tipo de Saída deve ser selecionado!");
        else if (Convert.ToInt32(txtHor.Text) > 23 || Convert.ToInt32(txtMin.Text) > 59)
            globall.showMessage(ImgErr, lblErr, "Hora inválida!");
        else
        {

            ImgErr.Visible = false;
            lblErr.Text = string.Empty;

            string[] outParam = { "@Out_Err", "@Out_Sts", "@Out_Snh" };
            string[] outResult;

            DBASQL dba = new DBASQL();

            SqlParameter[] param = 
            {
                dba.MakeInParam("@IdGia",SqlDbType.Int,4,hdfIdGia.Value),
                dba.MakeInParam("@Gia_DatAtd",SqlDbType.SmallDateTime,4,Convert.ToDateTime(txtDatRel.Text +" "+ txtHor.Text +":"+ txtMin.Text)),
                dba.MakeInParam("@Gia_TipDoe",SqlDbType.Char,1,rblTipDoe.SelectedValue),
                dba.MakeInParam("@Gia_TemDoe",SqlDbType.Char,4, txtTemDoe.Text.Trim() + ddlTemDoe.SelectedValue),
                dba.MakeInParam("@Gia_IdTpc",SqlDbType.TinyInt,1,ddlTipCon.SelectedValue),
                dba.MakeInParam("@Gia_IdSai",SqlDbType.TinyInt,1,ddlTipSai.SelectedValue),
                dba.MakeOutParam("@Out_Err",SqlDbType.Bit,1),
                dba.MakeOutParam("@Out_Sts",SqlDbType.Bit,1),
                dba.MakeOutParam("@Out_Snh",SqlDbType.VarChar,20),
            };

            outResult = dba.RunProc("stAtz_GiaConAtd", param, outParam);


            //Inserindo os Códigos de CID-10
            DataTable dtb = new DataTable();
            dtb = (DataTable)ViewState["dtbCID"];
            foreach (DataRow row in dtb.Rows)
            {
                SqlParameter[] paramCid = 
                   {
                       dba.MakeInParam("@Gcd_IdCid", SqlDbType.Char,5,row["IdCid"]),
                       dba.MakeInParam("@Gcd_IdGia", SqlDbType.Int,4,hdfIdGia.Value)
                   };
                dba.RunProc("stAtz_GiaCid", paramCid);
            }

            dba.Dispose();

            lblGia_Snh.Text = outResult[2];

            if (outResult[0] == "True")
            {
                pnlAtz.Visible = false;
                ImgErr.Visible = true;
                globall.showMessage(ImgErr, lblErr, "Ocorreram erros na execução. Tente novamente");
            }
            else
            {
                ImgErr.Visible = false;
                lblErr.Text = string.Empty;
                if (outResult[1] == "True")
                {
                    pnlAtz.Visible = true;

                }
                else
                {
                    pnlAtz.Visible = false;
                }
            }
            mvw.ActiveViewIndex = 1;
        }
    }
    protected void btnPgaIni_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("prf.aspx");
    }
    private void printGiaCon(Int32 IdGia)
    {
        DBASQL db = new DBASQL();

        SqlParameter[] prams =	{
                                    db.MakeInParam("@IdGia", SqlDbType.Int, 4, IdGia)
                                };

        DataSet dtset = db.RunProcDataSet("srAtz_GiaCon", prams, "setGuiaConsulta");

        setReport.Rpt.SetRelatorio(dtset, @"App_Rpt\GuiaConsulta.rdlc", "guia_srAtz_GiaCon", String.Empty, Page.ToString());
        db.Dispose();
        Response.Redirect("../App_Rpt/Rpt.aspx");
    }
    private void renderReport(string idGia)
    {
        DBASQL db = new DBASQL();

        SqlParameter[] prams =	{
                                    db.MakeInParam("@IdGia", SqlDbType.Int, 4, idGia)
                                };

        DataSet dtset = db.RunProcDataSet("srAtz_GiaCon", prams, "setGuiaConsulta");


        LocalReport localReport = new LocalReport();
        localReport.ReportPath = @"App_Rpt\GuiaConsulta.rdlc";

        //A method that returns a collection for our report
        //Note: A report can have multiple data sources
        //***List<Employee> employeeCollection = GetData();

        //Give the collection a name (EmployeeCollection) so that we can reference it in our report designer
        //***ReportDataSource reportDataSource = new ReportDataSource("setSolSdt", dtset);

        //***localReport.DataSources.Add(reportDataSource);

        // ###
        //Associa o DataSet com a fonte do ReportViewer
        ReportDataSource reportDataSource = new ReportDataSource("guia_srAtz_GiaCon", dtset.Tables[0]);

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
        Response.AddHeader("content-disposition", "attachment; filename=SolCon." + fileNameExtension);
        Response.BinaryWrite(renderedBytes);
        Response.End();
    }
    protected void btnImprimeGia_Click(object sender, ImageClickEventArgs e)
    {
        //printGiaCon(Convert.ToInt32(hdfIdGia.Value));
        renderReport(hdfIdGia.Value);
    }
    protected void btnPgnIni_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("prf.aspx");
    }
    protected void grd_Sorted(object sender, EventArgs e)
    {
        ModalPopupExtender1.Show();
    }
}
