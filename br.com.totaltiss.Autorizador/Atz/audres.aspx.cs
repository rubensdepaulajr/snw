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
using br.com.totaltiss.Data;
using System.Linq;
using br.com.totaltiss.Web.Autorizador;

public partial class Atz_audres : PageBase
{

    protected void Page_Load(object sender, EventArgs e)
    {
        // Desabilita o clique do botão no post
        btnAtz.Attributes.Add("onclick", "this.disabled=true;" + ClientScript.GetPostBackEventReference(btnAtz, "").ToString());

        if (!Page.IsPostBack)
        {
            hdfIdPdm.Value = null;
            hdfIdSol.Value = Request.QueryString["Sol"];
            hdfSolTip.Value = Request.QueryString["Tip"];

            WebProfile Profile = WebProfile.GetProfile("username");
            // Verificando se o papel pode autorizar consulta e/ou sp/sadt
            short idPpl = Convert.ToInt16(Profile.Seguranca.IdPpl);
            using (AppEntities ctx = new AppEntities())
            {
                var sgnPpl = ctx.Sgn_Ppl.First(p => p.IdPpl == idPpl);
                hdfPplCon.Value = (sgnPpl.Ppl_Con.Value) ? "s" : "n";
                hdfPplSdt.Value = (sgnPpl.Ppl_Sdt.Value) ? "s" : "n";
                hdfPplPrgLib.Value = (sgnPpl.Ppl_PrgLib.Value) ? "s" : "n";
            }
            
            // Preenchendo detalhes da solicitação/guia
            DBASQL dba = new DBASQL();
            SqlParameter[] param = 
                {
                    dba.MakeInParam("@IdSol",SqlDbType.Int,4,hdfIdSol.Value),
                    dba.MakeInParam("@Sol_Tip",SqlDbType.TinyInt,1,hdfSolTip.Value)
                };
            SqlDataReader reader;
            reader = dba.runProcDataReader("ssAtz_AudDet", param);
            while (reader.Read())
            {
                lblCtt.Text = reader["Sol_IdCtt"].ToString() + reader["Sol_SeqEnd"].ToString() + " - " + reader["Ctt_Nme"].ToString();
                lblEnd.Text = reader["Ctt_End"].ToString();
                lblBnf.Text = reader["Bnf_Mtr"].ToString() +" - "+ reader["Bnf_Nme"].ToString();
                lblPrf.Text = reader["Prf_Mtr"].ToString() + " - " + reader["Prf_Nme"].ToString();
                lblPrfTel.Text = reader["Prf_Tel"].ToString();
                if (!string.IsNullOrEmpty(reader["Prf_Tel2"].ToString()))
                    lblPrfTel.Text += " - "+ reader["Prf_Tel2"].ToString();
                if (!string.IsNullOrEmpty(reader["Prf_Fax"].ToString()))
                    lblPrfTel.Text += " / " + reader["Prf_Fax"].ToString();
                lblCidDsc.Text = reader["Cid_Dsc"].ToString();
                lblIndCln.Text = reader["Sol_IndCln"].ToString();            
            }
            dba.Dispose();

            string sql;
            if (hdfSolTip.Value == "0")
                sql = "SELECT IdSit, Sit_Dsc FROM dbo.Atz_Sit WHERE IdSit IN (3, 4, 5, 7) ORDER BY Sit_Dsc";
            else
                sql = "SELECT IdSit, Sit_Dsc FROM dbo.Atz_Sit WHERE IdSit IN (3, 4, 5) ORDER BY Sit_Dsc";
            DBASQL dba2 = new DBASQL();
            SqlDataReader reader2;
            dba2.RunSql(sql, out reader2);
            ddlSit.DataSource = reader2;
            ddlSit.DataBind();
            dba2.Dispose();

            // Seleciona no Papel a quantidade de CH que o usuário pode autorizar
            DBASQL dba3 = new DBASQL();
            SqlDataReader reader3;
            dba3.RunSql("SELECT ISNULL(Ppl_QtdCh_,0) AS Ppl_QtdCh_ "+
                        "FROM dbo.Sgn_Usr, Sgn_Ppl "+
                        "WHERE IdPpl = Usr_IdPpl " +
                        "AND IdUsr = "+ Profile.Seguranca.IdUsr, out reader3);
            while (reader3.Read())
            {
                hdfQtdMaxCh_.Value = reader3[0].ToString();
            }
            dba3.Dispose();
        }
    }

