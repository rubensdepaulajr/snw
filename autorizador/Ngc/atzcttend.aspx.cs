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

public partial class Ngc_atzcttend : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            lockForm(true);            
        }
    }
    protected void btnNew_Click(object sender, EventArgs e)
    {
        clearForm();
        dtsLgr.SelectParameters["Lgr_Cep"].DefaultValue = String.Empty;
        dts.SelectParameters["Ctt_Nme"].DefaultValue = String.Empty;
        grd.SelectedIndex = -1;
        lockForm(false);
        grd.Visible = false;
        pnlInfoPrf.Visible = true;
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        if (grd.SelectedIndex == -1)
            lblToolbar.Text = "Nenhum item selecionado!";
        else
        {
            lockForm(false);
            grd.Visible = false;
            pnlInfoPrf.Visible = true;
        }
    }
    protected void btnDel_Click(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(txtCte_IdCtt.Text) && !String.IsNullOrEmpty(txtCte_SeqEnd.Text))
        {
            try
            {
                dts.Delete();
                grd.SelectedIndex = -1;
//                this.clearForm();
//                Response.Write(@"<script language='javascript'><!-- Esconder código!
//                           alert('Exclusão efetuada com sucesso.');// Exibir código --></script>");
            }
            catch (Exception erro)
            {
                lblToolbar.Text = "A exclusão não foi concluída pois existe um ou mais registros relacionados a esse.";
            }
        }
        else
        {
            lblToolbar.Text = "Selecione um registro para ser excluído!";
        }        
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {
            for (int i = 0; i < dts.SelectParameters.Count; i++)
                dts.SelectParameters[i].DefaultValue = String.Empty;

            dts.SelectParameters[rblTipAco.SelectedItem.Value].DefaultValue = txtPsq.Text;
            grd.DataBind();
            grd.SelectedIndex = -1;
            clearForm();
            grd.Visible = true;
            pnlInfoPrf.Visible = false;
        }
        catch (Exception erroSelect)
        {
            lblToolbar.Text = "Atenção: valor inválido para pesquisa!";
        }
    }   
    private void clearForm()
    {
        txtCte_SeqEnd.Text = string.Empty;            
        ddlIdCtt.SelectedIndex = -1;
        txtCte_IdCtt.Text = string.Empty;
        txtCte_Cpl.Text = string.Empty;
        txtCte_NumEnd.Text = string.Empty;
        txtCte_Cep.Text = string.Empty;
        txtCte_Eml.Text = string.Empty;
        txtCte_NmeCto.Text = string.Empty;
        txtCte_Tel.Text = string.Empty;
        txtCte_Tel2.Text = string.Empty;
        txtCte_Fax.Text = string.Empty;
        txtCte_DatFim.Text = string.Empty;
        chkCteBioCon.Checked = false;
        chkCteBioExe.Checked = false;
    }
    private void lockForm(bool browseMode)
    {
        lblToolbar.Text = String.Empty;
        pnlPsq.Enabled = browseMode;  
        btnNew.Enabled = browseMode;
        btnEdit.Enabled = browseMode;
        btnDel.Enabled = browseMode;
        btnSave.Visible = !browseMode;
        btnCancel.Visible = !browseMode;
        pnlInfoPrf.Enabled = !browseMode;
        grd.Enabled = browseMode;
        //this.txt.Enabled = browseMode;
        lblMsg.Visible = false;
        btnSearch.Enabled = browseMode;
    }
    protected void grd_SelectedIndexChanged(object sender, EventArgs e)
    {   
        txtCte_SeqEnd.Text =  grd.SelectedRow.Cells[1].Text.Trim();
        ddlIdCtt.SelectedValue = ddlIdCtt.Items.FindByValue(grd.SelectedRow.Cells[0].Text.Trim()).Value;
        txtCte_IdCtt.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[0].Text.Trim()).Trim();
        txtCte_Cep.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[6].Text.Trim()).Trim();
        txtCte_Cpl.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[5].Text.Trim());
        txtCte_NumEnd.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[4].Text.Trim()).Trim();
        txtCte_Tel.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[7].Text.Trim()).Trim();
        txtCte_Tel2.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[8].Text.Trim()).Trim();
        txtCte_Fax.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[9].Text.Trim()).Trim();
        txtCte_Eml.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[10].Text.Trim()).Trim();
        txtCte_NmeCto.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[11].Text.Trim()).Trim();
        txtCte_DatFim.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[16].Text.Trim()).Trim();

        CheckBox cb = (CheckBox)(grd.SelectedRow.FindControl("chkGrdBioCon"));
        chkCteBioCon.Checked = cb.Checked;
        CheckBox cb2 = (CheckBox)(grd.SelectedRow.FindControl("chkGrdBioExe"));
        chkCteBioExe.Checked = cb2.Checked;
        
        // Selecionando o logradouro a partir do CEP do contratado local
        dtsLgr.SelectParameters["Lgr_Cep"].DefaultValue = txtCte_Cep.Text;
        dtvCte_IdLgr.DataBind();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(txtCte_IdCtt.Text) &&
            !String.IsNullOrEmpty(txtCte_NumEnd.Text) &&
            !(dtvCte_IdLgr.SelectedValue == null) &&
            !String.IsNullOrEmpty(txtCte_Tel.Text))
        {
            if (string.IsNullOrEmpty(txtCte_SeqEnd.Text))
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
    protected void ddlIdCtt_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtCte_IdCtt.Text = ddlIdCtt.SelectedItem.Value;        
    }
    protected void btnSearchLgr_Click(object sender, EventArgs e)
    {
        dtsLgr.SelectParameters["Lgr_Cep"].DefaultValue = txtCte_Cep.Text;
        dtvCte_IdLgr.DataBind();
    }
    protected void grd_PageIndexChanged(object sender, EventArgs e)
    {
        grd.SelectedIndex = -1;
    }
}
