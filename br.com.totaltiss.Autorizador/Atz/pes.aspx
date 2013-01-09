<%@ Page Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" Inherits="Atz_pes" Title="Relatório" Codebehind="pes.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <script type="text/javascript">
        $(function() {
        $("input[class *= 'datepicker']").datepicker({
            changeMonth: true,
            changeYear: true,
            monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
            monthNamesShort: ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'],
            dayNames: ['Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado'],
            dayNamesMin: ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sab'],
            nextText: 'Próximo',
            prevText: 'Anterior',
            dateFormat: 'dd/mm/yy'
            });
        });

        $(function($) {
            $(".datepicker").mask("99/99/9999");
            $("[name$='txtIdPdm']").mask("99.99.999-9");
            $("[name$='txtBnfMtr']").mask("99999.999999.99");
        });
	 </script>
    <table  border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td style="padding: 0px 0 0px 20px; height: 37px;">
				<table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td align="left" style="width: 8px"><img src="../images/tit_left.gif" width="9" height="37" 
                                alt="" /></td>
						<td bgcolor="#f4f4f4"><h2>Relatório</h2></td>
						<td align="left" width="9"><img src="../images/tit_right.gif" width="9" height="37" alt="" /></td>
					</tr>
				</table>
			</td>
		</tr>						
		<tr>
			<td align="left" valign="top" style="padding: 20px 0 0 20px;">
			    <table border="0" cellpadding="0" cellspacing="0">
					<tr>
					    <td colspan="3">
					        <asp:Image ID="imgMsg" runat="server" ImageUrl="../Images/ico_alert.gif" Visible="False" />&nbsp;
                            <asp:Label ID="lblMsg" runat="server" class="erro"></asp:Label>
					
					    </td>
					</tr>
					<tr>
					    <td colspan="3" height="25"></td>
					</tr>
					<tr>
						<td align="right" width="150">Data Inicial:</td>
						<td width="5"></td>
						<td align="left"><asp:TextBox ID="txtDatIni" runat="server" CssClass="datepicker" 
                                Width="100px" MaxLength="10"></asp:TextBox></td>
				    </tr>
					<tr>
						<td colspan="3" style="height: 10px"></td>
					</tr>
					<tr>
						<td align="right" width="150" style="height: 22px">Data Final:</td>
						<td width="5" style="height: 22px"></td>
						<td align="left"><asp:TextBox ID="txtDatFim" runat="server" CssClass="datepicker" 
                                Width="100px" MaxLength="10"></asp:TextBox></td>																								
					</tr>
					<tr>
						<td colspan="3" height="10"></td>
					</tr>
					<tr>
						<td align="right" width="150">Ordernar por:</td>
						<td width="5"></td>
						<td align="left">
                            <asp:DropDownList ID="ddlOrd" runat="server" CssClass="campo" 
                                Width="150px">
                                <asp:ListItem Value="1">Data</asp:ListItem>
                                <asp:ListItem Value="4">Procedimento</asp:ListItem>
                                <asp:ListItem Value="3">Guia</asp:ListItem>
                                <asp:ListItem Value="2">Benefici&#225;rio</asp:ListItem>
                            </asp:DropDownList></td>
					</tr>
					<tr>
						<td colspan="3" height="10"></td>
					</tr>		
					<tr>
						<td align="right" width="150">Especialidades:</td>
						<td width="5"></td>
						<td align="left">
                            <asp:DropDownList ID="ddlEsp" runat="server" CssClass="campo" 
                                    AppendDataBoundItems="True" DataTextField="Esp_Dsc" DataValueField="IdEsp" 
                                    Width="400px">
                                <asp:ListItem Value="-1">Selecione</asp:ListItem>
                            </asp:DropDownList>
                        </td>																		
					</tr>
					<tr>
						<td colspan="3" height="10"></td>
					</tr>					
    				<tr>
						<td align="right" width="150" style="height: 20px">Tipo:</td>
						<td width="5" style="height: 20px"></td>
						<td align="left" style="height: 20px">
                            <asp:DropDownList ID="ddlTip" runat="server" CssClass="campo" 
                                    AppendDataBoundItems="True" Width="150px">
                                <asp:ListItem Value="-1">Selecione</asp:ListItem>
                                <asp:ListItem Value="1">Consulta</asp:ListItem>
                                <asp:ListItem Value="2">SP/SADT</asp:ListItem>
                                <asp:ListItem Value="0">Solicita&#231;&#227;o SP/SADT</asp:ListItem>
                                <asp:ListItem Value="3">Solicitação de Internação</asp:ListItem>
                            </asp:DropDownList>
                        </td>																		
					</tr>
					<tr>
						<td colspan="3" height="10"></td>
					</tr>						
					<tr>
						<td align="right" width="150">Situação:</td>
						<td width="5"></td>
						<td align="left">
                            <asp:DropDownList ID="ddlSit" runat="server" CssClass="campo" 
                                   AppendDataBoundItems="True" Width="150px" DataTextField="Sit_Dsc" DataValueField="IdSit">
                                <asp:ListItem Value="-1">Selecione</asp:ListItem>
                            </asp:DropDownList></td>
					</tr>
					<tr>
                    <td colspan="3" height="10">
                        </td>
                    </tr>
                    <tr>
                        <td align="right" width="150">
                            Indicador da Situação:
                        </td>
                        <td width="5">
                        </td>
                        <td align="left">
                            <asp:DropDownList ID="ddlSitInd" runat="server">                                    
                                <asp:ListItem Value="-1">Todos</asp:ListItem>
                                <asp:ListItem Value="A">Autorizados</asp:ListItem>
                                <asp:ListItem Value="N">Negados</asp:ListItem>
                                <asp:ListItem Value="C">Cancelados</asp:ListItem>                                    
                            </asp:DropDownList>
                        </td>
                    </tr>
					<tr>
						<td colspan="3" height="10"></td>
					</tr>						
					<tr>
						<td align="right" width="150">Código do Procedimento:</td>
						<td width="5"></td>
						<td align="left"><asp:TextBox ID="txtIdPdm" runat="server" CssClass="campo" Width="100px"></asp:TextBox></td>
					</tr>
					<tr>
						<td colspan="3" height="10"></td>
					</tr>							
					<tr>
						<td align="right" width="150">Número da Autorização:</td>
						<td width="5"></td>
						<td align="left"><asp:TextBox ID="txtSnh" runat="server" CssClass="campo" Width="100px"></asp:TextBox></td>
					</tr>
					<tr>
						<td colspan="3" height="10"></td>
					</tr>							
					<tr>
					    <td align="right" width="150" style="height: 22px">Matrícula do Beneficiário:</td>
						<td width="5" style="height: 22px"></td>
						<td align="left">
                               <asp:TextBox ID="txtBnfMtr" runat="server" CssClass="campo" Width="100px" ></asp:TextBox></td>
					</tr>
					<tr>
						<td colspan="3" height="10"></td>
					</tr>	
					<tr>
						<td align="right" width="150" style="height: 22px">
                            <asp:Label ID="lblPrf" runat="server" Text="Matrícula do Profissional:"></asp:Label>
                        </td>
				    	<td width="5" style="height: 22px"></td>
					    <td align="left" style="height: 22px" >
                            <asp:TextBox ID="txtPrfMtr" runat="server" CssClass="campo" Width="100px"></asp:TextBox>
                        </td>
					</tr>
					<tr>
						<td colspan="3" height="10"></td>
					</tr>													
                    <tr>
						<td align="right" width="150" style="height: 22px">
                                <asp:Label ID="lblCtt" runat="server" Text="Matrícula do Contratado:"></asp:Label></td>
						<td width="5"></td>
						<td align="left">
                            <asp:TextBox ID="txtIdCtt" runat="server" CssClass="campo" Width="100px"></asp:TextBox></td>
                    </tr>
                    <tr>
					    <td colspan="3" height="10"></td>
                    </tr>
					<tr>
						<td align="right" width="150" style="height: 14px"></td>
						<td width="5" style="height: 14px"></td>
						<td align="left" style="height: 14px; width: 147px;">
                            <asp:ImageButton ID="btnOk" runat="server" ImageUrl="../Images/bt_buscar.gif" 
                                OnClick="btnOk_Click"/></td>											
					</tr>
					<tr>
						<td colspan="3" height="10"></td>
					</tr>																	
				</table>
			</td>
		</tr>													
	</table>
</asp:Content>

