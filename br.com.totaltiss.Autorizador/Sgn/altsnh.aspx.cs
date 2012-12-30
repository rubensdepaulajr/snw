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
using System.Xml.Linq;

public partial class AltSnh : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnAltSnh_Click(object sender, ImageClickEventArgs e)
    {
        if (txtNovSnh.Text == string.Empty || txtRptSnh.Text == string.Empty || txtSnhAtu.Text == string.Empty)
        {
            globall.showMessage(ImgErr,lblErr,"Todos os campos devem ser preenchidos.");
        }
        else if (txtNovSnh.Text != txtRptSnh.Text)
        {
            globall.showMessage(ImgErr,lblErr,"Os campos Nova Senha e Repetir Senha devem ser iguais.");
        }
        else
        {
            MembershipUser usrInfo = Membership.GetUser(User.Identity.Name);

            try
            {
                if (usrInfo.ChangePassword(txtSnhAtu.Text, txtNovSnh.Text))
                {
                    globall.showMessage(ImgErr, lblErr, "Senha alterada com sucesso!.");
                }
                else
                {
                    globall.showMessage(ImgErr, lblErr, "A alteração da senha falhou. Por favor, tente novamente.");
                }
            }
            catch (Exception ex)
            {
                globall.showMessage(ImgErr, lblErr, "Ocorreu o seguinte erro: " + Server.HtmlEncode(ex.Message) + ". Por favor, tente novamente.");
            }
        }
    }
}
