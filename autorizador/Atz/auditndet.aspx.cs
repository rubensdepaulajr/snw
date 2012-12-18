using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using Snw.WebPage;
using System.Web;

public partial class Atz_auditndet : PageBase
{
    #region Display Mode Methods
    public static ModeItn _ModeItn;
    public enum ModeItn
    {
        AtzItn, // Autorizar internação
        NegItn, // Negar internação
        CncItn, // Cancelar
    }
    public static ModeItn displayModeItn
    {
        get
        {
            return _ModeItn;
        }
        set
        {
            _ModeItn = value;
        }
    }
    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            DBASQL dba = new DBASQL();
            SqlDataReader reader;
            dba.RunSql("SELECT IdAcm, Acm_Dsc FROM dbo.Atz_Acm ORDER BY Acm_Dsc", out reader);
            ddlAcm.DataSource = reader;
            ddlAcm.DataBind();
            dba.Dispose();

            DBASQL dba2 = new DBASQL();
            SqlDataReader reader2;
            dba2.RunSql("SELECT IdSit, Sit_Dsc FROM dbo.Atz_Sit WHERE IdSit IN (3, 4, 5) ORDER BY Sit_Dsc", out reader2);
            ddlSit.DataSource = reader2;
            ddlSit.DataBind();
            dba2.Dispose();

