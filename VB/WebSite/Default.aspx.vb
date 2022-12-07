Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls

Partial Public Class Grid_ColumnResizing_OverflowHidden_DataItemTemplate
	Inherits System.Web.UI.Page
	Private Const GridCustomPageSizeName As String = "gridCustomPageSize"
	Protected Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs)
		If Session(GridCustomPageSizeName) IsNot Nothing Then
			grid.SettingsPager.PageSize = CInt(Fix(Session(GridCustomPageSizeName)))
		End If
	End Sub
	Protected Sub grid_CustomCallback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewCustomCallbackEventArgs)
		Dim newPageSize As Integer
		If (Not Integer.TryParse(e.Parameters, newPageSize)) Then
			Return
		End If
		grid.SettingsPager.PageSize = newPageSize
		Session(GridCustomPageSizeName) = newPageSize
		grid.DataBind()
	End Sub
	Protected Function WriteSelectedIndex(ByVal pageSize As Integer) As String
		If pageSize = grid.SettingsPager.PageSize Then
			Return "selected='selected'"
		Else
			Return String.Empty
		End If
	End Function
	Protected Function GetShowingOnPage() As String
		Dim pageSize As Integer = grid.SettingsPager.PageSize
		Dim startIndex As Integer = grid.PageIndex * pageSize + 1
		Dim endIndex As Integer = (grid.PageIndex + 1) * pageSize
		If endIndex > grid.VisibleRowCount Then
			endIndex = grid.VisibleRowCount
		End If
		Return String.Format("Showing {0}-{1} of {2}", startIndex, endIndex, grid.VisibleRowCount)
	End Function
End Class
