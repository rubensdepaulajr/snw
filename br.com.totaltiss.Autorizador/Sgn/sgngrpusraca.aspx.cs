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

public partial class Sgn_sgngrpusraca : System.Web.UI.Page
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

    private void clearForm()
    {
        this.grdUsr.SelectedIndex = -1;
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
        this.pnlInfo.Enabled = !browseMode;
        this.pnlPsq.Enabled = browseMode;
        this.grd.Enabled = browseMode;
        lblMsg.Visible = false;
    }

    protected void grd_SelectedIndexChanged(object sender, EventArgs e)
    {
        pnlInfo.Visible = true;
        grd.Visible = false;
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (this.grdUsr.SelectedIndex > -1)
        {
            dts.Insert();
            lockForm(true);
            this.ddlGrupo_SelectedIndexChanged(sender, e);
        }
        else
        {
            lblMsg.Visible = true;
        }

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        lockForm(true);
        ddlGrupo_SelectedIndexChanged(sender, e);
    }


    /*Verificar se está ok*/
    protected void btnDel_Click(object sender, EventArgs e)
    {
        if (this.grd.Rows.Count > 0)
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

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        dtsUsr.SelectParameters[rblTipAco.SelectedItem.Value].DefaultValue = this.txtNme.Text;
        this.grdUsr.DataBind();
        this.grdUsr.SelectedIndex = -1;
        this.clearForm();        
    }
    protected void ddlGrupo_SelectedIndexChanged(object sender, EventArgs e)
    {
        lockForm(true);
    }
}