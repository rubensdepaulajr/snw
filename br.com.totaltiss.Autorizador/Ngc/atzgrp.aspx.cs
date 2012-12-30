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

public partial class Ngc_atzgrp : System.Web.UI.Page
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
        dts.SelectParameters["Grp_Dsc"].DefaultValue = String.Empty;
        this.grd.SelectedIndex = -1;
        lockForm(false);
        grd.Visible = false;
        pnlInf.Visible = true;
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        if (grd.SelectedIndex == -1)
            this.lblEditError.Visible = true;
        else
        {
            lockForm(false);
            grd.Visible = false;
            pnlInf.Visible = true;
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {
            for (int i = 0; i < dts.SelectParameters.Count; i++)
                dts.SelectParameters[i].DefaultValue = String.Empty;

            dts.SelectParameters[rblTipAco.SelectedItem.Value].DefaultValue = this.txtNme.Text;
            this.grd.DataBind();
            this.grd.SelectedIndex = -1;
            this.clearForm();
            grd.Visible = true;
            pnlInf.Visible = false;
        }
        catch (Exception erroSelect)
        {
            Response.Write(@"<script language='javascript'><!-- Esconder código!
                               alert('Atenção: valor inválido para pesquisa!!');// Exibir código --></script>");
        }
    }
    private void clearForm()
    {
        this.txtIdGrp.Text = string.Empty;
        this.txtGrp_Dsc.Text = string.Empty;
        this.txtGrp_QtdCh_.Text = string.Empty;
    }
    private void lockForm(bool browseMode)
    {
        this.lblEditError.Visible = false;
        this.pnlPsq.Enabled = browseMode;
        this.btnNew.Enabled = browseMode;
        this.btnEdit.Enabled = browseMode;
        this.btnDel.Enabled = browseMode;
        this.btnSave.Visible = !browseMode;
        this.btnCancel.Visible = !browseMode;
        this.pnlInf.Enabled = !browseMode;
        this.grd.Enabled = browseMode;
        this.txtIdGrp.Enabled = browseMode;
        this.lblMsg.Visible = false;
    }
    protected void grd_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.txtIdGrp.Text = this.grd.SelectedRow.Cells[0].Text.Trim();
        this.txtGrp_Dsc.Text = HttpUtility.HtmlDecode(this.grd.SelectedRow.Cells[1].Text).Trim();
        this.txtGrp_QtdCh_.Text = this.grd.SelectedRow.Cells[2].Text.Trim();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(txtGrp_Dsc.Text))
        {
            if (string.IsNullOrEmpty(this.txtIdGrp.Text))
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
        pnlInf.Visible = false;
    }
    protected void btnDel_Click(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(txtIdGrp.Text))
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
    protected void grd_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grd.SelectedIndex = -1;
    }
}