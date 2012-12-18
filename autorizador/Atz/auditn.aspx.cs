using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using Snw.WebPage;
using System.Data.SqlClient;

public partial class Atz_auditn : PageBase
{

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    #region Grid styles
    protected void paginateGrdItn(object sender, CommandEventArgs e)
    {
        globall.getCurrentPageGrid(grdItn, e.CommandArgument.ToString());
    }
    protected void ddlGrdItnPages_SelectedIndexChanged(object sender, EventArgs e)
    {
        globall.selectPageGrid(grdItn);
    }
    protected void ddlGrdCttPages_SelectedIndexChanged(object sender, EventArgs e)
    {
        globall.selectPageGrid(grdCtt);
        ModalPopupExtender1.Show();
    }
    protected void paginateGrdCtt(object sender, CommandEventArgs e)
    {
        globall.getCurrentPageGrid(grdCtt, e.CommandArgument.ToString());
        ModalPopupExtender1.Show();
    }
    #endregion
    protected void hidePopup()
    {
        txtCtt_NmePop.Text = "";
        txtCtt_MtrPop.Text = "";
        dtsCtt.SelectParameters["IdCtt"].DefaultValue = string.Empty;
        dtsCtt.SelectParameters["Ctt_Nme"].DefaultValue = string.Empty;
        dtsCtt.DataBind();
        grdCtt.DataBind();
        ModalPopupExtender1.Hide();
        grdCtt.SelectedIndex = -1;
    }
    protected void grd_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblIdCtt.Text = grdCtt.DataKeys[grdCtt.SelectedIndex].Values["IdCtt"].ToString();
        lblCttNme.Text = HttpUtility.HtmlDecode(grdCtt.DataKeys[grdCtt.SelectedIndex].Values["Ctt_Nme"].ToString());
        hidePopup();
    }
    protected void btnBuscar_Click(object sender, ImageClickEventArgs e)
    {
        ModalPopupExtender1.Show();
        dtsCtt.SelectParameters["IdCtt"].DefaultValue = txtCtt_MtrPop.Text;
        dtsCtt.SelectParameters["Ctt_Nme"].DefaultValue = txtCtt_NmePop.Text;
        grdCtt.DataBind();
        if (grdCtt.Rows.Count == 0)
            lblEmptyGrid.Text = "Nenhum registro encontrado!";
        else
            lblEmptyGrid.Text = string.Empty;
    }
    protected void btnOk_Click(object sender, ImageClickEventArgs e)
    {
        DBASQL dba = new DBASQL();
        SqlParameter[] param = { dba.MakeInParam("@IdCtt", SqlDbType.BigInt, 8, txtIdCtt.Text) };
        SqlDataReader reader;
        reader = dba.runProcDataReader("ssAtz_Ctt", param);
        while (reader.Read())
        {
            lblIdCtt.Text = reader["IdCtt"].ToString();
            lblCttNme.Text = reader["Ctt_Nme"].ToString();            
        }
        dba.Dispose();   
    }
    protected void lbtBuscar_Click(object sender, EventArgs e)
    {
        ModalPopupExtender1.Show();
    }
    protected void grdCtt_Sorted(object sender, EventArgs e)
    {
        ModalPopupExtender1.Show();
    }
    protected void lblRemCtt_Click(object sender, EventArgs e)
    {
        lblIdCtt.Text = string.Empty;
        lblCttNme.Text = string.Empty;
    }
}
