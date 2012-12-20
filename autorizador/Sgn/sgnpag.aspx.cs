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

public partial class Sgn_sgnpag : System.Web.UI.Page
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
        dts.SelectParameters["Pag_Dsc"].DefaultValue = String.Empty;
        this.grd.SelectedIndex = -1;
        lockForm(false);
        grd.Visible = false;
        pnlInfo.Visible = true;

    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        if (grd.SelectedIndex == -1)
            this.lblEditError.Visible = true;
        else
        {
            lockForm(false);
            grd.Visible = false;
            pnlInfo.Visible = true;
        }
    }


    protected void btnSearch_Click(object sender, EventArgs e)
    {

        dts.SelectParameters[rblTipAco.SelectedItem.Value].DefaultValue = this.txtPsq.Text;
        this.grd.DataBind();
        this.grd.SelectedIndex = -1;
        this.clearForm();
        grd.Visible = true;
        pnlInfo.Visible = false;
    }

    private void clearForm()
    {
        this.txtIdPag.Text = String.Empty;
        this.txtPag_Dsc.Text = String.Empty;
        this.txtPag_Url.Text = String.Empty;
        this.txtPag_Ord.Text = String.Empty;
        this.chkPag_Anm.Checked = false;
        this.ddlPag_IdMod.SelectedIndex = -1;
        this.ddlPag_IdPai.SelectedIndex = -1;
    }

    private void lockForm(bool browseMode)
    {
        this.btnNew.Enabled = browseMode;
        this.btnEdit.Enabled = browseMode;
        this.btnDel.Enabled = browseMode;
        this.btnSave.Visible = !browseMode;
        this.btnCancel.Visible = !browseMode;
        this.pnlInfo.Enabled = !browseMode;
        this.grd.Enabled = browseMode;
        this.txtIdPag.Enabled = browseMode;
        lblMsg.Visible = false;
        this.btnSearch.Enabled = browseMode;
    }

    protected void grd_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.txtIdPag.Text = this.grd.SelectedRow.Cells[1].Text.TrimEnd();/*1  id  */
        this.txtPag_Dsc.Text = HttpUtility.HtmlDecode(this.grd.SelectedRow.Cells[2].Text.TrimEnd());/*1  id  */
        this.txtPag_Url.Text = HttpUtility.HtmlDecode(this.grd.SelectedRow.Cells[3].Text.TrimEnd());
        this.txtPag_Ord.Text = this.grd.SelectedRow.Cells[4].Text.TrimEnd();
        this.ddlPag_IdMod.SelectedIndex = this.ddlPag_IdMod.Items.IndexOf(this.ddlPag_IdMod.Items.FindByText(HttpUtility.HtmlDecode(this.grd.SelectedRow.Cells[6].Text.Trim())));
        
        this.ddlPag_IdPai.SelectedIndex = this.ddlPag_IdPai.Items.IndexOf(this.ddlPag_IdPai.Items.FindByText(HttpUtility.HtmlDecode(this.grd.SelectedRow.Cells[7].Text.Trim())));

        CheckBox  cb = (CheckBox)(grd.SelectedRow.FindControl("chkAnm"));
        this.chkPag_Anm.Checked = cb.Checked;

        pnlInfo.Visible = true;
        grd.Visible = false;
    }



    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(txtPag_Dsc.Text) && !String.IsNullOrEmpty(txtPag_Ord.Text)  )
        {
            if (string.IsNullOrEmpty(this.txtIdPag.Text))
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


    /*Verificar se está ok*/
    protected void btnDel_Click(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(txtIdPag.Text))
        {
            try
            {
                dts.Delete();
                this.clearForm();
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
    protected void Button1_Click(object sender, EventArgs e)
    {
       
    }
}