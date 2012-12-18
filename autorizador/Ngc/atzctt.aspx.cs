using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cadastros_atzctt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            lockForm(true);
            this.rblTipAco.SelectedIndex = 1;
        }
    }

    private void clearForm()
    {
        this.txtIdCtt.Text = String.Empty;
        this.txtCtt_Nme.Text = String.Empty;
        this.txtCtt_NmeRsm.Text = String.Empty;
        //this.ddlPrf_IdCns.SelectedIndex.
        this.txtCtt_CodCne.Text = String.Empty;
        //this.ddlCtt_TipDoc.Text
        this.txtCtt_Doc.Text = String.Empty;
        //this.ddlCtt_IdCns.Text
        this.txtCtt_Eml.Text = String.Empty;
        this.txtCtt_Tel.Text = String.Empty;
        this.txtCtt_Tel2.Text = String.Empty;
        this.txtCtt_Tel3.Text = String.Empty;
    }

    private void lockForm(bool browseMode)
    {
        this.lblError.Visible = false;
        this.pnlPsq.Enabled = browseMode;

        this.btnNew.Enabled = browseMode;
        this.btnEdit.Enabled = browseMode;
        this.btnDel.Enabled = browseMode;
        this.btnSave.Visible = !browseMode;
        this.btnCancel.Visible = !browseMode;
        this.pnlInfoPrf.Enabled = !browseMode;
        this.grd.Enabled = browseMode;
        //this.txtIdCtt.Enabled = browseMode;
        btnSearch.Enabled = browseMode;
        lblMsg.Visible = false;
    }

    protected void PosicionaDdl(String TextoItem, Int32 ddl)
    {
        Int32 indice;

        switch (ddl)
        {
            case 1: /*posiciona dropdown no conselho do profissional selecionado*/
                indice = ddlIdTpd.SelectedIndex;
                for (int i = 1; i < ddlIdTpd.Items.Count; i++)
                {
                    ddlIdTpd.SelectedIndex = i;
                    if (ddlIdTpd.SelectedItem.Text == TextoItem)
                        indice = i;
                }
                ddlIdTpd.SelectedIndex = indice;
                break;
            case 2: /*posiciona dropdown no estado do conselho do profissional selecionado*/
                indice = ddlCtt_TipDoc.SelectedIndex;
                for (int i = 1; i < ddlCtt_TipDoc.Items.Count; i++)
                {
                    ddlCtt_TipDoc.SelectedIndex = i;
                    if (ddlCtt_TipDoc.SelectedItem.Text == TextoItem)
                        indice = i;
                }
                ddlCtt_TipDoc.SelectedIndex = indice;
                break;
            case 3: /*posiciona dropdown na situação do profissional selecionado*/
                indice = ddlCtt_IdCns.SelectedIndex;
                for (int i = 1; i < ddlCtt_IdCns.Items.Count; i++)
                {
                    ddlCtt_IdCns.SelectedIndex = i;
                    if (ddlCtt_IdCns.SelectedItem.Text == TextoItem)
                        indice = i;
                }
                ddlCtt_IdCns.SelectedIndex = indice;
                break;
            case 4: /*posiciona dropdown na situação do profissional selecionado*/
                indice = ddlCtt_EstCns.SelectedIndex;
                for (int i = 1; i < ddlCtt_EstCns.Items.Count; i++)
                {
                    ddlCtt_EstCns.SelectedIndex = i;
                    if (ddlCtt_EstCns.SelectedItem.Text == TextoItem)
                        indice = i;
                }
                ddlCtt_EstCns.SelectedIndex = indice;
                break;
            case 5: /*posiciona dropdown na situação do profissional selecionado*/
                indice = ddlCtt_Sit.SelectedIndex;
                for (int i = 1; i < ddlCtt_Sit.Items.Count; i++)
                {
                    ddlCtt_Sit.SelectedIndex = i;
                    if (ddlCtt_Sit.SelectedItem.Text == TextoItem)
                        indice = i;
                }
                ddlCtt_Sit.SelectedIndex = indice;
                break;
        }

    }
    protected void Grd_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList dropDown = (DropDownList)sender;
        this.grd.PageSize = int.Parse(dropDown.SelectedValue);
    }
    protected void grd_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.txtIdCtt.Text = HttpUtility.HtmlDecode(this.grd.SelectedRow.Cells[0].Text.Trim());
        this.PosicionaDdl(HttpUtility.HtmlDecode(this.grd.SelectedRow.Cells[1].Text), 1);
        this.PosicionaDdl(HttpUtility.HtmlDecode(this.grd.SelectedRow.Cells[2].Text), 3);
        this.txtCtt_Nme.Text = HttpUtility.HtmlDecode(this.grd.SelectedRow.Cells[3].Text.Trim());
        this.txtCtt_NmeRsm.Text = HttpUtility.HtmlDecode(this.grd.SelectedRow.Cells[4].Text.Trim());
        this.PosicionaDdl(HttpUtility.HtmlDecode(this.grd.SelectedRow.Cells[5].Text), 2);
        this.txtCtt_Doc.Text = HttpUtility.HtmlDecode(this.grd.SelectedRow.Cells[6].Text.Trim());
        this.txtCtt_CodCne.Text = HttpUtility.HtmlDecode(this.grd.SelectedRow.Cells[7].Text.Trim());
        this.txtCtt_NumCns.Text = HttpUtility.HtmlDecode(this.grd.SelectedRow.Cells[8].Text.Trim());
        this.PosicionaDdl(HttpUtility.HtmlDecode(this.grd.SelectedRow.Cells[9].Text), 4);
        this.PosicionaDdl(HttpUtility.HtmlDecode(this.grd.SelectedRow.Cells[10].Text), 5);
        this.txtCtt_Tel.Text = HttpUtility.HtmlDecode(this.grd.SelectedRow.Cells[11].Text.Trim());
        this.txtCtt_Tel2.Text = HttpUtility.HtmlDecode(this.grd.SelectedRow.Cells[12].Text.Trim());
        this.txtCtt_Tel3.Text = HttpUtility.HtmlDecode(this.grd.SelectedRow.Cells[13].Text.Trim());
        this.txtCtt_Eml.Text = HttpUtility.HtmlDecode(this.grd.SelectedRow.Cells[14].Text.Trim());        
    }
    protected void GoToPage_TextChanged(object sender, EventArgs e)
    {
        TextBox txtGoToPage = (TextBox)sender;

        int pageNumber;
        if (int.TryParse(txtGoToPage.Text.Trim(), out pageNumber) && pageNumber > 0 && pageNumber <= this.grd.PageCount)
        {
            this.grd.PageIndex = pageNumber - 1;
        }
        else
        {
            this.grd.PageIndex = 0;
        }
    }

    //Eventos de cliques

    protected void btnNew_Click(object sender, EventArgs e)
    {
        this.clearForm();
        dts.SelectParameters["Ctt_Nme"].DefaultValue = String.Empty;
        lockForm(false);
        grd.Visible = false;
        pnlInfoPrf.Visible = true;
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        if (grd.SelectedIndex == -1)
            this.lblError.Visible = true;
        else
        {
            lockForm(false);
            grd.Visible = false;
            pnlInfoPrf.Visible = true;
        }
    }
    protected void btnDel_Click(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(txtIdCtt.Text))
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
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(this.txtCtt_Nme.Text) &&
            !String.IsNullOrEmpty(txtCtt_NmeRsm.Text) &&
            !String.IsNullOrEmpty(txtIdCtt.Text))
        {
            if (string.IsNullOrEmpty(this.txtIdCtt.Text))
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
        this.lockForm(true);
        grd.Visible = true;
        pnlInfoPrf.Visible = false;
    }
    protected void grd_PageIndexChanged(object sender, EventArgs e)
    {
        grd.SelectedIndex = -1;
    }
}
