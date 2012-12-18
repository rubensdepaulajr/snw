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

public partial class selcttend : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public String idUce
    {
        get
        {
            return this.grd.SelectedDataKey.Value.ToString();
        }
    }

    protected void dtsLocAtd_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        e.Command.Parameters["@UserName"].Value = Membership.GetUser().ToString(); 
    }

    protected void grd_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["IdCtt"] = grd.DataKeys[grd.SelectedIndex].Values["IdCtt"].ToString();
        Session["Cte_SeqEnd"] = grd.DataKeys[grd.SelectedIndex].Values["Cte_SeqEnd"].ToString();
        Session["Ctt_Nme"] = grd.DataKeys[grd.SelectedIndex].Values["Ctt_Nme"].ToString();
        Session["IdUsr"] = grd.DataKeys[grd.SelectedIndex].Values["IdUsr"].ToString();
    }


}
