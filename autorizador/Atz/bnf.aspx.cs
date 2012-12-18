using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Atz_bnf : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Request.QueryString.Count > 0)
            {
                //getBeneficiario(Convert.ToInt32(PreviousPage.idBnf),null);
                //ViewState["bioIsValid"] = PreviousPage.isIdentified.ToString();
                getBnf(Request.QueryString["bnf"].ToString());
                if (Request.QueryString["bio"].ToString() == "0")
                {
                    lblBio.Text = "Beneficiário não identificado!";
                }
                else
                {
                    lblBio.Text = "Beneficiário identificado com sucesso!";
                }
            }
        }
    }
    private void getBnf(string bnfMtr)
    {
        lblBio.Text = string.Empty;
        DBASQL dba = new DBASQL();
        SqlParameter[] param = { dba.MakeInParam("@Bnf_Mtr", SqlDbType.VarChar, 20, bnfMtr) };
        SqlDataReader reader;
        reader = dba.runProcDataReader("ssAtz_Bnf", param);
        while (reader.Read())
        {
            hdfIdBnf.Value = reader["IdBnf"].ToString();
            // Informações Pessoais
            lblBnf.Text = reader["Bnf_Mtr"].ToString() + " - " + reader["Bnf_Nme"].ToString();
            lblBnfMtr.Text = reader["Bnf_Mtr"].ToString();
            lblBnfNme.Text = reader["Bnf_Nme"].ToString();
            lblBnfIdd.Text = reader["Bnf_Idd"].ToString();
            lblBnfDatNas.Text = reader["Bnf_DatNas"].ToString().Replace(" 00:00:00", "");
            lblBnfSxo.Text = reader["Bnf_Sxo"].ToString();
            if (string.IsNullOrEmpty(reader["Bnf_IdTit"].ToString()))
            {
                lblBnfTit.Text = "TITULAR";
            }
            else
            {
                lblBnfTit.Text = "DEPENDENTE";
            }
            // Contrato
            lblPrdNme.Text = reader["Prd_Nme"].ToString();
            if (reader["Bnf_PosFin"].ToString() == "A")
                lblBnfPosFin.Text = "ATIVO";
            else
                lblBnfPosFin.Text = "INATIVO";
            if (reader["Bnf_Sit"].ToString() == "A")
                lblBnfSit.Text = "ATIVO";
            else
                lblBnfSit.Text = "INATIVO";
            // Biometria
            if (string.IsNullOrEmpty(reader["Bnf_Bio"].ToString()))
            {
                btnAtivar.Visible = true;
                btnAlterar.Visible = false;
                btnDesativar.Visible = true;
                lblBnfBio.Text = "NAO CADASTRADA";
            }
            else
            if (reader["Bnf_Bio"].ToString() == "True")
            {
                btnAtivar.Visible = false;
                btnAlterar.Visible = true;
                btnDesativar.Visible = true;
                lblBnfBio.Text = "ATIVADA";
            }
            else
            {
                btnAtivar.Visible = true;
                btnAlterar.Visible = false;
                btnDesativar.Visible = false;
                lblBnfBio.Text = "DISPENSADA";
            }
        }
        dba.Dispose();
    }
    protected void btnOk_Click(object sender, ImageClickEventArgs e)
    {
        getBnf(txtBnf_Mtr.Text);
    }
    protected void lbtBuscar_Click(object sender, EventArgs e)
    {

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
        getBnf(grd.DataKeys[grd.SelectedIndex].Values["Bnf_Mtr"].ToString());
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
    protected void grd_Sorted(object sender, EventArgs e)
    {
        ModalPopupExtender1.Show();
    }
    #endregion
    protected void btnAtivar_Click(object sender, ImageClickEventArgs e)
    {
        if (!string.IsNullOrEmpty(hdfIdBnf.Value))
            Response.Redirect("../bio/cad.aspx?ori=cadbnf&bnf=" + hdfIdBnf.Value);
    }
    protected void btnDesativar_Click(object sender, ImageClickEventArgs e)
    {
        if (!string.IsNullOrEmpty(hdfIdBnf.Value))
        {
            dtsBnf.UpdateParameters["Bnf_Bio"].DefaultValue = "False";
            dtsBnf.Update();
            getBnf(lblBnfMtr.Text);
        }
    }
}
