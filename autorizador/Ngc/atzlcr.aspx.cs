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

public partial class Ngc_atzlcr : System.Web.UI.Page
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
        this.clearForm();
        this.txtPsqCtt.Text = string.Empty;
        dtsCtt2.SelectParameters[0].DefaultValue = String.Empty;
        dts.SelectParameters["Ctt_Nme"].DefaultValue = String.Empty;
        dtsRde.DataBind();
        this.grd.SelectedIndex = -1;
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
    protected void btnDel_Click(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(txtIdLcr.Text))
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
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {
            for (int i = 0; i < dts.SelectParameters.Count; i++)
                dts.SelectParameters[i].DefaultValue = String.Empty;

            dts.SelectParameters[rblTipAco.SelectedItem.Value].DefaultValue = this.txtPsq.Text;
            this.grd.DataBind();
            this.grd.SelectedIndex = -1;
            this.clearForm();
            grd.Visible = true;
            pnlInfoPrf.Visible = false;
        }
        catch (Exception erroSelect)
        {
            Response.Write(@"<script language='javascript'><!-- Esconder código!
                           alert('Atenção: valor inválido para pesquisa!!');// Exibir código --></script>");
        }
    }
    private void clearForm()
    {
        grdCtt.SelectedIndex = -1;
        grdCttEnd.SelectedIndex = -1;
        ddlRde.SelectedIndex = -1;
        txtIdLcr.Text = String.Empty;
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
        this.pnlInfoPrf.Enabled = !browseMode;
        this.grd.Enabled = browseMode;
        lblMsg.Visible = false;
        btnSearch.Enabled = browseMode;
    }
    protected void grd_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtIdLcr.Text = grd.SelectedRow.Cells[0].Text.Trim();        
        dtsCttEnd.SelectParameters["Cte_IdCtt"].DefaultValue = grd.DataKeys[grd.SelectedIndex].Values["Lcr_IdCtt"].ToString();
        dtsCttEnd.SelectParameters["Cte_SeqEnd"].DefaultValue = grd.DataKeys[grd.SelectedIndex].Values["Lcr_SeqEnd"].ToString();
        dtsCtt2.SelectParameters["IdCtt"].DefaultValue = grd.DataKeys[grd.SelectedIndex].Values["Lcr_IdCtt"].ToString();
        dtsRde.SelectParameters["Lcr_IdCtt"].DefaultValue = string.Empty;
        dtsRde.SelectParameters["Lcr_SeqEnd"].DefaultValue = string.Empty;
        dtsRde.SelectParameters["IdRde"].DefaultValue = grd.DataKeys[grd.SelectedIndex].Values["Lcr_IdRde"].ToString();
        dtsRde.DataBind();
        
        ddlRde.SelectedValue = grd.DataKeys[grd.SelectedIndex].Values["Lcr_IdRde"].ToString();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (grdCttEnd.SelectedIndex > -1 && this.ddlRde.SelectedIndex > -1)
        {
            string lcrIdCtt = grdCttEnd.DataKeys[grdCttEnd.SelectedIndex].Values["Cte_IdCtt"].ToString();
            string lcrSeqEnd = grdCttEnd.DataKeys[grdCttEnd.SelectedIndex].Values["Cte_SeqEnd"].ToString();

            dts.InsertParameters["Lcr_IdCtt"].DefaultValue = lcrIdCtt;
            dts.InsertParameters["Lcr_SeqEnd"].DefaultValue = lcrSeqEnd;
 
            if (string.IsNullOrEmpty(txtIdLcr.Text))
            {
                dts.InsertParameters["Lcr_IdCtt"].DefaultValue = lcrIdCtt;
                dts.InsertParameters["Lcr_SeqEnd"].DefaultValue = lcrSeqEnd;
                dts.Insert();
            }
            else
            {
                dts.UpdateParameters["Lcr_IdCtt"].DefaultValue = lcrIdCtt;
                dts.UpdateParameters["Lcr_SeqEnd"].DefaultValue = lcrSeqEnd;
                dts.Update();
            }
            lockForm(true);

            if (grdCttEnd.Enabled == false)
            {
                grdCttEnd.Enabled = true;
                grdCtt.Enabled = true;
            }
            this.lblMsg.Visible = false;
        }
        else
        {
            this.lblMsg.Visible = true;
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        clearForm();
        lockForm(true);
        grd.Visible = true;
        pnlInfoPrf.Visible = false;
    }
    protected void grdCttEnd_SelectedIndexChanged(object sender, EventArgs e)
    {
        dtsRde.SelectParameters["IdRde"].DefaultValue = string.Empty;
        dtsRde.SelectParameters["Lcr_IdCtt"].DefaultValue = grdCttEnd.DataKeys[grdCttEnd.SelectedIndex].Values["Cte_IdCtt"].ToString();
        dtsRde.SelectParameters["Lcr_SeqEnd"].DefaultValue = grdCttEnd.DataKeys[grdCttEnd.SelectedIndex].Values["Cte_SeqEnd"].ToString();
        dtsRde.DataBind();
    }
    protected void btnSearchCtt_Click(object sender, EventArgs e)
    {
        grdCtt.SelectedIndex = -1;
        grdCttEnd.SelectedIndex = -1;
        dtsCttEnd.SelectParameters["Cte_IdCtt"].DefaultValue = string.Empty;
        dtsCttEnd.SelectParameters["Cte_SeqEnd"].DefaultValue = string.Empty;       
    }
    protected void grd_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grd.SelectedIndex = -1;
    }
}
