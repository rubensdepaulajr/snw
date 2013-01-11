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

public partial class Sgn_sgnppl : System.Web.UI.Page
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
        clearForm(1);
        dts.SelectParameters["Ppl_Dsc"].DefaultValue = string.Empty;
        grd.SelectedIndex = -1;
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
        dts.SelectParameters[rblTipAco.SelectedItem.Value].DefaultValue = this.txtNme.Text;
        grd.DataBind();
        grd.SelectedIndex = -1;
        clearForm(1);
        grd.Visible = true;
        pnlInfoPrf.Visible = false;
    }
    private void clearForm(Int32 tipo)
    {
        if (tipo == 1)
        {
            this.txtIdPpl.Text = string.Empty;
            this.txtPpl_Dsc.Text = string.Empty;
            this.txtPplQtdCh_.Text = string.Empty;
        }
        else
        {
            txtPpl_Dsc.Text = txtPpl_Dsc.Text == "&nbsp;" ? string.Empty : txtPpl_Dsc.Text;           
        }
    }
    private void lockForm(bool browseMode)
    {
        btnNew.Enabled = browseMode;
        btnEdit.Enabled = browseMode;
        btnDel.Enabled = browseMode;
        btnSave.Visible = !browseMode;
        btnCancel.Visible = !browseMode;
        pnlInfoPrf.Enabled = !browseMode;
        grd.Enabled = browseMode;
        txtIdPpl.Enabled = browseMode;
        lblMsg.Visible = false;
    }
    protected void grd_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtIdPpl.Text = this.grd.SelectedRow.Cells[0].Text.Trim();
        txtPpl_Dsc.Text = this.grd.SelectedRow.Cells[1].Text.Trim();
        txtPplQtdCh_.Text = this.grd.SelectedRow.Cells[2].Text.Trim();
        CheckBox cb = (CheckBox)(grd.SelectedRow.FindControl("chkOpe"));
        chkPplOpe.Checked = cb.Checked;
        cb = (CheckBox)(grd.SelectedRow.FindControl("chkCon"));
        chkPplCon.Checked = cb.Checked;
        cb = (CheckBox)(grd.SelectedRow.FindControl("chkSdt"));
        chkPplSdt.Checked = cb.Checked;
        cb = (CheckBox)(grd.SelectedRow.FindControl("chkPrgLib"));
        chkPplPrgLib.Checked = cb.Checked;
        clearForm(2);
        pnlInfoPrf.Visible = true;
        grd.Visible = false;
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(txtPpl_Dsc.Text))
        {
            if (string.IsNullOrEmpty(this.txtIdPpl.Text))
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
    }
    protected void btnDel_Click(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(txtIdPpl.Text))
        {
            try
            {
                dts.Delete();
                clearForm(1);
                Response.Write(@"<script language='javascript'><!-- Esconder código!
                           alert('Exclusão efetuada com sucesso.');// Exibir código --></script>");
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
    protected void grd_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grd.SelectedIndex = -1;
    }
}