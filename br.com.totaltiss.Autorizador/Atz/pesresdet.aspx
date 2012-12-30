<%@ Page Language="C#" MasterPageFile="~/Atz2.master" AutoEventWireup="true" Inherits="Atz_pesresdet" Title="Detalhes do Registro" Codebehind="pesresdet.aspx.cs" %>
<%@ PreviousPageType VirtualPath="~/atz/pesres.aspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <table width="100%">
        <tr>
            <td style="padding: 0px 0 0px 20px;" >
                <table  border="0" cellpadding="0" cellspacing="0" width="100%">
	                <tr>
		                <td style="width: 899px">
			                <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
				                <tr>
					                <td align="left" width="9"  ><img src="../images/tit_left.gif" width="9" height="37" alt="" /></td>
					                <td bgcolor="#f4f4f4"><h2>Detalhes do Registro</h2></td>
					                <td align="left" width="9"><img src="../images/tit_right.gif" width="9" height="37" alt="" /></td>
				                </tr>
			                </table>
		                </td>
	                </tr>
	                <tr>
		                <td height="15" style="width: 899px">&nbsp;</td>
	                </tr>
                    <tr>
                        <td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px;
                            height: 47px">&nbsp;
                            <asp:ImageButton 
                                ID="btnPgaIni" runat="server" ImageUrl="~/Images/bt_home.gif" 
                                OnClick="btnPgaIni_Click" Width="119px" />
                            <img src="../Images/Spacer.gif" style="width: 1px; height: 1px" alt="" />
                            <asp:ImageButton ID="btnNewPsq" runat="server" 
                                ImageUrl="~/Images/bt_nova_pesquisa.gif" OnClick="btnNewPsq_Click" 
                                Width="130px" />
                            <img src="../Images/Spacer.gif" style="width: 1px; height: 1px" alt"" />
                            <asp:ImageButton ID="btnAud" runat="server" ImageUrl="~/Images/bt_ativar.gif" 
                                onclick="btnAud_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 899px; height: 15px;">
                        </td>
                    </tr>
	                <tr>
		                <td valign="middle" align="right" height="26" bgcolor="#e6e6e6" style="padding: 0 10px 0 10px; border-top: 1px solid #fff; width: 899px;">
			                <table border="0" cellpadding="0" cellspacing="0" width="100%">
				                <tr>
					                <td align="right" width="22%" style="height: 14px">Data e hora</td>
					                <td align="left" style="padding: 0 0 0 10px; height: 14px;"><span class="cinza-escuro">
                                        <asp:Label ID="lblDat" runat="server" CssClass="cinza-escuro"></asp:Label></span></td>
				                </tr>
			                </table>
		                </td>
	                </tr>			
	                <tr>
		                <td valign="middle" align="right" height="26" bgcolor="#f4f4f4" style="padding: 0 10px 0 10px; border-top: 1px solid #fff; width: 899px;">
			                <table border="0" cellpadding="0" cellspacing="0" width="100%">
				                <tr>
					                <td align="right" width="22%" style="height: 14px">Matrícula do Contratado</td>
					                <td align="left" style="padding: 0 0 0 10px; height: 14px;"><span class="cinza-escuro">
                                        <asp:Label ID="lblIdCtt" runat="server"></asp:Label></span></td>
				                </tr>
			                </table>								
		                </td>
	                </tr>		
	                <tr>
		                <td valign="middle" align="right" height="26" bgcolor="#e6e6e6" style="padding: 0 10px 0 10px; border-top: 1px solid #fff; width: 899px;">
			                <table border="0" cellpadding="0" cellspacing="0" width="100%">
				                <tr>
					                <td align="right" width="22%" style="height: 16px">Matricula do Profissional</td>
					                <td align="left" style="padding: 0 0 0 10px; height: 16px;"><span class="cinza-escuro">
                                        <asp:Label ID="lblPrfMtr" runat="server"></asp:Label></span></td>
				                </tr>
			                </table>								
		                </td>
	                </tr>		
	                <tr>
		                <td valign="middle" align="right" bgcolor="#f4f4f4" style="padding: 0 10px 0 10px; border-top: 1px solid #fff; height: 26px; width: 899px;">
			                <table border="0" cellpadding="0" cellspacing="0" width="100%">
				                <tr>
					                <td align="right" width="22%">
                                        Matrícula do Beneficiário</td>
                                    <td align="left" style="padding: 0 0 0 10px;">
                                        <span class="cinza-escuro">
                                            <asp:Label ID="lblBnfMtr" runat="server"></asp:Label></span></td>
				                </tr>
			                </table>								
		                </td>
	                </tr>		
	                <tr>
		                <td valign="middle" align="right" height="26" bgcolor="#e6e6e6" style="padding: 0 10px 0 10px; border-top: 1px solid #fff; width: 899px;">
			                <table border="0" cellpadding="0" cellspacing="0" width="100%">
				                <tr>
					                <td align="right" width="22%" style="height: 14px">
                                        Nome do Beneficiário</td>
                                    <td align="left" style="padding: 0 0 0 10px; height: 14px;">
                                        <span class="cinza-escuro">
                                            <asp:Label ID="lblBnfNme" runat="server"></asp:Label></span></td>
				                </tr>
			                </table>								
		                </td>
	                </tr>		
                    <tr>
                        <td valign="middle" align="right" bgcolor="#f4f4f4" style="padding: 0 10px 0 10px; border-top: 1px solid #fff; height: 26px; width: 899px;">
                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td align="right" width="22%" style="height: 16px">Tipo</td>
                                    <td align="left" style="padding: 0 0 0 10px; height: 16px;">
                                        <span class="cinza-escuro">
                                            <asp:Label ID="lblGiaTip" runat="server"></asp:Label></span></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td valign="middle" align="right" bgcolor="#e6e6e6" style="padding: 0 10px 0 10px; border-top: 1px solid #fff; height: 26px; width: 899px;">
                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td align="right" width="22%" style="height: 16px">Caráter</td>
                                    <td align="left" style="padding: 0 0 0 10px; height: 16px;">
                                        <span class="cinza-escuro">
                                            <asp:Label ID="lblGiaCrt" runat="server"></asp:Label></span></td>
                                </tr>
                            </table>
                        </td>
                    </tr>                    
                    <tr>
                        <td valign="middle" align="right" height="26" bgcolor="#f4f4f4" style="padding: 0 10px 0 10px; border-top: 1px solid #fff; width: 899px;">
                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td align="right" width="22%" style="height: 14px">
                                        Código do Procedimento</td>
                                    <td align="left" style="padding: 0 0 0 10px; height: 14px;">
                                        <span class="cinza-escuro">
                                            <asp:Label ID="lblPdmCod" runat="server"></asp:Label></span></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td valign="middle" align="right" bgcolor="#e6e6e6" style="padding: 0 10px 0 10px; border-top: 1px solid #fff; height: 26px; width: 899px;">
                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td align="right" width="22%" style="height: 16px">
                                        Descrição do Procedimento</td>
                                    <td align="left" style="padding: 0 0 0 10px; height: 16px;">
                                        <span class="cinza-escuro">
                                            <asp:Label ID="lblPdmDsc" runat="server"></asp:Label></span></td>
                                </tr>
                            </table>
                        </td>
                    </tr>




                    <tr>
                        <td valign="middle" align="right" bgcolor="#f4f4f4" style="padding: 0 10px 0 10px; border-top: 1px solid #fff; height: 26px; width: 899px;">
                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td align="right" width="22%" style="height: 16px">
                                        CH</td>
                                    <td align="left" style="padding: 0 0 0 10px; height: 16px;">
                                        <span class="cinza-escuro">
                                            <asp:Label ID="lblPdmQtdCh_" runat="server"></asp:Label></span></td>
                                </tr>
                            </table>
                        </td>
                    </tr>






                    <tr>
                        <td valign="middle" align="right" height="26" bgcolor="#e6e6e6" style="padding: 0 10px 0 10px; border-top: 1px solid #fff; width: 899px;">
                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td align="right" width="22%" style="height: 14px">Quantidade Solicitada</td>
                                    <td align="left" style="padding: 0 0 0 10px; height: 14px;">
                                        <span class="cinza-escuro">
                                            <asp:Label ID="lblQtdSol" runat="server"></asp:Label></span></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td valign="middle" align="right" bgcolor="#f4f4f4" style="padding: 0 10px 0 10px; border-top: 1px solid #fff; height: 26px; width: 899px;">
                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td align="right" width="22%">Quantidade Autorizada</td>
                                    <td align="left" style="padding: 0 0 0 10px;">
                                        <span class="cinza-escuro">
                                            <asp:Label ID="lblQtdAtz" runat="server"></asp:Label></span></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td valign="middle" align="right" height="26" bgcolor="#e6e6e6" style="padding: 0 10px 0 10px; border-top: 1px solid #fff; width: 899px;">
                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td align="right" width="22%" style="height: 14px">Situação</td>
                                    <td align="left" style="padding: 0 0 0 10px; height: 14px;">
                                        <span class="cinza-escuro">
                                            <asp:Label ID="lblSit" runat="server"></asp:Label></span></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td valign="middle" align="right" bgcolor="#f4f4f4" style="padding: 0 10px 0 10px; border-top: 1px solid #fff; height: 26px; width: 899px;">
                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td align="right" width="22%">
                                        Código da Autorização</td>
                                    <td align="left" style="padding: 0 0 0 10px;">
                                        <span class="cinza-escuro">
                                            <asp:Label ID="lblSnh" runat="server"></asp:Label></span></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td valign="middle" align="right" height="26" bgcolor="#e6e6e6" style="padding: 0 10px 0 10px; border-top: 1px solid #fff; width: 899px;">
                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td align="right" width="22%" style="height: 14px">Profissional Solicitante</td>
                                    <td align="left" style="padding: 0 0 0 10px; height: 14px;">
                                        <span class="cinza-escuro">
                                            <asp:Label ID="lblPrfSol" runat="server"></asp:Label></span></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td valign="middle" align="right" bgcolor="#f4f4f4" style="padding: 0 10px 0 10px; border-top: 1px solid #fff; height: 26px; width: 899px;">
                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td align="right" style="width: 22%; height: 15px">
                                        Especialidade Solicitação</td>
                                    <td align="left" style="padding: 0 0 0 10px; height: 15px;">
                                        <span class="cinza-escuro">
                                            <asp:Label ID="lblEspSol" runat="server"></asp:Label></span></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td valign="middle" align="right" height="26" bgcolor="#e6e6e6" style="padding: 0 10px 0 10px; border-top: 1px solid #fff; width: 899px;">
                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td align="right" width="22%" style="height: 14px">
                                        Profissional&nbsp; Executante</td>
                                    <td align="left" style="padding: 0 0 0 10px; height: 14px;">
                                        <span class="cinza-escuro">
                                            <asp:Label ID="lblPrfExe" runat="server"></asp:Label></span></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td valign="middle" align="right" bgcolor="#f4f4f4" style="padding: 0 10px 0 10px; border-top: 1px solid #fff; height: 26px; width: 899px;">
                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td align="right" width="22%" style="height: 16px">
                                        Especialidade Execução</td>
                                    <td align="left" style="padding: 0 0 0 10px; height: 16px;">
                                        <span class="cinza-escuro">
                                            <asp:Label ID="lblEspExe" runat="server"></asp:Label></span></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px;
                            height: 47px">&nbsp;
                            <asp:ImageButton ID="btnPgaIni2" runat="server" ImageUrl="~/Images/bt_home.gif" OnClick="btnPgaIni_Click" />&nbsp;
                            <asp:ImageButton ID="btnNewPsq2" runat="server" ImageUrl="~/Images/bt_nova_pesquisa.gif" OnClick="btnNewPsq_Click" /></td>
                    </tr>                																																																												
                </table>
            </td>
        </tr>
    </table>	
</asp:Content>

