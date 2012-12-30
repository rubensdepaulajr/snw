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
using br.com.totaltiss.Web.Autorizador;

public partial class Atz_pesresdet : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            WebProfile Profile = WebProfile.GetProfile("username");
            btnAud.Visible = globall.papelDaOperadora(Convert.ToInt32(Profile.Seguranca.IdPpl));

            if (!String.IsNullOrEmpty(PreviousPage.campo))
            {
                String[] s = PreviousPage.campo.Split(new char[] { '|' });

                lblDat.Text = s[0];
                lblIdCtt.Text = s[1];
                lblPrfMtr.Text = s[2];
                lblBnfMtr.Text = s[3];
                lblBnfNme.Text = s[4];
                lblGiaTip.Text = s[5];
                lblGiaCrt.Text = s[6];
                lblPdmCod.Text = s[7];
                lblPdmDsc.Text = s[8];
                lblQtdSol.Text = s[9];
                lblQtdAtz.Text = s[10];
                lblSit.Text = s[11];
                lblSnh.Text = s[12];
                lblPrfSol.Text = s[13];
                lblEspSol.Text = s[14];
                lblPrfExe.Text = s[15];
                lblEspExe.Text = s[16];
                lblPdmQtdCh_.Text = s[17];
            }
        }
    }
    protected void btnNewPsq_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Pes.aspx");
    }
    protected void btnPgaIni_Click(object sender, ImageClickEventArgs e)
    {
        // Seleciona a página inicial do usuário de acordo com o papel
        WebProfile Profile = WebProfile.GetProfile("username");
        String idPpl = Profile.Seguranca.IdPpl;
        if (idPpl == "2")
            Response.Redirect("prf.aspx");
        else if (idPpl == "4")
            Response.Redirect("atd.aspx");
        else if (idPpl == "3")
            Response.Redirect("exeexa.aspx");
        else if (idPpl == "5")
            Response.Redirect("exeexa.aspx");
        else if (idPpl == "6")
            Response.Redirect("exeexa.aspx");
        else
            Response.Redirect("pes.aspx");
    }
    protected void btnAud_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("aud.aspx?snh=" + lblSnh.Text);
    }
}
