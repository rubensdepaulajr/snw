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

public partial class Atz_prf : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        EscondeCabecalhoGrid();

        if (!Page.IsPostBack)
        {
            // Selecionando o Profissional do Contratado Local
            DBASQL dba = new DBASQL();
            SqlParameter[] param = 
                {
                    dba.MakeInParam("@IdCtt",SqlDbType.BigInt, 8, Profile.Local.IdCtt),
                    dba.MakeInParam("@Cte_SeqEnd",SqlDbType.TinyInt,1,Profile.Local.Cte_SeqEnd),
                    dba.MakeInParam("@IdUsr",SqlDbType.Int,4,Profile.Seguranca.IdUsr),
                };
            SqlDataReader reader;
            reader = dba.runProcDataReader("ssAtz_GiaPel", param);
            while (reader.Read())
            {
                hdfIdPrf.Value = reader["IdPrf"].ToString();
            }
            reader.Close();
            dba.Dispose();
        }
    }
    #region Simulate  tabclick on tabcontainer
    protected void btnTb1Trigger_Click(object sender, EventArgs args)
    {
        grdSolAtz.DataBind();
    }
    protected void btnTb2Trigger_Click(object sender, EventArgs args)
    {
        grdRet.Visible = true;
        grdRet.DataBind();
    }
    protected void btnTb3Trigger_Click(object sender, EventArgs args)
    {
        grdSolExe.Visible = true;
        grdSolExe.DataBind();
    }
    #endregion
    protected void EscondeCabecalhoGrid()
    {
        /*
        if (grdSolAtz.HeaderRow != null)
            grdSolAtz.HeaderRow.Visible = false;
        if (grdRet.HeaderRow != null)
            grdRet.HeaderRow.Visible = false;
        if (grdSolExe.HeaderRow != null)
            grdSolExe.HeaderRow.Visible = false;
         */

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
    protected void grdSolAtz_DataBound(object sender, EventArgs e)
    {
        GridViewRow gvrPager = grdSolAtz.BottomPagerRow;
        if (gvrPager == null)
            return;
        // get your controls from the gridview
        DropDownList ddlPages = (DropDownList)gvrPager.Cells[0].FindControl("ddlPages");
        Label lblPageCount = (Label)gvrPager.Cells[0].FindControl("lblPageCount");

        if (ddlPages != null)
        {
            // populate pager
            for (int i = 0; i < grdSolAtz.PageCount; i++)
            {
                int intPageNumber = i + 1;
                ListItem lstItem = new ListItem(intPageNumber.ToString());
                if (i == grdSolAtz.PageIndex)
                    lstItem.Selected = true;
                ddlPages.Items.Add(lstItem);
            }
        }
        // populate page count
        if (lblPageCount != null)
            lblPageCount.Text = grdSolAtz.PageCount.ToString();
    }

    /*dropdown do paginador da aba SOLICITAÇÕES AUTORIZADAS*/
    protected void ddlPages_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow gvrPager = grdSolAtz.BottomPagerRow;
        DropDownList ddlPages = (DropDownList)gvrPager.Cells[0].FindControl("ddlPages");
        grdSolAtz.PageIndex = ddlPages.SelectedIndex;
        // a method to populate your grid
        PopulateGridSolAut();
    }

    /*função que controla os botões de paginação da aba SOLICITAÇÕES AUTORIZADAS*/
    protected void PaginategrdSolAtz(object sender, CommandEventArgs e)
    {
        // get the current page selected
        int intCurIndex = grdSolAtz.PageIndex;

        switch (e.CommandArgument.ToString().ToLower())
        {
            case "first":
                grdSolAtz.PageIndex = 0;
                break;
            case "prev":
                if (intCurIndex > 0)
                    grdSolAtz.PageIndex = intCurIndex - 1;
                break;
            case "next":
                if (intCurIndex <= grdSolAtz.PageCount - 1)
                    grdSolAtz.PageIndex = intCurIndex + 1;
                break;
            case "last":
                grdSolAtz.PageIndex = grdSolAtz.PageCount;
                break;
        }
        // popultate the gridview control
        PopulateGridSolAut();
    }

    /* dropdown do paginador da aba SOLICITAÇÕES AUTORIZADAS*/
    protected void PopulateGridSolAut()
    {
        grdSolAtz.DataBind();
    }

    /* 1 - FIM DOS CÓDIGOS ESPECIFICOS DA ABA SOLICITAÇÕES AUTORIZADAS--------------------------------------*/


    /* 2- INICIO DOS CODIGOS ESPECIFICOS DA ABA RETORNO    -------------------------------------------------*/

    /*preenche informações(dropdown e total de paginas) do paginador do grid da aba SOLICITAÇÕES AUTORIZADAS*/
    protected void grdRet_DataBound(object sender, EventArgs e)
    {
        GridViewRow gvrPager = grdRet.BottomPagerRow;
        if (gvrPager == null)
            return;
        // get your controls from the gridview
        DropDownList ddlPagesRetorno = (DropDownList)gvrPager.Cells[0].FindControl("ddlPagesRetorno");
        Label lblPageCountRetorno = (Label)gvrPager.Cells[0].FindControl("lblPageCountRetorno");

        if (ddlPagesRetorno != null)
        {
            // populate pager
            for (int i = 0; i < grdRet.PageCount; i++)
            {
                int intPageNumber = i + 1;
                ListItem lstItem = new ListItem(intPageNumber.ToString());
                if (i == grdRet.PageIndex)
                    lstItem.Selected = true;
                ddlPagesRetorno.Items.Add(lstItem);
            }
        }
        // populate page count
        if (lblPageCountRetorno != null)
            lblPageCountRetorno.Text = grdRet.PageCount.ToString();
    }

    /*dropdown do paginador da aba SOLICITAÇÕES AUTORIZADAS*/
    protected void ddlPagesRetorno_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow gvrPager = grdRet.BottomPagerRow;
        DropDownList ddlPagesRetorno = (DropDownList)gvrPager.Cells[0].FindControl("ddlPagesRetorno");
        grdRet.PageIndex = ddlPagesRetorno.SelectedIndex;
        // a method to populate your grid
        PopulategrdRet();
    }

    /*função que controla os botões de paginação da aba SOLICITAÇÕES AUTORIZADAS*/
    protected void PaginategrdRet(object sender, CommandEventArgs e)
    {
        // get the current page selected
        int intCurIndex = grdRet.PageIndex;

        switch (e.CommandArgument.ToString().ToLower())
        {
            case "first":
                grdRet.PageIndex = 0;
                break;
            case "prev":
                if (intCurIndex > 0)
                    grdRet.PageIndex = intCurIndex - 1;
                break;
            case "next":
                if (intCurIndex <= grdRet.PageCount - 1)
                    grdRet.PageIndex = intCurIndex + 1;
                break;
            case "last":
                grdRet.PageIndex = grdRet.PageCount;
                break;
        }
        // popultate the gridview control
        PopulategrdRet();
    }

    /* dropdown do paginador da aba SOLICITAÇÕES AUTORIZADAS*/
    protected void PopulategrdRet()
    {
        grdRet.DataBind();
    }

    /* 2- FIM DOS CODIGOS ESPECIFICOS DA ABA RETORNO    -------------------------------------------------*/

    /*3 - INICIO DOS CODIGOS ESPECIFICOS DA ABA SOLICITAÇÕES PENDENTES */


    /*preenche informações(dropdown e total de paginas) do paginador do grid da aba SOLICITAÇÕES AUTORIZADAS*/
    protected void grdSolExe_DataBound(object sender, EventArgs e)
    {
        GridViewRow gvrPager = grdSolExe.BottomPagerRow;
        if (gvrPager == null)
            return;
        // get your controls from the gridview
        DropDownList ddlPagesSolPendentes = (DropDownList)gvrPager.Cells[0].FindControl("ddlPagesSolPendentes");
        Label lblPageCountSolPendentes = (Label)gvrPager.Cells[0].FindControl("lblPageCountSolPendentes");

        if (ddlPagesSolPendentes != null)
        {
            // populate pager
            for (int i = 0; i < grdSolExe.PageCount; i++)
            {
                int intPageNumber = i + 1;
                ListItem lstItem = new ListItem(intPageNumber.ToString());
                if (i == grdSolExe.PageIndex)
                    lstItem.Selected = true;
                ddlPagesSolPendentes.Items.Add(lstItem);
            }
        }
        // populate page count
        if (lblPageCountSolPendentes != null)
            lblPageCountSolPendentes.Text = grdSolExe.PageCount.ToString();
    }

    /*dropdown do paginador da aba SOLICITAÇÕES AUTORIZADAS*/
    protected void ddlPagesSolPendentes_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow gvrPager = grdSolExe.BottomPagerRow;
        DropDownList ddlPagesSolPendentes = (DropDownList)gvrPager.Cells[0].FindControl("ddlPagesSolPendentes");
        grdSolExe.PageIndex = ddlPagesSolPendentes.SelectedIndex;
        // a method to populate your grid
        PopulategrdSolExe();
    }

    /*função que controla os botões de paginação da aba SOLICITAÇÕES AUTORIZADAS*/
    protected void PaginategrdSolExe(object sender, CommandEventArgs e)
    {
        // get the current page selected
        int intCurIndex = grdSolExe.PageIndex;

        switch (e.CommandArgument.ToString().ToLower())
        {
            case "first":
                grdSolExe.PageIndex = 0;
                break;
            case "prev":
                if (intCurIndex > 0)
                    grdSolExe.PageIndex = intCurIndex - 1;
                break;
            case "next":
                if (intCurIndex <= grdSolExe.PageCount - 1)
                    grdSolExe.PageIndex = intCurIndex + 1;
                break;
            case "last":
                grdSolExe.PageIndex = grdSolExe.PageCount;
                break;
        }
        // popultate the gridview control
        PopulategrdSolExe();
    }

    /* dropdown do paginador da aba SOLICITAÇÕES AUTORIZADAS*/
    protected void PopulategrdSolExe()
    {
        grdSolExe.DataBind();
    }






    /*3 - FIM DOS CODIGOS ESPECIFICOS DA ABA SOLICITAÇÕES PENDENTES */

    /* 4 - inicio do codigo do grid expansivo da tab3*/

    

    /* 4 - fim do codigo do grid expansivo da tab3*/

}
