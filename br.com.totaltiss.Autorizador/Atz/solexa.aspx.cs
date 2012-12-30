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
using System.Collections.Generic;
using br.com.totaltiss.Web.Autorizador;

public partial class Atz_solexa : System.Web.UI.Page
{
  
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            // Tratamento para não permitir voltar para esta página
            string pageIsValid = Session["pageIsValid"].ToString();
            if (pageIsValid == "0")
            {
                Session["pageIsValid"] = 1;
                Response.Redirect("prf.aspx");
            }
            // Indica se o beneficiário foi validado via biometria
            ViewState["bioIsValid"] = "False";

            // Definindo a data da solicitação
            txtDatEms.Text = DateTime.Now.Date.ToShortDateString();

            // Definindo o horário da solicitação
            DateTime horSol = DateTime.Now;
            txtHor.Text = horSol.Hour.ToString();
            txtMin.Text = horSol.Minute.ToString();
            
            hdfIdGia.Value = Request.QueryString["Gia"].ToString();
            hdfIdBnf.Value = Request.QueryString["Bnf"].ToString();

            /*inicio parte que preenche os labels com info do benecifiario, profissional e especialidade*/
            DBASQL db = new DBASQL(); 
            SqlParameter[] paramInfoBnfPrfEsp = { db.MakeInParam("@IdGia",SqlDbType.BigInt,8,hdfIdGia.Value)   };
            SqlDataReader dr = db.runProcDataReader("ssAtz_GiaSolExa", paramInfoBnfPrfEsp);

            if (dr.Read())
            {                
                lblBnf_Mtr.Text = dr["Bnf_Mtr"].ToString();
                lblBnf_Nme.Text = dr["Bnf_Nme"].ToString();
                lblIdPrf.Text = dr["Gia_IdPrf"].ToString();
                lblPrf_Nme.Text = dr["Prf_Nme"].ToString();
                lblIdEsp.Text = dr["Gia_IdEsp"].ToString();
                lblEsp_Dsc.Text = dr["Esp_Dsc"].ToString();
                lblCid_Dsc.Text = dr["Cid_Dsc"].ToString();
                hdfIdBnf.Value = dr["IdBnf"].ToString();
                hdfGiaCrt.Value = dr["Gia_Crt"].ToString();
            }
            db.Dispose();
            /* fim da parte que preenche os labels */    
            // DataTable que conterá os procedimentos solicitados
            DataTable dtb = new DataTable();
            // Adiciona os nomes e tipos das colunas
            dtb.Columns.Add("IdPdm");
            dtb.Columns.Add("Pdm_Cod").Unique = true;            
            dtb.Columns.Add("Pdm_Dsc");
            dtb.Columns.Add("Qtd");
            dtb.Columns.Add("Pdm_QtdCh_");
            dtb.Columns.Add("IdMsg");
            dtb.Columns.Add("Atz");
            dtb.Columns.Add("IdGrp", typeof(int));
            dtb.Columns.Add("Grp_QtdCh_", typeof(decimal));
                 
