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

public partial class sellocatd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public String idCredenciado
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
        this.btnAtdCon.Enabled = true;
    }

}
