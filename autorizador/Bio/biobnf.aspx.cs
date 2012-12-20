using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
//using NBioBSPCOMLib;
using NITGEN.SDK.NBioBSP; 

public partial class Bio_biobnf : System.Web.UI.Page
{
    //#region CrossPage PostBack
    // Erro de jscript
    //public bool isIdentified
    //{
    //    get
    //    {
    //        bool aux = false;

    //        if (ViewState["bioValidated"].ToString() == "True")
    //            aux = true;

    //        return aux;
    //    }
    //}
    //public string idBnf
    //{
    //    get
    //    {
    //        return Request.QueryString["bnf"].ToString();
    //    }
    //}
    //#endregion
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ViewState["bioValidated"] = string.Empty;
            if (!string.IsNullOrEmpty(Request.QueryString["bnf"].ToString()))
            {
                getBeneficiario(Convert.ToInt32(Request.QueryString["bnf"].ToString()), null);
            }
        }
    }
    private void getBeneficiario(int? idBnf, string bnfMtr)
    {
        DBASQL dba = new DBASQL();
        SqlParameter[] param = {
                                    dba.MakeInParam("IdBnf",SqlDbType.Int,4,idBnf),
                                    dba.MakeInParam("@Bnf_Mtr", SqlDbType.VarChar, 20, bnfMtr) 
                               };
        SqlDataReader reader;
        reader = dba.runProcDataReader("ssAtz_Bnf", param);
        while (reader.Read())
        {
            lblBnfMtr.Text = reader["Bnf_Mtr"].ToString();
            lblBnfNme.Text = reader["Prd_Nme"].ToString();            
        }
        dba.Dispose();
    }
    //private void selectDB()
    //{
    //    //Faz a conexão com o banco de dados
    //    string strConnection = ConfigurationManager.ConnectionStrings["AppConnectionString"].ConnectionString;
    //    string strAccess = " SELECT Bnf_Mtr, Bnf_Nme, Bbf_Fir " +
    //                        "FROM dbo.Sgn_BioBnf, dbo.Atz_Bnf  " +
    //                        "WHERE IdBnf = Bbf_IdBnf " +
    //                        "AND Bnf_Mtr = '" + txtBnfMtr.Text + "'";

    //    //Cria a variável do tipo OleDbConnection para fazer a conexão com o banco de dados
    //    SqlConnection dbConnection = new SqlConnection(strConnection);
    //    //Cria a variável do tipo OleDbCommand para selecionar o banco de dados
    //    SqlCommand selectDB = new SqlCommand(strAccess, dbConnection);

    //    //Abre o banco de dados
    //    dbConnection.Open();
    //    //Cria um IDataReader
    //    IDataReader reader;
    //    reader = selectDB.ExecuteReader();

    //    try
    //    {
    //        //Varre os campos do banco
    //        while (reader.Read())
    //        {
    //            lblBnf.Text = reader["Bnf_Mtr"].ToString() + '-' + reader["Bnf_Nme"].ToString();
    //            txtFIR.Text = reader["Bbf_Fir"].ToString();
    //        }
    //    }
    //    finally
    //    {
    //        //Fecha o reader
    //        reader.Close();
    //        //Fecha o banco de dados
    //        dbConnection.Close();
    //    }
    //}
    public void saveDB()
    {
        //Cria a variável para a conexão com o banco de dados
        string strConnection = ConfigurationManager.ConnectionStrings["AppConnectionString"].ConnectionString;
        //Insere ID, Nome e Template no banco de dados
        string strAccess = "INSERT dbo.Sgn_BioBnf (Bbf_IdBnf, Bbf_IdUsr, Bbf_Fir, Bbf_Dat, Bbf_Ded) " +
                            "SELECT IdBnf," + Profile.Seguranca.IdUsr + ", '" + txtFIR.Text + "', GETDATE(), 1 " +
                            " FROM dbo.Atz_Bnf WHERE Bnf_Mtr = '" + lblBnfMtr.Text + "'";

        //Cria a variável do tipo OleDbConnection para abrir o banco de dados
        SqlConnection dbConnection = new SqlConnection(strConnection);
        //Cria a variável do tipo OleDbCommand para salvar no banco de dados
        SqlCommand cmdSalvar = new SqlCommand(strAccess, dbConnection);
        //Tenta abrir o banco de dados
        try
        {
            //Abre o banco de dados
            dbConnection.Open();
            //Salva no banco de dados
            cmdSalvar.ExecuteNonQuery();
            lblMsg.Text = "Dados salvos com sucesso!";
        }
        catch (Exception ex)
        {
            lblMsg.Text = "Falha ao conectar com o banco de dados!" + "[" + ex.Message + "]";
        }
        finally
        {
            //Fecha a conexão com o banco de dados
            dbConnection.Close();
        }

        //Cria a variável para a conexão com o banco de dados
        string strConnection2 = ConfigurationManager.ConnectionStrings["AppConnectionString"].ConnectionString;
        //Insere ID, Nome e Template no banco de dados
        string strAccess2 = " UPDATE dbo.Atz_Bnf SET Bnf_Bio = 1 WHERE Bnf_Mtr = '" + lblBnfMtr.Text + "'";

        //Cria a variável do tipo OleDbConnection para abrir o banco de dados
        SqlConnection dbConnection2 = new SqlConnection(strConnection2);
        //Cria a variável do tipo OleDbCommand para salvar no banco de dados
        SqlCommand cmdSalvar2 = new SqlCommand(strAccess2, dbConnection2);
        //Tenta abrir o banco de dados
        try
        {
            //Abre o banco de dados
            dbConnection2.Open();
            //Salva no banco de dados
            cmdSalvar2.ExecuteNonQuery();
            lblMsg.Text = "Dados salvos com sucesso!";
        }
        catch (Exception ex)
        {
            lblMsg.Text = "Falha ao conectar com o banco de dados!" + "[" + ex.Message + "]";
        }
        finally
        {
            //Fecha a conexão com o banco de dados
            dbConnection2.Close();
        }
    }
    protected void btnEnroll_Click(object sender, EventArgs e)
    {
        //NBioBSP objNBioBSP;
        //IDevice objDevice;
        //IExtraction objExtraction;

        //objNBioBSP = new NBioBSPClass();
        //objDevice = (IDevice)objNBioBSP.Device;
        //objExtraction = (IExtraction)objNBioBSP.Extraction;
        //objNBioBSP.SetSkinResource("NBSP2Por.dll");

        ////Abre o dispositivo
        //objDevice.Open(255);
        ////Decide qual dedo será exibido no pop-up
        //objExtraction.set_DisableFingerForEnroll(0, NBioAPI.Type.TRUE);
        //objExtraction.set_DisableFingerForEnroll(1, NBioAPI.Type.FALSE);
        //objExtraction.set_DisableFingerForEnroll(2, NBioAPI.Type.TRUE);
        //objExtraction.set_DisableFingerForEnroll(3, NBioAPI.Type.TRUE);
        //objExtraction.set_DisableFingerForEnroll(4, NBioAPI.Type.TRUE);
        //objExtraction.set_DisableFingerForEnroll(5, NBioAPI.Type.TRUE);
        //objExtraction.set_DisableFingerForEnroll(6, NBioAPI.Type.TRUE);
        //objExtraction.set_DisableFingerForEnroll(7, NBioAPI.Type.TRUE);
        //objExtraction.set_DisableFingerForEnroll(8, NBioAPI.Type.TRUE);
        //objExtraction.set_DisableFingerForEnroll(9, NBioAPI.Type.TRUE);
        ////Faz a captura da impressão digital
        //objExtraction.Enroll(null, null);
        ////Fecha o dispositivo
        //objDevice.Close(255);
        ////A impressão capturada é exibida no textbox3
        //txtFIR.Text = objExtraction.TextEncodeFIR;
    }
    protected void btnVerify_Click(object sender, EventArgs e)
    {
        //Verifica se a pessoa está se identificando para validar
        //if (!string.IsNullOrEmpty(txtBnfMtr.Text))
        //{
        //    NBioBSP objNBioBSP;
        //    IDevice objDevice;
        //    IExtraction objExtraction;
        //    IMatching objMatching;

        //    objNBioBSP = new NBioBSPClass();
        //    objDevice = (IDevice)objNBioBSP.Device;
        //    objExtraction = (IExtraction)objNBioBSP.Extraction;
        //    objMatching = (IMatching)objNBioBSP.Matching;
        //    objNBioBSP.SetSkinResource("NBSP2Por.dll");

        //    //Abre o dispositivo
        //    objDevice.Open(255);
        //    //Faz a captura da impressão digital
        //    objExtraction.Capture(2);
        //    //Fecha o dispositivo
        //    objDevice.Close(255);
        //    //Chama a função para verificar se o ID existe no banco de dados
        //    selectDB();
        //    //Compara a digital registrada no banco de dados com a digital capturada
        //    objMatching.VerifyMatch(txtFIR.Text, objExtraction.TextEncodeFIR);

        //    //Se a comparação retornar 1, o usuário é identificado
        //    if (objMatching.MatchingResult != 0)
        //    {
        //        lblMsg.Text = "Usuário encontrado";
        //    }
        //    //Se retornar 0, o usuário não é identificado
        //    else
        //    {
        //        lblMsg.Text = "Usuário não encontrado";
        //    }
        //}
        //else
        //{
        //    lblMsg.Text = "É necessário todos os campos estarem preenchidos!";
        //    txtFIR.Text = string.Empty;
        //}

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        ////Verifica se todos os campos estão preenchidos para salvar no banco de dados
        //if (!string.IsNullOrEmpty(txtFIR.Text))
        //{
        //    //Chama a função para salvar no banco de dados
        //    saveDB();
        //}
        //else
        //{
        //    //Retorna quando os dados não são preenchidos
        //    lblMsg.Text = "É necessário preencher todos os campos!";
        //}
    }
    protected void ibtEnroll_Click(object sender, ImageClickEventArgs e)
    {
        //if (Biometrics.enrollUser(Convert.ToInt32(Request.QueryString["bnf"].ToString()), Convert.ToInt32(Profile.Seguranca.IdUsr), rblFinger.SelectedIndex))
        //{
        //    ViewState["bioValidated"] = "True";
        //    globall.showMessage(imgMsg, lblMsg, "Cadastro efetuado com sucesso!");
        //}
        //else
        //{
        //    ViewState["bioValidated"] = "False";
        //    globall.showMessage(imgMsg, lblMsg, "Não foi possível efetuar o cadastro biométrico!");
        //}
    }
    protected void ibtVoltar_Click(object sender, ImageClickEventArgs e)
    {
        string bioVld;

        //if (ViewState["bioValidated"].ToString() == "True")
        //if (!string.IsNullOrEmpty(txtFIR.Text))
        //{
            //Biometrics.saveDB(txtFIR.Text,Convert.ToInt32(Request.QueryString["bnf"].ToString()),Convert.ToInt32(Profile.Seguranca.IdUsr), 1);
        saveDB();     
        bioVld = "1";
        //}
        //else
        //    bioVld = "0";

        if (Request.QueryString["ori"].ToString() == "solcon")
            Response.Redirect("../atz/solcon.aspx?bnf="+ Request.QueryString["bnf"].ToString() +"&bio="+ bioVld);
        else if (Request.QueryString["ori"].ToString() == "exesdt")
            Response.Redirect("../atz/exeexa.aspx?bnf=" + Request.QueryString["bnf"].ToString() + "&bio=" + bioVld);
    }
}
