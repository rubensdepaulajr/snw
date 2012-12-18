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

public partial class Mpv_cidcon : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
        }
    }
    protected void btnPgaIni_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void imgBtnAdicionar_Click(object sender, ImageClickEventArgs e)
    {
        string idCid = string.Empty;
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
        }
        dba.Dispose();

        if (string.IsNullOrEmpty(idCid))
        {
            globall.showMessage(imgErr, lblErr, "CID não econtrado!");
        }
        else
        {
            globall.showMessage(imgErr, lblErr, string.Empty);
            dts.InsertParameters["IdCid"].DefaultValue = idCid;
            dts.Insert();
            grdCID.DataBind();
        }
    }
    protected void btnPsq_Click(object sender, EventArgs e)
    {
        ModalPopupExtender1.Show();
    }
    #region Popup CID10

    protected void btnBuscar_Click(object sender, ImageClickEventArgs e)
    {
        ModalPopupExtender1.Show();
        dtsCID.SelectParameters["Cid_Cod"].DefaultValue = txtBnf_MtrPop.Text;
        dtsCID.SelectParameters["Cid_Dsc"].DefaultValue = txtBnf_NmePop.Text;
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
        globall.showMessage(imgErr, lblErr, string.Empty);
        dts.InsertParameters["IdCid"].DefaultValue = grd.DataKeys[grd.SelectedIndex].Values["IdCid"].ToString();
        dts.Insert();
        grdCID.DataBind();
        limpaPopup();
    }
    protected void btn_fechar_Click(object sender, ImageClickEventArgs e)
    {
        limpaPopup();
    }
    protected void limpaPopup()
    {
        txtBnf_NmePop.Text = "";
        txtBnf_MtrPop.Text = "";
        dtsCID.SelectParameters["IdCid"].DefaultValue = string.Empty;
        dtsCID.SelectParameters["Cid_Dsc"].DefaultValue = string.Empty;
        dtsCID.DataBind();
        grd.DataBind();

        ModalPopupExtender1.Hide();
        grd.SelectedIndex = -1;
    }
    protected void grd_Sorted(object sender, EventArgs e)
    {
        ModalPopupExtender1.Show();
    }
    #endregion

    protected void grdCID_SelectedIndexChanged(object sender, EventArgs e)
    {
        dts.DeleteParameters["IdCid"].DefaultValue = grdCID.Rows[grdCID.SelectedIndex].Cells[0].Text;
        dts.Delete();
        grdCID.DataBind();
        grdCID.SelectedIndex = -1;
    }
}
