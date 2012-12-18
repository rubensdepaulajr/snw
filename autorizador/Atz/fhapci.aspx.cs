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

public partial class Atz_fhapci : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            hdfIdBnf.Value = Request.QueryString["Bnf"];
            if (Request.QueryString.Count == 2)
                globall.showMessage(ImgErro, lblErro, "Profissional não identificado!");
            
            // Pesquisando o contratado
            DBASQL dba = new DBASQL();
            SqlParameter[] param = 
            {
                dba.MakeInParam("@Gia_IdCtt",SqlDbType.BigInt,8,Profile.Local.IdCtt),
                dba.MakeInParam("@Gia_SeqEnd",SqlDbType.TinyInt,1,Profile.Local.Cte_SeqEnd),
                dba.MakeInParam("@Prf_IdUsr",SqlDbType.Int,4,Profile.Seguranca.IdUsr),
                dba.MakeInParam("@Gia_IdBnf",SqlDbType.Int,4,hdfIdBnf.Value)
            };
            SqlDataReader reader;
            reader = dba.runProcDataReader("ssAtz_FhaPci", param);
            while (reader.Read())
            {
                lblBnf.Text = reader["Bnf_Mtr"].ToString() + " - " + reader["Bnf_Nme"].ToString();
                lblBnf_Idd.Text = reader["Bnf_Idd"].ToString();
                lblUlt_Con.Text = reader["Gia_DatAtd"].ToString();
                lblUlt_ConCid.Text = reader["Bnf_UltCid"].ToString();
                hdfIdGia.Value = reader["IdGia"].ToString();
            }
            dba.Dispose();

            //if (hdfIdGia.Value.Length > 0)
            //    globall.showMessage(ImgErro, lblErro, string.Empty);

            // Habilita botões de acordo com o status da solicitação(vefica se a consulta foi executada ou não)
            if (string.IsNullOrEmpty(hdfIdGia.Value))
            {
                btnExeCon.Visible = false;
                btnSolSdt.Visible = false;
                btnExeSdt.Visible = false;
                btnSolItn.Visible = false;
                
            }
            else if (string.IsNullOrEmpty(lblUlt_Con.Text))
            {
                btnExeCon.Visible = true;
                btnSolSdt.Visible = false;
                btnExeSdt.Visible = false;
                btnSolItn.Visible = false;
            }
            else
            {
                btnExeCon.Visible = false;
                btnSolSdt.Visible = true;
                btnExeSdt.Visible = true;
                btnSolItn.Visible = true;
            }
        }
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
        if (hdfIdGia.Value.Length > 0)
        {
            Response.Redirect("prf.aspx");
        }
        else
        {
            globall.showMessage(ImgErro, lblErro, "Nenhum beneficiário foi selecionado!");
        }
    }
    protected void btnExeCon_Click(object sender, ImageClickEventArgs e)
    {
        if (hdfIdGia.Value.Length > 0)
        {
            Response.Redirect("execon.aspx?Gia=" + hdfIdGia.Value +"&Bnf="+ hdfIdBnf.Value);
        }
        else
        {
            globall.showMessage(ImgErro, lblErro, "Nenhum beneficiário foi selecionado!");
        }
    }
    private void verifyBio()
    {
        //  Verifica se o profissional esta configurado para utilizar biometria
        if (Profile.Seguranca.BioPrf == true)
        {
            //Response.Redirect("../bio/ver.aspx?ori=solexa&Gia=" + hdfIdGia.Value + "&Bnf=" + hdfIdBnf.Value);
            Session["tmp"] = hdfIdGia.Value + "|" + hdfIdBnf.Value;
            Response.Redirect("../bio/ver.aspx?ori=solexa");
        }
        else
            Response.Redirect("solexa.aspx?Gia=" + hdfIdGia.Value + "&Bnf=" + hdfIdBnf.Value);
    }
    protected void btnSolSdt_Click(object sender, ImageClickEventArgs e)
    {
        if (hdfIdGia.Value.Length > 0)
        {
            Session["pageIsValid"] = "1";
            verifyBio();
        }
        else
        {
            globall.showMessage(ImgErro, lblErro, "Nenhum beneficiário foi selecionado!");
        }
    }
    protected void imgBtnAdicionar_Click(object sender, ImageClickEventArgs e)
    {
        string idBnf = string.Empty;
        DBASQL db = new DBASQL();
        SqlParameter[] paramInfoBnfPrfEsp = 
            { 
                db.MakeInParam("@Gia_IdCtt",SqlDbType.BigInt,8,Profile.Local.IdCtt),
                db.MakeInParam("@Gia_SeqEnd",SqlDbType.TinyInt,1,Profile.Local.Cte_SeqEnd),
                db.MakeInParam("@Prf_IdUsr",SqlDbType.Int,4,Profile.Seguranca.IdUsr),
                db.MakeInParam("@Bnf_Mtr", SqlDbType.VarChar, 20, txtPsqBnf.Text) 
            };
        SqlDataReader dr = db.runProcDataReader("ssAtz_FhaPci", paramInfoBnfPrfEsp);
        if (dr.Read())
        {
            idBnf = dr["IdBnf"].ToString();
            globall.showMessage(ImgErro, lblErro, string.Empty);
            txtPsqBnf.Text = string.Empty;
            
        }
        else
        {
            globall.showMessage(ImgErro, lblErro, "Matrícula não encontrada!");
        }

        db.Dispose();

        if(idBnf.Length > 0)
            Response.Redirect("fhapci.aspx?Bnf=" + idBnf);
    }
    protected void btnPsq_Click(object sender, EventArgs e)
    {
        ModalPopupExtender1.Show();
    }

    #region Popup PDM

    protected void btnBuscar_Click(object sender, ImageClickEventArgs e)
    {
        ModalPopupExtender1.Show();
        dtsPdm.SelectParameters["Gia_IdCtt"].DefaultValue = Profile.Local.IdCtt;
        dtsPdm.SelectParameters["Gia_SeqEnd"].DefaultValue = Profile.Local.Cte_SeqEnd;
        dtsPdm.SelectParameters["Prf_IdUsr"].DefaultValue = Profile.Seguranca.IdUsr;
        dtsPdm.SelectParameters["Bnf_Mtr"].DefaultValue = txtBnf_MtrPop.Text;
        dtsPdm.SelectParameters["Bnf_Nme"].DefaultValue = txtBnf_NmePop.Text;
        grdPop.DataBind();
        if (grdPop.Rows.Count == 0)
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
    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        GridViewRow gvrPager = grdPop.BottomPagerRow;
        if (gvrPager == null)
            return;
        // get your controls from the gridview
        DropDownList ddlPages = (DropDownList)gvrPager.Cells[0].FindControl("ddlPages");
        Label lblPageCount = (Label)gvrPager.Cells[0].FindControl("lblPageCount");

        if (ddlPages != null)
        {
            // populate pager
            for (int i = 0; i < grdPop.PageCount; i++)
            {
                int intPageNumber = i + 1;
                ListItem lstItem = new ListItem(intPageNumber.ToString());
                if (i == grdPop.PageIndex)
                    lstItem.Selected = true;
                ddlPages.Items.Add(lstItem);
            }
        }
        // populate page count
        if (lblPageCount != null)
            lblPageCount.Text = grdPop.PageCount.ToString();
    }

    /*dropdown do paginador da aba SOLICITAÇÕES AUTORIZADAS*/
    protected void ddlPagesGridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow gvrPager = grdPop.BottomPagerRow;
        DropDownList ddlPages = (DropDownList)gvrPager.Cells[0].FindControl("ddlPages");
        grdPop.PageIndex = ddlPages.SelectedIndex;
        // a method to populate your grid
        PopulateGridView1();
        ModalPopupExtender1.Show();
    }

    /*função que controla os botões de paginação da aba SOLICITAÇÕES AUTORIZADAS*/
    protected void PaginateGridView1(object sender, CommandEventArgs e)
    {
        // get the current page selected
        int intCurIndex = grdPop.PageIndex;

        switch (e.CommandArgument.ToString().ToLower())
        {
            case "first":
                grdPop.PageIndex = 0;
                break;
            case "prev":
                if (intCurIndex > 0)
                    grdPop.PageIndex = intCurIndex - 1;
                break;
            case "next":
                if (intCurIndex <= grdPop.PageCount - 1)
                    grdPop.PageIndex = intCurIndex + 1;
                break;
            case "last":
                grdPop.PageIndex = grdPop.PageCount;
                break;
        }
        // popultate the gridview control
        PopulateGridSolAut();
        ModalPopupExtender1.Show();
    }

    /* dropdown do paginador da aba SOLICITAÇÕES AUTORIZADAS*/
    protected void PopulateGridView1()
    {
        grdPop.DataBind();
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string idBnf = grdPop.DataKeys[grdPop.SelectedIndex].Values["IdBnf"].ToString();
        limpaPopup();
        Response.Redirect("fhapci.aspx?Bnf="+idBnf);
    }

    protected void btn_fechar_Click(object sender, ImageClickEventArgs e)
    {
        limpaPopup();
    }

    protected void limpaPopup()
    {
        txtBnf_NmePop.Text = "";
        txtBnf_MtrPop.Text = "";
        dtsPdm.SelectParameters["Bnf_Mtr"].DefaultValue = String.Empty;
        dtsPdm.SelectParameters["Bnf_Nme"].DefaultValue = String.Empty;
        dtsPdm.DataBind();
        grdPop.DataBind();
        ModalPopupExtender1.Hide();
        grdPop.SelectedIndex = -1;
    }

    #endregion
    
    protected void btnExeSdt_Click(object sender, ImageClickEventArgs e)
    {
        if (string.IsNullOrEmpty(lblBnf.Text))
            globall.showMessage(ImgErro, lblErro, "Nenhum beneficiário selecionado!");
        else
        {
            string[] s = lblBnf.Text.Split(new char[] { '-' });
            Response.Redirect("exeexa.aspx?bnf=" + hdfIdBnf.Value);
        }

    }
    protected void btnSolItn_Click(object sender, ImageClickEventArgs e)
    {
        if (hdfIdGia.Value.Length > 0)
        {
            Response.Redirect("solitn.aspx?Gia=" + hdfIdGia.Value + "&Bnf=" + hdfIdBnf.Value);
        }
        else
        {
            globall.showMessage(ImgErro, lblErro, "Nenhum beneficiário foi selecionado!");
        }
    }
}
