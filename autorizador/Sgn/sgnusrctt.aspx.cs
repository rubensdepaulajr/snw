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

public partial class Sgn_sgnusrctt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            lockForm(true);
            bindRolesToList();
        }
    }
    private void lockForm(bool browseMode)
    {
        lblToolBar.Text = string.Empty;
        pnlPsq.Enabled = browseMode;
        btnNew.Enabled = browseMode;
        btnEdit.Enabled = browseMode;
        btnDel.Enabled = browseMode;
        btnGrp.Enabled = browseMode;
        btnResetPwd.Enabled = browseMode;
        btnSave.Visible = !browseMode;
        btnCancel.Visible = !browseMode;
        pnlInf.Enabled = !browseMode;
        grd.Enabled = browseMode;
        lblMsg.Visible = false;
        btnSearch.Enabled = browseMode;
        pnlGrp.Visible = false;
    }
    private void clearForm()
    {
        txtUserName.Text = string.Empty;
        txtUsr_Nme.Text = string.Empty;
        txtEmail.Text = string.Empty;
        chkUsrAltSnh.Checked = false;
        chkIsLockedOut.Checked = false;
        txtComment.Text = string.Empty;
    }
    private void bindRolesToList()
    {
        // Get all of the roles
        string[] roles = Roles.GetAllRoles();
        UsersRoleList.DataSource = roles;
        UsersRoleList.DataBind();
    }
    private void checkRolesForSelectedUser()
    {
        // Determine what roles the selected user belongs to
        string selectedUserName = grd.SelectedRow.Cells[0].Text;
        string[] selectedUsersRoles = Roles.GetRolesForUser(selectedUserName);

        // Loop through the Repeater's Items and check or uncheck the checkbox as needed
        foreach (RepeaterItem ri in UsersRoleList.Items)
        {
            // Programmatically reference the CheckBox
            CheckBox RoleCheckBox = ri.FindControl("RoleCheckBox") as CheckBox;

            // See if RoleCheckBox.Text is in selectedUsersRoles
            if (selectedUsersRoles.Contains<string>(RoleCheckBox.Text))
                RoleCheckBox.Checked = true;
            else
                RoleCheckBox.Checked = false;
        }
    }
    private void manageUserGroup(string userName, CheckBox RoleCheckBox)
    {       
        string roleName = RoleCheckBox.Text;

        // Determine if we need to add or remove the user from this role
        if (RoleCheckBox.Checked)
        {
            // Add the user to the role
            Roles.AddUserToRole(userName, roleName);

            // Display a status message
            ActionStatus.Text = string.Format("Usuário {0} foi adicionado ao grupo {1}.", userName, roleName);
        }
        else
        {
            // Remove the user from the role
            Roles.RemoveUserFromRole(userName, roleName);

            // Display a status message
            ActionStatus.Text = string.Format("Usuário {0} foi removido do grupo {1}.", userName, roleName);
        }
    }
    protected void RoleCheckBox_CheckChanged(object sender, EventArgs e)
    {
        string selectedUserName;
        // Reference the CheckBox that raised this event
        CheckBox RoleCheckBox = sender as CheckBox;
        // Get the currently selected user and role
        if (txtUserName.Enabled == true)
            selectedUserName = txtUserName.Text;
        else
            selectedUserName = grd.SelectedRow.Cells[0].Text;
        manageUserGroup(selectedUserName, RoleCheckBox);
    }
    private void addUser(string userId)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AppConnectionString"].ConnectionString);
        conn.Open();
        SqlCommand cmd = new SqlCommand("INSERT dbo.Sgn_Usr " +
                                        " (Usr_UserId, Usr_IdPpl, Usr_Nme) " +
                                        "VALUES " +
                                        "('" + userId + "'," + ddlPpl.SelectedValue + ", UPPER('" + txtUsr_Nme.Text.Trim() + "'))", conn);
        cmd.ExecuteNonQuery();
        conn.Close();
        conn.Dispose();
        lblToolBar.Text = "Usuário criado com sucesso!";

        lblToolBar.Text = string.Empty;
        ActionStatus.Text = string.Empty;
        bindRolesToList();
    }
    protected void btnNew_Click(object sender, EventArgs e)
    {

        lockForm(false);        
        txtUserName.Enabled = true;
        txtUserName.CssClass = "input2";
        ddlPpl.SelectedIndex = 0;        
        grd.Visible = false;
        pnlInf.Visible = true;        
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        if (grd.SelectedIndex == -1)
            lblToolBar.Text = "Nenhum item selecionado!";
        else
        {
            txtUserName.Enabled = false;
            txtUserName.CssClass = "input3";
            lockForm(false);
            grd.Visible = false;
            pnlInf.Visible = true;
        }
    }
    protected void btnDel_Click(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(txtUserName.Text))
        {
            try
            {
                dts.DeleteParameters["IdUsr"].DefaultValue = grd.DataKeys[grd.SelectedIndex].Values["IdUsr"].ToString();
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
        lockForm(true);

        for (int i = 0; i < dts.SelectParameters.Count; i++)
            dts.SelectParameters[i].DefaultValue = string.Empty;

        // Devem ser exibidos somente usuários de contratados nesta página        
        dts.SelectParameters[rblTipAco.SelectedItem.Value].DefaultValue = txtPsq.Text;
        dts.SelectParameters["PplOpe"].DefaultValue = "False";
        grd.DataBind();
        grd.SelectedIndex = -1;
        clearForm();
        grd.Visible = true;
        pnlInf.Visible = false;
    }
    protected void grd_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grd.SelectedIndex = -1;
    }
    protected void grd_SelectedIndexChanged(object sender, EventArgs e)
    {
        lockForm(true);

        txtUserName.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[0].Text);
        txtUsr_Nme.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[1].Text);
        if (!string.IsNullOrEmpty(grd.DataKeys[grd.SelectedIndex].Values["IdPpl"].ToString()))
            ddlPpl.SelectedValue = grd.DataKeys[grd.SelectedIndex].Values["IdPpl"].ToString();
        txtEmail.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[3].Text);
        CheckBox cb = (CheckBox)(grd.SelectedRow.FindControl("chkAltSnh"));
        chkUsrAltSnh.Checked = cb.Checked;
        CheckBox cb2 = (CheckBox)(grd.SelectedRow.FindControl("chkIsLocked"));
        chkIsLockedOut.Checked = cb2.Checked;
        CheckBox cb3 = (CheckBox)(grd.SelectedRow.FindControl("chkIsApproved"));
        chkIsApproved.Checked = cb3.Checked;

        txtComment.Text = HttpUtility.HtmlDecode(grd.SelectedRow.Cells[7].Text);
    }
    protected void btnGrp_Click(object sender, EventArgs e)
    {
        if (grd.SelectedIndex == -1)
            lblToolBar.Text = "Nenhum item selecionado!";
        else
        {
            lblToolBar.Text = string.Empty;
            ActionStatus.Text = string.Empty;
            pnlGrp.Visible = true;
            checkRolesForSelectedUser();
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(txtUsr_Nme.Text) && (!string.IsNullOrEmpty(txtEmail.Text)) && (ddlPpl.SelectedValue != "-1"))
        {
            if (txtUserName.Enabled == true)
            {
                lblToolBar.Text = string.Empty;
                MembershipCreateStatus createStatus;

                MembershipUser newUser = Membership.CreateUser(txtUserName.Text, "Nov@123",
                                           txtEmail.Text, "passwordQuestion",
                                           "N/A", true, out createStatus);
                switch (createStatus)
                {
                    case MembershipCreateStatus.Success:
                        addUser(newUser.ProviderUserKey.ToString());
                        break;

                    case MembershipCreateStatus.DuplicateUserName:
                        lblToolBar.Text = "Já existe um usuário com este login.";
                        break;

                    case MembershipCreateStatus.DuplicateEmail:
                        lblToolBar.Text = "Já existe um usuário com este email.";
                        break;

                    case MembershipCreateStatus.InvalidEmail:
                        lblToolBar.Text = "Este email não e válido.";
                        break;

                    case MembershipCreateStatus.InvalidAnswer:
                        lblToolBar.Text = "Pergunta de segurança inválida.";
                        break;

                    case MembershipCreateStatus.InvalidPassword:
                        lblToolBar.Text = "Senha inválida. A senha deve ter no mínimo 7 caracteres e destes no mínimo 1 não alpha-numérico.";
                        break;

                    default:
                        lblToolBar.Text = "Erro desconhecido, o usuário não foi criado!";
                        break;
                }
            }
            else
            {
                dts.UpdateParameters["IdUsr"].DefaultValue = grd.DataKeys[grd.SelectedIndex].Values["IdUsr"].ToString();
                dts.Update();
            }
            if (string.IsNullOrEmpty(lblToolBar.Text))
                lockForm(true); 
            //pnlGrp.Visible = true;
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
        pnlInf.Visible = false;
    }
    protected void btnCancelGrp_Click(object sender, EventArgs e)
    {
        lockForm(true);
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
}
