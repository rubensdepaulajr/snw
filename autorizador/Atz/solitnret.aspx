<%@ Page Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" Theme="Standard" CodeFile="solitnret.aspx.cs" Inherits="Atz_solitnret" Title="Solicitação de Internação - RETORNO" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
      <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td style="width: 1002px">
                <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td align="left" width="9">
                            <img alt="" height="37" src="../Images/tit_left.gif" width="9" /></td>
                        <td bgcolor="#f4f4f4">
                            <h2>
                                Solicitação de Internação</h2>
                        </td>
                        <td align="left" width="9">
                            <img alt="" height="37" src="../Images/tit_right.gif" width="9" /></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td height="15" style="width: 1002px">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="left" style="width: 1002px" valign="top">
                <br />
                <br />
                <table align="center" border="0" cellpadding="20" cellspacing="0" width="95%">
                    <tr bgcolor="#f4f4f4">
                        <td width="1%">
                            <table border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td valign="top">
                                        <img alt="" height="23" src="../Images/ico_negada.gif" style="float: left" width="25" />
                                        &nbsp;</td>
                                    <td style="padding-right: 0px; padding-left: 0px; padding-bottom: 0px; padding-top: 5px"
                                        valign="top">
                                        <strong>SOLICITAÇÃO PENDENTE - BENEFICIÁRIO DEVE BUSCAR AUTORIZAÇÃO NO SM SAÚDE<br />
                                        </strong><br />
                                        <br />
                                        <br />
                                        <br />
                                       
                                        <br />
                                       
                                       
                                       
                                        <strong>Entre em contato com a Central SM Saúde no telefone 0800 286 3320</strong></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr bgcolor="#ffffff">
                        <td align="left"><asp:ImageButton ID="btnNewSol" runat="server" 
                                ImageUrl="~/Images/bt_nova_solicitacao.gif" />&nbsp;<asp:ImageButton 
                                ID="btnFhaPci" runat="server" 
                                ImageUrl="~/Images/bt_ficha.gif" OnClick="btnFhaPci_Click" 
                                Visible="False" />
                           &nbsp; 
                            <asp:ImageButton ID="btnPgaIni" runat="server" 
                                ImageUrl="~/Images/bt_home.gif" OnClick="btnPgaIni_Click" />
                            </td>
                    </tr>
                </table>
                <asp:HiddenField ID="hdfIdItn" runat="server" />
                <asp:HiddenField ID="hdfIdBnf" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>

