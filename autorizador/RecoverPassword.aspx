<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="RecoverPassword.aspx.cs" Inherits="RecoverPassword" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>Recover Your Password</h2>
    <p>
        <asp:PasswordRecovery ID="RecoverPwd" runat="server" 
            onsendingmail="RecoverPwd_SendingMail">
            <MailDefinition BodyFileName="~/EmailTemplates/PasswordRecovery.txt" 
                Subject="Your password has been reset...">
            </MailDefinition>
        </asp:PasswordRecovery>
    </p>
</asp:Content>
