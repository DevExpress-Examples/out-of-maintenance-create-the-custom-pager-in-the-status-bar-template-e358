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

public partial class Grid_ColumnResizing_OverflowHidden_DataItemTemplate : System.Web.UI.Page {
    const string GridCustomPageSizeName = "gridCustomPageSize";
    protected void Page_Init(object sender, EventArgs e) {
        if(Session[GridCustomPageSizeName] != null) {
            grid.SettingsPager.PageSize = (int)Session[GridCustomPageSizeName];
        }
    }
    protected void grid_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e) {
        int newPageSize;
        if(!int.TryParse(e.Parameters, out newPageSize)) return;
        grid.SettingsPager.PageSize = newPageSize;
        Session[GridCustomPageSizeName] = newPageSize;
        grid.DataBind();
    }
    protected string WriteSelectedIndex(int pageSize) {
        return pageSize == grid.SettingsPager.PageSize ? "selected='selected'" : string.Empty;
    }
    protected string GetShowingOnPage() {
        int pageSize = grid.SettingsPager.PageSize;
        int startIndex = grid.PageIndex * pageSize + 1;
        int endIndex = (grid.PageIndex + 1) * pageSize;
        if(endIndex > grid.VisibleRowCount) {
            endIndex = grid.VisibleRowCount;
        }
        return string.Format("Showing {0}-{1} of {2}", startIndex, endIndex, grid.VisibleRowCount);
    }
}
