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

public partial class Ngc_atzprfesplcr : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            lockForm(true);
        }
    }
    private void clearForm()
    {
        txtPsqCtt.Text = String.Empty;
        txtPsqPrf.Text = String.Empty;
        dtsPrf.SelectParameters["IdPrf"].DefaultValue = String.Empty;
        grdPrf.DataBind();
        ddlEsp.SelectedIndex = -1;
        dtsCtt.SelectParameters["Cte_IdCtt"].DefaultValue = String.Empty;
        dtsCtt.SelectParameters["Cte_SeqEnd"].DefaultValue = String.Empty;
        grdCtt.DataBind();
        getCttLocal(null, null, null,null);
        grdPrf.SelectedIndex = -1;
        grdCtt.SelectedIndex = -1;
        grdCttEnd.SelectedIndex = -1;
        txtIdPel.Text = String.Empty;
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
        pnlInf.Enabled = !browseMode;
        grd.Enabled = browseMode;
        lblMsg.Text = "";
        btnSearch.Enabled = browseMode;
    }
    private void getCttLocal(Int64? idCtt, Int16? seqEnd, Int32? idLcr, Int32? idPrf)
    {
        // Os locais só devem se atualizado em modo de inserção
        if (grdCtt.Enabled)
        {
            // Selecionando o contratado Local
            DBASQL dba = new DBASQL();
            SqlParameter[] param = 
                {
                    dba.MakeInParam("@IdCtt",SqlDbType.BigInt,8,idCtt),
                    dba.MakeInParam("@SeqEnd",SqlDbType.TinyInt,1,seqEnd),
                    dba.MakeInParam("@IdLcr",SqlDbType.Int,4,idLcr),
                };
            grdCttEnd.DataSource = dba.runProcDataReader("ssAtz_CttLocRde", param);
            grdCttEnd.DataBind();
            dba.Dispose();

            // Selecionando as especialidades para o Contratado Local Rede selecionado
            DBASQL dba2 = new DBASQL();
            SqlParameter[] param2 = 
                {
                    dba2.MakeInParam("@IdCtt",SqlDbType.BigInt,8,idCtt),
                    dba2.MakeInParam("@SeqEnd",SqlDbType.TinyInt,1,seqEnd),
                    dba2.MakeInParam("@IdPrf",SqlDbType.Int,4,idPrf),
                    dba2.MakeInParam("@IdEsp",SqlDbType.SmallInt,2,ddlEsp.SelectedValue),

                };
            SqlDataReader reader;
            reader = dba.runProcDataReader("ssAtz_PrfLocRde", param2);
            while (reader.Read())
            {
                foreach (GridViewRow gr in grdCttEnd.Rows)
                {
                    // Verifico se a rede foi selecionada para o profissional,
                    // se for desabilito o checkbox pois não pode inserir novamente
                    CheckBox chk = (CheckBox)gr.FindControl("chkSelect");
                    if (gr.Cells[1].Text == reader["IdLcr"].ToString())
                    {
                        chk.Checked = true;
                        chk.Enabled = false;
                    }
                }
            }
            dba2.Dispose();
        }
    }
    protected void chkSelectAll_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkAll = (CheckBox)grdCttEnd.HeaderRow.FindControl("chkSelectAll");
        // Não é permitido desmarcar a seleção em modo de edição
        if (grdCtt.Enabled)
        {
            foreach (GridViewRow gr in grdCttEnd.Rows)
            {
                CheckBox chk = (CheckBox)gr.FindControl("chkSelect");
                chk.Checked = chkAll.Checked;
            }
        }
        else
            chkAll.Checked = false;
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {
            for (int i = 0; i < dts.SelectParameters.Count; i++)
                dts.SelectParameters[i].DefaultValue = String.Empty;

            dts.SelectParameters[rblTipAco.SelectedItem.Value].DefaultValue = this.txtPsq.Text;
            grd.DataBind();
            grd.SelectedIndex = -1;
            clearForm();
            grd.Visible = true;
            pnlInf.Visible = false;
        }
        catch (Exception erroSelect)
        {
            Response.Write(@"<script language='javascript'><!-- Esconder código!
                           alert('Atenção: valor inválido para pesquisa!!');// Exibir código --></script>");
        }
    }
    protected void btnNew_Click(object sender, EventArgs e)
    {
        clearForm();
        grd.SelectedIndex = -1;
        lockForm(false);
        grd.Visible = false;
        pnlInf.Visible = true;
        grdCtt.Enabled = true;
        txtPsqCtt.Enabled = true;
        btnSearchCtt.Enabled = true;
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        if (grd.SelectedIndex == -1)
            lblToolbar.Text = "Nenhum item selecionado!";
        else
        {
            lockForm(false);
            grd.Visible = false;
            pnlInf.Visible = true;
            // Na edição não é permitido alterar o local rede
            grdCtt.Enabled = false;
            txtPsqCtt.Enabled = false;
            btnSearchCtt.Enabled = false;
        }
    }
    protected void btnDel_Click(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(txtIdPel.Text))
        {
            try
            {
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
    protected void grd_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtIdPel.Text = this.grd.SelectedRow.Cells[0].Text.Trim();
        ddlEsp.SelectedValue = grd.DataKeys[grd.SelectedIndex].Values["IdEsp"].ToString();
        txtPsqPrf.Text = grd.DataKeys[grd.SelectedIndex].Values["IdPrf"].ToString();
        dtsPrf.SelectParameters["IdPrf"].DefaultValue = txtPsqPrf.Text.Trim();
        grdPrf.DataBind();
        txtPsqCtt.Text = grd.DataKeys[grd.SelectedIndex].Values["IdCtt"].ToString();
        dtsCtt.SelectParameters["Cte_IdCtt"].DefaultValue = txtPsqCtt.Text.Trim();
        dtsCtt.SelectParameters["Cte_SeqEnd"].DefaultValue = grd.DataKeys[grd.SelectedIndex].Values["Cte_SeqEnd"].ToString();
        grdCtt.DataBind();
        getCttLocal(Convert.ToInt64(grd.DataKeys[grd.SelectedIndex].Values["IdCtt"].ToString()),
                    Convert.ToInt16(grd.DataKeys[grd.SelectedIndex].Values["Cte_SeqEnd"].ToString()), 
                    Convert.ToInt32(grd.DataKeys[grd.SelectedIndex].Values["IdLcr"].ToString()),
                    Convert.ToInt32(grd.DataKeys[grd.SelectedIndex].Values["IdPrf"].ToString()));
    }
    protected void btnSearchCtt_Click(object sender, EventArgs e)
    {
        if (grdPrf.SelectedIndex == -1)
            lblMsg.Text = "O Profissional deve ser selecionado!";
        else
        {
            lblMsg.Text = string.Empty;
            grdCtt.SelectedIndex = -1;
            dtsCtt.SelectParameters["Cte_IdCtt"].DefaultValue = txtPsqCtt.Text.Trim();
            dtsCtt.SelectParameters["Cte_SeqEnd"].DefaultValue = string.Empty;
            grdCtt.DataBind();
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if ((this.ddlEsp.SelectedIndex > -1) && (grdPrf.SelectedIndex > -1) && (grdCttEnd.Rows.Count > 0))
        {
            if (String.IsNullOrEmpty(txtIdPel.Text))
            {
                // Gravando somenente os Contratados Locais selecionados
                foreach (GridViewRow gr in grdCttEnd.Rows)
                {
                    CheckBox chk = (CheckBox)gr.FindControl("chkSelect");
                    if (chk != null)
                    {
                        if ((chk.Checked) && (chk.Enabled))
                        {
                            dts.InsertParameters["Pel_IdLcr"].DefaultValue = grdCttEnd.DataKeys[gr.RowIndex]["IdLcr"].ToString();

                            dts.Insert();
                        }
                    }
                }
            }
            else
            {
                // Gravando somenente os Contratados Locais selecionados
                foreach (GridViewRow gr in grdCttEnd.Rows)
                {
                    CheckBox chk = (CheckBox)gr.FindControl("chkSelect");
                    if (chk != null)
                    {
                        if (chk.Checked)
                        {
                            dts.UpdateParameters["Pel_IdLcr"].DefaultValue = grdCttEnd.DataKeys[gr.RowIndex]["IdLcr"].ToString();

                            dts.Update();
                        }
                    }
                }
            }
            lockForm(true);
            lblToolbar.Text = String.Empty;
        }
        else
        {
            lblToolbar.Text = "Nenhum item selecionado!";
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        clearForm();
        lockForm(true);
        grd.Visible = true;
        pnlInf.Visible = false;
    }
    protected void grd_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grd.SelectedIndex = -1;
    }
    protected void grdCtt_SelectedIndexChanged(object sender, EventArgs e)
    {
        getCttLocal(Convert.ToInt64(grdCtt.DataKeys[grdCtt.SelectedIndex].Values["Cte_IdCtt"].ToString()), 
                    Convert.ToInt16(grdCtt.DataKeys[grdCtt.SelectedIndex].Values["Cte_SeqEnd"].ToString()),
                    null,
                    Convert.ToInt32(grdPrf.SelectedValue));
    }
    protected void btnSearchPrf_Click(object sender, EventArgs e)
    {
        dtsPrf.SelectParameters["Prf_Mtr"].DefaultValue = txtPsqPrf.Text;
        grdPrf.DataBind();
        getCttLocal(null,null,null,null);
    }
    protected void ddlEsp_SelectedIndexChanged(object sender, EventArgs e)
    {
        getCttLocal(null, null,null,null);
    }
}
