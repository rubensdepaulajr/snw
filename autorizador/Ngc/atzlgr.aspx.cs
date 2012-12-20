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

public partial class Ngc_atzlgr : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            lockForm(true);
            this.rblTipAco.SelectedIndex = 1;
        }
    }
    protected void btnNew_Click(object sender, EventArgs e)
    {
        this.clearForm();
        dts.SelectParameters["Lgr_Nme"].DefaultValue = String.Empty;
        this.grd.SelectedIndex = -1;
        lockForm(false);
        grd.Visible = false;
        pnlInfoPrf.Visible = true;
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        if (grd.SelectedIndex == -1)
            this.lblEditError.Visible = true;
        else
        {
            lockForm(false);
            grd.Visible = false;
            pnlInfoPrf.Visible = true;
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {
            for (int i = 0; i < dts.SelectParameters.Count; i++)
                dts.SelectParameters[i].DefaultValue = String.Empty;

            dts.SelectParameters[rblTipAco.SelectedItem.Value].DefaultValue = this.txtPsq.Text;
            this.grd.DataBind();
            this.grd.SelectedIndex = -1;
            this.clearForm();
            grd.Visible = true;
            pnlInfoPrf.Visible = false;
        }
        catch (Exception erroSelect)
        {
            Response.Write(@"<script language='javascript'><!-- Esconder código!
                           alert('Atenção: valor inválido para pesquisa!!');// Exibir código --></script>");
        }
    }
    private void clearForm()
    {
        this.txtIdLgr.Text = string.Empty;
        this.txtLgr_Nme.Text = string.Empty;
        this.txtLgr_Cep.Text = string.Empty;    }

    private void lockForm(bool browseMode)
    {
        lblEditError.Visible = false;
        pnlPsq.Enabled = browseMode;        
        btnNew.Enabled = browseMode;
        btnEdit.Enabled = browseMode;
        btnDel.Enabled = browseMode;
        btnSave.Visible = !browseMode;
        btnCancel.Visible = !browseMode;
        pnlInfoPrf.Enabled = !browseMode;
        grd.Enabled = browseMode;
        txtIdLgr.Enabled = browseMode;
        lblMsg.Visible = false;
        btnSearch.Enabled = browseMode;
    }
    protected void grd_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtIdLgr.Text = grd.SelectedRow.Cells[0].Text.TrimEnd();
        ddlIdMun.SelectedValue = grd.SelectedDataKey.Values["IdMun"].ToString();
        ddlIdBrr.DataBind();
        ddlIdBrr.SelectedValue = grd.SelectedDataKey.Values["IdBrr"].ToString();
        ddlLgr_IdTpl.SelectedValue = ddlLgr_IdTpl.Items.FindByText(HttpUtility.HtmlDecode(this.grd.SelectedRow.Cells[1].Text.Trim())).Value;
        txtLgr_Nme.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[2].Text.TrimEnd());
        txtLgr_Cep.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[4].Text.TrimEnd()); 
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(txtLgr_Nme.Text))
        {
            if (string.IsNullOrEmpty(txtIdLgr.Text))
                dts.Insert();
            else
                dts.Update();
            lockForm(true);
        }
        else
        {
            lblMsg.Visible = true;
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        lockForm(true);
        grd.Visible = true;
        pnlInfoPrf.Visible = false;
    }
    protected void btnDel_Click(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(txtIdLgr.Text))
        {
            try
            {
                dts.Delete();
                grd.SelectedIndex = -1;
            }
            catch (Exception erro)
            {
                Response.Write(@"<script language='javascript'><!-- Esconder código!
                           alert('A exclusão não foi concluída pois existe um ou mais registros relacionados a esse.');// Exibir código --></script>");
            }
        }
        else
        {
            Response.Write(@"<script language='javascript'><!-- Esconder código!
                           alert('Selecione um registro para ser excluído!');// Exibir código --></script>");
        }
    }
    protected void ddlIdBrr_SelectedIndexChanged(object sender, EventArgs e)
    {
        // Para evitar que retorne dados na pesquisa ao mudar o item do drop down
        dts.SelectParameters["Lgr_Nme"].DefaultValue = string.Empty;
    }
    protected void grd_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grd.SelectedIndex = -1;
    }
}