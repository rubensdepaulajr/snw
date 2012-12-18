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

public partial class Verification : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Request.QueryString["ID"]))
            StatusMessage.Text = "The UserId was not included in the querystring...";
        else
        {
            Guid userId;

            try
            {
                userId = new Guid(Request.QueryString["ID"]);
            }
            catch
            {
                StatusMessage.Text = "The UserId passed into the querystring is not in the proper format...";
                return;
            }

            MembershipUser usr = Membership.GetUser(userId);
            if (usr == null)
                StatusMessage.Text = "User account could not be found...";
            else
            {
                // Approve the user
                usr.IsApproved = true;
                Membership.UpdateUser(usr);

                StatusMessage.Text = "Your account has been approved. Please <a href=\"Login.aspx\">login</a> to the site.";
            }
        }
    }
}
