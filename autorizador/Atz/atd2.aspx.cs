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

public partial class Atz_atd2 : System.Web.UI.Page
{
    private int index = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
    }
    #region Simulate  tabclick on tabcontainer
    protected void btnTb1Trigger_Click(object sender, EventArgs args)
    {
        grdSolAtz.DataBind();
        //System.Threading.Thread.Sleep(5000);
    }
    protected void btnTb2Trigger_Click(object sender, EventArgs args)
    {
        grdRet.DataBind();
        //System.Threading.Thread.Sleep(5000);
    }
    protected void btnTb3Trigger_Click(object sender, EventArgs args)
    {
        grdSolPen.DataBind();
        //System.Threading.Thread.Sleep(5000);
    }
    #endregion
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
            DropDownList ddlPages =  (DropDownList)gvrPager.Cells[0].FindControl("ddlPages");
            Label lblPageCount =     (Label)gvrPager.Cells[0].FindControl("lblPageCount");

        if (ddlPages != null)
            {
                // populate pager
                for (int i = 0; i < grdSolAtz.PageCount; i++)
                {
                    int intPageNumber = i + 1;
                    ListItem lstItem =  new ListItem(intPageNumber.ToString());
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
                if(intCurIndex > 0)
                    grdSolAtz.PageIndex = intCurIndex - 1;
                break;
            case "next":
                if(intCurIndex <= grdSolAtz.PageCount - 1)
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
    protected void grdSolPen_DataBound(object sender, EventArgs e)
    {
        GridViewRow gvrPager = grdSolPen.BottomPagerRow;
        if (gvrPager == null)
            return;
        // get your controls from the gridview
        DropDownList ddlPagesSolPendentes = (DropDownList)gvrPager.Cells[0].FindControl("ddlPagesSolPendentes");
        Label lblPageCountSolPendentes = (Label)gvrPager.Cells[0].FindControl("lblPageCountSolPendentes");

        if (ddlPagesSolPendentes != null)
        {
            // populate pager
            for (int i = 0; i < grdSolPen.PageCount; i++)
            {
                int intPageNumber = i + 1;
                ListItem lstItem = new ListItem(intPageNumber.ToString());
                if (i == grdSolPen.PageIndex)
                    lstItem.Selected = true;
                ddlPagesSolPendentes.Items.Add(lstItem);
            }
        }
        // populate page count
        if (lblPageCountSolPendentes != null)
            lblPageCountSolPendentes.Text = grdSolPen.PageCount.ToString();
    }

    /*dropdown do paginador da aba SOLICITAÇÕES AUTORIZADAS*/
    protected void ddlPagesSolPendentes_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow gvrPager = grdSolPen.BottomPagerRow;
        DropDownList ddlPagesSolPendentes = (DropDownList)gvrPager.Cells[0].FindControl("ddlPagesSolPendentes");
        grdSolPen.PageIndex = ddlPagesSolPendentes.SelectedIndex;
        // a method to populate your grid
        PopulategrdSolPen();
    }

    /*função que controla os botões de paginação da aba SOLICITAÇÕES AUTORIZADAS*/
    protected void PaginategrdSolPen(object sender, CommandEventArgs e)
    {
        // get the current page selected
        int intCurIndex = grdSolPen.PageIndex;

        switch (e.CommandArgument.ToString().ToLower())
        {
            case "first":
                grdSolPen.PageIndex = 0;
                break;
            case "prev":
                if (intCurIndex > 0)
                    grdSolPen.PageIndex = intCurIndex - 1;
                break;
            case "next":
                if (intCurIndex <= grdSolPen.PageCount - 1)
                    grdSolPen.PageIndex = intCurIndex + 1;
                break;
            case "last":
                grdSolPen.PageIndex = grdSolPen.PageCount;
                break;
        }
        // popultate the gridview control
        PopulategrdSolPen();
    }

    /* dropdown do paginador da aba SOLICITAÇÕES AUTORIZADAS*/
    protected void PopulategrdSolPen()
    {
        grdSolPen.DataBind();
    }
    
    /*3 - FIM DOS CODIGOS ESPECIFICOS DA ABA SOLICITAÇÕES PENDENTES */

    /* 4 - inicio do codigo do grid expansivo da tab3*/

    protected void grdSolPen_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Button b = (Button)e.Row.Cells[1].FindControl("Button1");
            b.CommandArgument = index.ToString();
            index = index + 1;
        }
    }

    protected void grdSolPen_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Show")
        {
            Button b = (Button)grdSolPen.Rows[int.Parse(e.CommandArgument.ToString())].Cells[1].FindControl("Button1");
            if (b.Text == "Exibir Motivos")
            {
                string custid = grdSolPen.DataKeys[int.Parse(e.CommandArgument.ToString())].Value.ToString();
                SqlDataSource sds = (SqlDataSource)grdSolPen.Rows[int.Parse(e.CommandArgument.ToString())].FindControl("dtGiaMsg");
                GridView gv = (GridView)grdSolPen.Rows[int.Parse(e.CommandArgument.ToString())].FindControl("grdGiaMsg");
                if (gv.HeaderRow != null)
                    gv.HeaderRow.Visible = false;
                
                sds.SelectParameters[0].DefaultValue = custid;
                gv.Visible = true;
                b.Text = "Ocultar Motivos";
            }
            else
            {
                GridView gv = (GridView)grdSolPen.Rows[int.Parse(e.CommandArgument.ToString())].FindControl("grdGiaMsg");
                gv.Visible = false;
                if (gv.HeaderRow != null)
                    gv.HeaderRow.Visible = false;
                b.Text = "Exibir Motivos";
                
            }

        }
    }

    /* 4 - fim do codigo do grid expansivo da tab3*/

}
