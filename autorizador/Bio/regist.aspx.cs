using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using NITGEN.SDK.NBioBSP;
using NBioBSPCOMLib;
using System.Web.Security;

public partial class Bio_regist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((!Page.IsPostBack) & (Request.Form.Count > 0))
        {
            // Usuário cancelou a leitura da digital
            if (string.IsNullOrEmpty(Request.Form["FIRTextData"].ToString()))
            {
                if (Request.Form["ori"].ToString() == "solcon")
                    Response.Redirect("../atz/solcon.aspx?bnf=" + Request.Form["UserID"].ToString() + "&bio=0");
                else if (Request.Form["ori"].ToString() == "exeexa")
                    Response.Redirect("../atz/exeexa.aspx?bnf=" + Request.Form["UserID"].ToString() + "&bio=0");
                else if (Request.Form["ori"].ToString() == "solexa")
                {
                    String[] s = Session["tmp"].ToString().Split(new char[] { '|' });
                    Response.Redirect("../atz/fhapci.aspx?Bnf=" + s[1] + "&bio=0");
                }
                else if (Request.Form["ori"].ToString() == "cadbnf")
                    Response.Redirect("../atz/bnf.aspx?bnf=" + Request.Form["UserID"].ToString() + "&bio=0");
                else if (Request.Form["ori"].ToString() == "cadprf")
                    Response.Redirect("../sgn/bioprf.aspx?prf=" + Request.Form["UserID"].ToString());
                else if (Request.Form["ori"].ToString() == "lgnprf")
                {
                    // No login do profissional não é permitido logar no sistema 
                    // sem se identificar via biometria quando ela esta ativada
                    FormsAuthentication.SignOut();
                    Response.Redirect("../home.html");
                }
            }
            // Verificação da biometria
            else if (Request.QueryString["aco"].ToString() == "biover")
                verifyBnf();
            // Cadastro da biometria
            else
                saveDB();
        }
    }
    private void verifyBnf()
    {
            NBioBSP objNBioBSP;
            IMatching objMatching;
            objNBioBSP = new NBioBSPClass();
            objMatching = (IMatching)objNBioBSP.Matching;
            //objNBioBSP.SetSkinResource("NBSP2Por.dll");
            selectDB();
            //Compara a digital registrada no banco de dados com a digital capturada
            objMatching.VerifyMatch(txtFIR.Text, Request.Form["FIRTextData"].ToString());

            //Se a comparação retornar 1, o usuário é identificado
            if (objMatching.MatchingResult != 0)
            {
                lblMsg.Text = "Usuário encontrado";
                if (Request.Form["ori"].ToString() == "solcon")
                    Response.Redirect("../atz/solcon.aspx?bnf=" + Request.Form["UserID"].ToString() + "&bio=1");
                else if (Request.Form["ori"].ToString() == "exeexa")
                    Response.Redirect("../atz/exeexa.aspx?bnf=" + Request.Form["UserID"].ToString() + "&bio=1");
                else if (Request.Form["ori"].ToString() == "cadbnf")
                    Response.Redirect("../atz/bnf.aspx?bnf=" + Request.Form["UserID"].ToString() + "&bio=1");
                else if (Request.Form["ori"].ToString() == "lgnprf")
                    Response.Redirect("../atz/prf.aspx");
                else if (Request.Form["ori"].ToString() == "cadprf")
                    Response.Redirect("../sgn/bioprf.aspx?mtr=" + Request.Form["UserID"].ToString()); //+ "&bio=1");
                else if (Request.Form["ori"].ToString() == "solexa")
                {
                    String[] s = Session["tmp"].ToString().Split(new char[] { '|' });
                    Response.Redirect("../atz/solexa.aspx?Gia=" + s[0] + "&Bnf=" + s[1] + "&bio=1");
                }
            }
            //Se retornar 0, o usuário não é identificado
            else
            {
                lblMsg.Text = "Usuário não encontrado";
                if (Request.Form["ori"].ToString() == "solcon")
                    Response.Redirect("../atz/solcon.aspx?bnf=" + Request.Form["UserID"].ToString() + "&bio=0");
                else if (Request.Form["ori"].ToString() == "exeexa")
                    Response.Redirect("../atz/exeexa.aspx?bnf=" + Request.Form["UserID"].ToString() + "&bio=0");
                else if (Request.Form["ori"].ToString() == "cadbnf")
                    Response.Redirect("../atz/bnf.aspx?bnf=" + Request.Form["UserID"].ToString() + "&bio=0");
                else if (Request.Form["ori"].ToString() == "lgnprf")
                {
                    // A identificação biométrica do profissional falhou,
                    // portanto o acesso ao sistema será negado
                    FormsAuthentication.SignOut();
                    Response.Redirect("../home.html");
                }
                else if (Request.Form["ori"].ToString() == "cadprf")
                    Response.Redirect("../sgn/bioprf.aspx?mtr=" + Request.Form["UserID"].ToString());// + "&bio=0");
                else if (Request.Form["ori"].ToString() == "solexa")
                {
                    String[] s = Session["tmp"].ToString().Split(new char[] { '|' });
                    //Response.Redirect("../atz/solexa.aspx?Gia=" + s[0] + "&Bnf=" + s[1] + "&bio=0");
                    Response.Redirect("../atz/fhapci.aspx?Bnf=" + s[1] + "&bio=0");
                }
            }
    }
    private void selectDB()
    {
        //Faz a conexão com o banco de dados
        String strConnection = ConfigurationManager.ConnectionStrings["AppConnectionString"].ConnectionString;
        String strAccess;
        if (Request.Form["ori"].ToString() == "lgnprf" || (Request.Form["ori"].ToString() == "solexa"))
            strAccess = "SELECT Prf_Mtr, Prf_Nme, Bpf_Fir "+
                        "FROM dbo.Sgn_BioPrf, dbo.Atz_Prf "+
                        "WHERE IdPrf = Bpf_IdPrf "+ 
                        "  AND Bpf_IdCtt = "+ Profile.Local.IdCtt +
                        "  AND Bpf_SeqEnd = "+ Profile.Local.Cte_SeqEnd +
                        "  AND Prf_Mtr = '" + Request.Form["UserID"].ToString() + "'";
        else
            strAccess = "SELECT Bnf_Mtr, Bnf_Nme, Bbf_Fir " +
                        "FROM dbo.Sgn_BioBnf, dbo.Atz_Bnf  " +
                        "WHERE IdBnf = Bbf_IdBnf " +
                        "  AND Bnf_Mtr = '" + Request.Form["UserID"].ToString() + "'";

        //Cria a variável do tipo OleDbConnection para fazer a conexão com o banco de dados
        SqlConnection dbConnection = new SqlConnection(strConnection);
        //Cria a variável do tipo OleDbCommand para selecionar o banco de dados
        SqlCommand selectDB = new SqlCommand(strAccess, dbConnection);

        //Abre o banco de dados
        dbConnection.Open();
        //Cria um IDataReader
        IDataReader reader;
        reader = selectDB.ExecuteReader();

        try
        {
            //Varre os campos do banco
            while (reader.Read())
            {
                //lblBnf.Text = reader["Bnf_Mtr"].ToString() + '-' + reader["Bnf_Nme"].ToString();
                txtFIR.Text = reader[2].ToString(); // reader["Bbf_Fir"].ToString();
            }
        }
        finally
        {
            //Fecha o reader
            reader.Close();
            //Fecha o banco de dados
            dbConnection.Close();
        }
    }
    private void saveDB()
    {
        string[] outParam = { "@Out_Err" };
        string[] outResult;
        try
        {
            DBASQL dba = new DBASQL();
            if (Request.Form["ori"].ToString() == "cadprf")
            {
                String[] s = Session["tmp"].ToString().Split(new char[] { '|' });
                SqlParameter[] paramPrf = 
                {
                    dba.MakeInParam("IdCtt",SqlDbType.BigInt,8,s[0]),
                    dba.MakeInParam("SeqEnd",SqlDbType.TinyInt,1,s[1]),
                    dba.MakeInParam("@Prf_Mtr",SqlDbType.VarChar,20,Request.Form["UserID"].ToString()),
                    dba.MakeInParam("@IdUsr",SqlDbType.Int,4,Profile.Seguranca.IdUsr),
                    dba.MakeInParam("@Bpf_Fir",SqlDbType.VarChar,4000,Request.Form["FIRTextData"].ToString()),
                    dba.MakeInParam("@Bpf_Ded",SqlDbType.TinyInt,1,1),
                    dba.MakeOutParam("@Out_Err",SqlDbType.Bit,1)
                 };
                outResult = dba.RunProc("stSgn_BioPrf", paramPrf, outParam);
            }
            else
            {
                SqlParameter[] paramBnf = 
                {
                    dba.MakeInParam("@Bnf_Mtr",SqlDbType.VarChar,20,Request.Form["UserID"].ToString()),
                    dba.MakeInParam("@IdUsr",SqlDbType.Int,4,Profile.Seguranca.IdUsr),
                    dba.MakeInParam("@Bbf_Fir",SqlDbType.VarChar,4000,Request.Form["FIRTextData"].ToString()),
                    dba.MakeInParam("@Bbf_Ded",SqlDbType.TinyInt,1,1),
                    dba.MakeOutParam("@Out_Err",SqlDbType.Bit,1)
                 };
                outResult = dba.RunProc("stSgn_BioBnf", paramBnf, outParam);
            }
            dba.Dispose();
            // Tratamento para a mensagem com a negativa
            if (outResult[0] == "False")
            {
                lblMsg.Text = "Dados salvos com sucesso!";
            }

        }
        catch (Exception ex)
        {
            lblMsg.Text = "Falha ao conectar com o banco de dados!" + "[" + ex.Message + "]";
        }
        finally
        {
            if (Request.Form["ori"].ToString() == "solcon")
                Response.Redirect("../atz/solcon.aspx?bnf=" + Request.Form["UserID"].ToString() + "&bio=1");
            else if (Request.Form["ori"].ToString() == "exeexa")
                Response.Redirect("../atz/exeexa.aspx?bnf=" + Request.Form["UserID"].ToString() + "&bio=1");
            else if (Request.Form["ori"].ToString() == "cadbnf")
                Response.Redirect("../atz/bnf.aspx?bnf=" + Request.Form["UserID"].ToString() + "&bio=1");
            else if (Request.Form["ori"].ToString() == "cadprf")
                Response.Redirect("../sgn/bioprf.aspx?prf=" + Request.Form["UserID"].ToString() + "&bio=1");
        }
    }
}
