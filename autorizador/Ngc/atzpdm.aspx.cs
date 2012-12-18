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
using System.Text;
using System.Text.RegularExpressions;

public partial class Ngc_atzpdm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            lockForm(true);
            rblTipAco.SelectedIndex = 1;
            if (Request.QueryString.Count > 0)
            {
                dts.SelectParameters["IdPdm"].DefaultValue = Request.QueryString["Pdm"];
                grd.DataBind();
                grd.SelectedIndex = -1;
                clearForm();
                grd.Visible = true;
                pnlInfoPdm.Visible = false;
            }
        }
    }
    public string Procedimento
    {
        get
        {
            return txtIdPdm.Text + "|" + txtPdmCod.Text +"|"+ txtPdmDsc.Text;
        }
    }
    protected void btnNew_Click(object sender, EventArgs e)
    {
        clearForm();
        dts.SelectParameters["Pdm_Dsc"].DefaultValue = string.Empty;
        grd.SelectedIndex = -1;
        lockForm(false);
        grd.Visible = false;
        pnlInfoPdm.Visible = true;

    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        if (grd.SelectedIndex == -1)
            lblToolBar.Text = "Nenhum item selecionado!";
        else
        {
            lockForm(false);
            grd.Visible = false;
            pnlInfoPdm.Visible = true;
        }
    }
    protected void btnDel_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(txtIdPdm.Text))
        {
            try
            {
                dts.Delete();
                grd.SelectedIndex = -1;
            }
            catch (Exception erro)
            {
                lblToolBar.Text = "A exclusão não foi concluída pois existe um ou mais registros relacionados a esse.";
            }
        }
        else
        {
            lblToolBar.Text = "Selecione um registro para ser excluído!";
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
            clearForm();
            grd.Visible = true;
            pnlInfoPdm.Visible = false;
        }
        catch (Exception erroSelect)
        {
            Response.Write(@"<script language='javascript'><!-- Esconder código!
                           alert('Atenção: valor inválido para pesquisa!!');// Exibir código --></script>");
        }
    }   
    private void clearForm()
    {
        txtIdPdm.Text = string.Empty;
        txtPdmCod.Text = string.Empty;
        txtPdmDsc.Text = string.Empty;
        txtPdmDscRsm.Text = string.Empty;
        txtPdmCodAmb.Text = string.Empty;
        txtPdmDscAmb.Text = string.Empty;
        txtPdmIddMin.Text = string.Empty;
        txtPdmIddMax.Text = string.Empty;
        txtPdmQtdMax.Text = string.Empty;
        txtPdmQtdDia.Text = string.Empty;
        txtPdmQtdMes.Text = string.Empty;
        txtPdmQtdAno.Text = string.Empty;
        txtPdmRtn.Text = string.Empty;
        chkPdmAltCpx.Checked = false;
        chkPdmEsp.Checked = false;
        chkPdmPrf.Checked = false;
        chkPdmAtv.Checked = false;
        chkPdmItn.Checked = false;
        chkPdmBlqUrg.Checked = false;
        txtPdmQtdCh_.Text = string.Empty;
        txtPdmQtdFlm.Text = string.Empty;
    }
    private void lockForm(bool browseMode)
    {
        lblToolBar.Text = string.Empty;
        pnlPsq.Enabled = browseMode; 

        btnNew.Enabled = browseMode;
        btnEdit.Enabled = browseMode;
        btnDel.Enabled = browseMode;
        btnSave.Visible = !browseMode;
        btnCancel.Visible = !browseMode;
        pnlInfoPdm.Enabled = !browseMode;
        grd.Enabled = browseMode;
        lblMsg.Visible = false;
        btnSearch.Enabled = browseMode;
    }
    protected void grd_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtIdPdm.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[0].Text).Trim();
        txtPdmCod.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[1].Text).Trim();
        ddlPdmIdTab.SelectedValue = grd.DataKeys[grd.SelectedIndex].Values["Pdm_IdTab"].ToString();
        ddlPdmIdTpp.SelectedValue = grd.DataKeys[grd.SelectedIndex].Values["Pdm_IdTpp"].ToString();
        ddlPdmIdGrp.SelectedValue = grd.DataKeys[grd.SelectedIndex].Values["Pdm_IdGrp"].ToString();
        txtPdmDsc.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[5].Text).Trim();
        txtPdmDscRsm.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[6].Text).Trim();
        txtPdmCodAmb.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[7].Text).Trim();
        txtPdmDscAmb.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[8].Text).Trim();

        txtPdmQtdCh_.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[9].Text).Trim();
        txtPdmQtdFlm.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[10].Text).Trim();

        CheckBox cb = (CheckBox)(grd.SelectedRow.FindControl("chkAltCpx"));
        chkPdmAltCpx.Checked = cb.Checked;
        //CheckBox cb2 = (CheckBox)(grd.SelectedRow.FindControl("chkEsp"));
        cb = (CheckBox)(grd.SelectedRow.FindControl("chkEsp"));
        chkPdmEsp.Checked = cb.Checked;
        //CheckBox cb3 = (CheckBox)(grd.SelectedRow.FindControl("chkPrf"));
        cb = (CheckBox)(grd.SelectedRow.FindControl("chkPrf"));
        chkPdmPrf.Checked = cb.Checked;
        //CheckBox cb4 = (CheckBox)(grd.SelectedRow.FindControl("chkAtv"));
        cb = (CheckBox)(grd.SelectedRow.FindControl("chkAtv"));
        chkPdmAtv.Checked = cb.Checked;
        //CheckBox cb5 = (CheckBox)(grd.SelectedRow.FindControl("chkBlqUrg"));
        cb = (CheckBox)(grd.SelectedRow.FindControl("chkBlqUrg"));
        chkPdmBlqUrg.Checked = cb.Checked;
        //CheckBox cb6 = (CheckBox)(grd.SelectedRow.FindControl("chkItn"));
        cb = (CheckBox)(grd.SelectedRow.FindControl("chkItn"));
        chkPdmItn.Checked = cb.Checked;

        ddlPdmSxo.SelectedValue = grd.SelectedRow.Cells[17].Text.Trim();
        txtPdmIddMin.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[18].Text).Trim();
        txtPdmIddMax.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[19].Text).Trim();
        txtPdmQtdMax.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[20].Text).Trim();
        txtPdmQtdDia.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[21].Text).Trim();
        txtPdmQtdMes.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[22].Text).Trim();
        txtPdmQtdAno.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[23].Text).Trim();
        txtPdmRtn.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[24].Text).Trim();    
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(txtPdmDsc.Text) && (!string.IsNullOrEmpty(txtPdmDscRsm.Text)) &&
            (ddlPdmIdTab.SelectedIndex > -1) && (ddlPdmIdGrp.SelectedIndex > -1) && 
            (ddlPdmIdTpp.SelectedIndex > -1))
        {
            if (string.IsNullOrEmpty(txtIdPdm.Text))
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
        pnlInfoPdm.Visible = false;
    }
    protected void grd_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grd.SelectedIndex = -1;
    }
    protected void btnOrt_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(txtIdPdm.Text))
        {
            lblToolBar.Text = "Nenhum registro selecionado!";
        }
        else
        {
            Response.Redirect("CadPdmOrt.aspx?Pdm="+txtIdPdm.Text);
        }
    }
}
