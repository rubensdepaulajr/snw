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

public partial class solcon : System.Web.UI.Page
{
    void Page_PreRender(object obj, EventArgs e)
    {
        ViewState["update"] = Session["update"];
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        // Desabilita o clique do botão no post
        btnSolAtz.Attributes.Add("onclick", "this.disabled=true;" + ClientScript.GetPostBackEventReference(btnSolAtz, "").ToString());

        // Tratamento para não permitir voltar para esta página
        string pageIsValid = Session["pageIsValid"].ToString();
        if (pageIsValid == "0")
        {
            Session["pageIsValid"] = 1;
            Response.Redirect("atd.aspx");
        }
        if (!Page.IsPostBack)
        {
            Session["update"] = Server.UrlEncode(System.DateTime.Now.ToString());

            // Indica se o beneficiário foi validado via biometria
            ViewState["bioIsValid"] = "False";
            // Indica se o benficiário deve ser validado com biometria
            // "" - Biometria não cadastrada para o beneficiário
            // False - Usuário não deve ser validado via biometria
            // True - Usuário cadastrado e deve ser validade via biometria
            ViewState["validateBioBnf"] = string.Empty;
            setDataHora();
            rblGiaCrt.SelectedIndex = -1;
            if (Profile.Seguranca.Cte_BioCon == true)
            {
                pnlBio.Visible = true;
                upnDoc.Visible = false;
            }
            else
            {
                pnlBio.Visible = false;
                upnDoc.Visible = true;
            }
            if (Request.QueryString.Count > 0)
            {
                //getBeneficiario(Convert.ToInt32(PreviousPage.idBnf),null);
                //ViewState["bioIsValid"] = PreviousPage.isIdentified.ToString();
                getBeneficiario(null, Request.QueryString["bnf"].ToString(), false);
                if (Request.QueryString["bio"].ToString() == "0")
                {
                    ViewState["bioIsValid"] = "False";
                    lblBio.Text = "Beneficiário não identificado!";
                }
                else
                {
                    ViewState["bioIsValid"] = "True";
                    lblBio.Text = "Beneficiário identificado com sucesso!";
                }
            }
        }
    }
    private void setDataHora()
    {
        // Definindo a data da solicitação
        txtDatEms.Text = DateTime.Now.Date.ToShortDateString();

        // Definindo o horário da solicitação
        DateTime horSol = DateTime.Now;
        txtHor.Text = horSol.Hour.ToString();
        txtMin.Text = horSol.Minute.ToString();
    }
    private void clearPage()
    {
        ddlPrf.SelectedIndex = 0;
        ddlEsp.SelectedIndex = 0;
        txtBnf_Mtr.Text = string.Empty;
        lblBnf.Text = string.Empty;
        lblPrd.Text = string.Empty;
        txtSolInf.Text = string.Empty;
        dtsBnf.SelectParameters["Bnf_Mtr"].DefaultValue = string.Empty;
        dtsBnf.SelectParameters["Bnf_Nme"].DefaultValue = string.Empty;
        grd.DataBind();
    }
   

