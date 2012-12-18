using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

public partial class Sgn_sgnusrinf : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            // If querystring value is missing, send the user to ManageUsers.aspx
            string userName = Request.QueryString["user"];
            if (string.IsNullOrEmpty(userName))
                Response.Redirect("sgnusr.aspx");


            // Get information about this user
            MembershipUser usr = Membership.GetUser(userName);
            if (usr == null)
                Response.Redirect("sgnusr.aspx");

            lblUserName.Text = usr.UserName;
            IsApproved.Checked = usr.IsApproved;
            txtComment.Text = usr.Comment;

            if (usr.LastLockoutDate.Year < 2000)
                LastLockoutDateLabel.Text = string.Empty;
            else
                LastLockoutDateLabel.Text = usr.LastLockoutDate.ToShortDateString();

            chkIsLockedOut.Checked = usr.IsLockedOut;
            hdfLocked.Value = usr.IsLockedOut.ToString();
            chkIsLockedOut.Enabled = usr.IsLockedOut;

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MedicallConnectionString"].ConnectionString))
            {
                SqlCommand command = new SqlCommand("SELECT Usr_Nme FROM dbo.Sgn_Usr, dbo.aspnet_Users WHERE UserId = Usr_UserId AND UserName = '"+ lblUserName.Text.Trim() +"'", connection);
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                    txtUsr_Nme.Text = reader[0].ToString();

                reader.Close();
            }
        }
    }

    protected void IsApproved_CheckedChanged(object sender, EventArgs e)
    {
        //// Toggle the user's approved status
        //string userName = Request.QueryString["user"];
        //MembershipUser usr = Membership.GetUser(userName);
        //usr.IsApproved = IsApproved.Checked;
        //Membership.UpdateUser(usr);

        //StatusMessage.Text = "Alteração efetuada com sucesso.";
    }


    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Sgn/sgnusr.aspx");
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        // Toggle the user's approved status
        MembershipUser usr = Membership.GetUser(lblUserName.Text);
        usr.IsApproved = IsApproved.Checked;
        //usr.IsLockedOut = chkIsLockedOut.Checked;
        usr.Comment = txtComment.Text;       
        Membership.UpdateUser(usr);

        // Unlock user
        if (hdfLocked.Value == "True")
        {
            //MembershipUser usr = Membership.GetUser(lblUserName.Text);
            usr.UnlockUser();
        }

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MedicallConnectionString"].ConnectionString);
        conn.Open();
        SqlCommand cmd = new SqlCommand("UPDATE dbo.Sgn_Usr SET Usr_Nme = '"+ txtUsr_Nme.Text.Trim() +"' FROM dbo.Sgn_Usr, dbo.aspnet_Users WHERE UserId = Usr_UserId AND UserName = '" + lblUserName.Text + "'", conn);
        cmd.ExecuteNonQuery();
        conn.Close();
        conn.Dispose();

        Response.Redirect("~/Sgn/sgnusr.aspx");
    }
}
