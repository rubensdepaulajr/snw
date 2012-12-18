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

public partial class solcondet : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["Gia"]))
            {
                hdfIdGia.Value = Request.QueryString["Gia"];

                // Selecionando os dados da Guia de Consulta
                DBASQL dba = new DBASQL();
                SqlParameter[] param = 
                {
                    dba.MakeInParam("@IdGia",SqlDbType.Int, 4, hdfIdGia.Value),
                    dba.MakeOutParam("Out_SldSdt",SqlDbType.Int,4),
                };
                SqlDataReader reader;
                reader = dba.runProcDataReader("ssAtz_GiaConDet", param);
                while (reader.Read())
                {
                    lblBnf.Text = reader["Bnf_Mtr"].ToString() + " - " + reader["Bnf_Nme"].ToString();
                    lblPrf_Nme.Text = reader["Prf_Nme"].ToString();
                    lblEsp_Dsc.Text = reader["Esp_Dsc"].ToString();
                    lblIdPdm.Text = reader["Pdm_Cod"].ToString();
                    lblPdmDsc.Text = reader["Pdm_Dsc"].ToString();
                    lblGia_DatEms.Text = reader["Gia_DatEms"].ToString();
                    lblGpdDatRel.Text = reader["Gpd_DatRel"].ToString();
                }
                dba.Dispose();

                string msg = string.Empty;
                if ((int)param[1].Value > 0)
                {
                    msg = "Existem solicitações de procedimentos relacionados a esta consulta não executados. Você confirma o cancelamento da consulta e dos procedimentos relacionados?";
                    btnCancel.Attributes.Add("onClick", "return confirm('"+ msg +"')");
                }
                
            }
        }
    }
    protected void  btnPgaIni_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("atd.aspx");
    }
    protected void btnCancel_Click(object sender, ImageClickEventArgs e)
    {

        DBASQL dba = new DBASQL();
        
        string[] outParam = { "@Out_Err" };
        string[] outResult;

        SqlParameter[] param = 
            {
                dba.MakeInParam("@IdGia",SqlDbType.Int,4,hdfIdGia.Value),
                dba.MakeInParam("@IdUsr",SqlDbType.Int,4,Profile.Seguranca.IdUsr),
                dba.MakeInParam("@IdSit",SqlDbType.TinyInt,1,6),
                dba.MakeOutParam("@Out_Err",SqlDbType.Bit,1)
            };

        outResult = dba.RunProc("stAtz_GiaCnc", param, outParam);

        if (outResult[0] == "True")
            globall.showMessage(imgErr, lblErr, "Ocorreram erros na tentativa de cancelar a consulta!");
        else
        {
            btnCancel.Visible = false;
            globall.showMessage(imgErr, lblErr, "Consulta cancelada com sucesso!");
        }


        dba.Dispose();
    }
}
