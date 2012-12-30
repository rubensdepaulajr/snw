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
using br.com.totaltiss.Web.Autorizador;

public partial class lgnope : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    private String validateUser()
    {
        string msg = string.Empty;

        // Does there exist a User account for this user?      
        MembershipUser usrInfo = Membership.GetUser(txtUsr.Text);
        if (usrInfo != null)
        {
            // Is this user locked out?           
            if (usrInfo.IsLockedOut)
            {
                msg = "Seu usuário foi bloqueado, entre em contato com o administrador para solicitar o desbloqueio.";
            }
            else
                if (!usrInfo.IsApproved)
                {
                    msg = "Seu usuário ainda não teve o acesso aprovado. O login só será possível após a aprovação do seu usuário pelo administrador.";
                }
        }

        DBASQL dba = new DBASQL();
        SqlParameter[] param = {
                                    dba.MakeInParam("@UserName",SqlDbType.NVarChar,256,txtUsr.Text)
                                };
        SqlDataReader reader;
        reader = dba.runProcDataReader("ssSgn_UsrOpe", param);

        msg = "Acesso somente para usuário da operadora!";
        while (reader.Read())
        {
            msg = string.Empty;
            //get the profile by using the username
            WebProfile p = WebProfile.GetProfile("username");
            //ProfileCommon p = Profile.GetProfile(txtUsr.Text);
            p.Seguranca.IdUsr = reader["IdUsr"].ToString();
            p.Seguranca.Usr_Nme = reader["Usr_Nme"].ToString();
            p.Seguranca.IdPpl = reader["Usr_IdPpl"].ToString();
            p.Save();
        }
        dba.Dispose();

        return msg;
    }
    protected void btnOk_Click(object sender, ImageClickEventArgs e)
    {
        string validateUsr = string.Empty;
        string userName = string.Empty;        
        string password = string.Empty;

        if (txtUsr.Text.Length > 30)
            userName = HttpUtility.HtmlEncode(txtUsr.Text.Substring(0, 30));
        else
            userName = HttpUtility.HtmlEncode(txtUsr.Text);
        if (txtPwd.Text.Length > 30)
            password = HttpUtility.HtmlEncode(txtPwd.Text.Substring(0, 30));
        else
            password = HttpUtility.HtmlEncode(txtPwd.Text);

        if (string.IsNullOrEmpty(userName) || string.IsNullOrEmpty(password))
            globall.showMessage(imgErr, lblErr, "Todos os campos devem ser informados!");
        else if ((userName.Length) > 30 || (password.Length > 30))
            globall.showMessage(imgErr, lblErr, "Os campos usuário e senha devem possuir no máximo 30 caracteres!");
        else
        {
            try
            {                
                // Validate the user against the Membership framework user store      
                if (Membership.ValidateUser(userName, password))
                {
                    validateUsr = validateUser();

                    if (string.IsNullOrEmpty(validateUsr))
                    {
                        // Log the user into the site                   
                        FormsAuthentication.RedirectFromLoginPage(userName, false);
                    }
                    else
                    {
                        globall.showMessage(imgErr, lblErr, validateUsr);
                    }
                }
                // If we reach here, the user's credentials were invalid    

                globall.showMessage(imgErr, lblErr, "Acesso Negado!");
            }
            catch (Exception ex)
            {
                globall.showMessage(imgErr, lblErr, "Ocorreu o seguinte erro: " + Server.HtmlEncode(ex.Message) + ". Por favor, tente novamente.");
            }
        }
    }
}
