<%@ page language="C#" autoeventwireup="true" inherits="Rpt_Default" Codebehind="~/App_Rpt/Rpt.aspx.cs" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Relatório</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt"
            Height="450px" Width="100%" BackColor="#0066CC" Font-Bold="True" LinkActiveColor="Purple" LinkDisabledColor="White" ShowCredentialPrompts="False" Font-Italic="False" ShowBackButton="True">
            <LocalReport ReportPath="">
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetData"
            TypeName="QmcSubTableAdapters.ssQmc_MssRptTableAdapter" OldValuesParameterFormatString="original_{0}">
            <SelectParameters>
                <asp:Parameter Name="IdSstOrig" Type="Int32" />
                <asp:Parameter Name="IdSstDest" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:Label ID="lblBack" runat="server" Text='<a href="javascript:history.back()">Voltar</a>'></asp:Label><br />
        &nbsp;
        </div>
    </form>
</body>
</html>