            // Preenchendo detalhes da solicitação/guia
            DBASQL dba3 = new DBASQL();
            SqlParameter[] param3 = 
                {
                    dba3.MakeInParam("@IdItn",SqlDbType.Int,4,Request.QueryString["Itn"].ToString())

                };
            SqlDataReader reader3;
            reader3 = dba.runProcDataReader("ssAtz_AudItnDet", param3);
            while (reader3.Read())
            {
                hdfIdSol.Value = reader3["IdGia"].ToString();
                lblCtt.Text = reader3["Itn_IdCtt"].ToString() + reader3["Itn_SeqEnd"].ToString() + " - " + reader3["Ctt_Nme"].ToString();
                lblBnf.Text = reader3["Bnf_Mtr"].ToString() + " - " + reader3["Bnf_Nme"].ToString();
                lblPrf.Text = reader3["Prf_Mtr"].ToString() + " - " + reader3["Prf_Nme"].ToString();
                lblPrfTel.Text = reader3["Prf_Tel"].ToString();
                if (!string.IsNullOrEmpty(reader3["Prf_Tel2"].ToString()))
                    lblPrfTel.Text += " - " + reader3["Prf_Tel2"].ToString();
                if (!string.IsNullOrEmpty(reader3["Prf_Fax"].ToString()))
                    lblPrfTel.Text += " / " + reader3["Prf_Fax"].ToString();
                lblCidDsc.Text = reader3["Cid_Dsc"].ToString();
                lblIndCln.Text = reader3["Gia_IndCln"].ToString();
            }
            dba3.Dispose();
        }
    }
    #region Simulate  tabclick on tabcontainer
    protected void btnTb1Trigger_Click(object sender, EventArgs args)
    {
        dvw.DataBind();
    }
    protected void btnTb2Trigger_Click(object sender, EventArgs args)
    {
        dtsMaster.SelectParameters["IdSol"].DefaultValue = dvw.DataKey["IdGia"].ToString();
        grdMaster.DataBind();
    }
    protected void btnTb3Trigger_Click(object sender, EventArgs args)
    {
        dtsOPM.SelectParameters["IdItn"].DefaultValue = dvw.DataKey["IdItn"].ToString();
        grdOPM.DataBind();
    }
    protected void btnTb4Trigger_Click(object sender, EventArgs args)
    {
        dtsCon.SelectParameters["IdBnf"].DefaultValue = dvw.DataKey["IdBnf"].ToString();
        grdCon.DataBind();
    }
    protected void btnTb5Trigger_Click(object sender, EventArgs args)
    {
        dtsSdt.SelectParameters["IdBnf"].DefaultValue = dvw.DataKey["IdBnf"].ToString();
        grdSdt.DataBind();
    }
    #endregion
    #region Grid styles
    protected void paginateGrdPdm(object sender, CommandEventArgs e)
    {
        globall.getCurrentPageGrid(grdMaster, e.CommandArgument.ToString());
    }
    protected void ddlGrdPdmPages_SelectedIndexChanged(object sender, EventArgs e)
    {
        globall.selectPageGrid(grdMaster);
    }
    protected void paginateGrdOPM(object sender, CommandEventArgs e)
    {
        globall.getCurrentPageGrid(grdOPM, e.CommandArgument.ToString());
    }
    protected void ddlGrdOPMPages_SelectedIndexChanged(object sender, EventArgs e)
    {
        globall.selectPageGrid(grdOPM);
    }
    protected void paginateGrdCon(object sender, CommandEventArgs e)
    {
        globall.getCurrentPageGrid(grdCon, e.CommandArgument.ToString());
    }
    protected void ddlGrdConPages_SelectedIndexChanged(object sender, EventArgs e)
    {
        globall.selectPageGrid(grdCon);
    }
    protected void paginateGrdSdt(object sender, CommandEventArgs e)
    {
        globall.getCurrentPageGrid(grdSdt, e.CommandArgument.ToString());
    }
    protected void ddlGrdSdtPages_SelectedIndexChanged(object sender, EventArgs e)
    {
        globall.selectPageGrid(grdSdt);
    }

    protected void paginateGrdMsg(object sender, CommandEventArgs e)
    {
        globall.getCurrentPageGrid(grdDetail, e.CommandArgument.ToString());
    }
    protected void ddlGrdMsgPages_SelectedIndexChanged(object sender, EventArgs e)
    {
        globall.selectPageGrid(grdDetail);
    }
    protected void ddlGrdLogPages_SelectedIndexChanged(object sender, EventArgs e)
    {
        globall.selectPageGrid(grdAudLog);
    }
    protected void paginateGrdLog(object sender, CommandEventArgs e)
    {
        globall.getCurrentPageGrid(grdAudLog, e.CommandArgument.ToString());
    }
    #endregion
    protected void btnOk_Click(object sender, ImageClickEventArgs e)
    {
        DBASQL dba = new DBASQL();
        SqlParameter[] param = { dba.MakeInParam("@IdCtt", SqlDbType.BigInt, 8, txtIdCtt.Text) };
        SqlDataReader reader;
        reader = dba.runProcDataReader("ssAtz_Ctt", param);
        while (reader.Read())
        {
            lblIdCtt.Text = reader["IdCtt"].ToString();
            lblCttNme.Text = reader["Ctt_Nme"].ToString();
        }
        dba.Dispose(); 
    }
    protected void lbtBuscar_Click(object sender, EventArgs e)
    {
        mpeCtt.Show();
    }
    #region Grid styles
    protected void ddlGrdCttPages_SelectedIndexChanged(object sender, EventArgs e)
    {
        globall.selectPageGrid(grdCtt);
        mpeCtt.Show();
    }
    protected void paginateGrdCtt(object sender, CommandEventArgs e)
    {
        globall.getCurrentPageGrid(grdCtt, e.CommandArgument.ToString());
        mpeCtt.Show();
    }
    #endregion
    #region Popup Ctt
    protected void hidePopup()
    {
        txtCtt_NmePop.Text = "";
        txtCtt_MtrPop.Text = "";
        dtsCtt.SelectParameters["IdCtt"].DefaultValue = string.Empty;
        dtsCtt.SelectParameters["Ctt_Nme"].DefaultValue = string.Empty;
        dtsCtt.DataBind();
        grdCtt.DataBind();
        mpeCtt.Hide();
        grdCtt.SelectedIndex = -1;
    }
    protected void grd_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblIdCtt.Text = grdCtt.DataKeys[grdCtt.SelectedIndex].Values["IdCtt"].ToString();
        lblCttNme.Text = HttpUtility.HtmlDecode(grdCtt.DataKeys[grdCtt.SelectedIndex].Values["Ctt_Nme"].ToString());
        hidePopup();
    }
    protected void btnBuscar_Click(object sender, ImageClickEventArgs e)
    {
        mpeCtt.Show();
        dtsCtt.SelectParameters["IdCtt"].DefaultValue = txtCtt_MtrPop.Text;
        dtsCtt.SelectParameters["Ctt_Nme"].DefaultValue = txtCtt_NmePop.Text;
        grdCtt.DataBind();
        if (grdCtt.Rows.Count == 0)
            lblEmptyGrid.Text = "Nenhum registro encontrado!";
        else
            lblEmptyGrid.Text = string.Empty;
    }
    protected void btn_fechar_Click(object sender, ImageClickEventArgs e)
    {
        hidePopup();
    }
    protected void grdCtt_Sorted(object sender, EventArgs e)
    {
        mpeCtt.Show();
    }
    #endregion
    /// <summary>
    /// Verifica se a data da prorrogação é válida. O prazo máximo é de 60 dias após à solicitação.
    /// </summary>
    /// <returns>True - Data válida, False - Data inválida</returns>
    private bool validaProrrogacao()
    {
        DateTime datSol = Convert.ToDateTime(grdMaster.SelectedRow.Cells[4].Text.TrimEnd());
        DateTime datPrg = Convert.ToDateTime(txtPdmVldPrg.Text);
        TimeSpan datDif = datPrg.Subtract(datSol);

        return (datDif.Days <= 60);
    }
    private void clearPage(int pageIndex)
    {
        if (pageIndex == 1)
        {
            ddlSit.SelectedIndex = 0;
            txtQtdAtz.Text = string.Empty;
            txtPdmVldPrg.Text = string.Empty;
            txtGpaJst.Text = string.Empty;
            txtGpaJst.Text = string.Empty;
        }
    }
    protected void btnGravar_Click(object sender, ImageClickEventArgs e)
    {

        if (displayModeItn == ModeItn.AtzItn)
        {
            if (string.IsNullOrEmpty(txtDatAdm.Text) || string.IsNullOrEmpty(txtDriAtz.Text) ||
                (ddlAcm.SelectedIndex == 0) || string.IsNullOrEmpty(txtItnObs.Text) || (rblSeqEnd.SelectedIndex == -1))
                globall.showMessage(imgMsg, lblMsg, "Todos os campos devem ser informados!");
            else
            {
                dtsItn.UpdateParameters["IdItn"].DefaultValue = dvw.DataKey["IdItn"].ToString();
                dtsItn.UpdateParameters["Itn_Dat"].DefaultValue = txtDatAdm.Text;
                dtsItn.UpdateParameters["Itn_DriAtz"].DefaultValue = txtDriAtz.Text;
                dtsItn.UpdateParameters["IdAcm"].DefaultValue = ddlAcm.SelectedValue;
                dtsItn.UpdateParameters["Itn_Obs"].DefaultValue = txtItnObs.Text;
                dtsItn.UpdateParameters["IdCtt"].DefaultValue = lblIdCtt.Text;
                dtsItn.UpdateParameters["SeqEnd"].DefaultValue = rblSeqEnd.SelectedValue;
                dtsItn.UpdateParameters["Itn_IdUsrAud"].DefaultValue = Profile.Seguranca.IdUsr;
                dtsItn.UpdateParameters["Itn_Atz"].DefaultValue = "true";
                dtsItn.Update();
                dvw.DataBind();
                pnlEdit.Visible = false;
            }
        }
        else if (displayModeItn == ModeItn.NegItn)
        {
            if (string.IsNullOrEmpty(txtItnObs.Text))
                globall.showMessage(imgMsg, lblMsg, "A justificativa deve ser informada!");
            else
            {
                dtsItn.UpdateParameters["IdItn"].DefaultValue = dvw.DataKey["IdItn"].ToString();
                dtsItn.UpdateParameters["Itn_Dat"].DefaultValue = string.Empty;
                dtsItn.UpdateParameters["Itn_DriAtz"].DefaultValue = txtDriAtz.Text;
                dtsItn.UpdateParameters["IdAcm"].DefaultValue = string.Empty;
                dtsItn.UpdateParameters["Itn_Obs"].DefaultValue = txtItnObs.Text;
                dtsItn.UpdateParameters["IdCtt"].DefaultValue = string.Empty;
                dtsItn.UpdateParameters["SeqEnd"].DefaultValue = string.Empty;
                dtsItn.UpdateParameters["Itn_IdUsrAud"].DefaultValue = Profile.Seguranca.IdUsr;
                dtsItn.UpdateParameters["Itn_Atz"].DefaultValue = "false";
                dtsItn.Update();
                dvw.DataBind();
                pnlEdit.Visible = false;
            }
        }
}
    protected void grdMaster_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlSit.Enabled = true;
        ddlSit.SelectedValue = "-1";

        lblPdmCod.Text = grdMaster.DataKeys[grdMaster.SelectedIndex].Values["Pdm_Cod"].ToString();
        lblPdmDsc.Text = grdMaster.DataKeys[grdMaster.SelectedIndex].Values["Pdm_Dsc"].ToString();
        txtQtdAtz.Text = grdMaster.SelectedRow.Cells[6].Text.TrimEnd();
        txtPdmVldOri.Text = grdMaster.SelectedRow.Cells[8].Text.TrimEnd();

        dtsDetail.SelectParameters["IdSol"].DefaultValue = hdfIdSol.Value;
        dtsDetail.SelectParameters["IdPdm"].DefaultValue = grdMaster.DataKeys[grdMaster.SelectedIndex].Values["IdPdm"].ToString();
        dtsDetail.SelectParameters["Sol_Tip"].DefaultValue = "1";
        grdDetail.DataBind();

        dtsGiaPdmAud.SelectParameters["IdSol"].DefaultValue = hdfIdSol.Value;
        dtsGiaPdmAud.SelectParameters["IdPdm"].DefaultValue = grdMaster.DataKeys[grdMaster.SelectedIndex].Values["IdPdm"].ToString();
        dtsGiaPdmAud.SelectParameters["Sol_Tip"].DefaultValue = "1";
        grdAudLog.DataBind();

        globall.showMessage(imgMsg1, lblMsg1, string.Empty);
    }
    protected void ddlSit_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (grdMaster.SelectedIndex > -1)
        {
            txtQtdAtz.Enabled = false;
            txtPdmVldPrg.Enabled = false;
            txtQtdAtz.Enabled = false;
            ibtAdicionar.Visible = false;
            txtPsqPdm.Visible = false;
            btnPsqPdm.Visible = false;
            txtPdmVldPrg.Text = string.Empty;
            txtGpaJst.Text = string.Empty;
            txtQtdAtz.Text = grdMaster.SelectedRow.Cells[6].Text.TrimEnd();

            if (ddlSit.SelectedValue == "7")
            {
                txtPsqPdm.Visible = true;
                ibtAdicionar.Visible = true;
                btnPsqPdm.Visible = true;
            }
            else if (ddlSit.SelectedValue == "4")
            {
                txtQtdAtz.Text = "0";
            }
            else if ((ddlSit.SelectedValue == "5") && (grdMaster.DataKeys[grdMaster.SelectedIndex].Values["IdSit"].ToString() == "0"))
            {
                txtPdmVldPrg.Enabled = true;
                txtQtdAtz.Enabled = true;
            }
            else if (ddlSit.SelectedValue == "5")
            {
                txtPdmVldPrg.Enabled = true;
            }
            else if (ddlSit.SelectedValue == "3")
            {
                txtQtdAtz.Enabled = true;
            }
        }
    }
    protected void imgBtnAdicionar_Click(object sender, ImageClickEventArgs e)
    {
        if (txtPsqPdm.Text.Length > 0)
        {
            hdfIdPdm.Value = null;
            DBASQL db = new DBASQL();
            SqlParameter[] paramInfoBnfPrfEsp = { db.MakeInParam("@Pdm_Cod", SqlDbType.VarChar, 20, txtPsqPdm.Text) };
            SqlDataReader dr = db.runProcDataReader("ssAtz_Pdm", paramInfoBnfPrfEsp);

            if (dr.Read())
            {
                hdfIdPdm.Value = dr["IdPdm"].ToString();
                lblPdmCod.Text = dr["Pdm_Cod"].ToString();
                lblPdmDsc.Text = dr["Pdm_Dsc"].ToString();
            }

            db.Dispose();

            if (!string.IsNullOrEmpty(hdfIdPdm.Value))
            {
                txtPsqPdm.Text = string.Empty;
                globall.showMessage(imgMsg1, lblMsg1, string.Empty);
            }
            else
            {
                globall.showMessage(imgMsg1, lblMsg1, "O código de procedimento informado não foi encontrado.");
            }
        }
        else
            globall.showMessage(imgMsg1, lblMsg1, "Por favor, informe o código do procedimento que deseja adicionar.");
    }
    protected void btnPsqPdm_Click(object sender, EventArgs e)
    {
        mpePdm.Show();
    }
    protected void btnAtz_Click(object sender, ImageClickEventArgs e)
    {
        if (grdMaster.SelectedIndex == -1)
            globall.showMessage(imgMsg1, lblMsg1, "Nenhum procedimento selecionado!");
        else if (hdfItnAtz.Value == "False")
            globall.showMessage(imgMsg1, lblMsg1, "A internação/prorrogação não esta autorizada!");
        else if ((grdMaster.DataKeys[grdMaster.SelectedIndex].Values["IdSit"].ToString() == "8"))
            globall.showMessage(imgMsg1, lblMsg1, "Não é permitido alterar a situação deste procedimento!");
        else if ((grdMaster.DataKeys[grdMaster.SelectedIndex].Values["IdSit"].ToString() == "4") && (ddlSit.SelectedValue != "3"))
            globall.showMessage(imgMsg1, lblMsg1, "Procedimento negado pela Auditoria só poderá ser autorizado novamente pela Auditoria!");
        else if (ddlSit.SelectedValue == "-1")
            globall.showMessage(imgMsg1, lblMsg1, "A situação deve ser selecionada!");
        else if (((ddlSit.SelectedValue == "3") && string.IsNullOrEmpty(txtQtdAtz.Text)) ||
            (ddlSit.SelectedValue == "5") && (txtQtdAtz.Enabled) && string.IsNullOrEmpty(txtQtdAtz.Text))
            globall.showMessage(imgMsg1, lblMsg1, "A quantidade autorizada deve ser informada!");
        else if ((ddlSit.SelectedValue == "5") && string.IsNullOrEmpty(txtPdmVldPrg.Text))
            globall.showMessage(imgMsg1, lblMsg1, "A data de validade do procedimento deve ser informada!");
        else if (ddlSit.SelectedValue == "7" && string.IsNullOrEmpty(hdfIdPdm.Value))
            globall.showMessage(imgMsg1, lblMsg1, "Nenhum procedimento selecionado!");
        else if ((ddlSit.SelectedValue == "7") && (grdMaster.DataKeys[grdMaster.SelectedIndex].Values["IdPdm"].ToString() == hdfIdPdm.Value))
            globall.showMessage(imgMsg1, lblMsg1, "O procedimento solicitado e o procedimento selecionado devem ser diferentes!");
        else if (!string.IsNullOrEmpty(txtPdmVldPrg.Text) && !validaProrrogacao())
            globall.showMessage(imgMsg1, lblMsg1, "O prazo máximo para prorrogação é de 60 dias a partir da data da solicitação!");
        else if (!globall.isInteger(txtQtdAtz.Text))
            globall.showMessage(imgMsg1, lblMsg1, "Quantidade inválida!");
        else if (txtGpaJst.Text.Length < 40)
            globall.showMessage(imgMsg1, lblMsg1, "Por favor, informe a justificativa com no mínimo 40 caracteres!");
        else
        {
            globall.showMessage(imgMsg1, lblMsg1, string.Empty);
            dtsDetail.UpdateParameters["IdSol"].DefaultValue = hdfIdSol.Value;
            dtsDetail.UpdateParameters["Sol_Tip"].DefaultValue = "1";
            dtsDetail.UpdateParameters["IdPdm"].DefaultValue = grdMaster.DataKeys[grdMaster.SelectedIndex].Values["IdPdm"].ToString();
            dtsDetail.UpdateParameters["Spd_IdSit"].DefaultValue = ddlSit.SelectedValue;
            dtsDetail.UpdateParameters["Spa_Jst"].DefaultValue = txtGpaJst.Text;
            dtsDetail.UpdateParameters["IdUsr"].DefaultValue = Profile.Seguranca.IdUsr;
            dtsDetail.UpdateParameters["Sol_QtdAtz"].DefaultValue = txtQtdAtz.Text;
            dtsDetail.UpdateParameters["Spd_DatVld"].DefaultValue = txtPdmVldPrg.Text;
            dtsDetail.UpdateParameters["IdNovPdm"].DefaultValue = hdfIdPdm.Value;
            dtsDetail.Update();
            grdMaster.DataBind();
            grdAudLog.DataBind();
            clearPage(1);
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
    protected void btnNewPsq_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("aud.aspx");
    }
    protected void dtsDetail_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        string outSts = ((SqlParameter)e.Command.Parameters["@Out_Sts"]).Value.ToString();
        if (outSts == "1")
            globall.showMessage(imgMsg1, lblMsg1, "O procedimento selecionado já esta na solicitação!");
        else if (outSts == "2")
            globall.showMessage(imgMsg1, lblMsg1, "Não é permitido trocar um procedimento que já foi realizado!");
        else if (outSts == "3")
            globall.showMessage(imgMsg1, lblMsg1, "Não é permitido alterar a validade de SP/SADT!");
        else if (outSts == "4")
            globall.showMessage(imgMsg1, lblMsg1, "Não é permitido prorrogar a validade para procedimento sem saldo para execução!");
        else if (outSts == "5")
            globall.showMessage(imgMsg1, lblMsg1, "Não é permitido alterar a situação de procedimento com validade vencida!");
    }
    #region Popup PDM

    protected void grdPdmPop_Sorted(object sender, EventArgs e)
    {
        mpePdm.Show();
    }

    protected void btnBuscarPdm_Click(object sender, ImageClickEventArgs e)
    {
        mpePdm.Show();
        dtsPdm.SelectParameters["Pdm_Cod"].DefaultValue = txtBnf_MtrPop.Text;
        dtsPdm.SelectParameters["Pdm_Dsc"].DefaultValue = txtBnf_NmePop.Text;
        grdPdmPop.DataBind();
        if (grdPdmPop.Rows.Count == 0)
            lblEmptyGrid.Text = "Nenhum registro encontrado!";
        else
            lblEmptyGrid.Text = string.Empty;
    }

    protected void grdPdm_PageIndexChanged(object sender, EventArgs e)
    {
        mpePdm.Show();
    }

    /* 1 - Codigos da paginação da aba SOLICITAÇÕS AUTORIZADAS---------------------------------------------------------*/

    /*dropdown do paginador da aba SOLICITAÇÕES AUTORIZADAS*/
    protected void ddlPages_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow gvrPager = grdPdmPop.BottomPagerRow;
        DropDownList ddlPages = (DropDownList)gvrPager.Cells[0].FindControl("ddlPages");
        grdPdmPop.PageIndex = ddlPages.SelectedIndex;
        // a method to populate your grid
        PopulateGridSolAut();
        mpePdm.Show();
    }

    /*função que controla os botões de paginação da aba SOLICITAÇÕES AUTORIZADAS*/
    protected void Paginategrd(object sender, CommandEventArgs e)
    {
        // get the current page selected
        int intCurIndex = grdPdmPop.PageIndex;

        switch (e.CommandArgument.ToString().ToLower())
        {
            case "first":
                grdPdmPop.PageIndex = 0;
                break;
            case "prev":
                if (intCurIndex > 0)
                    grdPdmPop.PageIndex = intCurIndex - 1;
                break;
            case "next":
                if (intCurIndex <= grdPdmPop.PageCount - 1)
                    grdPdmPop.PageIndex = intCurIndex + 1;
                break;
            case "last":
                grdPdmPop.PageIndex = grdPdmPop.PageCount;
                break;
        }
        // popultate the gridview control
        PopulateGridSolAut();
        mpePdm.Show();
    }

    /* dropdown do paginador da aba SOLICITAÇÕES AUTORIZADAS*/
    protected void PopulateGridSolAut()
    {
        grdPdmPop.DataBind();
    }
    protected void grdPdmPop_SelectedIndexChanged(object sender, EventArgs e)
    {
        globall.showMessage(imgMsg1, lblMsg1, string.Empty);

        hdfIdPdm.Value = grdPdmPop.DataKeys[grdPdmPop.SelectedIndex].Values["IdPdm"].ToString();
        lblPdmCod.Text = grdPdmPop.DataKeys[grdPdmPop.SelectedIndex].Values["Pdm_Cod"].ToString();
        lblPdmDsc.Text = HttpUtility.HtmlDecode(grdPdmPop.DataKeys[grdPdmPop.SelectedIndex].Values["Pdm_Dsc"].ToString());

        limpaPopupPdm();
    }
    protected void btn_fecharPdm_Click(object sender, ImageClickEventArgs e)
    {
        limpaPopupPdm();
    }
    protected void limpaPopupPdm()
    {
        txtBnf_NmePop.Text = "";
        txtBnf_MtrPop.Text = "";
        dtsPdm.SelectParameters["Pdm_Cod"].DefaultValue = string.Empty;
        dtsPdm.SelectParameters["Pdm_Dsc"].DefaultValue = string.Empty;
        dtsPdm.DataBind();
        grdPdmPop.DataBind();
        mpePdm.Hide();
        grdPdmPop.SelectedIndex = -1;
    }
    #endregion
    protected void dvw_DataBound(object sender, EventArgs e)
    {
        DataRowView rowView = (DataRowView)dvw.DataItem;
        if (rowView.Row["Itn_Atz"].ToString() == "PENDENTE")
        {
            ibtAtzItn.Visible = true;
            ibtNegItn.Visible = true;
            dvw.Fields[0].ItemStyle.Font.Bold = true;
            dvw.Fields[0].ItemStyle.ForeColor = System.Drawing.Color.Orange;
            hdfItnAtz.Value = "False";
        }
        else if (rowView.Row["Itn_Atz"].ToString() == "NEGADO")
        {
            ibtAtzItn.Visible = false;
            ibtNegItn.Visible = false;
            dvw.Fields[0].ItemStyle.Font.Bold = true;
            //dvw.Fields[0].HeaderStyle.BackColor = System.Drawing.Color.Red;
            //dvw.Fields[0].ItemStyle.BackColor = System.Drawing.Color.Red;
            dvw.Fields[0].ItemStyle.ForeColor = System.Drawing.Color.Red;
            hdfItnAtz.Value = "False";
        }
        else if (rowView.Row["Itn_Atz"].ToString() == "AUTORIZADO")
        {
            ibtAtzItn.Visible = false;
            ibtNegItn.Visible = false;
            dvw.Fields[0].ItemStyle.Font.Bold = true;
            dvw.Fields[0].ItemStyle.ForeColor = System.Drawing.Color.Green;
            hdfItnAtz.Value = "True";
        }
    }
    private void lockForm()
    {
        if (displayModeItn == ModeItn.AtzItn)
        {
            ibtAtzItn.Visible = false;
            ibtNegItn.Visible = false;
            txtDatAdm.Enabled = true;
            txtDriAtz.Enabled = true;
            ddlAcm.Enabled = true;
            txtIdCtt.Enabled = true;
            lblIdCtt.Enabled = true;
            btnOk.Visible = true;
            lbtBuscar.Visible = true;
            txtDatAdm.Text = string.Empty;
            txtDriAtz.Text = string.Empty;
            ddlAcm.SelectedIndex = 0;
            txtItnObs.Text = string.Empty;
            lblIdCtt.Text = string.Empty;
            pnlEdit.Visible = true;
        }
        else if (displayModeItn == ModeItn.NegItn)
        {
            ibtAtzItn.Visible = false;
            ibtNegItn.Visible = false;
            txtDatAdm.Enabled = false;
            txtDriAtz.Enabled = false;
            ddlAcm.Enabled = false;
            txtIdCtt.Enabled = false;
            lblIdCtt.Enabled = false;
            btnOk.Visible = false;
            lbtBuscar.Visible = false;
            txtDatAdm.Text = string.Empty;
            txtDriAtz.Text = "0";
            ddlAcm.SelectedIndex = 0;
            txtItnObs.Text = string.Empty;
            lblIdCtt.Text = string.Empty;
            pnlEdit.Visible = true;
        }
        else if (displayModeItn == ModeItn.CncItn)
        {
            ibtAtzItn.Visible = true;
            ibtNegItn.Visible = true;
            pnlEdit.Visible = false;
        }
    }
    protected void ibtAtzItn_Click(object sender, ImageClickEventArgs e)
    {
        displayModeItn = ModeItn.AtzItn;
        lockForm();

    }
    protected void ibtNegItn_Click(object sender, ImageClickEventArgs e)
    {
        displayModeItn = ModeItn.NegItn;
        lockForm();
    }
    protected void ibtCancelEdit_Click(object sender, ImageClickEventArgs e)
    {
        displayModeItn = ModeItn.CncItn;
        lockForm();
    }
}
