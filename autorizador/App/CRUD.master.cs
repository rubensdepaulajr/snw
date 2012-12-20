using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace br.com.totaltiss.Gestor.Web.App
{
    public partial class CRUDMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        #region Validação de campos e mensagem popup
        public bool validateFields()
        {
            Page.Validate(valSummary.ValidationGroup);
            if (!Page.IsValid)
            {
                update.Update();
                popVld.Show();
                return false;
            }
            return true;
        }
        public void showMessage(String msg)
        {
            lblMsg.Text = msg;
            upnMsg.Update();
            popMsg.Show();
        }
        #endregion
    }
}