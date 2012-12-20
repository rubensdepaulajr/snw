<%@ Page Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" CodeFile="solcondet.aspx.cs" Theme="Standard" Inherits="solcondet" Title="Consulta Eletiva" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                <tbody>
                    <tr>
                        <td style="width: 943px; height: 443px">
                            <table cellspacing="0" cellpadding="0" width="100%" align=center border=0>
                                <tbody>
                                    <tr>
                                        <td style="padding-right: 0px; padding-left: 5px; padding-bottom: 5px; padding-top: 5px; height: 432px" valign="top">
                                            <table cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
                                                <tbody>
                                                    <tr>
                                                        <td style="width: 752px">
                                                            <table cellspacing="0" cellpadding="0" width="100%" align=left border=0>
                                                                <tbody>
                                                                    <tr>
                                                                        <td style="width: 9px" align="left"><img height="37" alt="" src="../Images/tit_left.gif" width="9" /></td>
                                                                        <td bgColor="#f4f4f4"><h2>Solicitação de Consulta Eletiva</h2></td>
                                                                        <td align="left" width="9"><img height="37" alt="" src="../Images/tit_right.gif" width="9" /></td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="15">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td valign="middle">
                                                            <span class="erro">
                                                                <asp:Image id="imgErr" runat="server" Visible="False" ImageUrl="../Images/ico_alert.gif"></asp:Image> &nbsp;
                                                                <asp:Label id="lblErr" runat="server"></asp:Label>
                                                            </span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; width: 752px; padding-top: 20px" valign="top" align="left">
                                                            <h3>Geral </h3><br />
                                                            <table cellspacing="0" cellpadding="0" align="left" border="0">
                                                                <tbody>
                                                                    <tr>
                                                                        <td style="height: 20px" align="right" width="150">Profissional:</td>
                                                                        <td style="height: 20px" width="5"></td>
                                                                        <td style="height: 20px" align="left">&nbsp;
                                                                            <asp:Label ID="lblPrf_Nme" runat="server"></asp:Label>
                                                                        </td>
                                                                        <td style="height: 20px" align="left" width="20">
                                                                            <a href="#"><img height="16" alt="" src="../Images/ico_ajuda_campos.gif" width="20" border="0" /></a>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="4" height="10"></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="height: 20px" align="right" width="150">Especialidade:</td>
                                                                        <td style="height: 20px" width="5"></td>
                                                                        <td style="height: 20px" align="left">&nbsp;<asp:Label ID="lblEsp_Dsc" runat="server"></asp:Label></td>
                                                                        <td style="height: 20px" align="left" width="20">
                                                                            <a href="#"><img height="16" alt="" src="../Images/ico_ajuda_campos.gif" width=20 border="0" /></a>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="4" height="10"></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="height: 28px" align="right" width="150">Procedimento:</td>
                                                                        <td style="height: 28px" width="5"></td>
                                                                        <td style="height: 28px" align="left">
                                                                            <span class="cinza-claro">&nbsp;
                                                                                <asp:Label id="lblIdPdm" runat="server"></asp:Label>-<asp:Label id="lblPdmDsc" runat="server"></asp:Label>
                                                                            </span>
                                                                        </td>
                                                                        <td style="height: 28px" align="left"></td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                            <br /><br /><br /><br /><br /><br /><br /><h3>Beneficiário </h3><br />
                                                            <div id="resposta-beneficiario">
                                                                <table cellspacing="0" cellpadding="0" align="left" border="0">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td colspan="9" style="height: 10px">
                                                                                <table>
                                                                                    <tbody>
                                                                                        <tr>
                                                                                            <td style="padding-right: 0px; padding-left: 150px; padding-bottom: 0px; width: 477px; padding-top: 0px">
                                                                                                <div class="resultado-beneficiario">
                                                                                                    <asp:Label id="lblBnf" runat="server"></asp:Label>&nbsp;
                                                                                                </div>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </tbody>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div><br /><br /><br /><br /><br />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 752px">&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                            <table cellspacing="0" cellpadding="0" align="left" border="0">
                                                                <tbody>
                                                                    <tr>
                                                                        <td align="right"  style="padding: 0px 0 0 20px;height: 20px;" >Data da Solicitação:</td>
                                                                        <td style="height: 20px" width="5">
                                                                        </td>
                                                                        <td style="height: 20px" align="left">
                                                                            &nbsp;<asp:Label ID="lblGia_DatEms" runat="server"></asp:Label></td>
                                                                        <td style="height: 20px" align="left" >
                                                                            <A href="#">
                                                                                <img height=16 alt="" src="../Images/ico_ajuda_campos.gif" width=20 border=0 /></a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="4" height="10">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="right"  style="padding: 0px 0 0 20px;height: 20px;" >
                                                                            Data da Realização:</td>
                                                                        <td style="height: 20px" width="5">
                                                                        </td>
                                                                        <td style="height: 20px" align="left">
                                                                            &nbsp;<asp:Label ID="lblGpdDatRel" runat="server"></asp:Label></td>
                                                                        <td style="height: 20px" align="left" >
                                                                            <A href="#">
                                                                                <IMG height=16 alt="" src="../Images/ico_ajuda_campos.gif" width="20" border="0" /></a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="4" height="10">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colSpan="4" height="10">
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding: 0px 0 0 20px; height: 14px">
                                                            <asp:ImageButton ID="btnPgaIni" runat="server" ImageUrl="~/Images/bt_home.gif" OnClick="btnPgaIni_Click" />&nbsp;
                                                            <asp:ImageButton ID="btnCancel" runat="server" ImageUrl="~/Images/bt_cancelar_consulta.gif" OnClick="btnCancel_Click" />
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                               </tbody>
                            </table>
                        </td>
                    </tr>
                </tbody>
            </table> 
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
    <asp:HiddenField ID="hdfIdGia" runat="server" />
    <asp:HiddenField ID="hdfSldSdt" runat="server" />
</asp:Content>


