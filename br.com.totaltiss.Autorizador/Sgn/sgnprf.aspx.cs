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
using System.Data.SqlClient;

public partial class Sgn_sgnprf : System.Web.UI.Page
{        
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            lockForm(true);            
            this.rblTipAco.SelectedIndex = 1;
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
            grd.Visible = true;
            pnlInfoPrf.Visible = false;
        }
        catch (Exception erroSelect)
        {
            Response.Write(@"<script language='javascript'><!-- Esconder código!
                           alert('Atenção: valor inválido para pesquisa!!');// Exibir código --></script>");
        }
    }    
    private void lockForm(bool browseMode)
    {
        pnlPsq.Enabled = browseMode;
        btnSave.Visible = !browseMode;
        btnCancel.Visible = !browseMode;
        pnlInfoPrf.Enabled = !browseMode;
        grd.Enabled = browseMode;
        txtIdPrf.Enabled = browseMode;
        lblMsg.Text = String.Empty;
        btnSearch.Enabled = browseMode;
    }
    protected void grd_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtIdPrf.Text = grd.SelectedDataKey.Values["IdPrf"].ToString();
        txtPrf_Nme.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[3].Text.TrimEnd());
        txtUsr_Nme.Text = grd.SelectedDataKey["Usr_Nme"].ToString();

        // Para garantir que o grid não virá preenchido
        dtsUsr.SelectParameters["UserName"].DefaultValue = String.Empty;
        dtsUsr.SelectParameters["IdUsr"].DefaultValue = String.Empty;

        if (String.IsNullOrEmpty(grd.SelectedDataKey["Usr_Nme"].ToString()))
        {
            lblUsr.Visible = false;
            txtUsr_Nme.Visible = false;
            lblSearchUsr.Visible = true;
            txtUsr.Visible = true;
            btnSearchUsr.Visible = true;
            btnSave.Text = "Gravar";
        }
        else
        {
            lblUsr.Visible = true;
            txtUsr_Nme.Visible = true;
            lblSearchUsr.Visible = false;
            txtUsr.Visible = false;
            btnSearchUsr.Visible = false;
            btnSave.Text = "Remover";
        }
        grd.Visible = false;
        pnlInfoPrf.Visible = true;
        lockForm(false);
    }    
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if ((btnSearchUsr.Visible) && (grdUsr.SelectedIndex == -1))
            lblMsg.Text = "* Nenhum usuário selecionado!";
        else
        {
            if (btnSearchUsr.Visible)
            {
                dtsUsr.UpdateParameters["IdPrf"].DefaultValue = grd.SelectedDataKey["IdPrf"].ToString();
                dtsUsr.UpdateParameters["IdUsr"].DefaultValue = grdUsr.SelectedValue.ToString();
                dtsUsr.UpdateParameters["Tip_Aco"].DefaultValue = "I";
            }
            else
            {
                dtsUsr.UpdateParameters["IdPrf"].DefaultValue = grd.SelectedDataKey["IdPrf"].ToString();
                dtsUsr.UpdateParameters["IdUsr"].DefaultValue = String.Empty;
                dtsUsr.UpdateParameters["Tip_Aco"].DefaultValue = "U";
            }
            dtsUsr.Update();
            grd.DataBind();
            lockForm(true);
            grd.Visible = true;
            pnlInfoPrf.Visible = false;
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        lockForm(true);
        grd.Visible = true;
        pnlInfoPrf.Visible = false;
    }    
    protected void grd_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grd.SelectedIndex = -1;
    }
    protected void btnSearchUsr_Click(object sender, EventArgs e)
    {
        dtsUsr.SelectParameters["UserName"].DefaultValue = txtUsr.Text;
        dtsUsr.SelectParameters["IdUsr"].DefaultValue = string.Empty;
    }
    protected void grdUsr_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(HttpUtility.HtmlDecode(grdUsr.SelectedRow.Cells[4].Text).Trim()))
        {
            lblMsg.Text = "* Não é possível associar este usuário, ele já está sendo utilizado por outro Profissional!";
            grdUsr.SelectedIndex = -1;
        }
        else
            lblMsg.Text = String.Empty;
    }
}
