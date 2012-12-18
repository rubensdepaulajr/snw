using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace br.com.totaltiss.Util 
{
    public abstract class PageBase: System.Web.UI.Page
    {
        #region Display Mode Methods
        public static Mode _Mode; 
        public enum Mode
        {
            Add,
            Update,
            Browse,
        }
        public static Mode displayMode
        {
            get 
            { 
                return _Mode; 
            }
            set 
            { 
                _Mode = value; 
            }
        }
        #endregion
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

            if (!CheckQueryStrings())
            {
                // all required query strings have not been specified
                RedirectToPage("Error.aspx");
            }

            if (!CheckQueryStringValues())
            {
                // one or more query string values are invalid
                RedirectToPage("Error.aspx");
            }
        }
        protected override void OnLoad(EventArgs e) {
            base.OnLoad(e);
            Page.MaintainScrollPositionOnPostBack = true;
        }
        #region Query String Methods

        /// <summary>
        /// When overriden, returns a list of all required query string keys
        /// </summary>
        /// <returns></returns>
        protected virtual List<string> RequiredQueryStrings() {
            return null;
        }

        /// <summary>
        /// When overriden, checks the actual values of query strings
        /// </summary>
        /// <returns></returns>
        protected virtual bool CheckQueryStringValues() {
            return true;
        }

        /// <summary>
        /// Verifies the required query string are actually present
        /// </summary>
        /// <returns></returns>
        protected bool CheckQueryStrings() {
            List<string> values = RequiredQueryStrings();

            if (values == null || values.Count == 0) {
                return true;
            }
            else {
                foreach (string value in values) {
                    if (Request.QueryString[value] == null) {
                        return false;
                    }
                }
            }

            return true;
        }

        #endregion
        #region Redirection Methods

        /// <summary>
        /// Redirects the application to the specified page, and ignores the 
        /// erroneous error that is sometimes thrown
        /// </summary>
        /// <param name="url"></param>
        protected void RedirectToPage(string url){
            try{
                Response.Redirect(url);
            }
            catch{
                // catch the ThreadAbortException that is occasionally thrown by ASP.NET
            }
        }

        /// <summary>
        /// Redirects to another page and carries over all current 
        /// query string keys and values
        /// </summary>
        /// <param name="url"></param>
        protected void RedirectToPageWithQueryStrings(string url) {
            string queryStringList = string.Empty;

            if (!string.IsNullOrEmpty(url)) {
                if (Request.QueryString.Count > 0) {

                    // rebuild the query string list
                    for (int i = 0; i < Request.QueryString.Count; i++) {
                        queryStringList += string.Format("{0}={1}&",
                            Request.QueryString.GetKey(i), Request.QueryString.Get(i));
                    }

                    // remove the erroneous ampersand
                    queryStringList = queryStringList.TrimEnd(new char[] { '&' });

                    // append the '?' to the beginning
                    if (!string.IsNullOrEmpty(queryStringList)) {
                        url = "?" + queryStringList;
                    }
                }

                RedirectToPage(url);
            }
        }

        #endregion
        #region ViewState Methods

        /// <summary>
        /// Retrieves a value from ViewState
        /// </summary>
        /// <param name="key"></param>
        /// <param name="defaultValue"></param>
        /// <returns></returns>
        protected object getViewStateValue(string key, object defaultValue) {
            return ((ViewState[key] == null) ? defaultValue : ViewState[key]);
        }

        /// <summary>
        /// Sets a value in ViewState
        /// </summary>
        /// <param name="key"></param>
        /// <param name="val"></param>
        protected void setViewStateValue(string key, object val) {
            ViewState[key] = val;
        }

        /// <summary>
        /// Clears a value from ViewState
        /// </summary>
        /// <param name="key"></param>
        protected void clearViewStateValue(string key) {
            ViewState[key] = null;
        }

        #endregion
        #region Cache Methods

        /// <summary>
        /// Returns an item from the application cache
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        protected object GetCachedItem(string key) {
            object returnValue = null;

            try {
                returnValue = Cache.Get(key);
            }
            catch { }

            return returnValue;
        }

        /// <summary>
        /// Adds in item to the application cache
        /// </summary>
        /// <param name="key"></param>
        /// <param name="value"></param>
        /// <param name="minutes"></param>
        protected void SetCachedItem(string key, object value, int minutes) {
            try {
                Cache.Insert(key, value, null, 
                    DateTime.Now.AddMinutes(minutes), TimeSpan.Zero);
            }
            catch { }
        }

        /// <summary>
        /// Clears an item from the application cache
        /// </summary>
        /// <param name="key"></param>
        protected void ClearCachedItem(string key) {
            try {
                Cache.Remove(key);
            }
            catch { }
        }

        #endregion
        protected void gotoPagInicial(string idPpl)
        {
            // Seleciona a página inicial do usuário de acordo com o papel            
            if (idPpl == "2")
                Server.Transfer("prf.aspx");
            else if (idPpl == "4")
                Server.Transfer("atd.aspx");
            else if (idPpl == "3")
                Server.Transfer("exeexa.aspx");
            else if (idPpl == "5")
                Server.Transfer("exeexa.aspx");
            else if (idPpl == "6")
                Server.Transfer("exeexa.aspx");
            else
                Server.Transfer("pes.aspx");
        }
        protected void grd_DataBound(object sender, EventArgs e)
        {
            GridViewRow gvrPager = ((GridView)sender).BottomPagerRow;
            if (gvrPager == null)
                return;
            // get your controls from the gridview
            DropDownList ddlPages = (DropDownList)gvrPager.Cells[0].FindControl("ddlGridPages");
            Label lblPageCount = (Label)gvrPager.Cells[0].FindControl("lblPageCount");

            if (ddlPages != null)
            {
                // populate pager
                for (int i = 0; i < ((GridView)sender).PageCount; i++)
                {
                    int intPageNumber = i + 1;
                    ListItem lstItem = new ListItem(intPageNumber.ToString());
                    if (i == ((GridView)sender).PageIndex)
                        lstItem.Selected = true;
                    ddlPages.Items.Add(lstItem);
                }
            }
            // populate page count
            if (lblPageCount != null)
                lblPageCount.Text = ((GridView)sender).PageCount.ToString();
        }
        protected void grdRowDataBound(object sender, GridViewRowEventArgs e)
        {
            GridView gridView = (GridView)sender;

            if (gridView.SortExpression.Length > 0)
            {
                int cellIndex = -1;
                foreach (DataControlField field in gridView.Columns)
                {
                    if (field.SortExpression == gridView.SortExpression)
                    {
                        cellIndex = gridView.Columns.IndexOf(field);
                        break;
                    }
                }
                if (cellIndex > -1)
                {
                    if (e.Row.RowType == DataControlRowType.Header)
                    {
                        //  this is a header row,
                        //  set the sort style
                        e.Row.Cells[cellIndex].CssClass = gridView.SortDirection == SortDirection.Ascending ? "sortascheaderstyle" : "sortdescheaderstyle";
                    }
                    else if (e.Row.RowType == DataControlRowType.DataRow)
                    {
                        //  this is an alternating row
                        e.Row.Cells[cellIndex].CssClass = e.Row.RowIndex % 2 == 0 ? "sortalternatingrowstyle" : "sortrowstyle";
                    }
                }
            }
            if (e.Row.RowType == DataControlRowType.Pager)
            {
                Label lblTotalNumberOfPages = (Label)e.Row.FindControl("lblTotalNumberOfPages");
                lblTotalNumberOfPages.Text = gridView.PageCount.ToString();

                TextBox txtGoToPage = (TextBox)e.Row.FindControl("txtGoToPage");
                txtGoToPage.Text = (gridView.PageIndex + 1).ToString();

                DropDownList ddlPageSize = (DropDownList)e.Row.FindControl("ddlPageSize");
                ddlPageSize.SelectedValue = gridView.PageSize.ToString();
            }
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    e.Row.Attributes["onmouseover"] = "this.style.cursor='hand';this.style.textDecoration='underline';";
            //    e.Row.Attributes["onmouseout"] = "this.style.textDecoration='none';";

            //    e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(gridView, "Select$" + e.Row.RowIndex);
            //}
        }
    }

}
