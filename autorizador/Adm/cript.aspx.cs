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

public partial class Administration_cript : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Button5.Attributes.Add("onclick", "this.disabled=true;" + ClientScript.GetPostBackEventReference(Button5, "").ToString());
        Button6.Attributes.Add("onclick", "this.disabled=true;" + ClientScript.GetPostBackEventReference(Button6, "").ToString());

        

    }

    #region Criptografia simples
    /// <summary>
    /// Criptografa uma palavra qualquer.
    /// </summary>
    /// <param name="Texto">Palavra a ser criptografada.</param>
    /// <returns>string.</returns>
    private string Crypt(string Texto)
    {
        string ret = "";
        for (int x = 0; x < Texto.Length; x++)
            ret += System.Convert.ToChar(System.Convert.ToByte(Texto[x]) + (x + 1));
        return ret;
    }
    #endregion

    #region Decrypt simples
    /// <summary>
    /// Reverte Criptografia Crypt.
    /// </summary>
    /// <param name="Texto">String Criptografada com Crypt.</param>
    /// <returns>string.</returns>
    private static string DeCrypt(string texto)
    {
        string ret = "";
        for (int x = 0; x < texto.Length; x++)
            ret += System.Convert.ToChar(System.Convert.ToByte(texto[x]) - (x + 1));
        return ret;
    }
    #endregion

    protected void Button1_Click(object sender, EventArgs e)
    {
        this.TextBox2.Text = Crypt(this.TextBox1.Text);
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        this.TextBox3.Text = DeCrypt(this.TextBox2.Text);
    }

    private string createUser(String userName, String email)
    {
        String result = String.Empty;
        MembershipCreateStatus createStatus;

        if (String.IsNullOrEmpty(email))
            email = userName + "@sms.org.br";

        MembershipUser newUser =
             Membership.CreateUser(userName, "Nov@123",
                                   email, "Password question",
                                   "Security answer", true,
                                   out createStatus);

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MedicallConnectionString"].ConnectionString);
        conn.Open();
        SqlCommand cmd = new SqlCommand("INSERT dbo.Sgn_Usr (Usr_UserId, Usr_Nme) SELECT TOP 1 Usr_UserId, '"+ userName +"' FROM sgn_usr ", conn);
        cmd.ExecuteNonQuery();
        conn.Close();
        conn.Dispose();

        switch (createStatus)
        {
            case MembershipCreateStatus.Success:
                result = "The user account was successfully created!";
                break;

            case MembershipCreateStatus.DuplicateUserName:
                result = "There already exists a user with this username.";
                break;

            case MembershipCreateStatus.DuplicateEmail:
                result = "There already exists a user with this email address.";
                break;

            case MembershipCreateStatus.InvalidEmail:
                result = "There email address you provided in invalid.";
                break;

            case MembershipCreateStatus.InvalidAnswer:
                result = "There security answer was invalid.";
                break;

            case MembershipCreateStatus.InvalidPassword:
                result = "The password you provided is invalid. It must be seven characters long and have at least one non-alphanumeric character.";
                break;

            default:
                result = "There was an unknown error; the user account was NOT created.";
                break;
        }

        return result;

    }

    protected void bntNewUsrPrf_Click(object sender, EventArgs e)
    {

        String queryString = "SELECT Prf_Mtr, Prf_Nme, Prf_Eml FROM dbo.Atz_Prf WHERE Prf_IdUsr IS NULL ORDER BY IdPrf";

        using (SqlConnection connection =
                   new SqlConnection(ConfigurationManager.ConnectionStrings["MedicallConnectionString"].ConnectionString))
        {
            SqlCommand command = new SqlCommand(queryString, connection);
            connection.Open();

            SqlDataReader reader = command.ExecuteReader();

            // Call Read before accessing data.
            while (reader.Read())
            {
                createUser(reader[0].ToString(), reader[2].ToString());
            }
            // Call Close when done reading.
            reader.Close();
        }

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MedicallConnectionString"].ConnectionString);
        conn.Open();
        SqlCommand cmd = new SqlCommand("UPDATE dbo.Sgn_Usr " +
                                        "SET Usr_Nme = Prf_Nme, Usr_UserId = UserId, Usr_IdPpl = 2 " +
                                        "FROM dbo.aspnet_Users, dbo.Sgn_Usr, dbo.Atz_Prf " +
                                        "WHERE Prf_Mtr = UserName " +
                                        "AND   UserName = Usr_Nme ", conn);
        cmd.ExecuteNonQuery();
        conn.Close();
        conn.Dispose();

        SqlConnection conn2 = new SqlConnection(ConfigurationManager.ConnectionStrings["MedicallConnectionString"].ConnectionString);
        conn2.Open();
        SqlCommand cmd2 = new SqlCommand("UPDATE dbo.Atz_Prf " +
                                        "SET Prf_IdUsr = IdUsr " +
                                        "FROM dbo.aspnet_Users, dbo.Sgn_Usr, dbo.Atz_Prf " +
                                        "WHERE Usr_UserId = UserId " +
                                        "AND	Prf_Mtr = UserName", conn2);
        cmd2.ExecuteNonQuery();
        conn2.Close();
        conn2.Dispose();        

        Response.Write("Usuários incluídos com sucesso!");
           
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        String queryString = "SELECT LTRIM(STR(IdCtt)) + LTRIM(STR(Cte_SeqEnd)), Ctt_Nme, Ctt_Eml " +
                            "FROM atz_ctt, atz_cttend " +
                            "WHERE idctt = cte_idctt";

        using (SqlConnection connection =
                   new SqlConnection(ConfigurationManager.ConnectionStrings["MedicallConnectionString"].ConnectionString))
        {
            SqlCommand command = new SqlCommand(queryString, connection);
            connection.Open();

            SqlDataReader reader = command.ExecuteReader();

            // Call Read before accessing data.
            while (reader.Read())
            {
                createUser(reader[0].ToString(), reader[2].ToString());
            }
            // Call Close when done reading.
            reader.Close();
        }

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MedicallConnectionString"].ConnectionString);
        conn.Open();
        SqlCommand cmd = new SqlCommand("UPDATE dbo.Sgn_Usr " +
                                        "SET Usr_Nme = Ctt_Nme, Usr_UserId = UserId, Usr_IdPpl = 3 " +
                                        "FROM dbo.aspnet_Users, dbo.Sgn_Usr, dbo.Atz_Ctt, dbo.Atz_CttEnd " +
                                        "WHERE LTRIM(STR(IdCtt)) + LTRIM(STR(Cte_SeqEnd)) = UserName " +
                                        "AND IdCtt = Cte_IdCtt " +
                                        "AND   UserName = Usr_Nme ", conn);
        cmd.ExecuteNonQuery();
        conn.Close();
        conn.Dispose();

        SqlConnection conn2 = new SqlConnection(ConfigurationManager.ConnectionStrings["MedicallConnectionString"].ConnectionString);
        conn2.Open();
        SqlCommand cmd2 = new SqlCommand("INSERT dbo.Atz_UsrCttEnd (Uce_IdUsr, Uce_IdCtt, Uce_SeqEnd) " +
                                        "SELECT IdUsr, IdCtt, Cte_SeqEnd " +
                                        "FROM dbo.aspnet_Users, dbo.Sgn_Usr, dbo.Atz_Ctt, dbo.Atz_CttEnd " +
                                        "WHERE Usr_UserId = UserId " +
                                        "AND   IdCtt = Cte_IdCtt " +
                                        "AND   LTRIM(STR(IdCtt)) + LTRIM(STR(Cte_SeqEnd)) = UserName", conn2);
        cmd2.ExecuteNonQuery();
        conn2.Close();
        conn2.Dispose();

        Response.Write("Usuários incluídos com sucesso!");
        
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        string tableName = string.Empty;

        string queryString = "SELECT UserName FROM dbo.Sgn_Usr, dbo.aspnet_Users WHERE UserId = Usr_UserId AND Usr_IdPpl > 1";

        using (SqlConnection connection =
                   new SqlConnection(ConfigurationManager.ConnectionStrings["MedicallConnectionString"].ConnectionString))
        {
            SqlCommand command = new SqlCommand(queryString, connection);
            connection.Open();

            SqlDataReader reader = command.ExecuteReader();

            // Call Read before accessing data.
            while (reader.Read())
            {
                MembershipUser usrInfo = Membership.GetUser(reader[0].ToString());

                try
                {
                    string resetPwd = usrInfo.ResetPassword();

                    usrInfo.ChangePassword(resetPwd, ConfigurationManager.AppSettings["defaultpwd"]);

                }
                catch (Exception ex)
                {
                    Response.Write("Ocorreu o seguinte erro: " + Server.HtmlEncode(ex.Message) + ". Por favor, tente novamente.");
                }
            }
            Response.Write("Senhas reiniciadas com sucesso!");
            // Call Close when done reading.
            reader.Close();
        }
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        int i = 0;

        String queryString = "SELECT * " +
                            "FROM atz_ngc ";

        using (SqlConnection connection =
                   new SqlConnection(ConfigurationManager.ConnectionStrings["MedicallConnectionString"].ConnectionString))
        {
            SqlCommand command = new SqlCommand(queryString, connection);
            connection.Open();

            SqlDataReader reader = command.ExecuteReader();

            // Call Read before accessing data.
            while (reader.Read())
            {
                i += 1;
            }
            // Call Close when done reading.
            reader.Close();

            Response.Write("terminou: " + i.ToString());
        }
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        Response.Write("Default password:"+ ConfigurationManager.AppSettings["defaultpwd"]);
        Response.Write("Data Source:" + ConfigurationManager.AppSettings["datasource"]);
        Response.Write("Initial Catalog:" + ConfigurationManager.AppSettings["initialcatalog"]);
    }
    protected void Button8_Click(object sender, EventArgs e)
    {
        Response.Write(Request.ServerVariables["REMOTE_ADDR"]);

        Response.Write("<b>Name:</b> " + Request.ServerVariables["REMOTE_HOST"] + "<br />" +
            "<b>IP:</b> " + Request.ServerVariables["REMOTE_ADDR"] + "<br />" +
                "<b>User agent:</b> " + Request.ServerVariables["HTTP_USER_AGENT"] + "<br />" +
                "<b>Language:</b> " + Request.ServerVariables["HTTP_ACCEPT_LANGUAGE"] + "<br />" +
                "<b>Browser:</b> " + Request.Browser.Browser + "<br />" +
                "<b>Type:</b> " + Request.Browser.Type + "<br />" +
                "<b>Version:</b> " + Request.Browser.Version + "<br />" +
                "<b>Major version:</b> " + Request.Browser.MajorVersion.ToString() + "<br />" +
                "<b>Minor version:</b> " + Request.Browser.MinorVersion.ToString() + "<br />" +
                "<b>Beta:</b> " + Request.Browser.Beta.ToString() + "<br />" +
                "<b>Cookies:</b> " + Request.Browser.Cookies.ToString() + "<br />" +
                "<b>Frames:</b> " + Request.Browser.Frames.ToString() + "<br />" +
                "<b>Tables:</b> " + Request.Browser.Tables.ToString() + "<br />" +
                "<b>ActiveX:</b> " + Request.Browser.ActiveXControls.ToString() + "<br />" +
                "<b>Java Applets:</b> " + Request.Browser.JavaApplets.ToString() + "<br />" +
                "<b>JavaScript:</b> " + Request.Browser.JavaScript.ToString() + "<br />" +
                "<b>VBScript:</b> " + Request.Browser.VBScript.ToString() + "<br />");
    }
    protected void Button9_Click(object sender, EventArgs e)
    {
        string strConnection = ConfigurationManager.ConnectionStrings["AppConnectionString"].ConnectionString;
        string strInsert = "EXEC stAtz_CttEnd @Cte_IdCtt, @Cte_SeqEnd, @Cte_IdLgr, " +
		"@Cte_Cpl,	@Cte_NumEnd, @Cte_Tel";
        SqlConnection con = new SqlConnection(strConnection);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = strInsert;
        SqlParameter idCtt = new SqlParameter("@Cte_IdCtt", SqlDbType.BigInt, 8);
        idCtt.Value = 1007;
        cmd.Parameters.Add(idCtt);

        SqlParameter seqEnd = new SqlParameter("@Cte_SeqEnd", SqlDbType.TinyInt, 4);
        seqEnd.Value = 55;
        cmd.Parameters.Add(seqEnd);

        SqlParameter idLgr = new SqlParameter("@Cte_IdLgr", SqlDbType.Int, 4);
        idLgr.Value = 1;
        cmd.Parameters.Add(idLgr);

        SqlParameter cpl = new SqlParameter("@Cte_Cpl", SqlDbType.VarChar, 15);
        cpl.Value = "fkdjfl";
        cmd.Parameters.Add(cpl);

        SqlParameter numEnd = new SqlParameter("@Cte_NumEnd", SqlDbType.Int, 4);
        numEnd.Value = 1;
        cmd.Parameters.Add(numEnd);

        SqlParameter tel = new SqlParameter("@Cte_Tel", SqlDbType.VarChar, 20);
        tel.Value = "fkdjfl";
        cmd.Parameters.Add(tel);


        con.Open();
        int result = cmd.ExecuteNonQuery();
        con.Close();

        Response.Write("AH MULUEQUE!!!!");
    }
}
