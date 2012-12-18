<%@ Page Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" CodeFile="sgnusrinf.aspx.cs" Inherits="Sgn_sgnusrinf" Title="Informações do Usuário" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2 style="text-align: center">Informações do Usuário</h2>
    <p>
        <asp:HiddenField ID="hdfLocked" runat="server" />
        &nbsp;</p>
    <table>
        <tr>
            <td class="tdLabel" style="width: 135px; height: 18px;">
                Login:</td>
            <td style="width: 485px; height: 18px;"><asp:Label runat="server" ID="lblUserName"></asp:Label></td>
        </tr>
        <tr>
            <td class="tdLabel" style="width: 135px; height: 22px">
                Nome do Usuário</td>
            <td style="width: 485px; height: 22px">
                <asp:TextBox ID="txtUsr_Nme" runat="server" MaxLength="70" Width="477px"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="tdLabel" style="width: 135px; height: 22px;">
                Aprovado?</td>
            <td style="width: 485px; height: 22px;">
                <asp:CheckBox ID="IsApproved" runat="server" AutoPostBack="true" 
                    oncheckedchanged="IsApproved_CheckedChanged" />
            </td>
        </tr>
        <tr>
            <td class="tdLabel" style="width: 135px; height: 62px;">
                Bloqueado?</td>
            <td style="width: 485px; height: 62px;"><asp:CheckBox ID="chkIsLockedOut" runat="server" AutoPostBack="true" 
                    oncheckedchanged="IsApproved_CheckedChanged" />
                <asp:Label runat="server" ID="LastLockoutDateLabel"></asp:Label>&nbsp;<br />
            </td>
        </tr>
        <tr>
            <td class="tdLabel" style="width: 135px; height: 25px">
                Observações:</td>
            <td style="width: 485px; height: 25px">
                <asp:TextBox ID="txtComment" runat="server" Height="77px" Width="477px" TextMode="MultiLine"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="tdLabel" style="width: 135px">
            </td>
            <td style="width: 485px">
            </td>
        </tr>
        <tr>
            <td class="tdLabel" colspan="2" style="text-align: center">
                <asp:Button ID="btnSave" runat="server" CssClass="input7" OnClick="btnSave_Click"
                    Text="Gravar" />&nbsp;
                <asp:Button ID="btnCancel" runat="server" CssClass="input7" OnClick="btnCancel_Click"
                    Text="Cancelar" /></td>
        </tr>
        <tr>
            <td class="tdLabel" style="width: 135px">
            </td>
            <td style="width: 485px">
            </td>
        </tr>
    </table>
    <p>
        <asp:Label ID="StatusMessage" CssClass="Important" runat="server"></asp:Label>
    </p>
</asp:Content>