    protected void btnNewPsq_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("aud.aspx");
    }
    private void clearPage()
    {
        ddlSit.SelectedIndex = 0;
        txtQtdAtz.Text = string.Empty;
        txtPdmVldPrg.Text = string.Empty;
        txtGpaJst.Text = string.Empty;
        txtGpaJst.Text = string.Empty;
    }
    /*dropdown do paginador da aba SOLICITAÇÕES AUTORIZADAS*/
    protected void ddlGrdPdmPages_SelectedIndexChanged(object sender, EventArgs e)
    {
        globall.selectPageGrid(grdMaster);
    }
    /*função que controla os botões de paginação da aba SOLICITAÇÕES AUTORIZADAS*/
    protected void paginateGrdPdm(object sender, CommandEventArgs e)
    {
        globall.getCurrentPageGrid(grdMaster, e.CommandArgument.ToString());
    }
    /*dropdown do paginador da aba SOLICITAÇÕES AUTORIZADAS*/
    protected void ddlGrdMsgPages_SelectedIndexChanged(object sender, EventArgs e)
    {
        globall.selectPageGrid(grdDetail);
    }
    /*função que controla os botões de paginação da aba SOLICITAÇÕES AUTORIZADAS*/
    protected void paginateGrdMsg(object sender, CommandEventArgs e)
    {
        globall.getCurrentPageGrid(grdDetail, e.CommandArgument.ToString());
    }
    protected void ddlGrdLogPages_SelectedIndexChanged(object sender, EventArgs e)
    {
        globall.selectPageGrid(grdAudLog);
    }
    /*função que controla os botões de paginação da aba SOLICITAÇÕES AUTORIZADAS*/
    protected void paginateGrdLog(object sender, CommandEventArgs e)
    {
        globall.getCurrentPageGrid(grdAudLog, e.CommandArgument.ToString());
    }
    /*3 - FIM DOS CODIGOS ESPECIFICOS DA ABA SOLICITAÇÕES PENDENTES */

    protected void btnPgaIni_Click(object sender, ImageClickEventArgs e)
    {
        // Seleciona a página inicial do usuário de acordo com o papel
        WebProfile Profile = WebProfile.GetProfile("username");
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

    protected void grdMaster_SelectedIndexChanged(object sender, EventArgs e)
    {
        bool podeAuditar = true;
        ddlSit.SelectedIndex = 0;

        if ((hdfSolTip.Value == "1" && hdfPplCon.Value == "s") || 
            (((hdfSolTip.Value == "0") || (hdfSolTip.Value == "2")) && hdfPplSdt.Value == "s"))
        {
            btnAtz.Visible = true;
            globall.showMessage(imgMsg, lblMsg, string.Empty);
        }
        else
        {
            btnAtz.Visible = false;
            globall.showMessage(imgMsg, lblMsg, "Atenção! Você não esta autorizado(a) a auditar este tipo de guia!");
            podeAuditar = false;
        }

        DBASQL dba = new DBASQL();
        SqlParameter[] param = 
            {
                dba.MakeInParam("@IdOpe",SqlDbType.Int,4,1),
                dba.MakeInParam("@IdPdm",SqlDbType.Int,4,grdMaster.DataKeys[grdMaster.SelectedIndex].Values["IdPdm"].ToString()),
            };
        SqlDataReader reader;
        reader = dba.runProcDataReader("ssCad_PdmOrt", param);
        lblDlgOrt.Text = string.Empty;
        while (reader.Read())
        {            
            lblDlgOrt.Text = "<h2>Informações para auditoria do procedimento</h2><br> "+ Server.HtmlDecode(reader["Pdo_Htm"].ToString()) +"<br>";
        }
        dba.Dispose();
        if (podeAuditar)
        {
            if ((grdMaster.DataKeys[grdMaster.SelectedIndex].Values["Sit_Ind"].ToString() == "A") &&
               (hdfSolTip.Value != "0"))
            {
                lblSitDsc.Text = grdMaster.SelectedRow.Cells[7].Text.TrimEnd(); ;
                ddlSit.Visible = false;
                btnAtz.Visible = false;
                btnCnc.Visible = true;
            }
            else
            {
                lblSitDsc.Text = string.Empty;
                ddlSit.Visible = true;
                btnAtz.Visible = true;
                btnCnc.Visible = false;
            }
        }
        else
        {
            lblSitDsc.Text = grdMaster.SelectedRow.Cells[7].Text.TrimEnd(); ;
            ddlSit.Visible = false;
            txtGpaJst.Enabled = false;
        }
        lblPdmCod.Text = grdMaster.DataKeys[grdMaster.SelectedIndex].Values["Pdm_Cod"].ToString();
        lblPdmDsc.Text = grdMaster.DataKeys[grdMaster.SelectedIndex].Values["Pdm_Dsc"].ToString();
        txtQtdAtz.Text = grdMaster.SelectedRow.Cells[6].Text.TrimEnd();
        txtPdmVldOri.Text = grdMaster.SelectedRow.Cells[8].Text.TrimEnd();

        dtsDetail.SelectParameters["IdSol"].DefaultValue = hdfIdSol.Value;
        dtsDetail.SelectParameters["IdPdm"].DefaultValue = grdMaster.DataKeys[grdMaster.SelectedIndex].Values["IdPdm"].ToString();
        dtsDetail.SelectParameters["Sol_Tip"].DefaultValue = hdfSolTip.Value;
        grdDetail.DataBind();

        dtsGiaPdmAud.SelectParameters["IdSol"].DefaultValue = hdfIdSol.Value;
        dtsGiaPdmAud.SelectParameters["IdPdm"].DefaultValue = grdMaster.DataKeys[grdMaster.SelectedIndex].Values["IdPdm"].ToString();
        dtsGiaPdmAud.SelectParameters["Sol_Tip"].DefaultValue = hdfSolTip.Value;
        grdAudLog.DataBind();
    }
    /// <summary>
    /// Verifica se a data da prorrogação é válida. O prazo máximo é de 120 dias após à solicitação
    /// e até 30 dias após a data corrente. Execeção para o papel que esta configurado para não
    /// checar estes prazos.
    /// </summary>
    /// <returns>True - Data válida, False - Data inválida</returns>
    private bool validaProrrogacao()
    {
        if (hdfPplPrgLib.Value == "s")
            return true;
        else
        {
            DateTime datSol = Convert.ToDateTime(grdMaster.SelectedRow.Cells[4].Text.TrimEnd());
            DateTime datPrg = Convert.ToDateTime(txtPdmVldPrg.Text);
            TimeSpan datDifSol = datPrg.Subtract(datSol);
            TimeSpan datDifNow = datPrg.Subtract(DateTime.Now);

            return ((datDifSol.Days <= 120) && (datDifNow.Days <= 30));
        }
    }
    protected void btnAtz_Click(object sender, ImageClickEventArgs e)
    {
        // Só é permitido repetir a situação para PRORROGACAO VALIDADE
        if ((grdMaster.DataKeys[grdMaster.SelectedIndex].Values["IdSit"].ToString() != "5") && 
            (grdMaster.DataKeys[grdMaster.SelectedIndex].Values["IdSit"].ToString() == ddlSit.SelectedValue))
            globall.showMessage(imgMsg, lblMsg, "O procedimento já esta com a situação selecionada!");
        else if ((grdMaster.DataKeys[grdMaster.SelectedIndex].Values["IdSit"].ToString() == "0") && (ddlSit.SelectedValue == "5"))
            globall.showMessage(imgMsg, lblMsg, "Não é permitido prorrogar validade de procedimento pendente!");
        // Para as situações Negado Auditoria e Porrogação Validade não deve verificar a regra de quantidade de CH do papel
        else if  ((ddlSit.SelectedValue != "4") && (ddlSit.SelectedValue != "5") &&
            (Convert.ToDouble(hdfQtdMaxCh_.Value) < Convert.ToDouble(grdMaster.DataKeys[grdMaster.SelectedIndex].Values["Pdm_QtdCh_"].ToString())))
            globall.showMessage(imgMsg, lblMsg, "Você esta autorizado a auditar procedimentos de no máximo "+ hdfQtdMaxCh_.Value +" CH !");
        else if (grdMaster.SelectedIndex == -1)
            globall.showMessage(imgMsg, lblMsg, "Nenhum procedimento selecionado!");
        else if ((grdMaster.DataKeys[grdMaster.SelectedIndex].Values["IdSit"].ToString() == "8"))
            globall.showMessage(imgMsg, lblMsg, "Não é permitido alterar a situação deste procedimento!");
        else if ((grdMaster.DataKeys[grdMaster.SelectedIndex].Values["IdSit"].ToString() == "4") && (ddlSit.SelectedValue != "3"))
            globall.showMessage(imgMsg, lblMsg, "Procedimento negado pela Auditoria só poderá ser autorizado novamente pela Auditoria!");
        else if (ddlSit.SelectedValue == "-1")
            globall.showMessage(imgMsg, lblMsg, "A situação deve ser selecionada!");
        else if (((ddlSit.SelectedValue == "3") && (string.IsNullOrEmpty(txtQtdAtz.Text) || (txtQtdAtz.Text == "0"))) ||
            (ddlSit.SelectedValue == "5") && (txtQtdAtz.Enabled) && string.IsNullOrEmpty(txtQtdAtz.Text))
            globall.showMessage(imgMsg, lblMsg, "A quantidade autorizada deve ser informada!");
        else if ((ddlSit.SelectedValue == "5") && string.IsNullOrEmpty(txtPdmVldPrg.Text))
            globall.showMessage(imgMsg, lblMsg, "A data de validade do procedimento deve ser informada!");
        else if (ddlSit.SelectedValue == "7" && string.IsNullOrEmpty(hdfIdPdm.Value))
            globall.showMessage(imgMsg, lblMsg, "Nenhum procedimento selecionado!");
        else if (ddlSit.SelectedValue == "7" && txtQtdAtz.Text == "0")
            globall.showMessage(imgMsg, lblMsg, "Não existe saldo para efetuar a troca de código!");
        else if ((ddlSit.SelectedValue == "7") && (grdMaster.DataKeys[grdMaster.SelectedIndex].Values["IdPdm"].ToString() == hdfIdPdm.Value))
            globall.showMessage(imgMsg, lblMsg, "O procedimento solicitado e o procedimento selecionado devem ser diferentes!");
        else if (!string.IsNullOrEmpty(txtPdmVldPrg.Text) && !validaProrrogacao())
            globall.showMessage(imgMsg, lblMsg, "O prazo máximo para prorrogação é de até 30 dias após hoje, com limite de até 120 dias a partir da data da solicitação!");
        else if (!globall.isInteger(txtQtdAtz.Text))
            globall.showMessage(imgMsg, lblMsg, "Quantidade inválida!");
        else if (txtGpaJst.Text.Length < 40)
            globall.showMessage(imgMsg, lblMsg, "Por favor, informe a justificativa com no mínimo 40 caracteres!");
        else
        {
            string idNgc = string.Empty;
            // Flag para indicar se existe negociação para a execução de SP/SADT.
            // Para consulta e solicitação é definido como true porque nestes casos a execução
            // é executada pelo profissional e/ou contratado
            bool existeNgc = true;
            // Flag para indicar se o usuário pode autorizar a negativa do procedimento
            bool podeAutorizarNegativa = true;

            WebProfile Profile = WebProfile.GetProfile("username");

            // Procedimento que terá validado a negociação e se o usuário pode autorizar a negativa
            string idPdm;
            // Se for troca de código o procedimento esta no hiddenfield, para os outros, o procedimento 
            // é o selecionado no Grid
            if (ddlSit.SelectedValue == "7")
                idPdm = hdfIdPdm.Value;
            else
                idPdm = grdMaster.DataKeys[grdMaster.SelectedIndex].Values["IdPdm"].ToString();
            

            // Verifica se o usuário possui permissão para auditar a negativa, exceto para administrador
            if (Profile.Seguranca.IdPpl != "1")
            {
                string[] outParam2 = { "@OutAtz" };
                string[] outResult2;

                DBASQL dba2 = new DBASQL();

                SqlParameter[] paramVldMsg = 
                {
                    dba2.MakeInParam("@IdOpe",SqlDbType.SmallInt,2,1),
                    dba2.MakeInParam("@IdGia",SqlDbType.Int,4,hdfIdSol.Value),
                    dba2.MakeInParam("@IdPdm",SqlDbType.Int,4,idPdm),
                    dba2.MakeInParam("@IdUsr",SqlDbType.Int,4,Profile.Seguranca.IdUsr),
                    dba2.MakeOutParam("@OutAtz",SqlDbType.Bit,1),
                };

                outResult2 = dba2.RunProc("ssAtz_VldAudMsg", paramVldMsg, outParam2);
                dba2.Dispose();
                // Tratamento para a mensagem com a negativa
                if (outResult2[0] == "False")
                {
                    podeAutorizarNegativa = false;
                }
            }

            if ((hdfSolTip.Value == "2") && (podeAutorizarNegativa))
            {
                string[] outParam = { "@OutErr", "@OutAtz", "@OutIdMsg", "@OutIdNgc", "@OutMsg" };
                string[] outResult;

                DBASQL dba = new DBASQL();

                SqlParameter[] paramVldCon = 
                {
                    dba.MakeInParam("@IdGia",SqlDbType.Int,4,hdfIdSol.Value),
                    dba.MakeInParam("@IdPdm",SqlDbType.Int,4,idPdm),
                    dba.MakeOutParam("@OutErr",SqlDbType.Bit,1),
                    dba.MakeOutParam("@OutAtz",SqlDbType.Bit,1),
                    dba.MakeOutParam("@OutIdMsg",SqlDbType.VarChar,200),
                    dba.MakeOutParam("@OutMsg",SqlDbType.VarChar,160),
                    dba.MakeOutParam("@OutIdNgc",SqlDbType.Int,4),
                };

                outResult = dba.RunProc("ssAtz_VldAud", paramVldCon, outParam);
                dba.Dispose();
                // Tratamento para a mensagem com a negativa
                if (outResult[1] == "True")
                {
                    existeNgc = true;
                    idNgc = outResult[3];
                }
            }
            
            if (existeNgc && podeAutorizarNegativa)
            {
                globall.showMessage(imgMsg, lblMsg, string.Empty);
                dtsDetail.UpdateParameters["IdSol"].DefaultValue = hdfIdSol.Value;
                dtsDetail.UpdateParameters["Sol_Tip"].DefaultValue = hdfSolTip.Value;
                dtsDetail.UpdateParameters["IdPdm"].DefaultValue = grdMaster.DataKeys[grdMaster.SelectedIndex].Values["IdPdm"].ToString();
                dtsDetail.UpdateParameters["Spd_IdSit"].DefaultValue = ddlSit.SelectedValue;
                dtsDetail.UpdateParameters["Spa_Jst"].DefaultValue = txtGpaJst.Text;
                dtsDetail.UpdateParameters["IdUsr"].DefaultValue = Profile.Seguranca.IdUsr;
                dtsDetail.UpdateParameters["Sol_QtdAtz"].DefaultValue = txtQtdAtz.Text;
                dtsDetail.UpdateParameters["Spd_DatVld"].DefaultValue = txtPdmVldPrg.Text;
                dtsDetail.UpdateParameters["IdNovPdm"].DefaultValue = hdfIdPdm.Value;
                dtsDetail.UpdateParameters["IdNgc"].DefaultValue = idNgc;
                dtsDetail.Update();
                grdMaster.DataBind();
                grdAudLog.DataBind();
                clearPage();
            }
            else if (podeAutorizarNegativa == false)
                globall.showMessage(imgMsg, lblMsg, "Você não esta autorizado a auditar procedimento com a negativa abaixo!");
            else
                globall.showMessage(imgMsg, lblMsg, "Não existe negociação cadastrada para execução deste procedimento no Contratado!");
        }
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
            // Troca de Código
            if (ddlSit.SelectedValue == "7")
            {
                txtPsqPdm.Visible = true;
                ibtAdicionar.Visible = true;
                btnPsqPdm.Visible = true;
            }
            // Negado Auditoria
            else if (ddlSit.SelectedValue == "4")
            {
                txtQtdAtz.Text = "0";
            }
            // Prorrogado Validade e Pendente
            else if ((ddlSit.SelectedValue == "5") && (grdMaster.DataKeys[grdMaster.SelectedIndex].Values["IdSit"].ToString() == "0")) 
            {
                txtPdmVldPrg.Enabled = true;
                txtQtdAtz.Enabled = true;
            }
            // Prorrogado Validade
            else if (ddlSit.SelectedValue == "5")
            {
                txtPdmVldPrg.Enabled = true;
            }
            // Autorizado Auditoria
            else if (ddlSit.SelectedValue == "3")
            {
                txtQtdAtz.Enabled = true;
            }
        }
    }
    protected void btnPsqPdm_Click(object sender, EventArgs e)
    {
        ModalPopupExtender1.Show();
    }

    #region Popup PDM

    protected void grd_Sorted(object sender, EventArgs e)
    {
        ModalPopupExtender1.Show();
    }

    protected void btnBuscar_Click(object sender, ImageClickEventArgs e)
    {
        ModalPopupExtender1.Show();
        dtsPdm.SelectParameters["Pdm_Cod"].DefaultValue = txtBnf_MtrPop.Text;
        dtsPdm.SelectParameters["Pdm_Dsc"].DefaultValue = txtBnf_NmePop.Text;
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

    /* 1 - Codigos da paginação da aba SOLICITAÇÕS AUTORIZADAS---------------------------------------------------------*/

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
        globall.showMessage(imgMsg, lblMsg, string.Empty);

        hdfIdPdm.Value = grd.DataKeys[grd.SelectedIndex].Values["IdPdm"].ToString();
        lblPdmCod.Text = grd.DataKeys[grd.SelectedIndex].Values["Pdm_Cod"].ToString();
        lblPdmDsc.Text = HttpUtility.HtmlDecode(grd.DataKeys[grd.SelectedIndex].Values["Pdm_Dsc"].ToString());

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
        dtsPdm.SelectParameters["Pdm_Cod"].DefaultValue = string.Empty;
        dtsPdm.SelectParameters["Pdm_Dsc"].DefaultValue = string.Empty;
        dtsPdm.DataBind();
        grd.DataBind();
        ModalPopupExtender1.Hide();
        grd.SelectedIndex = -1;
    }

    #endregion
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
                globall.showMessage(imgMsg, lblMsg, string.Empty);
            }
            else
            {
                globall.showMessage(imgMsg, lblMsg,"O código de procedimento informado não foi encontrado.");
            }
        }
        else
            globall.showMessage(imgMsg, lblMsg,"Por favor, informe o código do procedimento que deseja adicionar.");
    }
    protected void dtsDetail_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        string outSts = ((SqlParameter)e.Command.Parameters["@Out_Sts"]).Value.ToString();
        if (outSts == "1")
            globall.showMessage(imgMsg, lblMsg, "O procedimento selecionado já esta na solicitação!");
        else if (outSts == "2")
            globall.showMessage(imgMsg, lblMsg, "Não é permitido trocar um procedimento que já foi realizado!");
        else if (outSts == "3")
            globall.showMessage(imgMsg, lblMsg, "Não é permitido alterar a validade de SP/SADT!");
        else if (outSts == "4")
            globall.showMessage(imgMsg, lblMsg, "Não é permitido prorrogar a validade para procedimento sem saldo para execução!");
        else if (outSts == "5")
            globall.showMessage(imgMsg, lblMsg, "Não é permitido alterar situação de procedimento vencido!");
        else if (outSts == "6")
            globall.showMessage(imgMsg, lblMsg, "Erro na pesquisa que verifica se o profissional possui negociação para a execução da consulta!");
        else if (outSts == "7")
            globall.showMessage(imgMsg, lblMsg, "Profissional não possui negociação cadastrada para execução da consulta!");
        else if (outSts == "8")
            globall.showMessage(imgMsg, lblMsg, "Não existe saldo na solicitação para autorizar a execução de SP/SADT!");
        else if (outSts == "9")
            globall.showMessage(imgMsg, lblMsg, "O prazo máximo para prorrogar a validade é de 30 dias após a validade atual");
    }

    protected void btnCnc_Click(object sender, ImageClickEventArgs e)
    {
        if (txtGpaJst.Text.Length < 40)
            globall.showMessage(imgMsg, lblMsg, "Por favor, informe a justificativa com no mínimo 40 caracteres!");
        else
        {
            WebProfile Profile = WebProfile.GetProfile("username");
            DBASQL dba = new DBASQL();
            string[] outParam = { "@Out_Err" };
            string[] outResult;
            SqlParameter[] param = 
                {
                    dba.MakeInParam("@GiaTip",SqlDbType.TinyInt,1,hdfSolTip.Value),
                    dba.MakeInParam("@IdGia",SqlDbType.Int,4,hdfIdSol.Value),
                    dba.MakeInParam("@IdPdm",SqlDbType.Int,4,grdMaster.DataKeys[grdMaster.SelectedIndex].Values["IdPdm"].ToString()),
                    dba.MakeInParam("@IdUsr",SqlDbType.Int,4,Profile.Seguranca.IdUsr),
                    dba.MakeInParam("@IdSit",SqlDbType.TinyInt,1,9),
                    dba.MakeInParam("@Gpa_Jst",SqlDbType.VarChar,200,txtGpaJst.Text),
                    dba.MakeOutParam("@Out_Err",SqlDbType.Bit,1)
                };
            outResult = dba.RunProc("stAtz_GiaCnc", param, outParam);
            if (outResult[0] == "True")
            {
                globall.showMessage(imgMsg, lblMsg, "Ocorreram erros na tentativa de cancelar a execução!");                
            }
            else
            {
                globall.showMessage(imgMsg, lblMsg, "Execução cancelada com sucesso!");
                grdMaster.DataBind();
                grdAudLog.DataBind();
                clearPage();
            }
            dba.Dispose();
        }
    }
    private void imprimirGuia()
    {


        DBASQL db = new DBASQL();
        SqlParameter[] param = 
                {
                    db.MakeInParam("@IdSol",SqlDbType.Int,4,hdfIdSol.Value),
                    db.MakeInParam("@Sol_Tip",SqlDbType.TinyInt,1,hdfSolTip.Value)

                };
        DataSet dtset = db.RunProcDataSet("srAtz_Aud", param, "setAtz");
        LocalReport localReport = new LocalReport();
        localReport.ReportPath = @"App_Rpt\AtzAud.rdlc";

        //A method that returns a collection for our report
        //Note: A report can have multiple data sources
        //***List<Employee> employeeCollection = GetData();

        //Give the collection a name (EmployeeCollection) so that we can reference it in our report designer
        //***ReportDataSource reportDataSource = new ReportDataSource("setSolSdt", dtset);

        //***localReport.DataSources.Add(reportDataSource);

        // ###
        //Associa o DataSet com a fonte do ReportViewer
        ReportDataSource reportDataSource = new ReportDataSource("Relatorio_srAtz_Aud", dtset.Tables[0]);

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
        Response.AddHeader("content-disposition", "attachment; filename=SMSaude-Aud." + fileNameExtension);
        Response.BinaryWrite(renderedBytes);
        Response.End();
    }
    protected void btnImprimir_Click(object sender, EventArgs e)
    {
        imprimirGuia();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (grdMaster.SelectedIndex == -1)
            globall.showMessage(imgMsg, lblMsg, "Nenhum procedimento selecionado!");
    }

}
