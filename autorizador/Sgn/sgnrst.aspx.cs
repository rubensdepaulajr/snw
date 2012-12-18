using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;

public partial class Sgn_sgnrst : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            lockForm(true);
        }
    }
    private void lockForm(bool browseMode)
    {
        lblToolBar.Text = string.Empty;
        pnlPsq.Enabled = browseMode;
        btnResetPwd.Enabled = browseMode;
        grd.Enabled = browseMode;
        btnSearch.Enabled = browseMode;
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        lockForm(true);

        for (int i = 0; i < dts.SelectParameters.Count; i++)
            dts.SelectParameters[i].DefaultValue = string.Empty;

        dts.SelectParameters[rblTipAco.SelectedItem.Value].DefaultValue = txtPsq.Text;
        // Lista somente usuários com pápeis que não são da operadora
        dts.SelectParameters["PplOpe"].DefaultValue = "False";
        grd.DataBind();
        grd.SelectedIndex = -1;
        grd.Visible = true;
    }
    protected void grd_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grd.SelectedIndex = -1;
    }
    protected void btnResetPwd_Click(object sender, EventArgs e)
    {
        if (grd.SelectedIndex == -1)
            lblToolBar.Text = "Nenhum item selecionado!";
        else
        {
            MembershipUser usrInfo = Membership.GetUser(HttpUtility.HtmlDecode(grd.SelectedRow.Cells[0].Text));
            
            try
            {
                string resetPwd = usrInfo.ResetPassword();

                if (usrInfo.ChangePassword(resetPwd, ConfigurationManager.AppSettings["defaultpwd"]))
                {
                    dts.InsertParameters["IdUsr"].DefaultValue = grd.DataKeys[grd.SelectedIndex].Values["IdUsr"].ToString();
                    dts.InsertParameters["Usr_AltSnh"].DefaultValue = "True";
                    dts.Insert();
                    lblToolBar.Text = "Senha reiniciada com sucesso!";
                }
                else
                {
                    lblToolBar.Text = "A alteração da senha falhou. Por favor, tente novamente.";
                }
            }
            catch (Exception ex)
            {
                lblToolBar.Text = "Ocorreu o seguinte erro: " + Server.HtmlEncode(ex.Message) + ". Por favor, tente novamente.";
            }
        }
    }
    protected void btnBloquear_Click(object sender, EventArgs e)
    {
        if (grd.SelectedIndex == -1)
            lblToolBar.Text = "Nenhum item selecionado!";
        else
        {
            MembershipUser usrInfo = Membership.GetUser(HttpUtility.HtmlDecode(grd.SelectedRow.Cells[0].Text));

            try
            {
                usrInfo.IsApproved = false;
                Membership.UpdateUser(usrInfo);
                grd.DataBind();
                grd.SelectedIndex = -1;
                lblToolBar.Text = "Usuário bloqueado com sucesso!.";
            }
            catch (Exception ex)
            {
                lblToolBar.Text = "Ocorreu o seguinte erro: " + Server.HtmlEncode(ex.Message) + ". Por favor, tente novamente.";
            }
        }
    }
    protected void btnDesbloquear_Click(object sender, EventArgs e)
    {
        if (grd.SelectedIndex == -1)
            lblToolBar.Text = "Nenhum item selecionado!";
        else
        {
            MembershipUser usrInfo = Membership.GetUser(HttpUtility.HtmlDecode(grd.SelectedRow.Cells[0].Text));

            try
            {
                usrInfo.IsApproved = true;
                Membership.UpdateUser(usrInfo);
                if (usrInfo.UnlockUser())
                {
                    lblToolBar.Text = "Usuário desbloqueado com sucesso!";
                    grd.DataBind();
                    grd.SelectedIndex = -1;
                }
                else
                {
                    lblToolBar.Text = "Desbloqueio de usuário falhou. Por favor, tente novamente.";
                }
            }
            catch (Exception ex)
            {
                lblToolBar.Text = "Ocorreu o seguinte erro: " + Server.HtmlEncode(ex.Message) + ". Por favor, tente novamente.";
            }
        }
    }
    protected void grd_SelectedIndexChanged(object sender, EventArgs e)
    {
        CheckBox chkIsLocked = (CheckBox)(grd.SelectedRow.FindControl("chkIsLocked"));
        CheckBox chkIsApproved = (CheckBox)(grd.SelectedRow.FindControl("chkIsApproved"));
        
        btnBloquear.Visible = chkIsApproved.Checked;
        btnDesbloquear.Visible = (!chkIsApproved.Checked) || (chkIsLocked.Checked);
    }

}
