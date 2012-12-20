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

public partial class Atz_aud : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            txtDatIni.Text = DateTime.Now.AddDays(-7).ToShortDateString();
            txtDatFim.Text = DateTime.Now.ToShortDateString();

            DBASQL dba = new DBASQL(); 
            SqlDataReader reader;
            dba.RunSql("SELECT IdSit, Sit_Dsc FROM dbo.Atz_Sit WHERE IdSit <> 10 ORDER BY IdSit", out reader);
            ddlSit.DataSource = reader;
            ddlSit.DataBind();            
            dba.Dispose();

            if (Request.QueryString.Count > 0)
            {
                txtSnh.Text = Request.QueryString["snh"].ToString();
                pesquisarGuias(false);
            }
        }
    }
    private void pesquisarGuias(bool verificarParametros)
    {
        string dataIni = txtDatIni.Text + " 00:00:00";
        string dataFim = txtDatFim.Text + " 23:59:59";

        if (verificarParametros && string.IsNullOrEmpty(txtDatIni.Text) && string.IsNullOrEmpty(txtDatFim.Text))
            globall.showMessage(imgMsg, lblMsg, "A data inicial e final da pesquisa devem ser informadas.");
        else if (verificarParametros && (ddlTip.SelectedValue == "-1") &&
            (ddlSit.SelectedValue == "-1") && string.IsNullOrEmpty(txtPdmCod.Text) &&
            string.IsNullOrEmpty(txtSnh.Text) && string.IsNullOrEmpty(txtBnfMtr.Text) &&
            string.IsNullOrEmpty(txtIdCtt.Text) && string.IsNullOrEmpty(txtPrfMtr.Text))
            globall.showMessage(imgMsg, lblMsg, "Pelo menos um critério além da data inicial e final deve ser informado.");
        else if (verificarParametros && !string.IsNullOrEmpty(txtDatIni.Text) && !globall.isDate(txtDatIni.Text))
            globall.showMessage(imgMsg, lblMsg, "Data Inicial inválida.");
        else if (verificarParametros && !string.IsNullOrEmpty(txtDatFim.Text) && !globall.isDate(txtDatFim.Text))
            globall.showMessage(imgMsg, lblMsg, "Data Final inválida.");
        else if (verificarParametros && !string.IsNullOrEmpty(txtIdCtt.Text) && !globall.isInteger(txtIdCtt.Text))
            globall.showMessage(imgMsg, lblMsg, "Matrícula do Contratado inválida!");
        else
        {
            if (verificarParametros)
            {
                dts.SelectParameters["Gia_DatIni"].DefaultValue = dataIni;
                dts.SelectParameters["Gia_DatFim"].DefaultValue = dataFim;
            }
            if (ddlTip.SelectedValue != "-1")
                dts.SelectParameters["Gia_Tip"].DefaultValue = ddlTip.SelectedValue;
            if (ddlSit.SelectedValue != "-1")
                dts.SelectParameters["IdSit"].DefaultValue = ddlSit.SelectedValue;
            dts.SelectParameters["Gia_Snh"].DefaultValue = txtSnh.Text;
            dts.SelectParameters["Bnf_Mtr"].DefaultValue = txtBnfMtr.Text;
            dts.SelectParameters["IdCtt"].DefaultValue = txtIdCtt.Text;
            dts.SelectParameters["Prf_Mtr"].DefaultValue = txtPrfMtr.Text;
            dts.SelectParameters["Pdm_Cod"].DefaultValue = txtPdmCod.Text;
            dts.SelectParameters["Ord"].DefaultValue = ddlOrd.SelectedValue;
            grdMaster.DataBind();

            mvw.ActiveViewIndex = 1;
        }
    }
    protected void btnOk_Click(object sender, ImageClickEventArgs e)
    {
        pesquisarGuias(true);
    }
    protected void btnNewPsq_Click(object sender, ImageClickEventArgs e)
    {
        mvw.ActiveViewIndex = 0;
    }
    /*3 - INICIO DOS CODIGOS ESPECIFICOS DA ABA SOLICITAÇÕES PENDENTES */

    /*preenche informações(dropdown e total de paginas) do paginador do grid da aba SOLICITAÇÕES AUTORIZADAS*/
    protected void grdSolPen_DataBound(object sender, EventArgs e)
    {
        GridViewRow gvrPager = grdMaster.BottomPagerRow;
        if (gvrPager == null)
            return;
        // get your controls from the gridview
        DropDownList ddlPagesSolPendentes = (DropDownList)gvrPager.Cells[0].FindControl("ddlPagesSolPendentes");
        Label lblPageCountSolPendentes = (Label)gvrPager.Cells[0].FindControl("lblPageCountSolPendentes");

        if (ddlPagesSolPendentes != null)
        {
            // populate pager
            for (int i = 0; i < grdMaster.PageCount; i++)
            {
                int intPageNumber = i + 1;
                ListItem lstItem = new ListItem(intPageNumber.ToString());
                if (i == grdMaster.PageIndex)
                    lstItem.Selected = true;
                ddlPagesSolPendentes.Items.Add(lstItem);
            }
        }
        // populate page count
        if (lblPageCountSolPendentes != null)
            lblPageCountSolPendentes.Text = grdMaster.PageCount.ToString();
    }

    /*dropdown do paginador da aba SOLICITAÇÕES AUTORIZADAS*/
    protected void ddlPagesSolPendentes_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow gvrPager = grdMaster.BottomPagerRow;
        DropDownList ddlPagesSolPendentes = (DropDownList)gvrPager.Cells[0].FindControl("ddlPagesSolPendentes");
        grdMaster.PageIndex = ddlPagesSolPendentes.SelectedIndex;
        // a method to populate your grid
        PopulategrdSolPen();
    }

    /*função que controla os botões de paginação da aba SOLICITAÇÕES AUTORIZADAS*/
    protected void PaginategrdSolPen(object sender, CommandEventArgs e)
    {
        // get the current page selected
        int intCurIndex = grdMaster.PageIndex;

        switch (e.CommandArgument.ToString().ToLower())
        {
            case "first":
                grdMaster.PageIndex = 0;
                break;
            case "prev":
                if (intCurIndex > 0)
                    grdMaster.PageIndex = intCurIndex - 1;
                break;
            case "next":
                if (intCurIndex <= grdMaster.PageCount - 1)
                    grdMaster.PageIndex = intCurIndex + 1;
                break;
            case "last":
                grdMaster.PageIndex = grdMaster.PageCount;
                break;
        }
        // popultate the gridview control
        PopulategrdSolPen();
    }

    /* dropdown do paginador da aba SOLICITAÇÕES AUTORIZADAS*/
    protected void PopulategrdSolPen()
    {
        grdMaster.DataBind();
    }

    /*3 - FIM DOS CODIGOS ESPECIFICOS DA ABA SOLICITAÇÕES PENDENTES */

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

}
