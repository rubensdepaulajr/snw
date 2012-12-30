using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cadastros_atzbrr : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            lockForm(true);
            rblTipAco.SelectedIndex = 1;
        }
    }
    private void clearForm() 
    {
        txtIdBrr.Text = String.Empty;
        txtBrr_Nme.Text = String.Empty;
    }
    private void lockForm(bool browseMode)
    {
        lblError.Visible = false;
        pnlPsq.Enabled = browseMode;
        btnNew.Enabled = browseMode;
        btnEdit.Enabled = browseMode;
        btnDel.Enabled = browseMode;
        btnSave.Visible = !browseMode;
        btnCancel.Visible = !browseMode;
        pnlInfoPrf.Enabled = !browseMode;
        grd.Enabled = browseMode;
        txtIdBrr.Enabled = browseMode;
        lblMsg.Visible = false;
        btnSearch.Enabled = browseMode;
    }
    protected void btnNew_Click(object sender, EventArgs e)
    {
        clearForm();
        dts.SelectParameters["Brr_Nme"].DefaultValue = String.Empty;
        grd.SelectedIndex = -1;
        lockForm(false);
        grd.Visible = false;
        pnlInfoPrf.Visible = true;

    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        if (grd.SelectedIndex == -1)
            lblError.Visible = true;
        else
        {
            lockForm(false);
            grd.Visible = false;
            pnlInfoPrf.Visible = true;
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < dts.SelectParameters.Count; i++)
        dts.SelectParameters[i].DefaultValue=String.Empty;

        dts.SelectParameters[rblTipAco.SelectedItem.Value].DefaultValue=txtPsq.Text;
        grd.DataBind();
        grd.SelectedIndex = -1;
        clearForm();
        grd.Visible=true;
        pnlInfoPrf.Visible = false;
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(txtBrr_Nme.Text))
        {
            if (string.IsNullOrEmpty(txtIdBrr.Text))
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
        if (!String.IsNullOrEmpty(txtIdBrr.Text))
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
    protected void GoToPage_TextChanged(object sender, EventArgs e)
    {
        TextBox txtGoToPage = (TextBox)sender;

        int pageNumber;
        if (int.TryParse(txtGoToPage.Text.Trim(), out pageNumber) && pageNumber > 0 && pageNumber <= this.grd.PageCount)
        {
            this.grd.PageIndex = pageNumber - 1;
        }
        else
        {
            this.grd.PageIndex = 0;
        }
    }
    protected void grd_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtIdBrr.Text = grd.SelectedRow.Cells[0].Text.TrimEnd();
        txtBrr_Nme.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[1].Text.TrimEnd());
        ddlMun_Nme.SelectedValue = ddlMun_Nme.Items.FindByText(HttpUtility.HtmlDecode(grd.SelectedRow.Cells[2].Text.Trim())).Value;
    }
    protected void grd_PageIndexChanged(object sender, EventArgs e)
    {
        grd.SelectedIndex = -1;
    }
}