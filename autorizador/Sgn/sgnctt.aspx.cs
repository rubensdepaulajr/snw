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

public partial class Sgn_sgnctt : System.Web.UI.Page
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
        if (grd.SelectedIndex == -1)
            lblToolbar.Text = "Nenhum item selecionado!";
        else
        {
            lockForm(false);
            grd.Visible = false;
            grdCttUsr.Visible = false;
            pnlInfoPrf.Visible = true;
        }
    }
    protected void btnDel_Click(object sender, EventArgs e)
    {
        if (grdCttUsr.SelectedIndex == -1)
        {
            lblToolbar.Text = "Selecione um registro para ser excluído!";
        }
        else
        {
            try
            {                
                dtsUsr.UpdateParameters["Cte_IdCtt"].DefaultValue = grd.SelectedDataKey["Cte_IdCtt"].ToString();
                dtsUsr.UpdateParameters["Cte_SeqEnd"].DefaultValue = grd.SelectedDataKey["Cte_SeqEnd"].ToString();
                dtsUsr.UpdateParameters["IdUsr"].DefaultValue = grdCttUsr.SelectedValue.ToString();
                dtsUsr.UpdateParameters["Tip_Aco"].DefaultValue = "D";
        
                dtsUsr.Update();
                grdCttUsr.DataBind();
                lockForm(true);
                grd.Visible = true;
                grdCttUsr.Visible = true;
                pnlInfoPrf.Visible = false;
            }
            catch (Exception erro)
            {
                lblToolbar.Text = "A exclusão não foi concluída pois existe um ou mais registros relacionados a esse.";
            }
        }        
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {
            for (int i = 0; i < dts.SelectParameters.Count; i++)
                dts.SelectParameters[i].DefaultValue = string.Empty;

            dts.SelectParameters[rblTipAco.SelectedItem.Value].DefaultValue = txtPsq.Text;
            grd.DataBind();
            grd.SelectedIndex = -1;
            grdCttUsr.SelectedIndex = -1;
            clearForm();
            grd.Visible = true;
            grdCttUsr.Visible = true;
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
        txtCte_IdCtt.Text = string.Empty;
    }
    private void lockForm(bool browseMode)
    {
        lblToolbar.Text = String.Empty;
        pnlPsq.Enabled = browseMode;  

        btnNew.Enabled = browseMode;
        btnDel.Enabled = browseMode;
        btnSave.Visible = !browseMode;
        btnCancel.Visible = !browseMode;
        pnlInfoPrf.Enabled = !browseMode;
        grd.Enabled = browseMode;
        lblMsg.Visible = false;
        btnSearch.Enabled = browseMode;
    }
    protected void grd_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtCte_SeqEnd.Text =  grd.SelectedRow.Cells[1].Text.Trim();
        txtCte_IdCtt.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[0].Text.Trim()).Trim();
        txtCtt_Nme.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[2].Text.Trim()).Trim();
        dtsCttUsr.SelectParameters["Uce_IdCtt"].DefaultValue = grd.SelectedDataKey["Cte_IdCtt"].ToString();
        dtsCttUsr.SelectParameters["Uce_SeqEnd"].DefaultValue = grd.SelectedDataKey["Cte_SeqEnd"].ToString();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (grdUsr.SelectedIndex == -1)        
        {
            lblMsg.Visible = true;
        }
        else
        {
            dtsUsr.UpdateParameters["Cte_IdCtt"].DefaultValue = grd.SelectedDataKey["Cte_IdCtt"].ToString();
            dtsUsr.UpdateParameters["Cte_SeqEnd"].DefaultValue = grd.SelectedDataKey["Cte_SeqEnd"].ToString();
            dtsUsr.UpdateParameters["IdUsr"].DefaultValue = grdUsr.SelectedValue.ToString();
            dtsUsr.UpdateParameters["Tip_Aco"].DefaultValue = "I";
            dtsUsr.Update();
            grdCttUsr.DataBind();
            lockForm(true);
            grd.Visible = true;
            grdCttUsr.Visible = true;
            pnlInfoPrf.Visible = false;
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        lockForm(true);
        grd.Visible = true;
        grdCttUsr.Visible = true;
        pnlInfoPrf.Visible = false;
    }
    protected void btnSearchUsr_Click(object sender, EventArgs e)
    {
        dtsUsr.SelectParameters["UserName"].DefaultValue = txtUsr.Text;
        dtsUsr.SelectParameters["IdUsr"].DefaultValue = string.Empty;
    }
    protected void grd_PageIndexChanged(object sender, EventArgs e)
    {
        grd.SelectedIndex = -1;
    }
}
