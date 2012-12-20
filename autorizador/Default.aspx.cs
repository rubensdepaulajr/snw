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

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            // Seleciona a página inicial do usuário de acordo com o papel
            String idPpl = Profile.Seguranca.IdPpl;
            if (idPpl == "2")
            {
                if (Profile.Seguranca.BioPrf == true)
                {
                    Response.Redirect("bio/ver.aspx?ori=lgnprf");
                }
                Response.Redirect("atz/prf.aspx");
            }
            else if (idPpl == "4")
                Response.Redirect("atz/atd.aspx");
            else if (idPpl == "3")
                Response.Redirect("atz/exeexa.aspx");
            else if (idPpl == "5")
                Response.Redirect("atz/exeexa.aspx");
            else if (idPpl == "6")
                Response.Redirect("atz/exeexa.aspx");
            else
                Response.Redirect("atz/pes.aspx");
        }
    }
}
