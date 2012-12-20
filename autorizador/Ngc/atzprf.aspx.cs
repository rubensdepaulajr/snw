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

public partial class Ngc_atzprf : System.Web.UI.Page
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
        clearForm();
        dts.SelectParameters["Prf_Nme"].DefaultValue = String.Empty;
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
        if (!String.IsNullOrEmpty(txtIdPrf.Text))
        {
            try
            {
                lblToolbar.Text = String.Empty;
                dts.Delete();
                grd.SelectedIndex = -1;
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
            lblToolbar.Text = String.Empty;

            for (int i = 0; i < dts.SelectParameters.Count; i++)
                dts.SelectParameters[i].DefaultValue = String.Empty;

            dts.SelectParameters[rblTipAco.SelectedItem.Value].DefaultValue = this.txtNme.Text;
            this.grd.DataBind();
            this.grd.SelectedIndex = -1;
            this.clearForm();
            grd.Visible = true;
            pnlInfoPrf.Visible = false;
        }
        catch (Exception erroSelect)
        {
            lblToolbar.Text = "Atenção: valor inválido para pesquisa!";
        }
    }
    protected void PosicionaDdl(String TextoItem, Int32 ddl)
    {
        Int32 indice;

        switch (ddl)
        {
            case 1: /*posiciona dropdown no conselho do profissional selecionado*/
                indice = ddlPrf_IdCns.SelectedIndex;
                for (int i = 1; i < ddlPrf_IdCns.Items.Count; i++)
                {
                    ddlPrf_IdCns.SelectedIndex = i;
                    if (ddlPrf_IdCns.SelectedItem.Text == TextoItem)
                        indice = i;
                }
                ddlPrf_IdCns.SelectedIndex = indice;
                break;
            case 2: /*posiciona dropdown no estado do conselho do profissional selecionado*/
                indice = ddlPrf_EstCns.SelectedIndex;
                for (int i = 1; i < ddlPrf_EstCns.Items.Count; i++)
                {
                    ddlPrf_EstCns.SelectedIndex = i;
                    if (ddlPrf_EstCns.SelectedItem.Text == TextoItem)
                        indice = i;
                }
                ddlPrf_EstCns.SelectedIndex = indice;
                break;
            case 3: /*posiciona dropdown na situação do profissional selecionado*/
                indice = ddlPrf_Sit.SelectedIndex;
                for (int i = 1; i < ddlPrf_Sit.Items.Count; i++)
                {
                    ddlPrf_Sit.SelectedIndex = i;
                    if (ddlPrf_Sit.SelectedItem.Text == TextoItem)
                        indice = i;
                }
                ddlPrf_Sit.SelectedIndex = indice;
                break;
        }
    }
    private void clearForm()
    {
        txtIdPrf.Text = string.Empty;
        txtPrf_Nme.Text = string.Empty;
        txtPrf_NmeRsm.Text = string.Empty;
        txtPrf_NumCns.Text = string.Empty;
        txtPrf_Cpf.Text = string.Empty;
        txtPrf_Eml.Text = string.Empty;
        txtPrf_Tel.Text = string.Empty;
        txtPrf_Tel2.Text = string.Empty;
        txtPrf_Tel3.Text = string.Empty;        
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
        txtIdPrf.Enabled = browseMode;
        lblMsg.Visible = false;
        btnSearch.Enabled = browseMode;
    }
    protected void grd_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtIdPrf.Text = grd.SelectedRow.Cells[0].Text.TrimEnd();
        txtPrf_Mtr.Text = grd.SelectedRow.Cells[1].Text.TrimEnd();
        txtPrf_Nme.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[2].Text.TrimEnd());
        txtPrf_NmeRsm.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[3].Text.TrimEnd());
        PosicionaDdl(grd.SelectedRow.Cells[4].Text, 1);
        txtPrf_NumCns.Text = grd.SelectedRow.Cells[5].Text.TrimEnd();
        PosicionaDdl(grd.SelectedRow.Cells[6].Text, 2);
        txtPrf_Cpf.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[7].Text.TrimEnd());
        PosicionaDdl(grd.SelectedRow.Cells[8].Text, 3);
        txtPrf_Tel.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[9].Text.TrimEnd());
        txtPrf_Tel2.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[10].Text.TrimEnd());
        txtPrf_Tel3.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[11].Text.TrimEnd());
        txtPrf_Eml.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[12].Text.TrimEnd());        
    }    
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(this.txtPrf_NumCns.Text) && !String.IsNullOrEmpty(txtPrf_NmeRsm.Text) && 
            !String.IsNullOrEmpty(txtPrf_Nme.Text) && !String.IsNullOrEmpty(txtPrf_Nme.Text))
        {
            if (string.IsNullOrEmpty(this.txtIdPrf.Text))
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
    protected void grd_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grd.SelectedIndex = -1;
    }
}
