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
using System.Text.RegularExpressions;

public partial class Atz_exeexa : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Desabilita o botão durante o post, tem que ficar fora do IsPostBack
        btnExeExa.Attributes.Add("onclick", "this.disabled=true;" + ClientScript.GetPostBackEventReference(btnExeExa, "").ToString());

        if (!Page.IsPostBack)
        {
            // Indica se o beneficiário foi validado via biometria
            ViewState["bioIsValid"] = "False";
            // Indica se o benficiário deve ser validado com biometria
            // "" - Biometria não cadastrada para o beneficiário
            // False - Usuário não deve ser validado via biometria
            // True - Usuário cadastrado e deve ser validade via biometria
            ViewState["validateBioBnf"] = string.Empty;

            // Definindo a data da solicitação
            txtDat.Text = DateTime.Now.Date.ToShortDateString();

            // Definindo o horário da solicitação
            DateTime horSol = DateTime.Now;
            txtHor.Text = horSol.Hour.ToString();
            txtMin.Text = horSol.Minute.ToString();

            // Selecionando o beneficiário
            //if (!string.IsNullOrEmpty(Request.QueryString["Mtr"]))
            //{
            //    searchBnf(null,Request.QueryString["Mtr"].ToString(),false);
            //}
            if (Request.QueryString.Count > 0)
            {
                // Quando redirecionado pela fihca do paciente
                if (Request.QueryString.Count == 1)
                {
                    searchBnf(Convert.ToInt32(Request.QueryString["bnf"]), null, true);
                }
                else
                {
                    // Quando redirecionado após passar pela elegibilidade bia biometria
                    searchBnf(null, Request.QueryString["bnf"].ToString(), false);
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
    }
    private void verifyBio(int bnfIdd)
    {
        //  Verifica se o contratado esta configurado para utilizar biometria na elegibilidade
        if (Profile.Seguranca.Cte_BioExe == true)
        {
            if (string.IsNullOrEmpty(lblIdBnf.Text))
                lblBio.Text = "Nenhum beneficiário selecionado!";
            else if (bnfIdd <= 6)
            {
                lblBio.Text = "Idade menor ou igual a 6 anos. Identificação biométrica desativada!";
                ViewState["bioIsValid"] = "True";
            }
            else if (ViewState["validateBioBnf"].ToString() == "True")
            {
                Response.Redirect("../bio/ver.aspx?ori=exeexa&bnf=" + lblIdBnf.Text);
            }
            else if (string.IsNullOrEmpty(ViewState["validateBioBnf"].ToString()))
            {
                // Usuário não possui biometria cadastrada, o cadastro deve ser efetuado
                Response.Redirect("../bio/cad.aspx?ori=exeexa&bnf=" + lblIdBnf.Text);

            }
            else if (ViewState["validateBioBnf"].ToString() == "False")
            {
                // Usuário não deve ser validado via biometria
                lblBio.Text = "Beneficiário dispensado da identificação biométrica!";
                ViewState["bioIsValid"] = "True";
            }
        }
    }
    private void searchBnf(int? idBnf,string bnfMtr, bool verify)
    {
        lblBio.Text = string.Empty;
        string bnfIdd = string.Empty;
        ViewState["bioIsValid"] = "False";
        DBASQL db = new DBASQL();
        SqlParameter[] paramInfoBnf = 
        {
            db.MakeInParam("IdBnf",SqlDbType.Int,4,idBnf),
            db.MakeInParam("@Bnf_Mtr", SqlDbType.VarChar, 20, bnfMtr) 
        };
        SqlDataReader dr = db.runProcDataReader("ssAtz_Bnf", paramInfoBnf);
        if (dr.Read())
        {
            lblBio.Text = string.Empty;
            lblIdBnf.Text = dr["IdBnf"].ToString();
            lblBnf_Mtr.Text = dr["Bnf_Mtr"].ToString();
            lblBnf_Nme.Text = dr["Bnf_Nme"].ToString();
            lblPrdNme.Text = dr["Prd_Nme"].ToString();
            hdfIdRde.Value = dr["IdRde"].ToString();
            globall.showMessage(imgErr, lblErr, string.Empty);
            PreencheGridPdm();

            ViewState["validateBioBnf"] = dr["Bnf_Bio"].ToString();
            bnfIdd = dr["Bnf_Idd"].ToString();
        }
        else
        {
            globall.showMessage(imgErr, lblErr, "Código de beneficiário não encontrado.");
        }
        if ((verify == true) && (!String.IsNullOrEmpty(bnfIdd)))
            verifyBio(Convert.ToInt32(bnfIdd));
        db.Dispose();
    }
    /// <summary>
    /// Verifica o tipo de atendimento que o contratado pode efetuar
    /// [E-Eletiva|U-Urgência|A-Ambos]
    /// </summary>
    private void getTipoAtendimento(string idEsp, RadioButtonList rbl)
    {
        if (!string.IsNullOrEmpty(hdfIdRde.Value))
        {
            string tipAtd = "E";
            DBASQL dba = new DBASQL();
            SqlDataReader reader;
            dba.RunSql("SELECT	Lce_TipAtd " +
                        "FROM	dbo.Atz_LcrEsp, dbo.Atz_Lcr " +
                        "WHERE	IdLcr = Lce_IdLcr " +
                        "AND	Lce_IdEsp = " + idEsp +
                        "AND	Lcr_IdCtt = " + Profile.Local.IdCtt +
                        "AND	Lcr_SeqEnd = " + Profile.Local.Cte_SeqEnd +
                        "  AND  Lcr_IdRde = " + hdfIdRde.Value, out reader);
            while (reader.Read())
            {
                tipAtd = reader["Lce_TipAtd"].ToString();
            }
            dba.Dispose();
            rbl.SelectedValue = tipAtd;
        }
        //getEspContratado();
    }
    private void getEspContratado()
    {
        // "Limpa" a especialidade
        ddlEspCtt.SelectedIndex = 0;
        // "Limpa" o Dropdown
        ddlEspCtt.Items.Clear();
        // Define o primeiro item da seleção
        ddlEspCtt.Items.Add(new ListItem("Selecione", "-1"));

        // Selecionando as especialidades do Contratado Local
        DBASQL dba = new DBASQL();
        SqlParameter[] param2 = 
                {
                    dba.MakeInParam("@IdCtt",SqlDbType.BigInt, 8, Profile.Local.IdCtt),
                    dba.MakeInParam("@SeqEnd",SqlDbType.TinyInt,1,Profile.Local.Cte_SeqEnd)
                };
        ddlEspCtt.DataSource = dba.runProcDataReader("ssAtz_LcrEsp", param2);
        ddlEspCtt.DataBind();
        dba.Dispose();
    }
    private void getProfissional()
    {
        string idUsr = string.Empty;
        string idPpl = Profile.Seguranca.IdPpl;

        // "Limpa" a especialidade
        ddlEspPrf.SelectedIndex = 0;

        // Se o papel do usuário for PROFISSIONAL ou PROFISSIONAL SP/SADT,
        // só deverá ser exibido no ddlPrf o login dele mesmo.
        if ((idPpl == "2") || (idPpl == "5"))
            idUsr = Profile.Seguranca.IdUsr;

        // "Limpa" o Dropdown
        ddlPrf.Items.Clear();
        // Define o primeiro item da seleção
        ddlPrf.Items.Add(new ListItem("Selecione", "-1"));


        // Selecionando o Profissional do Contratado Local
        DBASQL dba = new DBASQL();
        SqlParameter[] param = 
                {
                    dba.MakeInParam("@IdCtt",SqlDbType.BigInt, 8, Profile.Local.IdCtt),
                    dba.MakeInParam("@Cte_SeqEnd",SqlDbType.TinyInt,1,Profile.Local.Cte_SeqEnd),
                    dba.MakeInParam("@IdUsr",SqlDbType.Int,4,idUsr),
                };
        ddlPrf.DataSource = dba.runProcDataReader("ssAtz_GiaPel", param);
        ddlPrf.DataBind();
        dba.Dispose();
    }
    protected void chkSelectAll_CheckedChanged(object sender, EventArgs e)
    {
        Button b = (Button)grdPdm.HeaderRow.FindControl("Button1");
        if (b.Text == "Todos")
        {
            foreach (GridViewRow gr in grdPdm.Rows)
            {
                CheckBox chk = (CheckBox)gr.FindControl("chkSelect");
                chk.Checked = true;                
            }
            b.Text = "Nenhum";
        }
        else
        {
            foreach (GridViewRow gr in grdPdm.Rows)
            {
                CheckBox chk = (CheckBox)gr.FindControl("chkSelect");
                chk.Checked = false;                  
            }
            b.Text = "Todos";
        }
    }
    protected void imgBtnAdicionar_Click(object sender, ImageClickEventArgs e)
    {
        if (!String.IsNullOrEmpty(txtPsqBnf.Text.Trim()))
            searchBnf(null,txtPsqBnf.Text, true);
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
    /// <summary>
    /// Coloca as informações do beneficiario selecionado no grid dentro dos labels de exibição de beneficiário
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void grd_SelectedIndexChanged(object sender, EventArgs e)
    {
        ViewState["bioIsValid"] = "False";
        lblBio.Text = string.Empty;
        lblBnf_Mtr.Text = grd.DataKeys[grd.SelectedIndex].Values["Bnf_Mtr"].ToString();
        lblBnf_Nme.Text = grd.DataKeys[grd.SelectedIndex].Values["Bnf_Nme"].ToString();
        lblIdBnf.Text = grd.DataKeys[grd.SelectedIndex].Values["IdBnf"].ToString();
        lblPrdNme.Text = grd.DataKeys[grd.SelectedIndex].Values["Prd_Nme"].ToString();
        hdfIdRde.Value = grd.DataKeys[grd.SelectedIndex].Values["IdRde"].ToString();
        ViewState["validateBioBnf"] = grd.DataKeys[grd.SelectedIndex].Values["Bnf_Bio"].ToString();
        verifyBio(Convert.ToInt32(grd.DataKeys[grd.SelectedIndex].Values["Bnf_Idd"].ToString()));
        limpaPopup();
        PreencheGridPdm();
        
    }
    protected void PreencheGridPdm()
    {
        string idPpl = Profile.Seguranca.IdPpl;

        if (Profile.Local.IdCtt.ToString().Length > 0 && Profile.Local.Cte_SeqEnd.ToString().Length > 0 && lblIdBnf.Text.Length > 0 )
        {
            // Se o papel do usuário for PROFISSIONAL ou PROFISSIONAL SP/SADT, não devem 
            // ser mostrados os procedimentos que não exigem profissional para execução
            if ((idPpl != "2") && (idPpl != "5"))
            {
                dtsExeExa.SelectParameters["IdCtt"].DefaultValue = Profile.Local.IdCtt;
                dtsExeExa.SelectParameters["Lcr_SeqEnd"].DefaultValue = Profile.Local.Cte_SeqEnd;
                dtsExeExa.SelectParameters["IdBnf"].DefaultValue = lblIdBnf.Text;
                dtsExeExa.SelectParameters["Pdm_Prf"].DefaultValue = "False";
                grdPdm.DataBind();
            }
            dtsExeExaPrf.SelectParameters["IdCtt"].DefaultValue = Profile.Local.IdCtt;
            dtsExeExaPrf.SelectParameters["Lcr_SeqEnd"].DefaultValue = Profile.Local.Cte_SeqEnd;
            dtsExeExaPrf.SelectParameters["IdBnf"].DefaultValue = lblIdBnf.Text;
            dtsExeExaPrf.SelectParameters["Pdm_Prf"].DefaultValue = "True";
            grdPdmPrf.DataBind();

            pnlPdm.Visible = (grdPdm.Rows.Count > 0);
            pnlPdmPrf.Visible = (grdPdmPrf.Rows.Count > 0);            
        }
    }

    /// <summary>
    /// Fecha o popup
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btn_fechar_Click(object sender, ImageClickEventArgs e)
    {
        limpaPopup();
    }

    /// <summary>
    /// Apaga os dados da pesquisa do popup para que ele abra vazio na próxima vez que for acionado
    /// </summary>
    protected void limpaPopup()
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
    /// <summary>
    /// Pesquisa o beneficiário pelo nome ou matrícula e preenche o grid do popup com o resultado da busca
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        ModalPopupExtender1.Show();
        dtsBnf.SelectParameters["Bnf_Nme"].DefaultValue = txtBnf_NmePop.Text;
        dtsBnf.SelectParameters["Bnf_Mtr"].DefaultValue = txtBnf_MtrPop.Text;
        grd.DataBind();
    }

    private ArrayList saveGiaSdt(ArrayList idSol, int? idPrf, int idEsp, string giaCrt)
    {
        bool err = false;
        ArrayList returnIdGia = new ArrayList();

        //// Separo o código das solicitações e armazeno em um vetor
        //string[] vetSol = idSol.Split(new char[] { ',' });
        
        // Faço loop no vetor para gravar uma guia para cada solicitação
        foreach (int id in idSol)
        //for(int i = 0; i < vetSol.Length; i++)
        {
            //grava a guia no banco após varrer o grid validando os procedimentos selecionados
            DBASQL dba = new DBASQL();
            string[] outParam = { "@Out_Err", "@Out_Snh", "@Out_IdGia" };
            string[] outResult;

            SqlParameter[] paramGia = 
                {
                    dba.MakeInParam("@IdSol",SqlDbType.VarChar,50,id),//vetSol[i]),
                    dba.MakeInParam("@Gia_IdCtt",SqlDbType.BigInt,8,Profile.Local.IdCtt),
                    dba.MakeInParam("@Gia_SeqEnd",SqlDbType.TinyInt,1,Profile.Local.Cte_SeqEnd),
                    dba.MakeInParam("@Gia_IdUsr",SqlDbType.Int,4,Profile.Seguranca.IdUsr),
                    dba.MakeInParam("@Gia_IdPrf",SqlDbType.Int,4,idPrf),
                    dba.MakeInParam("@Gia_IdEsp",SqlDbType.Int,4,idEsp),
                    dba.MakeInParam("@Gia_DatEms",SqlDbType.SmallDateTime,4,Convert.ToDateTime(txtDat.Text +" "+txtHor.Text +":"+ txtMin.Text)),
                    dba.MakeInParam("@Gia_Crt",SqlDbType.Char,1,giaCrt),
                    dba.MakeInParam("@Gia_Snh",SqlDbType.VarChar,20,globall.gerarStringRandomica(4)),
                    dba.MakeInParam("@Gia_IdTpa",SqlDbType.TinyInt,1,ddlTipoAtendimento.SelectedValue),
                    dba.MakeInParam("@Gia_IdSai",SqlDbType.TinyInt,1,ddlTipoSaida.SelectedValue),            
                    dba.MakeOutParam("@Out_Err",SqlDbType.Bit,1),
                    dba.MakeOutParam("@Out_Snh",SqlDbType.VarChar,20),
                    dba.MakeOutParam("@Out_IdGia",SqlDbType.Int,4)
                };

            outResult = dba.RunProc("stAtz_GiaSdt", paramGia, outParam);

            // Se a inclusão ocorreu com sucesso retorno os códigos das guias gravadas
            if (outResult[0] == "True")
                err = true;
            else
            {
                hdfGiaSnh.Value += outResult[1] +"  ";
                returnIdGia.Add(Convert.ToInt32(outResult[2]));
            }
            dba.Dispose();
        }

        if (err == true)
            returnIdGia.Clear();

        return returnIdGia;
    }
    private void savePdm(DataTable dtb, ArrayList idSol, ArrayList idGia)
    {
        // Armazena o código na negociação que resultou na autorização para execução do procedimento
        int? idNgc;

        DBASQL dba = new DBASQL();

        foreach (DataRow row in dtb.Rows)
        {
            // O código da guia para o procedimento que vai ser inserido é obtido
            // através do índice do vetor de solicitações já que os indíces dos 
            // códigos das solicitações e das guias são os mesmas no dois vetores
            int iGia = idSol.IndexOf(Convert.ToInt32(row["IdSol"]));// Array.IndexOf(vetSol, row["IdSol"]);            

            // Tratamento para a mensagem com a negativa
            if (row["Atz"].ToString() == "True")
            {
                idNgc = Convert.ToInt32(row["IdNgc"]);
            }
            else
            {
                idNgc = null;
            }

            SqlParameter[] paramPdm = 
                            {                                
                                dba.MakeInParam("@Gpd_IdGia",SqlDbType.Int,4,idGia[iGia]),
                                dba.MakeInParam("@Gpd_IdPdm",SqlDbType.Int,4,Convert.ToInt32(row["IdPdm"])),
                                dba.MakeInParam("@Gpd_IdSit",SqlDbType.TinyInt,1,Convert.ToBoolean(row["Atz"])),
                                dba.MakeInParam("@Gpd_QtdSol",SqlDbType.TinyInt,1,Convert.ToInt16(row["Qtd"])),
                                dba.MakeInParam("@Gpd_QtdAtz",SqlDbType.TinyInt,1,Convert.ToInt16(row["QtdSol"])),
                                dba.MakeInParam("@Gpd_DatRel",SqlDbType.SmallDateTime,4,Convert.ToDateTime(txtDat.Text +" "+txtHor.Text +":"+ txtMin.Text)),
                                dba.MakeInParam("@Gpd_IdNgc",SqlDbType.Int,4,idNgc),
                                dba.MakeInParam("@IdSol",SqlDbType.Int,4,idSol[iGia]),
                                dba.MakeInParam("@Gpm_IdMsg",SqlDbType.VarChar,200,row["IdMsg"])                                
                            };
            dba.RunProc("stAtz_GiaPdmSdt", paramPdm);
        }

        dba.Dispose();
    }
    private void verificaDuplicado(ArrayList value, int id)
    {
        bool found = false;
        foreach(int currentItem in value)
        {
           if (currentItem.Equals(id))
           {
               found = true;
           }
        }

        if (!found)
            value.Add(id);
    }
    /// <summary>
    /// Executa os procedimentos marcados no grid
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnExeExa_Click(object sender, ImageClickEventArgs e)
    {
        if (ddlEspCtt.Visible && ddlEspCtt.SelectedValue == "-1")
            globall.showMessage(imgErr, lblErr, "A especialidade do Contratado deve ser selecionada!");
        else if (string.IsNullOrEmpty(lblBnf_Mtr.Text))
            globall.showMessage(imgErr, lblErr, "Nenhum beneficiário selecionado!");
        else if (ddlTipoAtendimento.SelectedValue == "-1")
            globall.showMessage(imgErr, lblErr, "O Tipo de Atendimento deve ser selecionado!");
        else if (ddlTipoSaida.SelectedValue == "-1")
            globall.showMessage(imgErr, lblErr, "O Tipo de Saída deve ser selecionado");
        else if (ddlPrf.Visible && ddlPrf.SelectedValue == "-1")
            globall.showMessage(imgErr, lblErr, "O Profissional deve ser selecionado!");
        else if (ddlEspPrf.Visible && ddlEspPrf.SelectedValue == "-1")
            globall.showMessage(imgErr, lblErr, "A Especialidade do Profissional executante deve ser selecionada!");
        else if (VerificaChkGrid() && VerificaTextboxGrid())
        {
            bool bioVld;
            // Flag que indica se ao menos um procedimento foi selecionado no grid
            bool procedimentoSel = false;
            // Guia geradas na execução
            string gia = string.Empty;
            string giaCrt = string.Empty;

            // Verifica se o contratado local deve fazer a identificação via biometria ...
            if (Profile.Seguranca.Cte_BioExe)
            {
                bioVld = Convert.ToBoolean(ViewState["bioIsValid"]);
            }
            // Se a biometria não for utilizada no contratado local, é indicado que a 
            // biometria é valida para que a negativa não seja gerada na sp de validação.
            else
                bioVld = true;

            DataTable dtb = new DataTable();
            DBASQL dba = new DBASQL();
            // Adiciona os nomes e tipos das colunas
            dtb.Columns.Add("IdPdm").Unique = true;
            dtb.Columns.Add("Err");
            dtb.Columns.Add("Atz");
            dtb.Columns.Add("IdMsg");
            dtb.Columns.Add("Msg");
            dtb.Columns.Add("IdNgc");
            dtb.Columns.Add("Qtd");
            dtb.Columns.Add("IdSol");
            dtb.Columns.Add("QtdSol");

            // Armazena o(s) código(s) da(s) solicitação(ões) e guia(s)
            ArrayList idSol = new ArrayList();
            ArrayList idGia = new ArrayList();

            // Validando procedimentos que não requerem profissional
            foreach (GridViewRow gr in grdPdm.Rows)
            {
                #region Tratamento para o caráter da solicitação
                // Se o tipo de atendimento for A-Ambos ou U-Urgência e existir uma consulta 
                // executada na últimas 24 horas, o caráter da solicitação será Urgência
                if (((rblCrtCtt.SelectedValue == "A") && (grdPdm.DataKeys[gr.RowIndex].Values["Gia_Crt"].ToString() == "U")) ||
                    ((rblCrtCtt.SelectedValue == "U") && (grdPdm.DataKeys[gr.RowIndex].Values["Gia_Crt"].ToString() == "U")))
                {
                    giaCrt = "U";
                }
                else
                {
                    giaCrt = "E";
                }

                #endregion

                #region Executa validação dos procedimentos
                string[] outParam = { "@Out_Err", "@Out_Atz", "@Out_IdMsg", "@Out_Msg", "@Out_IdNgc" };
                string[] outResult;

                //loop que varre o data table validando ou não os procedimentos solicitados

                CheckBox chk = (CheckBox)gr.FindControl("chkSelect");
                TextBox txtQtd = (TextBox)gr.FindControl("txtExecutados");
                if (chk.Checked)
                {
                    procedimentoSel = true;
                    // Selecionando as diferentes solicitações
                    verificaDuplicado(idSol, Convert.ToInt32(grdPdm.DataKeys[gr.RowIndex].Values["IdSol"].ToString()));
                    //if (!(idSol.Contains(grdPdm.DataKeys[gr.RowIndex].Values["IdSol"].ToString())))
                    //    idSol.Add(Convert.ToInt32(grdPdm.DataKeys[gr.RowIndex].Values["IdSol"].ToString()));

                    SqlParameter[] paramVldExa = 
                            {
                                dba.MakeInParam("@IdCtt",SqlDbType.BigInt,8,Profile.Local.IdCtt),
                                dba.MakeInParam("@Cte_SeqEnd",SqlDbType.TinyInt,1,Profile.Local.Cte_SeqEnd),                   
                                dba.MakeInParam("@IdEsp",SqlDbType.BigInt,8,ddlEspCtt.SelectedValue),
                                dba.MakeInParam("@IdBnf",SqlDbType.BigInt,8,Int32.Parse(lblIdBnf.Text)),
                                dba.MakeInParam("@IdPdm",SqlDbType.Int,4, Int32.Parse(grdPdm.DataKeys[gr.RowIndex].Values["IdPdm"].ToString())),
                                dba.MakeInParam("@Spd_IdSit",SqlDbType.TinyInt,1,Int16.Parse(grdPdm.DataKeys[gr.RowIndex].Values["Spd_IdSit"].ToString())),
                                dba.MakeInParam("@Gpd_QtdSol",SqlDbType.TinyInt,1,Int16.Parse(txtQtd.Text)),
                                dba.MakeInParam("@Sol_DatEms",SqlDbType.SmallDateTime,4,DateTime.Now),
                                dba.MakeInParam("@Gia_Crt",SqlDbType.Char,1,giaCrt),
                                dba.MakeInParam("@Bnf_BioVld",SqlDbType.Bit,1,bioVld),
                                dba.MakeOutParam("@Out_Err",SqlDbType.Bit,1),
                                dba.MakeOutParam("@Out_Atz",SqlDbType.Bit,1),
                                dba.MakeOutParam("@Out_IdMsg",SqlDbType.VarChar,200),
                                dba.MakeOutParam("@Out_Msg",SqlDbType.VarChar,160),
                                dba.MakeOutParam("@Out_IdNgc",SqlDbType.VarChar,160)                                                         
                            };
                    outResult = dba.RunProc("ssAtz_VldExa", paramVldExa, outParam);
                    DataRow drw = dtb.NewRow();
                    drw[00] = grdPdm.DataKeys[gr.RowIndex].Values["IdPdm"].ToString();  //idpdm
                    drw[01] = outResult[0];   // err
                    drw[02] = outResult[1];   // atz
                    drw[03] = outResult[2];   // IdMsg
                    drw[04] = outResult[3];   // msg
                    drw[05] = outResult[4];   // IdNgc
                    drw[06] = txtQtd.Text;    // Qtd
                    drw[07] = grdPdm.DataKeys[gr.RowIndex].Values["IdSol"].ToString(); // IdSol
                    drw[08] = grdPdm.DataKeys[gr.RowIndex].Values["Spd_QtdAtz"].ToString(); // QtdSol
                    dtb.Rows.Add(drw);
                }

                #endregion
            }

            if (procedimentoSel)
            {
                // idGia recebe o código da guia gerada por solicitação
                idGia = saveGiaSdt(idSol,null,Convert.ToInt32(ddlEspCtt.SelectedValue),giaCrt);
                savePdm(dtb, idSol, idGia);
                
                // Retira a indicação de que algum procedimento foi selecionado para a execução
                procedimentoSel = false;
                // "Limpa" as solicitações, pois se existem procedimentos de uma solicitação que
                // foi executada em procedimentos que não requerem profissional, então deverá
                // ser gerada uma nova guia para o profissional

                // Guarda os codigos das guias geradas para procedimentos que não requerem profissional
                if (idGia.Count > 0)
                {
                    foreach (int id in idGia)
                        gia += id.ToString() + ",";
                }

                idSol.Clear();
                idGia.Clear();
            }            

            // Validando procedimentos que requerem profissional
            foreach (GridViewRow gr in grdPdmPrf.Rows)
            {
                #region Tratamento para o caráter da solicitação
                // Se o tipo de atendimento for A-Ambos ou U-Urgência e existir uma consulta 
                // executada na últimas 24 horas, o caráter da solicitação será Urgência
                if (((rblCrtCtt.SelectedValue == "A") && (grdPdmPrf.DataKeys[gr.RowIndex].Values["Gia_Crt"].ToString() == "U")) ||
                    ((rblCrtCtt.SelectedValue == "U") && (grdPdmPrf.DataKeys[gr.RowIndex].Values["Gia_Crt"].ToString() == "U")))
                {
                    giaCrt = "U";
                }
                else
                {
                    giaCrt = "E";
                }

                #endregion

                #region Executa validação dos procedimentos
                string[] outParam = { "@Out_Err", "@Out_Atz", "@Out_IdMsg", "@Out_Msg", "@Out_IdNgc" };
                string[] outResult;

                //loop que varre o data table validando ou não os procedimentos solicitados

                CheckBox chk = (CheckBox)gr.FindControl("chkSelect");
                TextBox txtQtd = (TextBox)gr.FindControl("txtExecutados");
                if (chk.Checked)
                {
                    procedimentoSel = true;
                    // Selecionando as diferentes solicitações
                    verificaDuplicado(idSol, Convert.ToInt32(grdPdmPrf.DataKeys[gr.RowIndex].Values["IdSol"].ToString()));
                    //if (!(idSol.Contains(grdPdmPrf.DataKeys[gr.RowIndex].Values["IdSol"].ToString())))
                    //    idSol.Add(Convert.ToInt32(grdPdmPrf.DataKeys[gr.RowIndex].Values["IdSol"].ToString()));

                    SqlParameter[] paramVldExa = 
                            {
                                dba.MakeInParam("@IdCtt",SqlDbType.BigInt,8,Profile.Local.IdCtt),
                                dba.MakeInParam("@Cte_SeqEnd",SqlDbType.TinyInt,1,Profile.Local.Cte_SeqEnd),                   
                                dba.MakeInParam("@IdEsp",SqlDbType.BigInt,8,ddlEspPrf.SelectedValue),
                                dba.MakeInParam("@IdBnf",SqlDbType.BigInt,8,Int32.Parse(lblIdBnf.Text)),
                                dba.MakeInParam("@IdPdm",SqlDbType.Int,4, Int32.Parse(grdPdmPrf.DataKeys[gr.RowIndex].Values["IdPdm"].ToString())),
                                dba.MakeInParam("@Spd_IdSit",SqlDbType.TinyInt,1,Int16.Parse(grdPdmPrf.DataKeys[gr.RowIndex].Values["Spd_IdSit"].ToString())),
                                dba.MakeInParam("@Gpd_QtdSol",SqlDbType.TinyInt,1,Int16.Parse(txtQtd.Text)),
                                dba.MakeInParam("@Sol_DatEms",SqlDbType.SmallDateTime,4,DateTime.Now),
                                dba.MakeInParam("@Gia_Crt",SqlDbType.Char,1,giaCrt),
                                dba.MakeInParam("@IdPrf",SqlDbType.Int,4,ddlPrf.SelectedValue), 
                                dba.MakeInParam("@Bnf_BioVld",SqlDbType.Bit,1,bioVld),
                                dba.MakeOutParam("@Out_Err",SqlDbType.Bit,1),
                                dba.MakeOutParam("@Out_Atz",SqlDbType.Bit,1),
                                dba.MakeOutParam("@Out_IdMsg",SqlDbType.VarChar,200),
                                dba.MakeOutParam("@Out_Msg",SqlDbType.VarChar,160),
                                dba.MakeOutParam("@Out_IdNgc",SqlDbType.VarChar,160)                                                         
                            };
                    outResult = dba.RunProc("ssAtz_VldExa", paramVldExa, outParam);
                    DataRow drw = dtb.NewRow();
                    drw[00] = grdPdmPrf.DataKeys[gr.RowIndex].Values["IdPdm"].ToString();  //idpdm
                    drw[01] = outResult[0];   // err
                    drw[02] = outResult[1];   // atz
                    drw[03] = outResult[2];   // IdMsg
                    drw[04] = outResult[3];   // msg
                    drw[05] = outResult[4];   // IdNgc
                    drw[06] = txtQtd.Text;    // QtdSol
                    drw[07] = grdPdmPrf.DataKeys[gr.RowIndex].Values["IdSol"].ToString(); // IdSol
                    drw[08] = grdPdmPrf.DataKeys[gr.RowIndex].Values["Spd_QtdAtz"].ToString(); // QtdSol
                    dtb.Rows.Add(drw);
                }

                #endregion
            }

            if (procedimentoSel)
            {
                // idGia recebe o código da guia gerada por solicitação
                idGia = saveGiaSdt(idSol,Convert.ToInt32(ddlPrf.SelectedValue),Convert.ToInt32(ddlEspPrf.SelectedValue),giaCrt);
                savePdm(dtb, idSol, idGia);
            }

            // Guarda os codigos das guias geradas para procedimentos que não profissional
            if (idGia.Count > 0)
            {
                foreach (int id in idGia)
                    gia += id.ToString() + ",";
            }

            string ConfereViewState = VerificaExistenciaDePdmNegadoAutorizado(dtb);

            dtb.Dispose();
            dba.Dispose();
            string B1 = "0", B2 = "0";
            if (ConfereViewState.Contains("AUTORIZADO"))
                B1 = "1";
            else
                hdfGiaSnh.Value = "-";

            if (ConfereViewState.Contains("NEGADO"))
                B2 = "1";
            // ********* CORRIGIR ********************
            //if (exibirSnh != true)
            //    hdfGia_Snh.Value = "-";
            // ********* CORRIGIR ********************

            gia = gia.Substring(0, gia.Length - 1);

            Response.Redirect("exeexaret.aspx?Gia=" + gia + "&b1=" + B1 + "&b2=" + B2 + "&Snh=" + hdfGiaSnh.Value);

        }
    }
    /// <summary>
    /// Verifica se existe ao menos um procedimento selecionado no grid
    /// </summary>
    /// <returns></returns>
    protected Boolean VerificaChkGrid()
    {
        foreach (GridViewRow gr in grdPdm.Rows)
        {
            CheckBox chk = (CheckBox)gr.FindControl("chkSelect");
            if (chk.Checked)
            {
                globall.showMessage(imgErr, lblErr, string.Empty);
                return true;
            }
        }

        foreach (GridViewRow gr in grdPdmPrf.Rows)
        {
            CheckBox chk = (CheckBox)gr.FindControl("chkSelect");
            if (chk.Checked)
            {
                globall.showMessage(imgErr, lblErr, string.Empty);
                return true;
            }
        }

        globall.showMessage(imgErr, lblErr, "Selecione ao menos um procedimento!");

        return false;
    }
    /// <summary>
    /// Verifica os totais dos procedimentos selecionados
    /// </summary>
    /// <returns></returns>
    protected Boolean VerificaTextboxGrid()
    {
        foreach (GridViewRow gr in grdPdm.Rows)
        {
            CheckBox chk = (CheckBox)gr.FindControl("chkSelect");
            if (chk.Checked)
            {
                TextBox txb = (TextBox)gr.FindControl("txtExecutados");
                if (txb.Text.Length > 0)
                {
                    if (!globall.isInteger(txb.Text))
                    {
                        globall.showMessage(imgErr, lblErr, "A quantidade deve ser numérica!");
                        return false;
                    }
                    else if (txb.Text == "0")
                    {
                        globall.showMessage(imgErr, lblErr, "A quantidade de execução informada não pode ser igual à zero (0)!");
                        return false;
                    }                    
                    else
                    {
                        if (Int32.Parse(txb.Text) > (Int32.Parse(gr.Cells[5].Text)) - (Int32.Parse(gr.Cells[6].Text)))
                        {
                            globall.showMessage(imgErr, lblErr, "A quantidade de execução informada é maior que a autorizada!");
                            return false;
                        }
                    }
                }
                else
                {
                    globall.showMessage(imgErr, lblErr, "Informe o total a ser executado de cada procedimento selecionado!");
                    return false;
                }
            }
        }

        foreach (GridViewRow gr in grdPdmPrf.Rows)
        {
            CheckBox chk = (CheckBox)gr.FindControl("chkSelect");
            if (chk.Checked)
            {
                TextBox txb = (TextBox)gr.FindControl("txtExecutados");
                if (txb.Text.Length > 0)
                {
                    if (!globall.isInteger(txb.Text))
                    {
                        globall.showMessage(imgErr, lblErr, "A quantidade deve ser numérica!");
                        return false;
                    }
                    else if (txb.Text == "0")
                    {
                        globall.showMessage(imgErr, lblErr, "A quantidade de execução informada não pode ser igual à zero (0)!");
                        return false;
                    }
                    else
                    {
                        if (Int32.Parse(txb.Text) > Int32.Parse(gr.Cells[5].Text) - (Int32.Parse(gr.Cells[6].Text)))
                        {
                            globall.showMessage(imgErr, lblErr, "A quantidade de execução informada é maior que a autorizada!");
                            return false;
                        }
                    }
                }
                else
                {
                    globall.showMessage(imgErr, lblErr, "Informe o total a ser executado de cada procedimento selecionado!");
                    return false;
                }
            }
        }
        globall.showMessage(imgErr, lblErr, string.Empty);
        return true;
    }
    /// <summary>
    /// Varre o datatable do viewstate e verifica se existe algum procedimento negado ou algum procedimento autorizado
    /// </summary>
    /// <returns></returns>
    protected string VerificaExistenciaDePdmNegadoAutorizado(DataTable dtb)
    {
        string aux = string.Empty;
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
        return aux;
    }

    protected void ddlPrf_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlPrf.SelectedIndex > -1)
        {
            // "Limpa" o Dropdown
            ddlEspPrf.Items.Clear();
            // Define o primeiro item da seleção
            ddlEspPrf.Items.Add(new ListItem("Selecione", "-1"));

            // Selecionando as Especialidades do Profissional relacionadas ao Contratado Local
            DBASQL dba = new DBASQL();
            SqlParameter[] param = 
                {
                    dba.MakeInParam("@IdCtt",SqlDbType.Int,4,Profile.Local.IdCtt),
                    dba.MakeInParam("@Cte_SeqEnd",SqlDbType.TinyInt,1,Profile.Local.Cte_SeqEnd),
                    dba.MakeInParam("@IdPrf",SqlDbType.Int,4,ddlPrf.SelectedValue),
                    //dba.MakeInParam("@Lce_TipAtd",SqlDbType.Char,1,rblCrtPrf.SelectedValue),
                };
            SqlDataReader reader;
            reader = dba.runProcDataReader("ssAtz_EspCon", param);
            ddlEspPrf.DataSource = reader;
            ddlEspPrf.DataBind();
            dba.Dispose();
        }
    }

    protected void btnSelectAll2_Click(object sender, EventArgs e)
    {
        Button b = (Button)grdPdmPrf.HeaderRow.FindControl("btnSelectAll2");
        if (b.Text == "Todos")
        {
            foreach (GridViewRow gr in grdPdmPrf.Rows)
            {
                CheckBox chk = (CheckBox)gr.FindControl("chkSelect");
                chk.Checked = true;                   
            }
            b.Text = "Nenhum";
        }
        else
        {
            foreach (GridViewRow gr in grdPdmPrf.Rows)
            {
                CheckBox chk = (CheckBox)gr.FindControl("chkSelect");
                chk.Checked = false;                   
            }
            b.Text = "Todos";
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
    protected void lbtBuscar_Click(object sender, EventArgs e)
    {
        ModalPopupExtender1.Show();
    }
    protected void grd_Sorted(object sender, EventArgs e)
    {
        ModalPopupExtender1.Show();
    }
    protected void ddlEspCtt_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlEspCtt.SelectedIndex > 0)
        {
            getTipoAtendimento(ddlEspCtt.SelectedValue, rblCrtCtt);
            upnPdmCtt.Update();
        }
    }
    protected void ddlEspPrf_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlEspPrf.SelectedIndex > 0)
        {
            getTipoAtendimento(ddlEspPrf.SelectedValue, rblCrtPrf);
            upnPdmPrf.Update();
        }
    }
    protected void dtsExeExa_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.AffectedRows > 0)
        {            
            if (e.Command.Parameters["@Pdm_Prf"].Value.ToString() == "False")
                getEspContratado();
            if (e.Command.Parameters["@Pdm_Prf"].Value.ToString() == "True")
                getProfissional();
        }
    }
    protected void dtsExeExaPrf_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.AffectedRows > 0)
        {
            getProfissional();
        }
    }
}
