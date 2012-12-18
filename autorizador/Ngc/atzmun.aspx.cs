using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cadastros_atzmun : Snw.WebPage.PageBase
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            lockForm(true);
            rblTipAco.SelectedIndex = 1;
        }
    }
    private void lockForm(bool browseMode) 
    {
        lblError.Visible = false;
        pnlPsq.Enabled = browseMode;
        btnNew.Enabled = browseMode;
        btnEdit.Enabled = browseMode;
        btnSave.Visible = !browseMode;
        btnCancel.Visible = !browseMode;
        pnlEdit.Enabled = !browseMode;
        grd.Enabled = browseMode;
        lblMsg.Visible = false;
        btnSearch.Enabled = browseMode;
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {
            for (int i = 0; i < dts.SelectParameters.Count; i++)
                dts.SelectParameters[i].DefaultValue = String.Empty;

            dts.SelectParameters[rblTipAco.SelectedItem.Value].DefaultValue = this.txtPsq.Text;
            this.grd.DataBind();
            pnlEdit.Visible = false;
            grd.Visible = true;
        }
        catch (Exception erroSelect)
        {
            Response.Write(@"<script language='javascript'><!-- Esconder código!
                           alert('Atenção: valor inválido para pesquisa!!');// Exibir código --></script>");
        }
    }
    protected void btnNew_Click(object sender, EventArgs e)
    {
        lockForm(false);
        grd.SelectedIndex = -1;
        pnlEdit.Visible = true;
        grd.Visible = false;
        txtIdMun.Text = string.Empty;
        txtMun_Cod.Text = string.Empty;
        txtMun_Nme.Text = string.Empty;
    }
    protected void btnDel_Click(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(txtIdMun.Text))
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
    private void clearForm()
    {
       txtIdMun.Text = string.Empty;
       txtMun_Cod.Text = string.Empty;
       txtMun_Nme.Text = string.Empty;
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(txtMun_Nme.Text) &&
            !string.IsNullOrEmpty(txtMun_Cod.Text))
        {
            if (string.IsNullOrEmpty(this.txtIdMun.Text))
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
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        if (grd.SelectedIndex == -1)
            this.lblError.Visible = true;
        else {
            this.lockForm(false);
            this.pnlEdit.Visible = true;
            this.grd.Visible = false;
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        lockForm(true);
    }
    protected void Grd_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList dropDown = (DropDownList)sender;
        grd.PageSize = int.Parse(dropDown.SelectedValue);
    }
    protected void grd_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtIdMun.Text = grd.SelectedRow.Cells[0].Text;
        txtMun_Cod.Text = grd.SelectedRow.Cells[1].Text;
        txtMun_Nme.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[2].Text);
        ddlMun_Est.SelectedValue = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[3].Text);
    }
    protected void grd_PageIndexChanged(object sender, EventArgs e)
    {
        grd.SelectedIndex = -1;
    }
}