            ViewState["dtbPdm"] = dtb;
            dtb.Dispose();
            WebProfile Profile = WebProfile.GetProfile("username");
            if ((Profile.Seguranca.BioPrf == true ) && (!String.IsNullOrEmpty(Request.QueryString["bio"].ToString())))
            {
                if (Request.QueryString["bio"].ToString() == "0")
                {
                    ViewState["bioIsValid"] = "False";
                    globall.showMessage(ImgErr, lblErr, "Profissional não identificado!");
                }
                else
                {
                    ViewState["bioIsValid"] = "True";
                    globall.showMessage(ImgErr, lblErr, "Profissional identificado com sucesso!");
                }
            }
        }
        this.EscondeCabecalhoGrid();
    }
    protected void EscondeCabecalhoGrid()
    {
        if (grdPdm.HeaderRow != null)
            grdPdm.HeaderRow.Visible = false;
    }
    /*define a intercalação de cores nos grids*/
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
        dtb = (DataTable)ViewState["dtbPdm"];
          
        ImgErr.Visible = false;
        lblErr.Text = String.Empty;

        // Cria uma nova linha no DataTable
        DataRow drw = dtb.NewRow();
        // Adiciona os dados à nova linha criada
        drw[0] = grd.DataKeys[grd.SelectedIndex].Values["IdPdm"].ToString();
        drw[1] = grd.DataKeys[grd.SelectedIndex].Values["Pdm_Cod"].ToString();
        drw[2] = HttpUtility.HtmlDecode(grd.DataKeys[grd.SelectedIndex].Values["Pdm_Dsc"].ToString());
        drw[3] = "1";
        drw[4] = grd.DataKeys[grd.SelectedIndex].Values["Pdm_QtdCh_"].ToString();

        drw["IdGrp"] = grd.DataKeys[grd.SelectedIndex].Values["Pdm_IdGrp"].ToString();
        drw["Grp_QtdCh_"] = grd.DataKeys[grd.SelectedIndex].Values["Grp_QtdCh_"].ToString();

        try
        {
            // Adiciona a linha no DataTable
            dtb.Rows.Add(drw);
        }
        catch
        {
            globall.showMessage(ImgErr,lblErr,"Este procedimento já foi selecionado!");
        }
        ViewState["dtbPdm"] = dtb;
        grdPdm.DataSource = dtb;
        grdPdm.DataBind();        
        dtb.Dispose();
        limpaPopup();
        this.EscondeCabecalhoGrid();
    }

    protected void btn_fechar_Click(object sender, ImageClickEventArgs e)
    {
        limpaPopup();
    }

    protected void limpaPopup()
    {
        txtBnf_NmePop.Text = "";
        txtBnf_MtrPop.Text = "";
        dtsPdm.SelectParameters["Pdm_Cod"].DefaultValue = String.Empty;
        dtsPdm.SelectParameters["Pdm_Dsc"].DefaultValue = String.Empty;
        dtsPdm.DataBind();
        grd.DataBind();
        ModalPopupExtender1.Hide();
        grd.SelectedIndex = -1;
    }
    #endregion

    /// <summary>
    /// Adiciona procedimento ao grid e ao datatable do viewstate, de acordo com o código digitado no textbox
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void imgBtnAdicionar_Click(object sender, ImageClickEventArgs e)
    {
        DataTable dtb = new DataTable();
        dtb = (DataTable)ViewState["dtbPdm"];

        if (txtPsqPdm.Text.Length > 0)
        {
            DBASQL dba = new DBASQL();
            SqlParameter[] param = { 
                                       dba.MakeInParam("@Pdm_Cod", SqlDbType.VarChar, 20, txtPsqPdm.Text),
                                       dba.MakeInParam("@Pdm_Atv", SqlDbType.Bit,1, 1)
                                   };
            SqlDataReader dr = dba.runProcDataReader("ssAtz_Pdm", param);
            
            if (dr.Read())
            {
                ImgErr.Visible = false;
                lblErr.Text = string.Empty;

                // Cria uma nova linha no DataTable
                DataRow drw = dtb.NewRow();
                // Adiciona os dados à nova linha criada
                drw[0] = dr["IdPdm"].ToString(); //IdPdm;
                drw[1] = dr["Pdm_Cod"].ToString(); //Pdm_Cod;
                drw[2] = dr["Pdm_Dsc"].ToString(); //Pdm_Dsc;
                drw[3] = "1";
                drw[4] = dr["Pdm_QtdCh_"].ToString();

                drw["IdGrp"] = dr["Pdm_IdGrp"];
                drw["Grp_QtdCh_"] = dr["Grp_QtdCh_"];

                try
                {
                    // Adiciona a linha no DataTable
                    dtb.Rows.Add(drw);
                }
                catch
                {
                    globall.showMessage(ImgErr, lblErr, "Este procedimento já foi selecionado!");
                }
                ViewState["dtbPdm"] = dtb;
                grdPdm.DataSource = dtb;
                grdPdm.DataBind();
                txtPsqPdm.Text = string.Empty;
                globall.showMessage(ImgErr, lblErr, string.Empty);
            }
            else
            {
                globall.showMessage(ImgErr, lblErr, "O código de procedimento informado não foi encontrado!");
            }
            dba.Dispose();
        }
        else
            globall.showMessage(ImgErr, lblErr, "Por favor, informe o código do procedimento que deseja adicionar.");

        dtb.Dispose();
        EscondeCabecalhoGrid();
    }

    protected void btnPsqPdm_Click(object sender, EventArgs e)
    {
        ModalPopupExtender1.Show();
    }

    /// <summary>
    /// Remove procedimento do grid
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void grdPdm_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataTable dtb = new DataTable();
        dtb = (DataTable)ViewState["dtbPdm"];        
        //DataRow drw = dtb.Rows.Find(grdPdm.Rows[grdPdm.SelectedIndex].Cells[0].Text);                        
        DataRow drw = dtb.NewRow(); 
        // procura na tabela pelo procedimento a ser removido
        foreach (DataRow dr in dtb.Rows)
        {
            if (dr["Pdm_Cod"].ToString() == grdPdm.Rows[grdPdm.SelectedIndex].Cells[0].Text)
            {              
                drw = dr;
            }               
        }

        //remove da tabela a linha que contém o procedimento
        if (!drw.IsNull("Pdm_Cod"))
            drw.Delete();
       
        grdPdm.DataSource = dtb;
        grdPdm.DataBind();
        ViewState["dtbPdm"] = dtb;
        dtb.Dispose();
        grdPdm.SelectedIndex = -1;
        globall.showMessage(ImgErr, lblErr, string.Empty);
        EscondeCabecalhoGrid();
    }
    /// <summary>
    /// Verifica se todos os procedimentos possuem  quantidade informada válida
    /// </summary>
    /// <returns></returns>
    protected Boolean ValidaQtdPdm()
    {
        if (grdPdm.Rows.Count > 0)
        {
            for (Int32 i = 0; i < grdPdm.Rows.Count; i++)
            {
                TextBox txtQtd = (TextBox)grdPdm.Rows[i].Cells[2].FindControl("txtQtd_Pdm");
                if (!globall.isInteger(txtQtd.Text))
                {
                    globall.showMessage(ImgErr, lblErr, "Existe um ou mais procedimentos com a quantidade informada inválida!");
                    return false;
                }
            }
            globall.showMessage(ImgErr, lblErr, string.Empty);
            return true;
        }
        else
        {
            globall.showMessage(ImgErr, lblErr, "Nenhum procedimento foi adicionado!");
            return false;
        }
    }

    /// <summary>
    /// Atualiza os índices contidos no view state de acordo com o que foi colocado no gridview
    /// </summary>
    protected double AtualizaQtdViewState()
    {
        DataTable dtb = new DataTable();
        int idxGdw = 0;
        double qtdCh_ = 0;

        dtb = (DataTable)ViewState["dtbPdm"];
        foreach (DataRow drw in dtb.Rows)
        {
            TextBox txtQtd = (TextBox)grdPdm.Rows[idxGdw].Cells[2].FindControl("txtQtd_Pdm");
            drw["Qtd"] = txtQtd.Text;
            qtdCh_ += Convert.ToDouble(drw["Pdm_QtdCh_"].ToString());
            idxGdw++;
        }
        dtb.AcceptChanges();
        grdPdm.DataSource = dtb;
        grdPdm.DataBind();
        ViewState["dtbPdm"] = dtb;
        dtb.Dispose();
        EscondeCabecalhoGrid();
        return qtdCh_;
    }

    /// <summary>
    /// Efetua a validação dos procedimentos, grava os as mensagens o solicitações autorizadas e, se houverem, as mensagens negativas no banco.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSol_Aut_Click(object sender, ImageClickEventArgs e)
    {
        if(ValidaQtdPdm())
            if (txtIndCln.Text.Length > 20)
            {
                bool bioVld;
                double qtdCh_ = AtualizaQtdViewState();

                WebProfile Profile = WebProfile.GetProfile("username");

                // Verifica se o profissional deve fazer a identificação via biometria ...
                if (Profile.Seguranca.BioPrf)
                {
                    bioVld = Convert.ToBoolean(ViewState["bioIsValid"]);
                }
                // Se a biometria não for utilizada no profissional, é indicado que a 
                // biometria é valida para que a negativa não seja gerada na sp de validação.
                else
                    bioVld = true;

                DataTable dtb = new DataTable();
                dtb = (DataTable)ViewState["dtbPdm"];

                #region Executa a autorização ou bloqueio dos procedimentos
                string[] outParam = { "@Out_Err", "@Out_Atz", "@Out_IdMsg", "@Out_Msg" };
                string[] outResult;
                string idMsg;

                DBASQL dba = new DBASQL();              
                
                //loop que varre o data table validando ou não os procedimentos solicitados
                foreach (DataRow dr in dtb.Rows)
                {
                    SqlParameter[] paramVldCon = 
                    {
                        dba.MakeInParam("@IdCtt",SqlDbType.BigInt,8,Profile.Local.IdCtt),
                        dba.MakeInParam("@Cte_SeqEnd",SqlDbType.TinyInt,1,Profile.Local.Cte_SeqEnd),
                        dba.MakeInParam("@IdBnf",SqlDbType.BigInt,8,Int32.Parse(hdfIdBnf.Value)),
                        dba.MakeInParam("@IdPdm",SqlDbType.Int,4,dr[0]),
                        dba.MakeInParam("@Gpd_QtdSol",SqlDbType.TinyInt,1,Int16.Parse(dr[3].ToString())),
                        dba.MakeInParam("@Sol_DatEms",SqlDbType.SmallDateTime,4,Convert.ToDateTime(txtDatEms.Text +" "+ txtHor.Text +":"+ txtMin.Text)),
                        dba.MakeInParam("@IdGia",SqlDbType.Int,4,Convert.ToInt32(hdfIdGia.Value)),
                        dba.MakeInParam("@Prf_BioVld",SqlDbType.Bit,1,bioVld),
                        dba.MakeOutParam("@Out_Err",SqlDbType.Bit,1),
                        dba.MakeOutParam("@Out_Atz",SqlDbType.Bit,1),
                        dba.MakeOutParam("@Out_IdMsg",SqlDbType.VarChar,200),
                        dba.MakeOutParam("@Out_Msg",SqlDbType.VarChar,160)
                    };
                    outResult = dba.RunProc("ssAtz_VldSol", paramVldCon, outParam);

                    int qtdMaxCh_ = Convert.ToInt32(ConfigurationManager.AppSettings["qtdmaxchsol"]);

                    // Tratamento para a mensagem com a negativa
                       if (((hdfGiaCrt.Value == "U") && (string.IsNullOrEmpty(outResult[2]))) ||
                       ((hdfGiaCrt.Value == "E") && (string.IsNullOrEmpty(outResult[2])) && (qtdCh_ < qtdMaxCh_))) 
                    {
                        idMsg = null;
                    }
                    else
                    {                      
                        idMsg = outResult[2];
                        // A regra de quantidade de CH é valida somente se: 
                        //   - a solicitação foi originada de consulta eletiva
                        //   - a quantidade na parametrização no web.config for maior que zero
                        //   - a parametrização no grupo de procedimentos para o procedimento for maior que zero
                        if ((qtdCh_ >= qtdMaxCh_) && (hdfGiaCrt.Value == "E") && (qtdMaxCh_ > 0) && (Convert.ToDecimal(dr["Grp_QtdCh_"]) > 0))
                        {
                            if (string.IsNullOrEmpty(idMsg))
                                idMsg = idMsg + ConfigurationManager.AppSettings["msgnegchsol"];
                            else
                                idMsg = idMsg + "," + ConfigurationManager.AppSettings["msgnegchsol"];
                        }
                    }                             
                    dr["IdMsg"] = idMsg;
                    if (string.IsNullOrEmpty(idMsg))
                        dr["Atz"] = "True";
                    else
                        dr["Atz"] = "False";
                }
                #endregion

                dtb.AcceptChanges();

                //*********************************************************************
                //*** Verifica a quantidade máxima de CHs por grupo de procedimentos 
                //*** somente para consulta eletiva
                //*********************************************************************
                if (hdfGiaCrt.Value == "E")
                {
                    decimal aux = 0;
                    Dictionary<int, decimal> grupoProcedimento = new Dictionary<int, decimal>();

                    // Totalizando a quantidade de CH por grupo de procedimentos selecionados
                    foreach (DataRow dr in dtb.Rows)
                    {
                        if (grupoProcedimento.ContainsKey(Convert.ToInt32(dr["IdGrp"])))
                        {
                            aux = grupoProcedimento[Convert.ToInt32(dr["IdGrp"])];
                            grupoProcedimento[Convert.ToInt32(dr["IdGrp"])] = aux + Convert.ToDecimal(dr["Pdm_QtdCh_"]);

                        }
                        else
                        {
                            grupoProcedimento.Add(Convert.ToInt32(dr["IdGrp"]), Convert.ToDecimal(dr["Pdm_QtdCh_"]));
                        }

                    }

                    // Negando os procedimentos que ultapassaram a quantidade permitida no grupo
                    // ou que possuem a quantidade de CH igual a zero no grupo. Para procedimentos
                    // com a quantidade de CH igual a -1 (NULL) não negar por grupo.
                    foreach (var item in grupoProcedimento)
                    {
                        foreach (DataRow dr in dtb.Rows)
                        {
                            if ((Convert.ToInt32(dr["IdGrp"]) == item.Key) &&
                                (Convert.ToDecimal(dr["Grp_QtdCh_"]) != -1) &&
                                (
                                    (Convert.ToDecimal(dr["Grp_QtdCh_"]) == 0) ||
                                    (item.Value > Convert.ToDecimal(dr["Grp_QtdCh_"]))
                               ))
                            {
                                if (string.IsNullOrEmpty(dr["IdMsg"].ToString()))
                                    dr["IdMsg"] = ConfigurationManager.AppSettings["msgneggrpchsol"];
                                else
                                    dr["IdMsg"] = dr["IdMsg"] + "," + ConfigurationManager.AppSettings["msgneggrpchsol"];
                                dr["Atz"] = "False";
                            }

                        }
                    }
                    dtb.AcceptChanges();
                }
                //*** Fim da validação por grupo de pocedimentos ********************
                //*******************************************************************
                ViewState["dtbPdm"] = dtb;
                grdPdm.DataSource = dtb;
                grdPdm.DataBind();
                dtb.Dispose();
                dba.Dispose();
                globall.showMessage(ImgErr, lblErr, string.Empty);
                PersisteProcedimentosNoBanco();
            // fim bloco que valida pdm e grava no banco
            }
            else
            {
                globall.showMessage(ImgErr, lblErr, "Por favor, informe a indicação clínica com no mínimo 20 caracteres!");
            }
    }

    /// <summary>
    /// Grava os procedimentos no banco
    /// </summary>
    protected void PersisteProcedimentosNoBanco()
    {
        bool erro = false;
        string[] outParam = { "@Out_Err", "@Out_Snh", "@Out_IdSol", "@Out_Dpl" };
        string[] outResult;
        String IdSol = string.Empty;
        String Senha = string.Empty;
        WebProfile Profile = WebProfile.GetProfile("username");
        DBASQL dba = new DBASQL();
        SqlParameter[] paramGia = 
        {
                dba.MakeInParam("@IdGia",SqlDbType.Int,4,Convert.ToInt32(hdfIdGia.Value)),
                dba.MakeInParam("@Sol_IdUsr",SqlDbType.Int,4,Profile.Seguranca.IdUsr),
                dba.MakeInParam("@Sol_DatEms",SqlDbType.SmallDateTime,4,Convert.ToDateTime(txtDatEms.Text +" "+txtHor.Text +":"+ txtMin.Text)),
                dba.MakeInParam("@Sol_Snh",SqlDbType.VarChar,20,globall.gerarStringRandomica(4)),
                dba.MakeInParam("@Sol_IndCln",SqlDbType.VarChar,200,txtIndCln.Text),
                dba.MakeInParam("@Sol_Crt",SqlDbType.Char,1,"E"),            
                dba.MakeOutParam("@Out_Err",SqlDbType.Bit,1),
                dba.MakeOutParam("@Out_Snh",SqlDbType.VarChar,20),
                dba.MakeOutParam("@Out_IdSol",SqlDbType.Int,4),
                dba.MakeOutParam("@Out_Dpl",SqlDbType.Bit,1),
        };
        outResult = dba.RunProc("stAtz_Sol", paramGia, outParam);

        if (outResult[3] == "True")
        {
            globall.showMessage(ImgErr, lblErr, "Atenção! Já existe uma guia com estes dados!");
        }
        else
        if (outResult[0] == "True")
        {
            globall.showMessage(ImgErr, lblErr, "Erro ao incluir a guia de solicitação!");
        }
        else
        {
            Senha = outResult[1];
            IdSol = outResult[2];
            #region Incluindo os Procedimentos no Banco
            DataTable dtb = new DataTable();
            dtb = (DataTable)ViewState["dtbPdm"];

            string[] outParamPdm = { "@Out_Err" };
            string[] outResultPdm;

            foreach (DataRow row in dtb.Rows)
            {  
                SqlParameter[] paramPdm =
                    {
                        dba.MakeInParam("@Spd_IdSol",SqlDbType.Int,4,Convert.ToInt32(IdSol)),
                        dba.MakeInParam("@Spd_IdPdm",SqlDbType.Int,4,Convert.ToInt32(row["IdPdm"])),
                        dba.MakeInParam("@Spm_IdMsg",SqlDbType.VarChar,200,row["IdMsg"]),
                        dba.MakeInParam("@Spd_QtdSol",SqlDbType.TinyInt,1,Convert.ToInt16(row["Qtd"])),
                        dba.MakeInParam("@Spd_Dat",SqlDbType.SmallDateTime,4,Convert.ToDateTime(txtDatEms.Text +" "+txtHor.Text +":"+ txtMin.Text)),
                        dba.MakeInParam("@Spd_IdSit",SqlDbType.TinyInt,1,Convert.ToBoolean(row["Atz"])),
                        dba.MakeOutParam("@Out_Err",SqlDbType.Bit,1),
                    };

                outResultPdm = dba.RunProc("stAtz_SolPdm", paramPdm, outParamPdm);
                if (outResultPdm[0] == "True")
                {
                    erro = true;
                    globall.showMessage(ImgErr, lblErr, "Erro ao incluir procedimento na guia de solicitação!");
                    break;
                }

            }
            dtb.Dispose();
            #endregion

            dba.Dispose();

            if (!erro)
            {
                String ConfereViewState = VerificaExistenciaDePdmNegadoAutorizado();
                String B1 = "0", B2 = "0";
                if (ConfereViewState.Contains("AUTORIZADO"))
                    B1 = "1";

                if (ConfereViewState.Contains("NEGADO"))
                    B2 = "1";
                Session["pageIsValid"] = "0";
                Response.Redirect("solexaret.aspx?Gia=" + hdfIdGia.Value + "&Sol=" + IdSol + "&b1=" + B1 + "&b2=" + B2 + "&Snh=" + Senha + "&Bnf=" + hdfIdBnf.Value + "&bio=" + Request.QueryString["bio"]);
            }
        }
    }

    /// <summary>
    /// Varre o datatable do viewstate e verifica se existe algum procedimento negado ou algum procedimento autorizado
    /// </summary>
    /// <returns></returns>
    protected String VerificaExistenciaDePdmNegadoAutorizado()
    {
        DataTable dtb = new DataTable();
        dtb = (DataTable)ViewState["dtbPdm"];
        String aux = String.Empty;
        Boolean Negado = false;
        Boolean Autorizado = false;

        foreach (DataRow row in dtb.Rows)
        {
            if (row["Atz"].ToString() == "False" && Negado == false)
            {
                Negado = true;
                aux = aux + "| NEGADO ";
            }

            if (row["Atz"].ToString() == "True" && Autorizado == false)
            {
                Autorizado = true;
                aux = aux + "| AUTORIZADO ";
            }
        }            
        dtb.Dispose();
        return aux;
    }

    protected void btnFhaPci_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("fhapci.aspx?Bnf=" + hdfIdBnf.Value);
    }

    protected void btnPgaIni_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("prf.aspx");
    }

}
