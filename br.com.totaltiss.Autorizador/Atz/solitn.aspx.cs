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
using Snw.WebPage;
using br.com.totaltiss.Web.Autorizador;

public partial class Atz_solitn : PageBase
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Desabilita o clique do botão no post
        btnSolAtz.Attributes.Add("onclick", "this.disabled=true;" + ClientScript.GetPostBackEventReference(btnSolAtz, "").ToString());

        if (!Page.IsPostBack)
        {
            // Definindo a data da solicitação
            txtDatEms.Text = DateTime.Now.Date.ToShortDateString();

            // Definindo o horário da solicitação
            DateTime horSol = DateTime.Now;
            txtHor.Text = horSol.Hour.ToString();
            txtMin.Text = horSol.Minute.ToString();
            
            hdfIdGia.Value = Request.QueryString["Gia"].ToString();
            hdfIdBnf.Value = Request.QueryString["Bnf"].ToString();

            // Seleciona os dados da guia de consulta
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
                hdfIdBnf.Value = dr["IdBnf"].ToString();     
            }
            db.Dispose();
            // Datatable que conterá os procedimentos solicitados
            DataTable dtb = new DataTable();
            // Adiciona os nomes e tipos das colunas
            dtb.Columns.Add("IdPdm");
            dtb.Columns.Add("Pdm_Cod").Unique = true;            
            dtb.Columns.Add("Pdm_Dsc");
            dtb.Columns.Add("Pdm_Qtd");
            dtb.Columns.Add("IdMsg");
            dtb.Columns.Add("Atz");                 
            ViewState["dtbPdm"] = dtb;
            dtb.Dispose();
            // Datatable que conterá os OPM solicitados
            DataTable dtbOpm = new DataTable();
            // Adiciona os nomes e tipos das colunas
            dtbOpm.Columns.Add("Opm_Dsc");
            dtbOpm.Columns.Add("Opm_Qtd");
            ViewState["dtbOPM"] = dtbOpm;
            dtbOpm.Dispose();
            // DataTable que conterá os CID10 selecionados
            DataTable dtbCID = new DataTable();
            // Adiciona os nomes e tipos das colunas
            dtbCID.Columns.Add("IdCid").Unique = true;
            dtbCID.Columns.Add("Cid_Dsc");
            ViewState["dtbCID"] = dtbCID;
            dtbCID.Dispose();
            DBASQL dba = new DBASQL();
            SqlDataReader reader;
            dba.RunSql("SELECT IdTpi, Tpi_Dsc FROM dbo.Atz_Tpi ORDER BY Tpi_Dsc", out reader);
            ddlTipItn.DataSource = reader;
            ddlTipItn.DataBind();
            dba.Dispose();
            DBASQL dba2 = new DBASQL();
            SqlDataReader reader2;
            dba2.RunSql("SELECT IdRgm, Rgm_Dsc FROM dbo.Atz_Rgm ORDER BY Rgm_Dsc", out reader2);
            ddlRgm.DataSource = reader2;
            ddlRgm.DataBind();
            dba2.Dispose();
        }
    }
    #region Popup PDM
    protected void grd_Sorted(object sender, EventArgs e)
    {
        mpePdm.Show();
    }
    protected void btnBuscar_Click(object sender, ImageClickEventArgs e)
    {
        mpePdm.Show();
        dtsPdm.SelectParameters["Pdm_Cod"].DefaultValue = txtBnf_MtrPop.Text; 
        dtsPdm.SelectParameters["Pdm_Dsc"].DefaultValue = txtBnf_NmePop.Text;  
        grdPopPdm.DataBind();
        if (grdPopPdm.Rows.Count == 0)
            lblEmptyGrid.Text = "Nenhum registro encontrado!";
        else
            lblEmptyGrid.Text = string.Empty;
    }
    protected void grd_PageIndexChanged(object sender, EventArgs e)
    {
        mpePdm.Show();
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
        drw[0] = grdPopPdm.DataKeys[grdPopPdm.SelectedIndex].Values["IdPdm"].ToString();
        drw[1] = grdPopPdm.DataKeys[grdPopPdm.SelectedIndex].Values["Pdm_Cod"].ToString();
        drw[2] = HttpUtility.HtmlDecode(grdPopPdm.DataKeys[grdPopPdm.SelectedIndex].Values["Pdm_Dsc"].ToString());
        drw[3] = "1";
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
        hidePopupPdm();
    }
    protected void btn_fechar_Click(object sender, ImageClickEventArgs e)
    {
        hidePopupPdm();
    }
    protected void hidePopupPdm()
    {
        txtBnf_NmePop.Text = "";
        txtBnf_MtrPop.Text = "";
        dtsPdm.SelectParameters["Pdm_Cod"].DefaultValue = String.Empty;
        dtsPdm.SelectParameters["Pdm_Dsc"].DefaultValue = String.Empty;
        dtsPdm.DataBind();
        grdPopPdm.DataBind();
        mpePdm.Hide();
        grdPopPdm.SelectedIndex = -1;
    }
    protected void ddlGrdPdmPages_SelectedIndexChanged(object sender, EventArgs e)
    {
        globall.selectPageGrid(grdPopPdm);
        mpePdm.Show();
    }
    protected void paginateGrdPdm(object sender, CommandEventArgs e)
    {
        globall.getCurrentPageGrid(grdPopPdm, e.CommandArgument.ToString());
        mpePdm.Show();
    }
    #endregion
    #region Popup CID
    protected void grdPopCID_Sorted(object sender, EventArgs e)
    {
        mpeCID.Show();
    }
    protected void ibtPopCidBuscar_Click(object sender, ImageClickEventArgs e)
    {
        mpeCID.Show();
        dtsCID.SelectParameters["IdCid"].DefaultValue = txtPopCidCod.Text;
        dtsCID.SelectParameters["Cid_Dsc"].DefaultValue = txtPopCidDsc.Text;
        grdPopCID.DataBind();
        if (grdPopCID.Rows.Count == 0)
            lblPopEmptyCid.Text = "Nenhum registro encontrado!";
        else
            lblPopEmptyCid.Text = string.Empty;
    }
    protected void grdPopCID_SelectedIndexChanged(object sender, EventArgs e)
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
            drw[0] = grdPopCID.DataKeys[grdPopCID.SelectedIndex].Values["IdCid"].ToString();
            drw[1] = HttpUtility.HtmlDecode(grdPopCID.DataKeys[grdPopCID.SelectedIndex].Values["Cid_Dsc"].ToString());

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
        hidePopupCID();
    }
    protected void ibtPopCIDClose_Click(object sender, ImageClickEventArgs e)
    {
        hidePopupCID();
    }
    protected void hidePopupCID()
    {
        txtPopCidCod.Text = string.Empty;
        txtPopCidDsc.Text = string.Empty;
        dtsCID.SelectParameters["IdCid"].DefaultValue = string.Empty;
        dtsCID.SelectParameters["Cid_Dsc"].DefaultValue = string.Empty;
        dtsCID.DataBind();
        grdPopCID.DataBind();
        mpeCID.Hide();
        grdPopCID.SelectedIndex = -1;
    }
    protected void ddlGrdCIDPages_SelectedIndexChanged(object sender, EventArgs e)
    {
        globall.selectPageGrid(grdPopCID);
        mpeCID.Show();
    }
    protected void paginateGrdCID(object sender, CommandEventArgs e)
    {
        globall.getCurrentPageGrid(grdPopCID, e.CommandArgument.ToString());
        mpeCID.Show();
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
            DBASQL db = new DBASQL();
            SqlParameter[] paramInfoBnfPrfEsp = { db.MakeInParam("@Pdm_Cod", SqlDbType.VarChar, 20, txtPsqPdm.Text) };
            SqlDataReader dr = db.runProcDataReader("ssAtz_Pdm", paramInfoBnfPrfEsp);
            string IdPdm = string.Empty;
            string Pdm_Cod = string.Empty;
            string Pdm_Dsc = string.Empty;

            if (dr.Read())
            {
                IdPdm = dr["IdPdm"].ToString();
                Pdm_Cod = dr["Pdm_Cod"].ToString();
                Pdm_Dsc = dr["Pdm_Dsc"].ToString();
            }
           
            db.Dispose();

            if (!string.IsNullOrEmpty(Pdm_Cod))
            {
                ImgErr.Visible = false;
                lblErr.Text = string.Empty;

                // Cria uma nova linha no DataTable
                DataRow drw = dtb.NewRow();
                // Adiciona os dados à nova linha criada
                drw[0] = IdPdm;
                drw[1] = Pdm_Cod;
                drw[2] = Pdm_Dsc;
                drw[3] = "1";
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
                globall.showMessage(ImgErr, lblErr, "O código de procedimento informado não foi encontrado..");
            }

        }
        else
            globall.showMessage(ImgErr, lblErr, "Por favor, informe o código do procedimento que deseja adicionar.");

        dtb.Dispose();
    }

    protected void btnPsqPdm_Click(object sender, EventArgs e)
    {
        mpePdm.Show();
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
    }
    /// <summary>
    /// Atualiza os índices contidos no view state de acordo com o que foi colocado no gridview
    /// </summary>
    protected void atualizaQtdViewState()
    {
        DataTable dtb = new DataTable();
        Int32 IdxGdw = 0; //Indice auxiliar do gridview

        dtb = (DataTable)ViewState["dtbPdm"];
        foreach (DataRow drw in dtb.Rows)
        {
            TextBox txtQtd = (TextBox)grdPdm.Rows[IdxGdw].Cells[2].FindControl("txtQtd_Pdm");
            drw["Pdm_Qtd"] = txtQtd.Text;
            IdxGdw++;
        }
        dtb.AcceptChanges();
        grdPdm.DataSource = dtb;
        grdPdm.DataBind();
        ViewState["dtbPdm"] = dtb;
        dtb.Dispose();
    }
    /// <summary>
    /// Grava a solicitação de internação no banco de dados
    /// </summary>
    private void saveItn()
    {
        string Senha = string.Empty;
        string indAdn = null;

        if (rblIndAdn.SelectedIndex > 0)
            indAdn = rblIndAdn.SelectedValue;

        string[] outParam = { "@Out_Err", "@Out_Snh", "@Out_IdGia", "@Out_IdItn" };
        string[] outResult;

        WebProfile Profile = WebProfile.GetProfile("username");

        DBASQL dba = new DBASQL();
        SqlParameter[] paramGia = 
        {
                dba.MakeInParam("@IdGia",SqlDbType.Int,4,Convert.ToInt32(hdfIdGia.Value)),
                dba.MakeInParam("@Gia_IdUsr",SqlDbType.Int,4,Profile.Seguranca.IdUsr),
                dba.MakeInParam("@Gia_DatEms",SqlDbType.SmallDateTime,4,Convert.ToDateTime(txtDatEms.Text +" "+txtHor.Text +":"+ txtMin.Text)),
                dba.MakeInParam("@Gia_Snh",SqlDbType.VarChar,20,globall.gerarStringRandomica(4)),
                dba.MakeInParam("@Gia_IndCln",SqlDbType.VarChar,200,txtIndCln.Text),
                dba.MakeInParam("@Gia_Crt",SqlDbType.Char,1,rblGiaCrt.SelectedValue),
                dba.MakeInParam("@Gia_TipDoe",SqlDbType.Char,1,rblTipDoe.SelectedValue),
                dba.MakeInParam("@Gia_TemDoe",SqlDbType.Char,4,txtTemDoe.Text.Trim() + ddlTemDoe.SelectedValue),
                dba.MakeInParam("@Gia_IndAdn",SqlDbType.TinyInt,1,indAdn),
                dba.MakeInParam("@Itn_IdTpi",SqlDbType.TinyInt,1,ddlTipItn.SelectedValue),
                dba.MakeInParam("@Itn_IdRgm",SqlDbType.TinyInt,1,ddlRgm.SelectedValue),
                dba.MakeInParam("@Itn_DriSol",SqlDbType.TinyInt,1,txtDri.Text),
                dba.MakeInParam("@Itn_Loc",SqlDbType.VarChar,50,txtLoc.Text),
                dba.MakeOutParam("@Out_Err",SqlDbType.Bit,1),
                dba.MakeOutParam("@Out_Snh",SqlDbType.VarChar,20),
                dba.MakeOutParam("@Out_IdGia",SqlDbType.Int,4),
                dba.MakeOutParam("@Out_IdItn",SqlDbType.Int,4),
        };
        outResult = dba.RunProc("stAtz_GiaItn", paramGia, outParam);

        if (outResult[1] == "True")
        {
            Senha = outResult[1];
        }       

        #region Incluindo os Procedimentos no Banco
        DataTable dtb = new DataTable();
        dtb = (DataTable)ViewState["dtbPdm"];

        foreach (DataRow row in dtb.Rows)
        {
            SqlParameter[] paramPdm =
                    {
                        dba.MakeInParam("@Gpd_IdGia",SqlDbType.Int,4,Convert.ToInt32(outResult[2])),
                        dba.MakeInParam("@Gpd_IdPdm",SqlDbType.Int,4,Convert.ToInt32(row["IdPdm"])),
                        dba.MakeInParam("@Gpd_QtdSol",SqlDbType.TinyInt,1,Convert.ToInt16(row["Pdm_Qtd"])),
                    };
            dba.RunProc("stAtz_GiaPdmItn", paramPdm);
        }
        dtb.Dispose();
        #endregion

        #region Inserindo os Códigos de CID-10
        DataTable dtbCID = new DataTable();
        dtbCID = (DataTable)ViewState["dtbCID"];
        foreach (DataRow row in dtbCID.Rows)
        {
            SqlParameter[] paramCid = 
                   {
                       dba.MakeInParam("@Gcd_IdCid", SqlDbType.Char,5,row["IdCid"]),
                       dba.MakeInParam("@Gcd_IdGia", SqlDbType.Int,4,outResult[2]),
                   };
            dba.RunProc("stAtz_GiaCid", paramCid);
        }
        #endregion
        #region Inserindo os OPMs
        DataTable dtbOPM = new DataTable();
        dtbOPM = (DataTable)ViewState["dtbOPM"];
        foreach (DataRow row in dtbOPM.Rows)
        {
            SqlParameter[] paramOPM = 
                   {
                       dba.MakeInParam("@Ito_IdItn", SqlDbType.Int,4,outResult[3]),
                       dba.MakeInParam("@Ito_Dsc", SqlDbType.Char,5,row["Opm_Dsc"]),
                       dba.MakeInParam("@Ito_Qtd", SqlDbType.Char,5,row["Opm_Qtd"]),
                       
                   };
            dba.RunProc("stAtz_ItnOpm", paramOPM);
        }
        #endregion

        dba.Dispose();

        Response.Redirect("solitnret.aspx?Gia=" + outResult[2] + "&Bnf=" + hdfIdBnf.Value);        
    }
    /// <summary>
    /// Verifica se todos os procedimentos possuem  quantidade informada válida
    /// </summary>
    /// <returns></returns>
    private bool validateQtdPdm()
    {
        return true;
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
        }
        //else
        //{
        //    globall.showMessage(ImgErr, lblErr, "Nenhum procedimento foi adicionado!");
        //    return false;
        //}
    }
    protected void btnFhaPci_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("fhapci.aspx?Bnf=" + hdfIdBnf.Value);
    }
    protected void btnPgaIni_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("prf.aspx");
    }

    protected void ibtAddOpm_Click(object sender, ImageClickEventArgs e)
    {
        if (string.IsNullOrEmpty(txtOpmDsc.Text) || (string.IsNullOrEmpty(txtOpmQtd.Text)))
            globall.showMessage(ImgErr, lblErr, "Informe a descrição e a quantidade de OPM que deseja adicionar!");
        else if (!globall.isInteger(txtOpmQtd.Text))
            globall.showMessage(ImgErr, lblErr, "Quantidade de OPM inválida!");
        else
        {
            DataTable dtb = new DataTable();
            dtb = (DataTable)ViewState["dtbOPM"];

            ImgErr.Visible = false;
            lblErr.Text = string.Empty;

            // Cria uma nova linha no DataTable
            DataRow drw = dtb.NewRow();
            // Adiciona os dados à nova linha criada
            drw[0] = txtOpmDsc.Text;
            drw[1] = txtOpmQtd.Text;
            dtb.Rows.Add(drw);

            ViewState["dtbOPM"] = dtb;
            grdOpm.DataSource = dtb;
            grdOpm.DataBind();
            txtOpmDsc.Text = string.Empty;
            txtOpmQtd.Text = string.Empty;
            dtb.Dispose();
            globall.showMessage(ImgErr, lblErr, string.Empty);
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
    protected void grdOpm_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataTable dtb = new DataTable();
        dtb = (DataTable)ViewState["dtbOPM"];                 
        DataRow drw = dtb.NewRow();
        // procura na tabela pelo procedimento a ser removido
        foreach (DataRow dr in dtb.Rows)
        {
            if (dr["Opm_Dsc"].ToString() == grdOpm.Rows[grdOpm.SelectedIndex].Cells[0].Text)
            {
                drw = dr;
            }
        }
        //remove da tabela a linha que contém o procedimento
        if (!drw.IsNull("Opm_Dsc"))
            drw.Delete();
        grdOpm.DataSource = dtb;
        grdOpm.DataBind();
        ViewState["dtbOPM"] = dtb;
        dtb.Dispose();
        grdOpm.SelectedIndex = -1;
        globall.showMessage(ImgErr, lblErr, string.Empty);
    }
    /// <summary>
    /// Efetua a validação dos procedimentos, grava os as mensagens o solicitações autorizadas e, se houverem, as mensagens negativas no banco.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSolAtz_Click(object sender, ImageClickEventArgs e)
    {
        if (ddlTipItn.SelectedIndex == 0)
        {
            globall.showMessage(ImgErr, lblErr, "Selecione o tipo de internação!");
        }
        else if (ddlRgm.SelectedIndex == 0)
        {
            globall.showMessage(ImgErr, lblErr, "Selecione o regime de internação!");
        }
        else if (string.IsNullOrEmpty(txtDri.Text) || (txtDri.Text == "0"))
        {
            globall.showMessage(ImgErr, lblErr, "Informe a quantidade de diárias!");
        }
        else if (grdCID.Rows.Count == 0)
        {
            globall.showMessage(ImgErr, lblErr, "Pelo menos um CID deve ser informado!");
        }
        else if (txtIndCln.Text.Length < 20)
        {
            globall.showMessage(ImgErr, lblErr, "Informe a indicação clínica com no mínimo 20 caracteres!");
        }
        else if (validateQtdPdm())
        {
            atualizaQtdViewState();
            globall.showMessage(ImgErr, lblErr, string.Empty);
            saveItn();
        }
    }
}
