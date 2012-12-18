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

public partial class Sgn_sgncttend : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            lockForm(true);            
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
        this.pnlPsq.Enabled = browseMode;  
        this.btnSave.Visible = !browseMode;
        this.btnCancel.Visible = !browseMode;
        this.pnlInfoPrf.Enabled = !browseMode;
        this.grd.Enabled = browseMode;
        //this.txt.Enabled = browseMode;
        lblMsg.Visible = false;
        btnSearch.Enabled = browseMode;
    }

    protected void grd_SelectedIndexChanged(object sender, EventArgs e)
    {   

        this.txtCte_SeqEnd.Text =  this.grd.SelectedRow.Cells[3].Text.Trim();
        this.txtCte_IdCtt.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[1].Text.Trim()).Trim();
        txtCtt_Nme.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[2].Text.Trim()).Trim();
        txtUsr_Nme.Text = grd.SelectedDataKey["Usr_Nme"].ToString();

        // Para garantir que o grid não virá preenchido
        dtsUsr.SelectParameters["UserName"].DefaultValue = string.Empty;
        dtsUsr.SelectParameters["IdUsr"].DefaultValue = string.Empty;

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
                dtsUsr.UpdateParameters["Cte_IdCtt"].DefaultValue = grd.SelectedDataKey["Cte_IdCtt"].ToString();
                dtsUsr.UpdateParameters["Cte_SeqEnd"].DefaultValue = grd.SelectedDataKey["Cte_SeqEnd"].ToString();
                dtsUsr.UpdateParameters["IdUsr"].DefaultValue = grdUsr.SelectedValue.ToString();
                dtsUsr.UpdateParameters["Tip_Aco"].DefaultValue = "I";
            }
            else
            {
                dtsUsr.UpdateParameters["Cte_IdCtt"].DefaultValue = grd.SelectedDataKey["Cte_IdCtt"].ToString();
                dtsUsr.UpdateParameters["Cte_SeqEnd"].DefaultValue = grd.SelectedDataKey["Cte_SeqEnd"].ToString();
                dtsUsr.UpdateParameters["IdUsr"].DefaultValue = grd.SelectedDataKey["IdUsr"].ToString();
                dtsUsr.UpdateParameters["Tip_Aco"].DefaultValue = "D";
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
        //this.lockForm(true);
        this.lockForm(true);
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

}