    /// <summary>
    /// Verifica o tipo de atendimento que o contratado pode efetuar
    /// [E-Eletiva|U-Urgência|A-Ambos]
    /// </summary>
    private void getTipAtendimento()
    {
        if (!string.IsNullOrEmpty(hdfIdRde.Value))
        {
            string tipAtd = string.Empty;
            rblGiaCrt.Enabled = false;

            DBASQL dba = new DBASQL();
            SqlDataReader reader;
            dba.RunSql("SELECT	Lce_TipAtd " +
                        "FROM	dbo.Atz_LcrEsp, dbo.Atz_Lcr " +
                        "WHERE	IdLcr = Lce_IdLcr " +
                        "  AND	Lce_IdEsp = " + ddlEsp.SelectedValue +
                        "  AND	Lcr_IdCtt = " + Profile.Local.IdCtt +
                        "  AND	Lcr_SeqEnd = " + Profile.Local.Cte_SeqEnd +
                        "  AND  Lcr_IdRde = " + hdfIdRde.Value, out reader);
            while (reader.Read())
            {
                tipAtd = reader["Lce_TipAtd"].ToString();
            }
            dba.Dispose();
            // Se o tipo de atendimento for A-Ambos o usuário poderá selecionar o tipo desejado
            if (tipAtd == "A")
            {
                rblGiaCrt.Enabled = true;
            }
            else if (tipAtd == "E")
            {
                rblGiaCrt.Enabled = false;
                rblGiaCrt.SelectedIndex = 0;
            }
            else if (tipAtd == "U")
            {
                rblGiaCrt.Enabled = false;
                rblGiaCrt.SelectedIndex = 1;
            }
        }
    }
    private void getProfissional()
    {
        // "Limpa" a especialidade
        ddlEsp.SelectedIndex = 0;

        // "Limpa" o Dropdown
        ddlPrf.Items.Clear();
        // Define o primeiro item da seleção
        ddlPrf.Items.Add(new ListItem("Selecione", "-1"));

        // Tratamento para mostrar somente o Profissional no Contratado Local
        // quando o usuário "logado" for um Profissional
        string idUsr;

        if (Profile.Seguranca.IdPpl == "2")
            idUsr = Profile.Seguranca.IdUsr;
        else
            idUsr = null;

        // Selecionando o Profissional do Contratado Local
        DBASQL dba = new DBASQL();
        SqlParameter[] param = 
                {
                    dba.MakeInParam("@IdCtt",SqlDbType.BigInt, 8, Profile.Local.IdCtt),
                    dba.MakeInParam("@Cte_SeqEnd",SqlDbType.TinyInt,1,Profile.Local.Cte_SeqEnd),
                    dba.MakeInParam("@IdUsr",SqlDbType.Int,4,idUsr),
                    dba.MakeInParam("@Lce_TipAtd",SqlDbType.Char,1,rblGiaCrt.SelectedValue),
                };
        SqlDataReader reader;
        reader = dba.runProcDataReader("ssAtz_GiaPel", param);
        ddlPrf.DataSource = reader;
        ddlPrf.DataBind();
        dba.Dispose();
    }
    private void getEspProfissional()
    {
        // "Limpa" o Dropdown
        ddlEsp.Items.Clear();
        // Define o primeiro item da seleção
        ddlEsp.Items.Add(new ListItem("Selecione", "-1"));
        // "Limpa" o procedimento
        //lblIdPdm.Text = string.Empty;
        //lblPdmDsc.Text = string.Empty;

        // Selecionando as Especialidades do Profissional relacionadas ao Contratado Local
        DBASQL dba = new DBASQL();
        SqlParameter[] param = 
            {
                dba.MakeInParam("@IdCtt",SqlDbType.Int,4,Profile.Local.IdCtt),
                dba.MakeInParam("@Cte_SeqEnd",SqlDbType.TinyInt,1,Profile.Local.Cte_SeqEnd),
                dba.MakeInParam("@IdPrf",SqlDbType.Int,4,ddlPrf.SelectedValue),
                dba.MakeInParam("@Lce_TipAtd",SqlDbType.Char,1,rblGiaCrt.SelectedValue),
            };
        SqlDataReader reader;
        reader = dba.runProcDataReader("ssAtz_EspCon", param);
        ddlEsp.DataSource = reader;
        ddlEsp.DataBind();
        dba.Dispose();
    }
    private void getBeneficiario(int? idBnf, string bnfMtr, bool verify)
    {
        lblBio.Text = string.Empty;
        string bnfIdd = string.Empty;
        ViewState["bioIsValid"] = "False";
        DBASQL dba = new DBASQL();
        SqlParameter[] param = {
                                    dba.MakeInParam("IdBnf",SqlDbType.Int,4,idBnf),
                                    dba.MakeInParam("@Bnf_Mtr", SqlDbType.VarChar, 20, bnfMtr) 
                               };
        SqlDataReader reader;
        reader = dba.runProcDataReader("ssAtz_Bnf", param);
        while (reader.Read())
        {
            lblBio.Text = string.Empty;
            hdfIdBnf.Value = reader["IdBnf"].ToString();
            lblBnf.Text = reader["Bnf_Mtr"].ToString() + " - " + reader["Bnf_Nme"].ToString();
            lblPrd.Text = reader["Prd_Nme"].ToString();
            hdfIdRde.Value = reader["IdRde"].ToString();
            if (string.IsNullOrEmpty(reader["Bnf_IdTit"].ToString()))
            {
                rblTipDoc.Visible = true;
                lblSolInf.Text = "Selecione e informe o Nº do documento de identificação do beneficiário.";
            }
            else
            {
                rblTipDoc.Visible = false;
                lblSolInf.Text = "Informe o nome da mãe do beneficiário.";
            }
            ViewState["validateBioBnf"] = reader["Bnf_Bio"].ToString();
            bnfIdd = reader["Bnf_Idd"].ToString();
        }
        dba.Dispose();
        if (verify == true && (!String.IsNullOrEmpty(bnfIdd)))
            verifyBio(Convert.ToInt32(bnfIdd));
    }
    protected void lbtBuscar_Click(object sender, EventArgs e)
    {
        ModalPopupExtender1.Show();
        txtBnf_NmePop.Focus();
    }
    protected void btnOk_Click(object sender, ImageClickEventArgs e)
    {
        getBeneficiario(null, txtBnf_Mtr.Text, true);        
    }
    protected void ddlPrf_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlPrf.SelectedIndex > 0)
        {
            getEspProfissional();
        }
    }
    protected void btnSolAtz_Click(object sender, ImageClickEventArgs e)
    {
        if (Session["update"].ToString() == ViewState["update"].ToString())
        {
            if (string.IsNullOrEmpty(lblPdmCod.Text))
                globall.showMessage(imgMsg, lblMsg, "Nenhum Procedimento selecionado!");
            else if (string.IsNullOrEmpty(lblBnf.Text))
                globall.showMessage(imgMsg, lblMsg, "Nenhum Beneficiário selecionado!");
            else if ((txtSolInf.Visible) && (string.IsNullOrEmpty(txtSolInf.Text)))
                globall.showMessage(imgMsg, lblMsg, "O documento de identificação do beneficiário deve ser informado!");
            else if ((rblTipDoc.Visible == true) && (rblTipDoc.SelectedValue == "CPF") && (!globall.isCPF(txtSolInf.Text)))
                globall.showMessage(imgMsg, lblMsg, "CPF inválido!");
            else if (ddlEsp.SelectedIndex == 0)
                globall.showMessage(imgMsg, lblMsg, "A Especialidade deve ser selecionada!");
            else if (rblGiaCrt.SelectedIndex == -1)
                globall.showMessage(imgMsg, lblMsg, "O Caráter da Solicitação deve ser selecionado!");
            else if (ddlPrf.SelectedIndex == 0)
                globall.showMessage(imgMsg, lblMsg, "O Profissional executante deve ser selecionado!");
            else if (Convert.ToInt32(txtHor.Text) > 23 || Convert.ToInt32(txtMin.Text) > 59)
                globall.showMessage(imgMsg, lblMsg, "Hora inválida!");
            else
            {
                string[] outParam = { "@Out_Err", "@Out_Atz", "@Out_IdMsg", "@Out_Msg", "@Out_IdNgc" };
                string[] outResult;

                int? idNgc;
                int qtdAtz;
                bool bioVld;
                string tipDoc = "MAE";

                if (rblTipDoc.Visible == true)
                    tipDoc = rblTipDoc.SelectedValue;

                imgMsg.Visible = false;
                globall.showMessage(imgMsg, lblMsg, string.Empty);

                // Verifica se o contratado local deve fazer a identificação via biometria ...
                if (Profile.Seguranca.Cte_BioCon)
                {
                    bioVld = Convert.ToBoolean(ViewState["bioIsValid"]);
                }
                // Se a biometria não for utilizada no contratado local, é indicado que a 
                // biometria é valida para que a negativa não seja gerada na sp de validação.
                else
                    bioVld = true;

                DBASQL dba = new DBASQL();

                SqlParameter[] paramVldCon = 
                    {
                        dba.MakeInParam("@IdCtt",SqlDbType.BigInt,8,Profile.Local.IdCtt),
                        dba.MakeInParam("@Cte_SeqEnd",SqlDbType.TinyInt,1,Profile.Local.Cte_SeqEnd),                
                        dba.MakeInParam("@IdPrf",SqlDbType.Int,4,ddlPrf.SelectedValue),
                        dba.MakeInParam("@IdEsp",SqlDbType.SmallInt,2,ddlEsp.SelectedValue),
                        dba.MakeInParam("@IdBnf",SqlDbType.BigInt,8,hdfIdBnf.Value),
                        dba.MakeInParam("@IdPdm",SqlDbType.Int,4,hdfIdPdm.Value),
                        dba.MakeInParam("@Gia_DatEms",SqlDbType.SmallDateTime,4,Convert.ToDateTime(txtDatEms.Text +" "+ txtHor.Text +":"+ txtMin.Text)),
                        dba.MakeInParam("@Gia_Crt",SqlDbType.Char,1,rblGiaCrt.SelectedValue),
                        dba.MakeInParam("@Bnf_BioVld",SqlDbType.Bit,1,bioVld),
                        dba.MakeOutParam("@Out_Err",SqlDbType.Bit,1),
                        dba.MakeOutParam("@Out_Atz",SqlDbType.Bit,1),
                        dba.MakeOutParam("@Out_IdMsg",SqlDbType.VarChar,200),
                        dba.MakeOutParam("@Out_Msg",SqlDbType.VarChar,160),
                        dba.MakeOutParam("@Out_IdNgc",SqlDbType.Int,4),
                    };

                outResult = dba.RunProc("ssAtz_VldCon", paramVldCon, outParam);
                dba.Dispose();
                // Tratamento para a mensagem com a negativa
                if (outResult[1] == "True")
                {
                    qtdAtz = 1;
                    idNgc = Convert.ToInt32(outResult[4]);
                }
                else
                {
                    qtdAtz = 0;
                    idNgc = null;
                }

                string[] outParam2 = { "@Out_Err", "@Out_Snh", "@Out_IdGia" };
                string[] outResult2;
                DBASQL dba2 = new DBASQL();
                SqlParameter[] paramGia = 
                    {
                        dba2.MakeInParam("@Gid_TipDoc",SqlDbType.Char,3,tipDoc),
                        dba2.MakeInParam("@Gid_NumDoc",SqlDbType.VarChar,50,txtSolInf.Text),
                        dba2.MakeInParam("@Gia_IdCtt",SqlDbType.BigInt,8,Profile.Local.IdCtt),
                        dba2.MakeInParam("@Gia_SeqEnd",SqlDbType.TinyInt,1,Profile.Local.Cte_SeqEnd),
                        dba2.MakeInParam("@Gia_IdPrf",SqlDbType.BigInt,8,ddlPrf.SelectedValue),
                        dba2.MakeInParam("@Gia_IdEsp",SqlDbType.SmallInt,2,ddlEsp.SelectedValue),
                        dba2.MakeInParam("@Gia_IdBnf",SqlDbType.BigInt,8,hdfIdBnf.Value),
                        dba2.MakeInParam("@Gia_IdUsr",SqlDbType.Int,4,Profile.Seguranca.IdUsr),
                        dba2.MakeInParam("@Gia_DatEms",SqlDbType.SmallDateTime,4,Convert.ToDateTime(txtDatEms.Text +" "+txtHor.Text +":"+ txtMin.Text)),
                        dba2.MakeInParam("@Gia_Crt",SqlDbType.Char,1,rblGiaCrt.SelectedValue),
                        dba2.MakeInParam("@Gia_Snh",SqlDbType.VarChar,20,globall.gerarStringRandomica(4)),
                        dba2.MakeInParam("@Gpd_IdPdm",SqlDbType.Int,4,hdfIdPdm.Value),
                        dba2.MakeInParam("@Gpm_IdMsg",SqlDbType.VarChar,200,outResult[2]),
                        dba2.MakeInParam("@Gpd_QtdAtz",SqlDbType.TinyInt,2,qtdAtz),
                        dba2.MakeInParam("@Gpd_IdNgc",SqlDbType.Int,4,idNgc),
                        // Utilizo a qtd. autorizada pois o status possui o mesmo valor [0-negado|1-autorizado]
                        dba2.MakeInParam("@Gpd_IdSit",SqlDbType.TinyInt,2,qtdAtz),
                        dba2.MakeOutParam("@Out_Err",SqlDbType.Bit,1),
                        dba2.MakeOutParam("@Out_Snh",SqlDbType.VarChar,20),
                        dba2.MakeOutParam("@Out_IdGia",SqlDbType.Int,4)
                    };
                outResult2 = dba2.RunProc("stAtz_GiaCon", paramGia, outParam2);
                dba2.Dispose();
                string solAtz = outResult[1];

                if (outResult[1] == "False")
                    solAtz = "-";
                else
                    solAtz = outResult2[1];

                lblSnh.Text = solAtz;

                if (outResult2[0] == "True")
                {
                    pnlAtz.Visible = false;
                    pnlPen.Visible = false;
                    imgMsg.Visible = true;
                    globall.showMessage(imgMsg, lblMsg, "Ocorreram erros na solicitação. Tente novamente");
                }
                else
                {
                    imgMsg.Visible = false;
                    globall.showMessage(imgMsg, lblMsg, string.Empty);
                    if (outResult[1] == "True")
                    {
                        pnlAtz.Visible = true;
                        pnlPen.Visible = false;
                    }
                    else
                    {
                        pnlAtz.Visible = false;
                        pnlPen.Visible = true;
                        // Selecionando as mensagens de negativa da Guia
                        DBASQL dba3 = new DBASQL();
                        SqlParameter[] param = 
                            {
                                dba3.MakeInParam("@IdGia",SqlDbType.Int, 4, outResult2[2]),
                            };
                        SqlDataReader reader;
                        reader = dba3.runProcDataReader("ssAtz_GiaPdmMsg", param);
                        btlMsg.DataSource = reader;
                        btlMsg.DataBind();
                        dba3.Dispose();
                    }
                    Session["pageIsValid"] = "0";
                    lblBnf.Text = string.Empty;
                    mvw.ActiveViewIndex = 1;
                }                
            }
        }
        else
        {
            globall.showMessage(imgMsg, lblMsg, "ERROR POST BACK REFRESH!!!!!!!!");
            mvw.ActiveViewIndex = 0;
        }
    }
    #region Popup Beneficiário
    protected void btnBuscar_Click(object sender, ImageClickEventArgs e)
    {
        ModalPopupExtender1.Show();
        dtsBnf.SelectParameters["Bnf_Mtr"].DefaultValue = txtBnf_MtrPop.Text;
        dtsBnf.SelectParameters["Bnf_Nme"].DefaultValue = txtBnf_NmePop.Text;
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
        lblBio.Text = string.Empty;
        ViewState["bioIsValid"] = "False";
        hdfIdBnf.Value = grd.DataKeys[grd.SelectedIndex].Values["IdBnf"].ToString();
        lblBnf.Text = grd.DataKeys[grd.SelectedIndex].Values["Bnf_Mtr"].ToString() + " - " + grd.DataKeys[grd.SelectedIndex].Values["Bnf_Nme"].ToString();
        lblPrd.Text = grd.DataKeys[grd.SelectedIndex].Values["Prd_Nme"].ToString();
        hdfIdRde.Value = grd.DataKeys[grd.SelectedIndex].Values["IdRde"].ToString();
        if (string.IsNullOrEmpty(grd.DataKeys[grd.SelectedIndex].Values["Bnf_IdTit"].ToString()))
        {
            rblTipDoc.Visible = true;
            lblSolInf.Text = "Selecione e informe o Nº do documento de identificação do beneficiário.";
        }
        else
        {
            rblTipDoc.Visible = false;
            lblSolInf.Text = "Informe o nome da mãe do beneficiário.";
        }
        ViewState["validateBioBnf"] = grd.DataKeys[grd.SelectedIndex].Values["Bnf_Bio"].ToString();

        verifyBio(Convert.ToInt32(grd.DataKeys[grd.SelectedIndex].Values["Bnf_Idd"].ToString()));

        hidePopup();
        
    }
    protected void btn_fechar_Click(object sender, ImageClickEventArgs e)
    {
        hidePopup();
    }
    protected void hidePopup()
    {
        txtBnf_NmePop.Text = "";
        txtBnf_MtrPop.Text = "";
        dtsBnf.SelectParameters["Bnf_Nme"].DefaultValue = string.Empty;
        dtsBnf.SelectParameters["Bnf_Mtr"].DefaultValue = string.Empty;
        dtsBnf.DataBind();
        grd.DataBind();

        ModalPopupExtender1.Hide();
        grd.SelectedIndex = -1;
    }
    #endregion
    protected void grd_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    e.Row.Attributes["onmouseover"] = "this.style.cursor='hand';this.style.textDecoration='underline';";
        //    e.Row.Attributes["onmouseout"] = "this.style.textDecoration='none';";

        //    e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(grd, "Select$" + e.Row.RowIndex);
        //}

    }
    protected void btnNewSol_Click(object sender, ImageClickEventArgs e)
    {
        Session["pageIsValid"] = "1";
        mvw.ActiveViewIndex = 0;
        clearPage();
        setDataHora();        
    }
    protected void grd_Sorted(object sender, EventArgs e)
    {
        ModalPopupExtender1.Show();
    }
    protected void rblGiaCrt_SelectedIndexChanged(object sender, EventArgs e)
    {
        //lblIdPdm.Text = string.Empty;
        //lblPdmDsc.Text = string.Empty;
        getProfissional();

        DBASQL dba = new DBASQL();
        SqlDataReader reader;
        dba.RunSql("SELECT IdPdm, Pdm_DscRsm, Pdm_Cod FROM dbo.vwAtz_Con WHERE Pdm_Crt = '"+ rblGiaCrt.SelectedValue +"'", out reader);
        while (reader.Read())
        {
            hdfIdPdm.Value = reader["IdPdm"].ToString();
            lblPdmCod.Text = reader["Pdm_Cod"].ToString();
            lblPdmDsc.Text = reader["Pdm_DscRsm"].ToString();
        }
        dba.Dispose();
    }
    private void verifyBio(int bnfIdd)
    {
        //  Verifica se o contratado esta configurado para utilizar biometria na elegibilidade
        if (Profile.Seguranca.Cte_BioCon == true)
        {            
            if (string.IsNullOrEmpty(hdfIdBnf.Value))
                lblBio.Text = "Nenhum beneficiário selecionado!";
            else if (bnfIdd <= 6)
            {
                lblBio.Text = "Idade menor ou igual a 6 anos. Identificação biométrica desativada!";
                ViewState["bioIsValid"] = "True";
            }
            else if (ViewState["validateBioBnf"].ToString() == "True")
            {
                Response.Redirect("../bio/ver.aspx?ori=solcon&bnf=" + hdfIdBnf.Value);
            }
            else if (string.IsNullOrEmpty(ViewState["validateBioBnf"].ToString()))
            {
                // Usuário não possui biometria cadastrada, o cadastro deve ser efetuado
                Response.Redirect("../bio/cad.aspx?ori=solcon&bnf=" + hdfIdBnf.Value);

            }
            else if (ViewState["validateBioBnf"].ToString() == "False")
            {
                // Usuário não deve ser validado via biometria
                lblBio.Text = "Beneficiário dispensado da identificação biométrica!";
                ViewState["bioIsValid"] = "True";
            }
        }
    }
    protected void dts_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        string tmp = e.Command.Parameters["@Out_Car"].Value.ToString() +"|"+
            e.Command.Parameters["@Out_Atz"].Value.ToString();
    }

}
