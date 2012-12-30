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
using System.Text.RegularExpressions;
using System.Data.SqlClient;
using Snw.WebPage;
using Microsoft.Reporting.WebForms;
using br.com.totaltiss.Web.Autorizador;

public partial class Sgn_bioprf : PageBase
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Request.QueryString.Count > 0)
            {
                getProfissional(Request.QueryString["prf"].ToString());
            }
        }
    }
    private void getProfissional(String strValue)
    {
        if (rblTip.SelectedIndex == 0)
        {
            dts.SelectParameters["Prf_Mtr"].DefaultValue = strValue;
            dts.SelectParameters["Prf_Nme"].DefaultValue = String.Empty;
        }
        else
        {
            dts.SelectParameters["Prf_Mtr"].DefaultValue = String.Empty;
            dts.SelectParameters["Prf_Nme"].DefaultValue = strValue;
        }
        grd.DataBind();
        mvw.ActiveViewIndex = 1;
    }
    protected void btnOk_Click(object sender, ImageClickEventArgs e)
    {
        if (string.IsNullOrEmpty(txtPsq.Text))
            globall.showMessage(imgMsg,lblMsg,"Informe o critério da pesquisa!");
        else
        {
            getProfissional(txtPsq.Text);
        }
    }
    protected void btnNewPsq_Click(object sender, ImageClickEventArgs e)
    {
        mvw.ActiveViewIndex = 0;
    }
    #region Grid Navegação
    protected void ddlGrdEspPages_SelectedIndexChanged(object sender, EventArgs e)
    {
        globall.selectPageGrid(grd);
    }
    protected void paginateGrdEsp(object sender, CommandEventArgs e)
    {
        globall.getCurrentPageGrid(grd, e.CommandArgument.ToString());
    }
    #endregion
    protected void btnPgaIni_Click(object sender, ImageClickEventArgs e)    
    {
        WebProfile Profile = WebProfile.GetProfile("username");
        gotoPagInicial(Profile.Seguranca.IdPpl);
    }
    protected void rblTip_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rblTip.SelectedIndex == 0)
            lblPsq.Text = "Informe a matrícula:";
        else if (rblTip.SelectedIndex == 1)
            lblPsq.Text = "Informe o nome:";
    }
    protected void grd_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblBio.Text = String.Empty;
    }
    protected void btnAtivar_Click(object sender, ImageClickEventArgs e)
    {
        if (grd.SelectedIndex == -1)
            lblBio.Text = "Nenhum profissional selecionado!";
        else
        {   
            string qtd = string.Empty;
            WebProfile Profile = WebProfile.GetProfile("username");
            DBASQL dba = new DBASQL();
            SqlDataReader reader;
            dba.RunSql("SELECT COUNT(*) AS Qtd "+
                        "FROM dbo.Sgn_BioPrf, dbo.Atz_Prf "+
                        "WHERE IdPrf = Bpf_IdPrf "+
                        "AND Prf_Mtr = '" + grd.SelectedDataKey.Values["Prf_Mtr"].ToString() +"'", out reader);
            while (reader.Read())
            {
                qtd = reader["Qtd"].ToString();
            }
            dba.Dispose();

            if (qtd == "0")
            {
                lblBio.Text = String.Empty;
                Session["tmp"] = grd.SelectedDataKey.Values["IdCtt"].ToString() + "|" + grd.SelectedDataKey.Values["Cte_SeqEnd"].ToString();
                Response.Redirect("../bio/cad.aspx?ori=cadprf&prf=" + grd.SelectedDataKey.Values["Prf_Mtr"].ToString());
            }
            else
            {
                string strConnection = ConfigurationManager.ConnectionStrings["AppConnectionString"].ConnectionString;
                string strAccess = "INSERT dbo.Sgn_BioPrf "+
                        " SELECT IdPrf, "+ grd.SelectedDataKey.Values["IdCtt"].ToString() +","+
                            grd.SelectedDataKey.Values["Cte_SeqEnd"].ToString() + ","+
                            Profile.Seguranca.IdUsr +", Bpf_Fir, GETDATE(), Bpf_Ded "+
                        " FROM dbo.Sgn_BioPrf, dbo.Atz_Prf "+
                        " WHERE IdPrf = Bpf_IdPrf "+
                        " AND Prf_Mtr = '" + grd.SelectedDataKey.Values["Prf_Mtr"].ToString() +"'";

                SqlConnection dbConnection = new SqlConnection(strConnection);
                SqlCommand cmdSalvar = new SqlCommand(strAccess, dbConnection);
                try
                {
                    dbConnection.Open();
                    cmdSalvar.ExecuteNonQuery();
                }
                finally
                {
                    dbConnection.Close();
                    grd.DataBind();
                }
            }                
        }
    }
    protected void btnDesativar_Click(object sender, ImageClickEventArgs e)
    {
        if (grd.SelectedIndex == -1)
            lblBio.Text = "Nenhum profissional selecionado!";
        else
        {
            lblBio.Text = String.Empty;
            dts.DeleteParameters["IdPrf"].DefaultValue = grd.SelectedDataKey.Values["IdPrf"].ToString();
            dts.DeleteParameters["IdCtt"].DefaultValue = grd.SelectedDataKey.Values["IdCtt"].ToString();
            dts.DeleteParameters["SeqEnd"].DefaultValue = grd.SelectedDataKey.Values["Cte_SeqEnd"].ToString();
            dts.Delete();
        }
    }
}
