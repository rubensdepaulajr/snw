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
using System.Web.Caching;
using br.com.totaltiss.Web.Autorizador;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    private String validateUser()
    {
        String msg = String.Empty;

        // Does there exist a User account for this user?      
        MembershipUser usrInfo = Membership.GetUser(HttpUtility.HtmlEncode(txtUsr.Text));
        if (usrInfo != null)
        {
            // Is this user locked out?           
            if (usrInfo.IsLockedOut)
            {
                msg = "Seu usuário foi bloqueado, entre em contato com o administrador para solicitar o desbloqueio.";
            }
            else if (!usrInfo.IsApproved)
            {
                msg = "Seu usuário ainda não teve o acesso aprovado. O login só será possível após a aprovação do seu usuário pelo administrador.";
            }

            //if (!preventMultipleLogin())
            //    msg = "Não é permitido acessar o sistema com o mesmo usuário simultaneamente!";
        }

        return msg;
    }
    protected bool preventMultipleLogin()
    {
        string strConCat = txtUsr.Text + txtPwd.Text;
        string strUser = Convert.ToString(Cache[strConCat]);

        if (strUser == null || strUser.Equals(string.Empty))
        {
            TimeSpan SessTimeOut = new TimeSpan(0, 0, Session.Timeout, 0, 0);
            Cache.Insert(strConCat, strConCat, null, DateTime.MaxValue, SessTimeOut,
              CacheItemPriority.NotRemovable, null);
            Session["UserDetails"] = strConCat;
            return true;
        }
        else
        {          
            return false;
        }
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

        if (string.IsNullOrEmpty(userName) || string.IsNullOrEmpty(password) || ddlLoc.SelectedValue == "-1" || ddlLoc.SelectedIndex == -1)
            globall.showMessage(imgErr, lblErr, "Todos os campos devem ser informados!");
        else if ((userName.Length) > 30 || (password.Length > 30))
            globall.showMessage(imgErr, lblErr, "Os campos usuário e senha devem possuir no máximo 30 caracteres!");
        else
        {
            try
            {
                MembershipUser usrInfo = Membership.GetUser(userName);

                // Validate the user against the Membership framework user store      
                if (Membership.ValidateUser(userName, password))
                {
                    globall.showMessage(imgErr, lblErr, string.Empty);
                    validateUsr = validateUser();

                    if (string.IsNullOrEmpty(validateUsr))
                    {
                        string[] elements;
                        elements = ddlLoc.SelectedValue.Split('|');
                        //get the profile by using the username
                        WebProfile p = WebProfile.GetProfile("username");
                        //ProfileCommon p = Profile.GetProfile(userName);
                        p.Local.IdCtt = elements[0];
                        p.Local.Cte_SeqEnd = elements[1];
                        p.Local.Ctt_Nme = elements[2];
                        p.Local.Lgr_Nme = elements[3];
                        p.Local.Brr_Nme = elements[4];
                        p.Local.Mun_Nme = elements[5];
                        p.Seguranca.IdUsr = elements[6];
                        p.Seguranca.Usr_Nme = elements[7];
                        p.Seguranca.IdPpl = elements[8];
                        if (elements[9] == "S")
                            p.Seguranca.Cte_BioCon = true;
                        else
                            p.Seguranca.Cte_BioCon = false;
                        if (elements[10] == "S")
                            p.Seguranca.Cte_BioExe = true;
                        else
                            p.Seguranca.Cte_BioExe = false;
                        if (elements[11] == "S")
                            p.Seguranca.BioPrf = true;
                        else
                            p.Seguranca.BioPrf = false;
                        
                        p.Save();

                        Session["pageIsValid"] = "1";
                        // Log the user into the site                   
                        FormsAuthentication.RedirectFromLoginPage(userName, false);
                    }
                    else
                    {
                        globall.showMessage(imgErr, lblErr, validateUsr);
                    }
                }
                // If we reach here, the user's credentials were invalid   
                if (string.IsNullOrEmpty(validateUsr))
                    globall.showMessage(imgErr, lblErr, "Acesso Negado!");
                else
                    globall.showMessage(imgErr, lblErr, validateUsr);
            }
            catch (Exception ex)
            {
                globall.showMessage(imgErr,lblErr,"Ocorreu o seguinte erro: " + HttpUtility.HtmlEncode(ex.Message) + ". Por favor, tente novamente.");
            }
        }
    }
    protected void txtUsr_TextChanged(object sender, EventArgs e)
    {
        // Selecionando os locais de atendimento do usuário
        DBASQL dba = new DBASQL();
        SqlParameter[] param = {
            dba.MakeInParam("@UserName",SqlDbType.NVarChar,256,HttpUtility.HtmlEncode(txtUsr.Text))
                };
        SqlDataReader reader;
        reader = dba.runProcDataReader("ssAtz_UsrCttEnd", param);
        ddlLoc.DataTextField = "Uce_Loc";
        ddlLoc.DataValueField = "Uce_Dad";
        ddlLoc.DataSource = reader;
        ddlLoc.DataBind();
        if (ddlLoc.Items.Count > 1) 
        {
            // Insere o item "Selecione o Local" no ddlLoc caso retorne mais de um local
            ListItem lst = new ListItem("Selecione o local", "-1");
            ddlLoc.Items.Insert(0, lst);
        }
        dba.Dispose();
        txtPwd.Focus();
    }
}
