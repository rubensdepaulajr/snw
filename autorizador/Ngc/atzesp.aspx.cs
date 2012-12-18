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

public partial class Ngc_atzesp : System.Web.UI.Page
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
        clearForm();
        dts.SelectParameters["Esp_Dsc"].DefaultValue = string.Empty;
        grd.SelectedIndex = -1;
        lockForm(false);
        grd.Visible = false;
        pnlInf.Visible = true;
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        if (grd.SelectedIndex == -1)
            lblEditError.Visible = true;
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
                dts.SelectParameters[i].DefaultValue = string.Empty;
            dts.SelectParameters[rblTipAco.SelectedItem.Value].DefaultValue = txtNme.Text;           
            grd.DataBind();
            grd.SelectedIndex = -1;
            clearForm();
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
        txtIdEsp.Text = string.Empty;
        txtEsp_Dsc.Text = string.Empty;
        txtEsp_Cbo.Text = string.Empty;
        txtEsp_SisGst.Text = string.Empty;
        txtEspIddMin.Text = string.Empty;
        txtEspIddMax.Text = string.Empty;
        txtEspQtdMax.Text = string.Empty;
        txtEspQtdDia.Text = string.Empty;
        txtEspQtdMes.Text = string.Empty;
        txtEspQtdAno.Text = string.Empty;
        txtEspRtn.Text = string.Empty;
        chkEspAltCpx.Checked = false;
    }
    private void lockForm(bool browseMode)
    {
        lblEditError.Visible = false;
        pnlPsq.Enabled = browseMode;
        btnNew.Enabled = browseMode;
        btnEdit.Enabled = browseMode;
        btnDel.Enabled = browseMode;
        btnSave.Visible = !browseMode;
        btnCancel.Visible = !browseMode;
        pnlInf.Enabled = !browseMode;
        grd.Enabled = browseMode;
        txtIdEsp.Enabled = browseMode;
        lblMsg.Visible = false;
    }
    protected void grd_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtIdEsp.Text = this.grd.SelectedRow.Cells[0].Text.TrimEnd();
        txtEsp_Dsc.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[1].Text.TrimEnd());
        txtEsp_Cbo.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[2].Text.TrimEnd());
        txtEsp_SisGst.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[3].Text.TrimEnd());
        CheckBox cb = (CheckBox)(grd.SelectedRow.FindControl("chkAltCpx"));
        chkEspAltCpx.Checked = cb.Checked;
        ddlEspSxo.SelectedValue = grd.SelectedRow.Cells[5].Text.Trim();
        txtEspIddMin.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[6].Text.TrimEnd());
        txtEspIddMax.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[7].Text.TrimEnd());
        txtEspQtdMax.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[8].Text.TrimEnd());
        txtEspQtdDia.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[9].Text.TrimEnd());
        txtEspQtdMes.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[10].Text.TrimEnd());
        txtEspQtdAno.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[11].Text.TrimEnd());
        txtEspRtn.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[12].Text.TrimEnd());    
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(txtEsp_Dsc.Text) && (!string.IsNullOrEmpty(txtEsp_Cbo.Text)))
        {
            if (string.IsNullOrEmpty(txtIdEsp.Text))
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
        //lockForm(true);
        lockForm(true);
        grd.Visible = true;
        pnlInf.Visible = false;
    }
    protected void btnDel_Click(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(txtIdEsp.Text))
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
    protected void grd_PageIndexChanged(object sender, EventArgs e)
    {
        grd.SelectedIndex = -1;
    }
}