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

public partial class Atz_atditn : PageBase
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
    #endregion
}
