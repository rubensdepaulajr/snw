using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Security;

public partial class Bio_ver : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if ((Request.QueryString["ori"].ToString() == "solexa") || (Request.QueryString["ori"].ToString() == "lgnprf"))
                getProfissional();
            else
                getBeneficiario(Convert.ToInt32(Request.QueryString["bnf"].ToString()));
        }
    }
    private void getProfissional()
    {
        DBASQL dba = new DBASQL();
        SqlParameter[] param = {
                                    dba.MakeInParam("UserName",SqlDbType.NVarChar,256,Membership.GetUser().ToString())
                               };
        SqlDataReader reader;
        reader = dba.runProcDataReader("ssAtz_UsrPrf", param);
        while (reader.Read())
        {
            lblBnfMtr.Text = reader["Prf_Mtr"].ToString();
            lblBnfNme.Text = reader["Prf_Nme"].ToString();
        }
        dba.Dispose();
    }
    private void getBeneficiario(int idBnf)
    {
        DBASQL dba = new DBASQL();
        SqlParameter[] param = {
                                   dba.MakeInParam("IdBnf",SqlDbType.Int,4,idBnf)
                               };
        SqlDataReader reader;
        reader = dba.runProcDataReader("ssAtz_Bnf", param);
        while (reader.Read())
        {
            lblBnfMtr.Text = reader["Bnf_Mtr"].ToString();
            lblBnfNme.Text = reader["Bnf_Nme"].ToString();            
        }
        dba.Dispose();
    }
}
