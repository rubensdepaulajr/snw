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
using System.Text.RegularExpressions;
using br.com.totaltiss.Web.Autorizador;


public partial class Atz_pes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (!Page.IsPostBack)
        {
            txtDatIni.Text = DateTime.Now.AddDays(-7).ToShortDateString();
            txtDatFim.Text = DateTime.Now.ToShortDateString();

            // Selecionando as Especialidades
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["AppConnectionString"].ConnectionString))
            {
                SqlCommand command = new SqlCommand("SELECT IdEsp, LTRIM(RTRIM(Esp_Dsc)) AS Esp_Dsc  FROM dbo.Atz_Esp ORDER BY Esp_Dsc", connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                ddlEsp.DataSource = reader;
                ddlEsp.DataBind();
                reader.Close();
            }

            // Selecionando as situações
            DBASQL dba = new DBASQL();
            SqlDataReader readerSit;
            dba.RunSql("SELECT IdSit, Sit_Dsc FROM dbo.Atz_Sit ORDER BY Sit_Dsc", out readerSit);
            ddlSit.DataSource = readerSit;
            ddlSit.DataBind();
            readerSit.Close();
            dba.Dispose();

            // Habilitando os campos de pesquisa de acordo com o papel do usuário
            WebProfile Profile = WebProfile.GetProfile("username");
            string idPpl = Profile.Seguranca.IdPpl;
            // Papéis profissionais
            if ((idPpl == "2") || (idPpl == "5"))
            {
                // Selecionando a matrícula do profissional "logado"
                DBASQL dba2 = new DBASQL();
                SqlParameter[] param = 
                    {
                        dba2.MakeInParam("@UserName",SqlDbType.NVarChar,256,Membership.GetUser().ToString())
                    };
                SqlDataReader reader;
                reader = dba2.runProcDataReader("ssAtz_UsrPrf", param);
                while (reader.Read())
                {
                    txtPrfMtr.Text = reader["Prf_Mtr"].ToString();
                }
                dba2.Dispose();

                lblCtt.Visible = false;
                txtIdCtt.Visible = false;
                lblPrf.Visible = false;
                txtPrfMtr.Visible = false;
            }
            //Papéis contratados
            else if ((idPpl == "3") || (idPpl == "4") || (idPpl == "6"))
            {
                lblCtt.Visible = false;
                txtIdCtt.Visible = false;
                txtIdCtt.Text = Profile.Local.IdCtt;
            }
        }
    }
    
    #region CrossPage PostBack
    public String ordem
    {
        get
        {
            return ddlOrd.SelectedValue;
        }
    }

    public String campo
    {
        get
        {
            String aux;

            txtDatIni.Text += " 00:00:00";
            txtDatFim.Text += " 23:59:59";

            aux = txtDatIni.Text +"|"+ txtDatFim.Text +"|"+ ddlEsp.SelectedValue +"|"+ ddlTip.SelectedValue +"|"+
                    ddlSit.SelectedValue + "|" + ddlSitInd.SelectedValue + "|" + txtIdPdm.Text + "|" + txtSnh.Text + "|" + txtBnfMtr.Text + "|" + 
                    txtIdCtt.Text +"|"+ txtPrfMtr.Text;

            return aux;
        }
    }
    #endregion
    /// <summary>
    /// Verifica o período da pesquisa que não deve exceder 31 dias
    /// </summary>
    /// <returns>True - Período válido, False - Período inválido</returns>
    private bool validaPeriodo()
    {
        DateTime datIni = Convert.ToDateTime(txtDatIni.Text);
        DateTime datFim = Convert.ToDateTime(txtDatFim.Text);
        TimeSpan datDif = datFim.Subtract(datIni);

        return (datDif.Days <= 31);
    }
    protected void btnOk_Click(object sender, ImageClickEventArgs e)
    {
        if (string.IsNullOrEmpty(txtDatIni.Text) && string.IsNullOrEmpty(txtDatFim.Text))
            globall.showMessage(imgMsg, lblMsg, "A data inicial e final devem ser informadas.");
        else if ((ddlEsp.SelectedValue == "-1") && (ddlTip.SelectedValue == "-1") &&
            (ddlSit.SelectedValue == "-1") && string.IsNullOrEmpty(txtIdPdm.Text) &&
            string.IsNullOrEmpty(txtSnh.Text) && string.IsNullOrEmpty(txtBnfMtr.Text) &&
            string.IsNullOrEmpty(txtIdCtt.Text) && string.IsNullOrEmpty(txtPrfMtr.Text))
            globall.showMessage(imgMsg, lblMsg, "Pelo menos um critério além da data inicial, data final e indicador da situação deve ser informado.");
        else if (!string.IsNullOrEmpty(txtDatIni.Text) && !globall.isDate(txtDatIni.Text))
            globall.showMessage(imgMsg, lblMsg, "Data Inicial inválida.");
        else if (!string.IsNullOrEmpty(txtDatFim.Text) && !globall.isDate(txtDatFim.Text))
            globall.showMessage(imgMsg, lblMsg, "Data Final inválida.");
        else if (!string.IsNullOrEmpty(txtIdCtt.Text) && !globall.isInteger(txtIdCtt.Text))
            globall.showMessage(imgMsg, lblMsg, "Matrícula do Contratado inválida!");
        //else if (!validaPeriodo())
        //    globall.showMessage(imgMsg, lblMsg, "O período máximo permtido para a pesquisa é de 31 dias!");
        else
        {
            globall.showMessage(imgMsg, lblMsg, "");
            Server.Transfer("pesres.aspx");
        }
    }
}
