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

public partial class AtzMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            lblDat.Text = DateTime.Now.Date.ToShortDateString();

            string idPpl = Profile.Seguranca.IdPpl;


            if (idPpl != "1")
            {
                // Buscando o endereço do local de atendimento selecionado pelo usuário
                lblCttNme.Text = Profile.Local.Ctt_Nme;
                lblCttEnd.Text = Profile.Local.Lgr_Nme + ", " + Profile.Local.Brr_Nme + ", " + Profile.Local.Mun_Nme;
            }

            // Buscando o primeiro nome do usuário logado
            if ((idPpl == "1") || (idPpl == "2") || (idPpl == "5"))
            {
                String[] elements;
                elements = Profile.Seguranca.Usr_Nme.Split(' ');
                lblUsrNme.Text = elements[0];
            }
        }
    }
    protected void lbtSair_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        Response.Redirect("../home.html");
    }
}
