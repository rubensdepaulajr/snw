<%@ Page Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" Inherits="Atz_altsnh" Title="Alterar Senha" Codebehind="altsnh.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

<asp:UpdatePanel ID="UpdatePanel2" runat="server">
     <ContentTemplate>
        <div bgcolor="#f4f4f4" style="padding: 0px 0 0 20px;" >
        <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td align="left" style="width: 9px">
                    <img alt="" height="37" src="../Images/tit_left.gif" width="9" /></td>
                <td bgcolor="#f4f4f4">
                    <h2>ALTERAR SENHA</h2>
                </td>
                <td align="left" style="width: 9px">
                    <img alt="" height="37" src="../Images/tit_right.gif" width="9" /></td>
            </tr>
        </table>
        </div>
        <div style="padding: 40px 0 0px 20px;">
            &nbsp;</div>
   
        <table align="left" border="0" cellpadding="0" cellspacing="0">
											<tbody>
                                                <tr>
                                                    <td align="left" colspan="3">
            <asp:Image ID="ImgErr" runat="server" Width="25px"  Height="25px"  
                ImageUrl="../Images/ico_alert.gif" ImageAlign="AbsMiddle" Visible="False" />
            <asp:Label
                ID="lblErr" runat="server" CssClass="erro"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td align="right" style="width: 149px">
                                                    </td>
                                                    <td width="5">
                                                    </td>
                                                    <td align="left">
                                                    </td>
                                                </tr>
											<tr>
												<td align="right" style="width: 149px">Senha Atual:</td>
												<td width="5"></td>
												<td align="left"><span class="cinza-escuro">
                                                    <asp:TextBox ID="txtSnhAtu" runat="server" Text="" CssClass="campo" TextMode="Password"></asp:TextBox></span></td>																				
											</tr>	
											<tr>

												<td colspan="3" height="10"></td>
											</tr>																					
											<tr>
												<td align="right" style="width: 149px">Nova Senha:</td>
												<td width="5"></td>
												<td align="left" colspan="2"><span class="cinza-claro">
                                                    <asp:TextBox ID="txtNovSnh" runat="server" Text="" CssClass="campo" TextMode="Password"></asp:TextBox></span></td>										
											</tr>
											<tr>
												<td colspan="3" height="10"></td>

											</tr>
											<tr>
												<td align="right" style="width: 149px">Repetir Nova Senha:</td>
												<td width="5"></td>
												<td align="left"><span class="cinza-claro">
                                                    <asp:TextBox ID="txtRptSnh" runat="server" Text="" CssClass="campo" TextMode="Password"></asp:TextBox></span></td>
											</tr>	
											<tr>
												<td colspan="3" height="10"></td>

											</tr>
											
											
                                                
          
            <tr><td class="campo" style="width: 149px">&nbsp;</td><td colspan="2" height="35px"  valign="top">
                &nbsp;&nbsp;
                <asp:ImageButton ID="btnAltSnh" runat="server" ImageUrl="~/Images/bt_alterar_senha.gif" OnClick="btnAltSnh_Click" /></td></tr>	                                   								                                                
     
                                             								
			 </tbody></table>
									
										

        </ContentTemplate>
        </asp:UpdatePanel>

</asp:Content>

