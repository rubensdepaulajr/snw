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

public partial class Sgn_sgnmod : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            lockForm(true);
            rblTipAco.SelectedIndex = 1;
        }
    }
    protected void btnNew_Click(object sender, EventArgs e)
    {
        clearForm(1);
        dts.SelectParameters["Mod_Dsc"].DefaultValue = String.Empty;
        grd.SelectedIndex = -1;
        lockForm(false);
        grd.Visible = false;
        pnlInfo.Visible = true;
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        if (grd.SelectedIndex == -1)
        {
            lblEditError.Visible = true;
        }
        else
        {
            lblEditError.Visible = false;
            lockForm(false);
            grd.Visible = false;
            pnlInfo.Visible = true;
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        dts.SelectParameters[rblTipAco.SelectedItem.Value].DefaultValue = txtNme.Text;
        grd.DataBind();
        grd.SelectedIndex = -1;
        clearForm(1);
        grd.Visible = true;
        pnlInfo.Visible = false;
    }
    private void clearForm(Int32 tipo)
    {
        if (tipo == 1)
        {
            txtIdMod.Text = String.Empty;
            txtMod_Dsc.Text = String.Empty;            
        }
        else
        {
            /* Uso do comando if resumido pra diminuir a quantidade de código 
             * b=a>0?-150:150; */
            txtMod_Dsc.Text = txtMod_Dsc.Text == "&nbsp;" ? String.Empty : txtMod_Dsc.Text;           
        }
    }
    private void lockForm(bool browseMode)
    {
        btnNew.Enabled = browseMode;
        btnEdit.Enabled = browseMode;
        btnDel.Enabled = browseMode;
        btnSave.Visible = !browseMode;
        btnCancel.Visible = !browseMode;
        pnlInfo.Enabled = !browseMode;
        grd.Enabled = browseMode;
        txtIdMod.Enabled = browseMode;
        lblMsg.Visible = false;
    }
    protected void grd_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtIdMod.Text = grd.SelectedRow.Cells[0].Text.TrimEnd();
        txtMod_Dsc.Text =  HttpUtility.HtmlDecode(grd.SelectedRow.Cells[1].Text.TrimEnd());
        clearForm(2);
        pnlInfo.Visible = true;
        grd.Visible = false;
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(txtMod_Dsc.Text))
        {
            if (string.IsNullOrEmpty(txtIdMod.Text))
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
        if (!String.IsNullOrEmpty(txtIdMod.Text))
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
    protected void grd_PageIndexChanged(object sender, EventArgs e)
    {
        grd.SelectedIndex = -1;
    }
}