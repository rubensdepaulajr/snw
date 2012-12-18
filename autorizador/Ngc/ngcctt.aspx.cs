using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using br.com.totaltiss.Data;
using Snw.WebPage;

public partial class Atz_ngcctt : PageBase
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            DBASQL dba = new DBASQL(); 
            SqlDataReader reader;
            dba.RunSql("SELECT IdRde, Rde_Nme FROM dbo.Atz_Rde ORDER BY Rde_Nme", out reader);
            cblRde.DataSource = reader;
            cblRde.DataBind();
            dba.Dispose();

            DBASQL dba2 = new DBASQL();
            SqlDataReader reader2;
            dba2.RunSql("SELECT IdEsp, Esp_Dsc FROM dbo.Atz_Esp ORDER BY Esp_Dsc", out reader2);
            ddlEsp.DataSource = reader2;
            ddlEsp.DataBind();
            dba2.Dispose();

            DBASQL dba3 = new DBASQL();
            SqlDataReader reader3;
            dba3.RunSql("SELECT IdGrp, Grp_Dsc FROM dbo.Atz_Grp ORDER BY Grp_Dsc", out reader3);
            ddlGrp.DataSource = reader3;
            ddlGrp.DataBind();
            dba3.Dispose();

            // DataTable que conterá os procedimentos selecionados
            DataTable dtb = new DataTable();
            // Adiciona os nomes e tipos das colunas
            dtb.Columns.Add("Pdm_Cod").Unique = true;
            dtb.Columns.Add("Pdm_Dsc");
            ViewState["dtbPdm"] = dtb;
            lvwPdm.DataSource = dtb;
            lvwPdm.DataBind();
            dtb.Dispose();
        }
    }
    private void selectedRde()
    {
        string selectedItems = string.Empty;
        hdfIdRde.Value = string.Empty;
        lblRdeNme.Text = string.Empty;
        foreach (ListItem li in cblRde.Items)
        {
            if (li.Selected)
            {
                selectedItems += li.Value +",";
                lblRdeNme.Text += li.Text + " ";
            }
        }
        if (!string.IsNullOrEmpty(selectedItems))
            selectedItems = selectedItems.Remove(selectedItems.Length - 1, 1);

        if (string.IsNullOrEmpty(lblRdeNme.Text))
            lblRdeNme.Text = "TODAS";

        hdfIdRde.Value = selectedItems;
    }
    private void selectedSeqEnd()
    {
        string selectedItems = string.Empty;
        hdfSeqEnd.Value = string.Empty;
        lblSeqEnd.Text = string.Empty;
        foreach (ListItem li in cblSeqEnd.Items)
        {
            if (li.Selected)
            {
                selectedItems += li.Value + ",";
                lblSeqEnd.Text += li.Text + " ";
            }
        }
        if (!string.IsNullOrEmpty(selectedItems))
            selectedItems = selectedItems.Remove(selectedItems.Length - 1, 1);

        if (string.IsNullOrEmpty(lblSeqEnd.Text))
            lblSeqEnd.Text = "TODAS";

        hdfSeqEnd.Value = selectedItems;
    }
    private void selectedPdm()
    {
        string selectedItems = string.Empty;
        hdfPdmCod.Value = string.Empty;
        DataTable dtb = new DataTable();
        dtb = (DataTable)ViewState["dtbPdm"];
        foreach (DataRow dr in dtb.Rows)
        {
            selectedItems += "'"+ dr["Pdm_Cod"].ToString() + "',";
        }
        // Verifica se algum procedimento foi selecionado para remover a vírgula no final da string
        if (!string.IsNullOrEmpty(selectedItems))
            selectedItems = selectedItems.Remove(selectedItems.Length - 1, 1);
        lvwPdmRes.DataSource = dtb;
        lvwPdmRes.DataBind();
        dtb.Dispose();
        hdfPdmCod.Value = selectedItems;
    }
    private void gotoPageView(int pageIndex)
    {
        pnlFiltro.Visible = (pageIndex > 0);
        if (pageIndex == 0)
        {
            dtsNgc.SelectParameters["IdNgc"].DefaultValue = string.Empty;
            dtsNgc.SelectParameters["IdCtt"].DefaultValue = string.Empty;
            dtsNgc.SelectParameters["Cte_SeqEnd"].DefaultValue = string.Empty;
            dtsNgc.SelectParameters["IdRde"].DefaultValue = string.Empty;
            dtsNgc.SelectParameters["IdEsp"].DefaultValue = string.Empty;
            dtsNgc.SelectParameters["IdGrp"].DefaultValue = string.Empty;
            dtsNgc.SelectParameters["Pdm_Cod"].DefaultValue = string.Empty;
            dtsNgc.SelectParameters["Ngc_DatIni"].DefaultValue = string.Empty;
            dtsNgc.SelectParameters["Ngc_DatFim"].DefaultValue = string.Empty;
        }
        else if (pageIndex == 1)
        {
            globall.showMessage(imgMsg, lblMsg, string.Empty);
        }
        mvw.ActiveViewIndex = pageIndex;
    }
    private void addPdm(string pdmCod)
    {
        string pdmDsc = string.Empty;

        DataTable dtb = new DataTable();
        dtb = (DataTable)ViewState["dtbPdm"];

        if (pdmCod.Trim().Length > 0)
        {
            using (AppEntities ctx = new AppEntities())
            {
                var pdm = ctx.Atz_Pdm.FirstOrDefault(p => p.Pdm_Cod == pdmCod);

                if (pdm == null)
                {
                    globall.showMessage(imgMsg, lblMsg, "Nenhum procedimento encontrado com o informado!");
                    return;
                }
                else if (pdm.Pdm_Atv == false)
                {
                    globall.showMessage(imgMsg, lblMsg, "Não é permitido inserir procedimento inativo na negociação!");
                    return;
                }
                else
                {
                    pdmDsc = pdm.Pdm_Dsc;
                }
            }


            //DBASQL db = new DBASQL();
            //SqlParameter[] param = { 
            //                           db.MakeInParam("@Pdm_Cod", SqlDbType.VarChar, 20, pdmCod),
            //                           db.MakeInParam("@Pdm_Atv", SqlDbType.Bit,1,1), // Somente procedimento ativo
            //                       };
            //SqlDataReader dr = db.runProcDataReader("ssAtz_Pdm", param);

            //if (dr.Read())
            //{
            //    pdmCod = dr["Pdm_Cod"].ToString();
            //    pdmDsc = dr["Pdm_Dsc"].ToString();
            //}
            //db.Dispose();

            //if (!string.IsNullOrEmpty(pdmDsc))
            //{
                globall.showMessage(imgMsg, lblMsg, string.Empty);

                // Cria uma nova linha no DataTable
                DataRow drw = dtb.NewRow();
                // Adiciona os dados à nova linha criada
                drw[0] = pdmCod;
                drw[1] = pdmDsc;
                try
                {
                    // Adiciona a linha no DataTable
                    dtb.Rows.Add(drw);
                }
                catch
                {
                    globall.showMessage(imgMsg, lblMsg, "Este procedimento já foi selecionado!");
                }
                ViewState["dtbPdm"] = dtb;
                lvwPdm.DataSource = dtb;
                lvwPdm.DataBind();
                globall.showMessage(imgMsg, lblMsg, string.Empty);
            //}
            //else
            //{
            //    globall.showMessage(imgMsg, lblMsg, "O código do procedimento informado não foi encontrado..");
            //}
        }
        else
            globall.showMessage(imgMsg, lblMsg, "Por favor, informe o código do procedimento que deseja adicionar.");

        dtb.Dispose();
    }
    protected void lvwPdm_SelectedIndexChanging(object sender, ListViewSelectEventArgs e)
    {
        string pdmCod = lvwPdm.DataKeys[e.NewSelectedIndex].Value.ToString();

        DataTable dtb = new DataTable();
        dtb = (DataTable)ViewState["dtbPdm"];
        DataRow drw = dtb.NewRow();
        // Procura no datatable pelo profissional a ser removido
        foreach (DataRow dr in dtb.Rows)
        {
            if (dr["Pdm_Cod"].ToString() == pdmCod)
            {
                drw = dr;
            }
        }
        //Remove do datatable a linha que contém o procedimento
        if (!drw.IsNull("Pdm_Cod"))
            drw.Delete();

        lvwPdm.DataSource = dtb;
        lvwPdm.DataBind();
        ViewState["dtbPdm"] = dtb;
        dtb.Dispose();
        globall.showMessage(imgMsg, lblMsg, string.Empty);
    }
    protected void lvwPdm_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "Add")
        {
            TextBox txtCod = (TextBox)lvwPdm.InsertItem.FindControl("txtPdmCod");
            addPdm(txtCod.Text);
            txtCod.Text = string.Empty;
        }
        else if (e.CommandName == "ShowPopup")
            showPopupPdm();
    }
    private void visualizarNgc()
    {
        selectedRde();
        selectedPdm();
        selectedSeqEnd(); 

        dtsNgc.SelectParameters["IdNgc"].DefaultValue = txtIdNgc.Text;
        dtsNgc.SelectParameters["IdCtt"].DefaultValue = txtIdCtt.Text;
        dtsNgc.SelectParameters["Cte_SeqEnd"].DefaultValue = hdfSeqEnd.Value;
        dtsNgc.SelectParameters["IdRde"].DefaultValue = hdfIdRde.Value;
        if (ddlEsp.SelectedValue != "-1")
            dtsNgc.SelectParameters["IdEsp"].DefaultValue = ddlEsp.SelectedValue;
        else
            dtsNgc.SelectParameters["IdEsp"].DefaultValue = string.Empty;
        if (ddlGrp.SelectedValue != "-1")
            dtsNgc.SelectParameters["IdGrp"].DefaultValue = ddlGrp.SelectedValue;
        else
            dtsNgc.SelectParameters["IdGrp"].DefaultValue = string.Empty;
        dtsNgc.SelectParameters["Pdm_Cod"].DefaultValue = hdfPdmCod.Value;
        if (txtDatIni.Text != "")
            dtsNgc.SelectParameters["Ngc_DatIni"].DefaultValue = txtDatIni.Text + " 00:00";
        else
            dtsNgc.SelectParameters["Ngc_DatIni"].DefaultValue = string.Empty;
        if (txtDatFim.Text != "")
            dtsNgc.SelectParameters["Ngc_DatFim"].DefaultValue = txtDatFim.Text + " 23:59";
        else
            dtsNgc.SelectParameters["Ngc_DatFim"].DefaultValue = string.Empty;
        try
        {
            dtsNgc.DataBind();
        }
        catch (Exception ex)
        {
            globall.showMessage(imgMsg2, lblMsg2, "Erro na pesquisa! [" + ex.Message + "]");
        }
        gotoPageView(1);

    }
    private void inserirNgc(string tipAco)
    {
        string idEsp = string.Empty;
        string idGrp = string.Empty;
        DateTime? datIni = null;

        selectedRde();
        selectedPdm();
        selectedSeqEnd(); 

        if (ddlEsp.SelectedValue != "-1")
            idEsp = ddlEsp.SelectedValue;
        if (ddlGrp.SelectedValue != "-1")
            idGrp = ddlGrp.SelectedValue;
        if (!string.IsNullOrEmpty(txtDatIni2.Text))
            datIni = Convert.ToDateTime(txtDatIni2.Text + " 00:00:00");

        string[] outParam = { "@Out_TotNgc" };
        string[] outResult;

        try
        {
            DBASQL dba = new DBASQL();
            SqlParameter[] param = 
                {
                    dba.MakeInParam("@TipAco",SqlDbType.Char,1,tipAco),
                    dba.MakeInParam("@IdCtt",SqlDbType.BigInt,8,txtIdCtt.Text),
                    dba.MakeInParam("@Cte_SeqEnd",SqlDbType.NVarChar,100,hdfSeqEnd.Value),
                    dba.MakeInParam("@IdRde",SqlDbType.NVarChar,100,hdfIdRde.Value),
                    dba.MakeInParam("@IdEsp",SqlDbType.SmallInt,2,idEsp),
                    dba.MakeInParam("@IdGrp",SqlDbType.TinyInt,1,idGrp),
                    dba.MakeInParam("@Pdm_Cod",SqlDbType.NVarChar,600,hdfPdmCod.Value),
                    dba.MakeInParam("@Ngc_DatIni",SqlDbType.SmallDateTime,4,datIni),
                    dba.MakeInParam("@Ngc_Vlr",SqlDbType.Real,4,txtVlr2.Text),
                    dba.MakeInParam("@Ngc_VlrFlm",SqlDbType.Real,4,txtVlrFlm2.Text),
                    dba.MakeInParam("@Ngc_FtrCh_",SqlDbType.Real,4,txtFtr2.Text),
                    dba.MakeInParam("@Ngc_Uni",SqlDbType.Char,10,"CH"),
                    dba.MakeInParam("@Ngc_Crt",SqlDbType.Char,1,rbtCrt.SelectedValue),
                    dba.MakeInParam("@IdUsr",SqlDbType.Int,4,Profile.Seguranca.IdUsr),
                    dba.MakeOutParam("@Out_TotNgc",SqlDbType.Int,4),
                };

            outResult = dba.RunProc("stAtz_NgcCttIns", param, outParam);
            dba.Dispose();
            if (tipAco == "S")
            {
                lblTotNgc2.Text = "Total de negociações que serão inseridas para o filtro selecionado: " + outResult[0];
                gotoPageView(2);
            }
            else
            {
                lblTotNgc.Text = "Total de negociações inseridas: " + outResult[0];
                gotoPageView(0);
            }
        }
        catch (Exception ex)
        {
            globall.showMessage(imgMsg2, lblMsg2, "Erro na pesquisa! inserirNgc[" + ex.Message + "]");
        }
    }
    private void alterarNgc(string tipAco)
    {
        string idEsp = string.Empty;
        string idGrp = string.Empty;
        DateTime? datIni = null;
        DateTime? datFim = null;

        selectedRde();
        selectedPdm();
        selectedSeqEnd(); 

        if (ddlEsp.SelectedValue != "-1")
            idEsp = ddlEsp.SelectedValue;
        if (ddlGrp.SelectedValue != "-1")
            idGrp = ddlGrp.SelectedValue;
        if (!string.IsNullOrEmpty(txtDatIni.Text))
            datIni = Convert.ToDateTime(txtDatIni.Text + " 00:00");
        if (!string.IsNullOrEmpty(txtDatFim.Text))
            datFim = Convert.ToDateTime(txtDatFim.Text + " 23:59");

        string[] outParam = { "@Out_TotNgc" };
        string[] outResult;

        try
        {
            DBASQL dba = new DBASQL();
            SqlParameter[] param = 
                {
                    dba.MakeInParam("@TipAco",SqlDbType.Char,1,tipAco),
                    dba.MakeInParam("@IdNgc",SqlDbType.Int,4,txtIdNgc.Text),
                    dba.MakeInParam("@IdCtt",SqlDbType.BigInt,8,txtIdCtt.Text),
                    dba.MakeInParam("@SeqEnd",SqlDbType.NVarChar,100,hdfSeqEnd.Value),
                    dba.MakeInParam("@IdRde",SqlDbType.NVarChar,100,hdfIdRde.Value),
                    dba.MakeInParam("@IdEsp",SqlDbType.SmallInt,2,idEsp),
                    dba.MakeInParam("@IdGrp",SqlDbType.TinyInt,1,idGrp),
                    dba.MakeInParam("@Pdm_Cod",SqlDbType.NVarChar,600,hdfPdmCod.Value),
                    dba.MakeInParam("@Ngc_DatIni",SqlDbType.SmallDateTime,4,datIni),
                    dba.MakeInParam("@Ngc_DatFim",SqlDbType.SmallDateTime,4,datFim),
                    dba.MakeInParam("@Ngc_Vlr",SqlDbType.Real,4,txtVlr3.Text),
                    dba.MakeInParam("@Ngc_VlrFlm",SqlDbType.Real,4,txtVlrFlm3.Text),
                    dba.MakeInParam("@Ngc_FtrCh_",SqlDbType.Real,4,txtFtr3.Text),
                    dba.MakeInParam("@Ngc_Uni",SqlDbType.Char,10,"CH"),
                    dba.MakeInParam("@Ngc_Crt",SqlDbType.Char,1,rbtCrt.SelectedValue),
                    dba.MakeInParam("@IdUsr",SqlDbType.Int,4,Profile.Seguranca.IdUsr),
                    dba.MakeOutParam("@Out_TotNgc",SqlDbType.Int,4),
                };

            outResult = dba.RunProc("stAtz_NgcCtt", param, outParam);
            dba.Dispose();
            if (tipAco == "S")
            {
                lblTotNgc3.Text = "Total de negociações que serão alteradas para o filtro selecionado: " + outResult[0];
                gotoPageView(3);
            }
            else
            {
                lblTotNgc.Text = "Total de negociações alteradas: " + outResult[0];
                gotoPageView(0);
            }
        }
        catch (Exception ex)
        {
            globall.showMessage(imgMsg3, lblMsg3, "Erro na pesquisa! alterarNgc[" + ex.Message + "]");
        }
    }
    private void finalizarNgc(string tipAco)
    {
        string idEsp = string.Empty;
        string idGrp = string.Empty;
        DateTime? datIni = null;
        DateTime? datFim = null;

        selectedRde();
        selectedPdm();
        selectedSeqEnd(); 

        if (ddlEsp.SelectedValue != "-1")
            idEsp = ddlEsp.SelectedValue;
        if (ddlGrp.SelectedValue != "-1")
            idGrp = ddlGrp.SelectedValue;
        if (!string.IsNullOrEmpty(txtDatIni.Text))
            datIni = Convert.ToDateTime(txtDatIni.Text + " 00:00");
        if ((tipAco == "U") && (!string.IsNullOrEmpty(txtDatFim4.Text)))
            datFim = Convert.ToDateTime(txtDatFim4.Text + " 23:59");

        string[] outParam = { "@Out_TotNgc", "@Out_Err" };
        string[] outResult;

        try
        {
            DBASQL dba = new DBASQL();
            SqlParameter[] param = 
                {
                    dba.MakeInParam("@TipAco",SqlDbType.Char,1,tipAco),
                    dba.MakeInParam("@IdNgc",SqlDbType.Int,4,txtIdNgc.Text),
                    dba.MakeInParam("@IdCtt",SqlDbType.BigInt,8,txtIdCtt.Text),
                    dba.MakeInParam("@SeqEnd",SqlDbType.NVarChar,100,hdfSeqEnd.Value),
                    dba.MakeInParam("@IdRde",SqlDbType.NVarChar,100,hdfIdRde.Value),
                    dba.MakeInParam("@IdEsp",SqlDbType.SmallInt,2,idEsp),
                    dba.MakeInParam("@IdGrp",SqlDbType.TinyInt,1,idGrp),
                    dba.MakeInParam("@Pdm_Cod",SqlDbType.NVarChar,600,hdfPdmCod.Value),
                    dba.MakeInParam("@Ngc_DatIni",SqlDbType.SmallDateTime,4,datIni),
                    dba.MakeInParam("@Ngc_DatFim",SqlDbType.SmallDateTime,4,datFim),
                    dba.MakeInParam("@Ngc_Crt",SqlDbType.Char,1,rbtCrt.SelectedValue),
                    dba.MakeInParam("@IdUsr",SqlDbType.Int,4,Profile.Seguranca.IdUsr),
                    dba.MakeOutParam("@Out_TotNgc",SqlDbType.Int,4),
                    dba.MakeOutParam("@Out_Err",SqlDbType.Bit,1),
                };

            outResult = dba.RunProc("stAtz_NgcCttFim", param, outParam);
            dba.Dispose();
            if (tipAco == "S")
            {
                lblTotNgc4.Text = "Total de negociações que serão finalizadas para o filtro selecionado: " + outResult[0];
                gotoPageView(4);
            }
            else
            {
                lblTotNgc.Text = "Total de negociações finalizadas: " + outResult[0];
                gotoPageView(0);
            }
        }
        catch (Exception ex)
        {
            globall.showMessage(imgMsg4, lblMsg4, "Erro na pesquisa! finalizarNgc[" + ex.Message + "]");
        }
    }    
    protected void btnOk_Click(object sender, ImageClickEventArgs e)
    {
        if (!string.IsNullOrEmpty(txtDatIni.Text) && !globall.isDate(txtDatIni.Text))
            globall.showMessage(imgMsg, lblMsg, "Data Inicial inválida.");
        else if (!string.IsNullOrEmpty(txtDatFim.Text) && !globall.isDate(txtDatFim.Text))
            globall.showMessage(imgMsg, lblMsg, "Data Final inválida.");
        else if (!string.IsNullOrEmpty(txtIdCtt.Text) && !globall.isInteger(txtIdCtt.Text))
            globall.showMessage(imgMsg, lblMsg, "Matrícula do Contratado inválida!");
        else
        {
            lblIdNgc.Text = txtIdNgc.Text;
            lblIdCtt.Text = txtIdCtt.Text;
            lblEspDsc.Text = ddlEsp.SelectedItem.Text;
            lblGrpDsc.Text = ddlGrp.SelectedItem.Text;
            lblDatIni.Text = txtDatIni.Text;
            lblDatFim.Text = txtDatFim.Text;

            switch (rblTip.SelectedValue)
            {
                case "V":
                    visualizarNgc();
                    break;
                case "F":
                    finalizarNgc("S");
                    break;
                case "U":
                    alterarNgc("S");
                    break;
                case "I":
                    inserirNgc("S");
                    break;
            }
        }
    }
    protected void btnNewPsq_Click(object sender, ImageClickEventArgs e)
    {
        gotoPageView(0);
    }
    #region Grid Navegação
    protected void ddlGrdEspPages_SelectedIndexChanged(object sender, EventArgs e)
    {
        globall.selectPageGrid(grdNgc);
    }
    protected void paginateGrdEsp(object sender, CommandEventArgs e)
    {
        globall.getCurrentPageGrid(grdNgc, e.CommandArgument.ToString());
    }
    #endregion
    protected void btnPgaIni_Click(object sender, ImageClickEventArgs e)    
    {
        Response.Redirect("../atz/pes.aspx");
    }
    protected void rbtFtr_CheckedChanged(object sender, EventArgs e)
    {
        txtFtr3.Enabled = true;
        txtVlr3.Enabled = false;
        txtVlr3.Text = string.Empty;
    }
    protected void rbtVlr_CheckedChanged(object sender, EventArgs e)
    {
        txtFtr3.Enabled = false;
        txtVlr3.Enabled = true;
        txtFtr3.Text = string.Empty;
    }
    protected void rbtFtr2_CheckedChanged(object sender, EventArgs e)
    {
        txtFtr2.Enabled = true;
        txtVlr2.Enabled = false;
        txtVlr2.Text = string.Empty;
    }
    protected void rbtVlr2_CheckedChanged(object sender, EventArgs e)
    {
        txtFtr2.Enabled = false;
        txtVlr2.Enabled = true;
        txtFtr2.Text = string.Empty;
    }
    protected void ibtSave3_Click(object sender, ImageClickEventArgs e)
    {
        if (rbtFtr3.Checked == false && rbtVlr3.Checked == false)
            globall.showMessage(imgMsg3, lblMsg3, "O Fator de CH ou o Valor deve ser informado!");
        else if (rbtFtr3.Checked && txtFtr3.Text.Trim() == "")
            globall.showMessage(imgMsg3, lblMsg3, "O Fator de CH deve ser informado!");
        else if (rbtVlr3.Checked && txtVlr3.Text.Trim() == "")
            globall.showMessage(imgMsg3, lblMsg3, "O valor deve ser informado!");
        else
        {
            alterarNgc("U");
        }
    }
    protected void ibtCancel_Click(object sender, ImageClickEventArgs e)
    {
        gotoPageView(0);
    }
    protected void txtIdCtt_TextChanged(object sender, EventArgs e)
    {
        if (!globall.isInteger(txtIdCtt.Text))
            globall.showMessage(imgMsg, lblMsg, "Matrícula do contratado inválida!");
        else if (!string.IsNullOrEmpty(txtIdCtt.Text))
        {
            DBASQL dba = new DBASQL();
            SqlDataReader reader;
            SqlParameter[] param = {
                                       dba.MakeInParam("@Cte_IdCtt",SqlDbType.BigInt,8,txtIdCtt.Text),
                                       dba.MakeInParam("@Fit",SqlDbType.NVarChar,100,"(Cte_DatFim IS NULL OR Cte_DatFim > GETDATE())")
                                   };
            reader = dba.runProcDataReader("ssAtz_CttEnd", param);
            cblSeqEnd.DataSource = reader;
            cblSeqEnd.DataBind();
            dba.Dispose();
        }
    }
    protected void rblTip_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblIdNgc0.Enabled = true;
        txtIdNgc.Enabled = true;
        txtIdNgc.Text = string.Empty;
        lblDatIni0.Enabled = false;
        txtDatIni.Enabled = false;
        txtDatIni.Text = string.Empty;
        lblDatFim0.Enabled = false;
        txtDatFim.Enabled = false;
        txtDatFim.Text = string.Empty;

        switch (rblTip.SelectedIndex)
        {
            case 0: // Visualizar
                lblDatIni0.Enabled = true;
                txtDatIni.Enabled = true;
                lblDatFim0.Enabled = true;
                txtDatFim.Enabled = true;
                break;
            case 1: // Inserir
                lblIdNgc0.Enabled = false;
                txtIdNgc.Enabled = false;
                break;
        }
    }
    #region ModalPopup
    private void showPopupPdm()
    {
        ModalPopupExtenderPdm.Show();
    }
    private void hidePopupPdm()
    {
        txtPopPdmCod.Text = "";
        txtPopPdmDsc.Text = "";
        dtsPdm.SelectParameters["Pdm_Cod"].DefaultValue = string.Empty;
        dtsPdm.SelectParameters["Pdm_Dsc"].DefaultValue = string.Empty;
        dtsPdm.DataBind();
        grdPopPdm.DataBind();
        ModalPopupExtenderPdm.Hide();
        grdPopPdm.SelectedIndex = -1;
    }
    protected void btnPopBuscarPdm_Click(object sender, ImageClickEventArgs e)
    {
        ModalPopupExtenderPdm.Show();
        dtsPdm.SelectParameters["Pdm_Cod"].DefaultValue = txtPopPdmCod.Text;
        dtsPdm.SelectParameters["Pdm_Dsc"].DefaultValue = txtPopPdmDsc.Text;
        grdPopPdm.DataBind();
        if (grdPopPdm.Rows.Count == 0)
            lblEmptyGrid.Text = "Nenhum registro encontrado!";
        else
            lblEmptyGrid.Text = string.Empty;
    }
    protected void grdPopPdm_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (HttpUtility.HtmlDecode(grdPopPdm.DataKeys[grdPopPdm.SelectedIndex].Values["Pdm_Atv"].ToString()) == "False")
        {
            globall.showMessage(imgMsg, lblMsg, "Não é permitido incluir na negociação procedimento inativo!");
            return;
        }

        DataTable dtb = new DataTable();
        dtb = (DataTable)ViewState["dtbPdm"];

        globall.showMessage(imgMsg, lblMsg, string.Empty);

        // Cria uma nova linha no DataTable
        DataRow drw = dtb.NewRow();
        drw[0] = grdPopPdm.DataKeys[grdPopPdm.SelectedIndex].Values["Pdm_Cod"].ToString();
        drw[1] = HttpUtility.HtmlDecode(grdPopPdm.DataKeys[grdPopPdm.SelectedIndex].Values["Pdm_Dsc"].ToString());
        try
        {
            // Adiciona a linha no DataTable
            dtb.Rows.Add(drw);
        }
        catch
        {
            globall.showMessage(imgMsg, lblMsg, "Este procedimento já foi selecionado!");
        }
        ViewState["dtbPdm"] = dtb;
        lvwPdm.DataSource = dtb;
        lvwPdm.DataBind();
        dtb.Dispose();
        hidePopupPdm();
    }
    protected void ibtFecharPdm_Click(object sender, ImageClickEventArgs e)
    {
        hidePopupPdm();
    }
    protected void grdPopPdm_Sorted(object sender, EventArgs e)
    {
        ModalPopupExtenderPdm.Show();
    }
    protected void ddlGrdPopPdmPages_SelectedIndexChanged(object sender, EventArgs e)
    {
        globall.selectPageGrid(grdPopPdm);
    }
    protected void paginateGrdPopPdm(object sender, CommandEventArgs e)
    {
        globall.getCurrentPageGrid(grdPopPdm, e.CommandArgument.ToString());
    }
    #endregion
    protected void ibtSave2_Click(object sender, ImageClickEventArgs e)
    {
        if (string.IsNullOrEmpty(txtDatIni2.Text))
            globall.showMessage(imgMsg2, lblMsg2, "A data de início da negociação deve ser informada!");
        else if (!globall.isDate(txtDatIni2.Text))
            globall.showMessage(imgMsg2, lblMsg2, "Data inválida!");
        else
        {
            inserirNgc("U");
        }
    }
    protected void ibtSave4_Click(object sender, ImageClickEventArgs e)
    {
        if (string.IsNullOrEmpty(txtDatFim4.Text))
            globall.showMessage(imgMsg4, lblMsg4, "A data da finalização da negociação deve ser inormada!");
        else if (!globall.isDate(txtDatFim4.Text))
            globall.showMessage(imgMsg4, lblMsg4, "Data inválida!");
        else
        {
            finalizarNgc("U");
        }
    }
}
