using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Ngc_CadPdmOrt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            hdfIdPdm.Value = Request.QueryString["Pdm"];
            DBASQL dba = new DBASQL();
            SqlParameter[] param = 
            {
                dba.MakeInParam("@IdOpe",SqlDbType.Int,4,1),
                dba.MakeInParam("@IdPdm",SqlDbType.Int,4,hdfIdPdm.Value),
            };
            SqlDataReader reader;            
            reader = dba.runProcDataReader("ssCad_PdmOrt", param);
            while (reader.Read())
            {
                lblPdm.Text = reader["Pdm_Cod"].ToString() +" - "+ reader["Pdm_Dsc"].ToString();
                htmlbox.Text = Server.HtmlDecode(reader["Pdo_Htm"].ToString());
            }
            dba.Dispose();
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (htmlbox.Text.Length < 20)
        {
            globall.showMessage(imgMsg, lblPdm, "O campo de orientações deve ter no mínimo 20 caracteres!");
        }
        else
        {
            DBASQL dba = new DBASQL();
            SqlParameter[] param = 
            {
                dba.MakeInParam("@IdOpe",SqlDbType.SmallInt,2,1),
                dba.MakeInParam("@IdPdm",SqlDbType.Int,4,hdfIdPdm.Value),
                dba.MakeInParam("@PdoDsc",SqlDbType.VarChar,900,HtmlRemoval.StripTagsCharArray(htmlbox.Text).Replace("&nbsp;"," ")),
                dba.MakeInParam("@PdoHtm",SqlDbType.VarChar,1100,htmlbox.Text),
            };
            dba.RunProc("stCad_PdmOrt", param);
            Server.Transfer("AtzPdm.aspx?Pdm=" + hdfIdPdm.Value);
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Server.Transfer("AtzPdm.aspx?Pdm=" + hdfIdPdm.Value);
    }
}
