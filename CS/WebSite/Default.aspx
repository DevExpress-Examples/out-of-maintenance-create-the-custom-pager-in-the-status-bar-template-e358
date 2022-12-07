<%-- BeginRegion TagPrefix and page properties --%>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Grid_ColumnResizing_OverflowHidden_DataItemTemplate" %>
<%@ Register Assembly="DevExpress.Web.v15.1" Namespace="DevExpress.Web"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v15.1" Namespace="DevExpress.Web"  TagPrefix="dxwgv" %>

<%-- EndRegion --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Create the custom pager in the status bar template</title>
<script language="javascript">
</script>    
</head>
<body>
    <form id="form1" runat="server">
    
    <dxwgv:ASPxGridView ID="grid" ClientInstanceName="grid" runat="server" DataSourceID="AccessDataSource1" KeyFieldName="CustomerID" Width="100%" OnCustomCallback="grid_CustomCallback">
        <%-- BeginRegion Grid Columns --%>
        <Columns>
            <dxwgv:GridViewDataColumn FieldName="ContactName" VisibleIndex="0">
            </dxwgv:GridViewDataColumn>
            <dxwgv:GridViewDataColumn FieldName="CompanyName" VisibleIndex="1">
            </dxwgv:GridViewDataColumn>
            <dxwgv:GridViewDataColumn FieldName="City" VisibleIndex="2">
            </dxwgv:GridViewDataColumn>
            <dxwgv:GridViewDataColumn FieldName="Region" VisibleIndex="3">
            </dxwgv:GridViewDataColumn>
            <dxwgv:GridViewDataColumn FieldName="Country" VisibleIndex="4">
            </dxwgv:GridViewDataColumn>
        </Columns>
        <%-- EndRegion --%>
        <Settings ShowStatusBar="Visible"  />
        <SettingsPager Visible="false" />
        <Templates>
            <StatusBar>
            <div style="text-align:right;">
                Records per page: 
                <select onchange="grid.PerformCallback(this.value);" >
                    <option value="5" <%# WriteSelectedIndex(5) %> >5</option>
                    <option value="10"<%# WriteSelectedIndex(10) %>  >10</option>
                    <option value="15" <%# WriteSelectedIndex(15) %> >15</option>
                    <option value="20" <%# WriteSelectedIndex(20) %> >20</option>
                    <option value="25" <%# WriteSelectedIndex(25) %> >25</option>
                </select>&nbsp;
                <%#GetShowingOnPage() %>&nbsp;
                 <a title="First" href="JavaScript:grid.GotoPage(0);">&lt;&lt;</a> &nbsp; 
                 <a title="Prev" href="JavaScript:grid.PrevPage();">&lt;</a> &nbsp;
                Page <input type="text" onchange="if(!grid.InCallback())  grid.GotoPage(parseInt(this.value, 10) - 1)" onkeydown="if (event.keyCode == 13) { event.cancelBubble=true; event.returnValue = false; grid.GotoPage(parseInt(this.value, 10) - 1); return false; }" value="<%# grid.PageIndex + 1 %>" style="width:20px" /> of <%# grid.PageCount %> &nbsp;
                 <a title="Next" href="JavaScript:grid.NextPage();">&gt;</a> &nbsp;
                 <a title="Last" href="JavaScript:grid.GotoPage(<%# grid.PageCount - 1 %>);">&gt;&gt;</a> &nbsp; 
            </div>
            </StatusBar>
        </Templates>
    </dxwgv:ASPxGridView>
    <%-- BeginRegion DataSource--%>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
        SelectCommand="SELECT * FROM [Customers]" DeleteCommand="DELETE FROM [Customers] WHERE [CustomerID] = ?" InsertCommand="INSERT INTO [Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" UpdateCommand="UPDATE [Customers] SET [CompanyName] = ?, [ContactName] = ?, [ContactTitle] = ?, [Address] = ?, [City] = ?, [Region] = ?, [PostalCode] = ?, [Country] = ?, [Phone] = ?, [Fax] = ? WHERE [CustomerID] = ?">
    </asp:AccessDataSource>
    <%-- EndRegion --%>
    </form>
</body>
</html>
