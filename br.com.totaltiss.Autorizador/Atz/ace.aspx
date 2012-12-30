<%@ Page Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" Inherits="Atz_ace" Title="ACE" Codebehind="ace.aspx.cs" %>
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
		$(function ($) {
			$(".datepicker").mask("99/99/9999");
			$("[name$='txtBnf_Mtr']").mask("99999.999999.99");
		});
	 </script>
	<asp:MultiView ID="mvw" runat="server" ActiveViewIndex="0">
		<asp:View ID="vw1" runat="server">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px;
						height: 37px">
						<table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td align="left" style="width: 8px">
									<img alt="" height="37" src="../images/tit_left.gif" width="9" /></td>
								<td bgcolor="#f4f4f4">
									<h2>
										ACE</h2>
								</td>
								<td align="left" width="9">
									<img alt="" height="37" src="../images/tit_right.gif" width="9" /></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td align="left" style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px;
						padding-top: 20px" valign="top">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td colspan="3">
									
								</td>
							</tr>
							<tr>
								<td colspan="3" height="25">
								</td>
							</tr>
							<tr>
								<td colspan="3" height="25" align="center">
									<asp:RadioButtonList ID="rblTip" runat="server" RepeatDirection="Horizontal" 
										onselectedindexchanged="rblTip_SelectedIndexChanged" AutoPostBack="True" >
										<asp:ListItem Value="1" Text="Especialidade" Selected="True"></asp:ListItem>
										<asp:ListItem Value="2" Text="Profissional"></asp:ListItem>
										<asp:ListItem Value="3">Especialidade Mensal</asp:ListItem>
										<asp:ListItem Value="4">Profissional Mensal</asp:ListItem>
										<asp:ListItem Value="5">Pontuado</asp:ListItem>
                                        <asp:ListItem Value="6">Pontuado por Município</asp:ListItem>
									</asp:RadioButtonList>
								</td>
							</tr>
							<tr>
								<td colspan="3" style="height: 10px">
								</td>
							</tr>
							<tr>
								<td align="right" width="150">
									Data Inicial:</td>
								<td width="5">
								</td>
								<td align="left">
									<asp:TextBox ID="txtDatIni" runat="server" Width="100px" CssClass="datepicker"></asp:TextBox>
									
								</td>
							</tr>
							<tr>
								<td colspan="3" style="height: 10px">
								</td>
							</tr>
							<tr>
								<td align="right" style="height: 22px" width="150">
									Data Final:</td>
								<td style="height: 22px" width="5">
								</td>
								<td align="left">
									<asp:TextBox ID="txtDatFim" runat="server" Width="100px" CssClass="datepicker" 
										SkinID="datepicker"></asp:TextBox></td>
							</tr>
							<tr>
								<td colspan="3" height="10">
								</td>
							</tr>
							<tr>
								<td align="right" width="150">
									Caráter:</td>
								<td width="5">
								</td>
								<td align="left">
									<asp:DropDownList ID="ddlCrt" runat="server" Width="150px">
										<asp:ListItem Value="-1">Todas</asp:ListItem>
										<asp:ListItem Value="E">Eletiva</asp:ListItem>
										<asp:ListItem Value="U">Urgência</asp:ListItem>
									</asp:DropDownList></td>
							</tr>
							<tr>
								<td colspan="3" height="10">
								</td>
							</tr>
							<tr>
								<td align="right" width="150">
									Situação:</td>
								<td width="5">
								</td>
								<td align="left">
									<asp:DropDownList ID="ddlSit" runat="server" AppendDataBoundItems="True"
										Width="150px" DataTextField="Sit_Dsc" DataValueField="IdSit">
										<asp:ListItem Value="-1">Todas</asp:ListItem>
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
								<td colspan="3" height="10">
								</td>
							</tr>
							<tr>
								<td align="right" width="150">
									Especialidade:</td>
								<td width="5">
								</td>
								<td align="left">
									<asp:DropDownList runat="server" ID="ddlEsp" AppendDataBoundItems="true" 
										DataValueField="IdEsp" DataTextField="Esp_Dsc">
										<asp:ListItem Value="-1">Todas</asp:ListItem>
									</asp:DropDownList>
								</td>
							</tr>
							<tr>
								<td colspan="3" height="10">
								</td>
							</tr>
							<tr>
								<td align="right" style="height: 22px" width="150">
									Matrícula do Beneficiário:</td>
								<td style="height: 22px" width="5">
								</td>
								<td align="left">
									<asp:TextBox ID="txtBnf_Mtr" runat="server" Width="100px"></asp:TextBox></td>
							</tr>
							<tr>
								<td colspan="3" height="10">
								</td>
							</tr>
							<tr>
								<td align="right" style="height: 22px" width="150">
									Matrícula do Contratado:</td>
								<td width="5">
								</td>
								<td align="left">
									<asp:TextBox ID="txtIdCtt" runat="server" Width="100px"></asp:TextBox></td>
							</tr>
							<tr>
								<td colspan="3" height="10">
								</td>
							</tr>
							<tr>
								<td align="right" style="height: 22px" width="150">
									Matrícula do Profissional:</td>
								<td style="height: 22px" width="5">
								</td>
								<td align="left">
									<asp:TextBox ID="txtPrf_Mtr" runat="server" Width="100px"></asp:TextBox></td>
							</tr>
							<tr>
								<td colspan="3" height="10">
								</td>
							</tr>


                            <tr>
								<td align="right" style="height: 22px" width="150">
									<asp:Label ID="lblMun" runat="server" Text="Município:"></asp:Label>
                                </td>
								<td style="height: 22px" width="5">
								</td>
								<td align="left">
									<asp:DropDownList ID="ddlMun" runat="server" DataSourceID="dtsMun" 
                                        DataTextField="Mun_Nme" DataValueField="IdMun" 
                                        AppendDataBoundItems="True" >
                                        <asp:ListItem Value="-1">Todos</asp:ListItem>
                                    </asp:DropDownList></td>
							</tr>
							<tr>
								<td colspan="3" height="10">
								</td>
							</tr



							<tr>
								<tr>
                                    <td align="center" colspan="3" height="25">
                                        <asp:RadioButtonList ID="rblTipSai" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem Selected="True" Text="Visualizar" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Exportar" Value="2"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                            </tr>
                            <tr>
                                <td colspan="3" height="10">
                                    <asp:Panel ID="pnlPto" runat="server" style="text-align: center" 
                                        Visible="False">
                                        <br />
                                        <asp:Label ID="lblMed" runat="server" Text="Média: "></asp:Label>
                                        <asp:TextBox ID="txtMed" runat="server" Width="50px"></asp:TextBox>
                                        &nbsp;
                                        <asp:Label ID="lblQtd" runat="server" Text="Quantidade: "></asp:Label>
                                        <asp:TextBox ID="txtQtd" runat="server" Width="50px"></asp:TextBox>
                                        &nbsp;
                                        <asp:Label ID="lblVlr" runat="server" Text="Valor: "></asp:Label>
                                        <asp:TextBox ID="txtVlr" runat="server" Width="50px"></asp:TextBox>
                                        <br />
                                    </asp:Panel>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" height="10">
                                    <asp:Image ID="imgMsg" runat="server" ImageUrl="../Images/ico_alert.gif" 
                                        Visible="False" />
                                    &nbsp;<asp:Label ID="lblMsg" runat="server" class="erro"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="height: 14px" width="150">
                                </td>
                                <td style="height: 14px" width="5">
                                </td>
                                <td align="left" style="width: 147px; height: 14px">
                                    <asp:ImageButton ID="btnOk" runat="server" ImageUrl="../Images/bt_buscar.gif" 
                                        OnClick="btnOk_Click" />
                                </td>
                            </tr>
						</table>
                    </td>
            </table>
		</asp:View>
		<asp:View ID="vw2" runat="server">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td>
						<table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td align="left" style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px;
									padding-top: 0px; height: 37px" width="9">
									<img alt="" height="37" src="../Images/tit_left.gif" width="9" /></td>
								<td bgcolor="#f4f4f4" style="height: 37px">
									<h2>
										ACE Especialidade - Resultado da Pesquisa</h2>
								</td>
								<td align="left" style="height: 37px" width="9">
									<img alt="" height="37" src="../Images/tit_right.gif" width="9" /></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="15">
						&nbsp;</td>
				</tr>
				<tr>
					<td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px;
						height: 47px">
						<div align="left">
							<asp:Label ID="lblTotEsp" runat="server"></asp:Label>
						</div>
						<br />
						<asp:GridView ID="grdEsp" runat="server" AutoGenerateColumns="False" 
							DataSourceID="dtsEsp" OnDataBound="grd_DataBound"
							Width="100%" AllowSorting="True">
							<Columns>
								<asp:BoundField DataField="Esp_Dsc" HeaderText="Especialidade" 
									SortExpression="Esp_Dsc" />
								<asp:BoundField DataField="QtdCon" HeaderText="Consultas" 
									SortExpression="QtdCon" />
								<asp:BoundField DataField="QtdSol" HeaderText="Solicitações" 
									SortExpression="QtdSol" />
								<asp:BoundField DataField="QtdExa" HeaderText="SP/SADT" 
									SortExpression="QtdExa" >
								</asp:BoundField>
								<asp:BoundField DataField="Med" HeaderText="Média" SortExpression="Med" />
								<asp:BoundField DataField="Prc" HeaderText="%" SortExpression="Prc" />
								<asp:BoundField DataField="Eag" HeaderText="EAG" SortExpression="Eag" />
								<asp:BoundField DataField="Vlr" HeaderText="Valor" SortExpression="Vlr" />
							</Columns>
							<FooterStyle Font-Bold="True" ForeColor="White" />
							<PagerTemplate>
								<div align="center" height="20">
									<asp:ImageButton ID="ImageButton1SolPendentes" runat="server" CommandArgument="First"
										ImageUrl="~/Images/seta1_1_on.gif" OnCommand="paginateGrdEsp" />&nbsp;
									<asp:ImageButton ID="ImageButton2SolPendentes" runat="server" CommandArgument="Prev"
										ImageUrl="~/Images/seta1_2_on.gif" OnCommand="paginateGrdEsp" />
									Página
									<asp:DropDownList ID="ddlGridPages" runat="server" AutoPostBack="True" CssClass="campo"
										OnSelectedIndexChanged="ddlGrdEspPages_SelectedIndexChanged">
									</asp:DropDownList>
									de
									<asp:Label ID="lblPageCount" runat="server"></asp:Label>&nbsp;
									<asp:ImageButton ID="ImageButton3SolPendentes" runat="server" CommandArgument="Next"
										ImageUrl="~/Images/seta2_1_on.gif" OnCommand="paginateGrdEsp" />&nbsp;
									<asp:ImageButton ID="ImageButton4SolPendentes" runat="server" CommandArgument="Last"
										ImageUrl="~/Images/seta2_2_on.gif" OnCommand="paginateGrdEsp" /></div>
							</PagerTemplate>
						</asp:GridView>
						&nbsp; &nbsp;
						<asp:SqlDataSource ID="dtsEsp" runat="server" CancelSelectOnNullParameter="False"
								ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" 
								SelectCommand="srAtz_AceEsp" onselected="dtsEsp_Selected" 
							SelectCommandType="StoredProcedure">
							<SelectParameters>
								<asp:Parameter Name="DatIni" Type="DateTime" />
								<asp:Parameter Name="DatFim" Type="DateTime"/>
								<asp:Parameter Name="IdEsp" Type ="Int32" />
								<asp:Parameter Name="IdCtt" Type ="Int64" />
								<asp:Parameter Name="Prf_Mtr" Type="String" />
								<asp:Parameter Name="IdSit" Type="Int16" />
								<asp:Parameter Name="Sit_Ind" Type="String" />
								<asp:Parameter Name="Bnf_Mtr" Type="String" />
								<asp:Parameter Name="Gia_Crt" Type="String" />
								<asp:Parameter Direction="InputOutput" Name="Out_Tot" Type="Double" />
							</SelectParameters>
						</asp:SqlDataSource>
						<div align="right">
							&nbsp; <a href="pes.aspx"></a>
						</div>
					</td>
				</tr>
			</table>
		</asp:View>
		<asp:View ID="vw3" runat="server">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td>
						<table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td align="left" style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px;
									padding-top: 0px; height: 37px" width="9">
									<img alt="" height="37" src="../Images/tit_left.gif" width="9" /></td>
								<td bgcolor="#f4f4f4" style="height: 37px">
									<h2>
										ACE Profissional - Resultado da Pesquisa</h2>
								</td>
								<td align="left" style="height: 37px" width="9">
									<img alt="" height="37" src="../Images/tit_right.gif" width="9" /></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="15">
						&nbsp;</td>
				</tr>
				<tr>
					<td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px;
						height: 47px">
						<div align="left">
							<asp:Label ID="lblTotPrf" runat="server"></asp:Label>
							&nbsp;&nbsp;<a href="pes.aspx"></a> &nbsp;</div>
						<br />
						<asp:GridView ID="grdPrf" runat="server" AutoGenerateColumns="False" 
							DataSourceID="dtsPrf" OnDataBound="grd_DataBound"
							Width="100%" AllowSorting="True">
							<Columns>
								<asp:BoundField DataField="Esp_Dsc" HeaderText="Especialidade" 
										SortExpression="Esp_Dsc" />
								<asp:BoundField DataField="Prf_Mtr" HeaderText="Matrícula" 
									SortExpression="Prf_Mtr" />
								<asp:BoundField DataField="Prf_Nme" HeaderText="Profissional" 
									SortExpression="Prf_Nme" />
								<asp:BoundField DataField="QtdCon" HeaderText="Consultas" 
									SortExpression="QtdCon" />
								<asp:BoundField DataField="QtdSol" HeaderText="Solicitações" 
									SortExpression="QtdSol" />
								<asp:BoundField DataField="QtdExa" HeaderText="SP/SADT"
									SortExpression="QtdExa" />
								<asp:BoundField DataField="Med" HeaderText="Média" SortExpression="Med" />
								<asp:BoundField DataField="Prc" HeaderText="%" SortExpression="Prc" />
								<asp:BoundField DataField="Eag" HeaderText="EAG" SortExpression="Eag" />
								<asp:BoundField DataField="Vlr" HeaderText="Valor" SortExpression="Vlr" />
							</Columns>
							<FooterStyle Font-Bold="True" ForeColor="White" />
							<PagerTemplate>
								<div align="center" height="20">
									<asp:ImageButton ID="ImageButton1SolPendentes" runat="server" CommandArgument="First"
										ImageUrl="~/Images/seta1_1_on.gif" OnCommand="paginateGrdPrf" />&nbsp;
									<asp:ImageButton ID="ImageButton2SolPendentes" runat="server" CommandArgument="Prev"
										ImageUrl="~/Images/seta1_2_on.gif" OnCommand="paginateGrdPrf" />
									Página
									<asp:DropDownList ID="ddlGridPages" runat="server" AutoPostBack="True" CssClass="campo"
										OnSelectedIndexChanged="ddlGrdPrfPages_SelectedIndexChanged">
									</asp:DropDownList>
									de
									<asp:Label ID="lblPageCount" runat="server"></asp:Label>&nbsp;
									<asp:ImageButton ID="ImageButton3SolPendentes" runat="server" CommandArgument="Next"
										ImageUrl="~/Images/seta2_1_on.gif" OnCommand="paginateGrdPrf" />&nbsp;
									<asp:ImageButton ID="ImageButton4SolPendentes" runat="server" CommandArgument="Last"
										ImageUrl="~/Images/seta2_2_on.gif" OnCommand="paginateGrdPrf" />
								</div>
							</PagerTemplate>
						</asp:GridView>
						&nbsp; &nbsp;
						<asp:SqlDataSource ID="dtsPrf" runat="server" CancelSelectOnNullParameter="False"
								ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" 
								
							SelectCommand="srAtz_AcePrf" onselected="dtsPrf_Selected" 
							SelectCommandType="StoredProcedure">
							<SelectParameters>
								<asp:Parameter Name="DatIni" Type="DateTime" />
								<asp:Parameter Name="DatFim" Type="DateTime"/>
								<asp:Parameter Name="IdEsp" Type ="Int32" />
								<asp:Parameter Name="IdCtt" Type ="Int64" />
								<asp:Parameter Name="Prf_Mtr" Type="String" />
								<asp:Parameter Name="IdSit" Type="Int16" />
								<asp:Parameter Name="Sit_Ind" Type="String" />
								<asp:Parameter Name="Bnf_Mtr" Type="String" />
								<asp:Parameter Name="Gia_Crt" Type="String" />
								<asp:Parameter Direction="InputOutput" Name="Out_Tot" Type=Double />
							</SelectParameters>
						</asp:SqlDataSource>
						<div align="right">
							&nbsp; <a href="pes.aspx"></a>
						</div>
					</td>
				</tr>
				<tr>
					<td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px;
						height: 47px">
							&nbsp;</td>
				</tr>
			</table>
		</asp:View>
		<asp:View ID="vw4" runat="server">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td>
						<table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td align="left" style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px;
									padding-top: 0px; height: 37px" width="9">
									<img alt="" height="37" src="../Images/tit_left.gif" width="9" /></td>
								<td bgcolor="#f4f4f4" style="height: 37px">
									<h2>
										ACE Especialidade Mensal - Resultado da Pesquisa</h2>
								</td>
								<td align="left" style="height: 37px" width="9">
									<img alt="" height="37" src="../Images/tit_right.gif" width="9" /></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="15">
						&nbsp;</td>
				</tr>
				<tr>
					<td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px;
						height: 47px">
						<div align="left">
							<asp:Label ID="Label2" runat="server"></asp:Label>
							&nbsp;&nbsp;<a href="pes.aspx"></a> &nbsp;</div>
						<br />
						<asp:GridView ID="grdEspMes" runat="server" AutoGenerateColumns="False" 
							DataSourceID="dtsEspMes" OnDataBound="grd_DataBound"
							Width="100%" AllowSorting="True" 
							EnableModelValidation="True">
							<Columns>
								<asp:BoundField DataField="AnoMes" HeaderText="Competência" 
									SortExpression="AnoMes" />
								<asp:BoundField DataField="Esp_Dsc" HeaderText="Especialidade" 
									SortExpression="Esp_Dsc" />
								<asp:BoundField DataField="QtdCon" HeaderText="Consultas" 
									SortExpression="QtdCon" />
								<asp:BoundField DataField="QtdSol" HeaderText="Solicitações" 
									SortExpression="QtdSol" />
								<asp:BoundField DataField="QtdExa" HeaderText="SP/SADT"
									SortExpression="QtdExa" />
								<asp:BoundField DataField="Med" HeaderText="Med" SortExpression="Med" />
								<asp:BoundField DataField="Prc" HeaderText="Prc" SortExpression="Prc" />
								<asp:BoundField DataField="Eag" HeaderText="Eag" SortExpression="Eag" />
								<asp:BoundField DataField="Vlr" HeaderText="Vlr" SortExpression="Vlr" />
							</Columns>
							<FooterStyle Font-Bold="True" ForeColor="White" />
							<PagerTemplate>
								<div align="center" height="20">
									<asp:ImageButton ID="ImageButton1SolPendentes" runat="server" CommandArgument="First"
										ImageUrl="~/Images/seta1_1_on.gif" OnCommand="paginateGrdEspMes" />&nbsp;
									<asp:ImageButton ID="ImageButton2SolPendentes" runat="server" CommandArgument="Prev"
										ImageUrl="~/Images/seta1_2_on.gif" OnCommand="paginateGrdEspMes" />
									Página
									<asp:DropDownList ID="ddlGridPages" runat="server" AutoPostBack="True" CssClass="campo"
										OnSelectedIndexChanged="ddlGrdEspMesPages_SelectedIndexChanged">
									</asp:DropDownList>
									de
									<asp:Label ID="lblPageCount" runat="server"></asp:Label>&nbsp;
									<asp:ImageButton ID="ImageButton3SolPendentes" runat="server" CommandArgument="Next"
										ImageUrl="~/Images/seta2_1_on.gif" OnCommand="paginateGrdEspMes" />&nbsp;
									<asp:ImageButton ID="ImageButton4SolPendentes" runat="server" CommandArgument="Last"
										ImageUrl="~/Images/seta2_2_on.gif" OnCommand="paginateGrdEspMes" />
								</div>
							</PagerTemplate>
						</asp:GridView>
						&nbsp; &nbsp;
						<asp:SqlDataSource ID="dtsEspMes" runat="server" CancelSelectOnNullParameter="False"
								ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" 
								
							SelectCommand="srAtz_AceEspMes" onselected="dtsPrf_Selected" 
							SelectCommandType="StoredProcedure">
							<SelectParameters>
								<asp:Parameter Name="DatIni" Type="DateTime" />
								<asp:Parameter Name="DatFim" Type="DateTime"/>
								<asp:Parameter Name="IdEsp" Type ="Int32" />
								<asp:Parameter Name="IdCtt" Type ="Int64" />
								<asp:Parameter Name="Prf_Mtr" Type="String" />
								<asp:Parameter Name="IdSit" Type="Int16" />
								<asp:Parameter Name="Sit_Ind" Type="String" />
								<asp:Parameter Name="Bnf_Mtr" Type="String" />
								<asp:Parameter Name="Gia_Crt" Type="String" />
								<asp:Parameter Direction="InputOutput" Name="Out_Tot" Type=Double />
							</SelectParameters>
						</asp:SqlDataSource>
						<div align="right">
							&nbsp; <a href="pes.aspx"></a>
						</div>
					</td>
				</tr>
				<tr>
					<td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px;
						height: 47px">
							&nbsp;</td>
				</tr>
			</table>
		</asp:View>
		<asp:View ID="vw5" runat="server">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td>
						<table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td align="left" style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px;
									padding-top: 0px; height: 37px" width="9">
									<img alt="" height="37" src="../Images/tit_left.gif" width="9" /></td>
								<td bgcolor="#f4f4f4" style="height: 37px">
									<h2>
										ACE Profissional Mensal - Resultado da Pesquisa</h2>
								</td>
								<td align="left" style="height: 37px" width="9">
									<img alt="" height="37" src="../Images/tit_right.gif" width="9" /></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="15">
						&nbsp;</td>
				</tr>
				<tr>
					<td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px;
						height: 47px">
						<div align="left">
							<asp:Label ID="Label1" runat="server"></asp:Label>
							&nbsp;&nbsp;<a href="pes.aspx"></a> &nbsp;</div>
						<br />
						<asp:GridView ID="grdPrfMes" runat="server" AutoGenerateColumns="False" 
							DataSourceID="dtsPrfMes" OnDataBound="grd_DataBound"
							Width="100%" AllowSorting="True">
							<Columns>
								<asp:BoundField DataField="AnoMes" HeaderText="Competência" 
									SortExpression="AnoMes" />
								<asp:BoundField DataField="Prf_Mtr" HeaderText="Matrícula" 
									SortExpression="Prf_Mtr" />
								<asp:BoundField DataField="Prf_Nme" HeaderText="Profissional" 
									SortExpression="Prf_Nme" />
								<asp:BoundField DataField="Esp_Dsc" HeaderText="Especialidade" 
									SortExpression="Esp_Dsc" />
								<asp:BoundField DataField="QtdCon" HeaderText="Consultas" 
									SortExpression="QtdCon" />
								<asp:BoundField DataField="QtdSol" HeaderText="Solicitações" 
									SortExpression="QtdSol" />
								<asp:BoundField DataField="QtdExa" HeaderText="SP/SADT"
									SortExpression="QtdExa" />
								<asp:BoundField DataField="Med" HeaderText="Média" SortExpression="Med" />
								<asp:BoundField DataField="Prc" HeaderText="%" SortExpression="Prc" />
								<asp:BoundField DataField="Eag" HeaderText="EAG" SortExpression="Eag" />
								<asp:BoundField DataField="Vlr" HeaderText="Valor" SortExpression="Vlr" />
							</Columns>
							<FooterStyle Font-Bold="True" ForeColor="White" />
							<PagerTemplate>
								<div align="center" height="20">
									<asp:ImageButton ID="ImageButton1SolPendentes" runat="server" CommandArgument="First"
										ImageUrl="~/Images/seta1_1_on.gif" OnCommand="paginateGrdPrfMes" />&nbsp;
									<asp:ImageButton ID="ImageButton2SolPendentes" runat="server" CommandArgument="Prev"
										ImageUrl="~/Images/seta1_2_on.gif" OnCommand="paginateGrdPrfMes" />
									Página
									<asp:DropDownList ID="ddlGridPages" runat="server" AutoPostBack="True" CssClass="campo"
										OnSelectedIndexChanged="ddlGrdPrfMesPages_SelectedIndexChanged">
									</asp:DropDownList>
									de
									<asp:Label ID="lblPageCount" runat="server"></asp:Label>&nbsp;
									<asp:ImageButton ID="ImageButton3SolPendentes" runat="server" CommandArgument="Next"
										ImageUrl="~/Images/seta2_1_on.gif" OnCommand="paginateGrdPrfMes" />&nbsp;
									<asp:ImageButton ID="ImageButton4SolPendentes" runat="server" CommandArgument="Last"
										ImageUrl="~/Images/seta2_2_on.gif" OnCommand="paginateGrdPrfMes" />
								</div>
							</PagerTemplate>
						</asp:GridView>
						&nbsp; &nbsp;
						<asp:SqlDataSource ID="dtsPrfMes" runat="server" CancelSelectOnNullParameter="False"
								ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" 
								
							SelectCommand="srAtz_AcePrfMes" onselected="dtsPrf_Selected" 
							SelectCommandType="StoredProcedure">
							<SelectParameters>
								<asp:Parameter Name="DatIni" Type="DateTime" />
								<asp:Parameter Name="DatFim" Type="DateTime"/>
								<asp:Parameter Name="IdEsp" Type ="Int32" />
								<asp:Parameter Name="IdCtt" Type ="Int64" />
								<asp:Parameter Name="Prf_Mtr" Type="String" />
								<asp:Parameter Name="IdSit" Type="Int16" />
								<asp:Parameter Name="Sit_Ind" Type="String" />
								<asp:Parameter Name="Bnf_Mtr" Type="String" />
								<asp:Parameter Name="Gia_Crt" Type="String" />
								<asp:Parameter Direction="InputOutput" Name="Out_Tot" Type=Double />
							</SelectParameters>
						</asp:SqlDataSource>
						<div align="right">
							&nbsp; <a href="pes.aspx"></a>
						</div>
					</td>
				</tr>
				<tr>
					<td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px;
						height: 47px">
							&nbsp;</td>
				</tr>
			</table>
		</asp:View>
		
		<asp:View ID="vw6" runat="server">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td>
						<table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td align="left" style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px;
									padding-top: 0px; height: 37px" width="9">
									<img alt="" height="37" src="../Images/tit_left.gif" width="9" /></td>
								<td bgcolor="#f4f4f4" style="height: 37px">
									<h2>
										ACE Pontuado - Resultado da Pesquisa</h2>
								</td>
								<td align="left" style="height: 37px" width="9">
									<img alt="" height="37" src="../Images/tit_right.gif" width="9" /></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="15">
						&nbsp;</td>
				</tr>
				<tr>
					<td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px;
						height: 47px">
						<div align="left">
							<asp:Label ID="lblTotPto" runat="server"></asp:Label>
							&nbsp;&nbsp;<a href="pes.aspx"></a> &nbsp;</div>
						<br />
						<asp:GridView ID="grdPto" runat="server" AutoGenerateColumns="False" 
							DataSourceID="dtsPto" OnDataBound="grd_DataBound"
							Width="100%" AllowSorting="True">
							<Columns>
								<asp:BoundField DataField="Esp_Dsc" HeaderText="Especialidade" 
									SortExpression="Esp_Dsc" />
								<asp:BoundField DataField="Prf_Mtr" HeaderText="Matrícula" 
									SortExpression="Prf_Mtr" />
								<asp:BoundField DataField="Prf_Nme" HeaderText="Profissional" 
									SortExpression="Prf_Nme" />
								<asp:BoundField DataField="QtdCon" HeaderText="Consultas" 
									SortExpression="QtdCon" >
								<ItemStyle HorizontalAlign="Right" />
								</asp:BoundField>
								<asp:BoundField DataField="VlrCon" HeaderText="Vlr.Con." 
									SortExpression="VlrCon">
								<ItemStyle HorizontalAlign="Right" />
								</asp:BoundField>
								<asp:BoundField DataField="MedCon" HeaderText="Med.Con." 
									SortExpression="MedCon">
								<ItemStyle HorizontalAlign="Right" />
								</asp:BoundField>
								<asp:BoundField DataField="QtdSol" HeaderText="Solicitações" 
									SortExpression="QtdSol" >
								<ItemStyle HorizontalAlign="Right" />
								</asp:BoundField>
								<asp:BoundField DataField="Ch_" HeaderText="CH Sol." 
									SortExpression="Ch_" >
								<ItemStyle HorizontalAlign="Right" />
								</asp:BoundField>
								<asp:BoundField DataField="MedSol" HeaderText="Med.Sol." 
									SortExpression="MedSol" >
								<ItemStyle HorizontalAlign="Right" />
								</asp:BoundField>
								<asp:BoundField DataField="QtdExaTot" HeaderText="Qtd. SADT Geral" 
									SortExpression="QtdExaTot" >
								<ItemStyle HorizontalAlign="Right" />
								</asp:BoundField>
								<asp:BoundField DataField="VlrExaTot" HeaderText="Vlr. SADT Geral" 
									SortExpression="VlrExaTot">
								<ItemStyle HorizontalAlign="Right" />
								</asp:BoundField>
								<asp:BoundField DataField="QtdExaPrf" HeaderText="Qtd. SADT Prof." 
									SortExpression="QtdExaPrf">
								<ItemStyle HorizontalAlign="Right" />
								</asp:BoundField>
								<asp:BoundField DataField="VlrExaPrf" HeaderText="Vlr. SADT Prof." 
									SortExpression="VlrExaPrf">
								<ItemStyle HorizontalAlign="Right" />
								</asp:BoundField>
								<asp:BoundField DataField="Eag" HeaderText="EAG" SortExpression="Eag" >
								<ItemStyle HorizontalAlign="Right" />
								</asp:BoundField>
								<asp:BoundField DataField="VlrEag" HeaderText="Vlr. EAG" 
                                    SortExpression="VlrEag" />
								<asp:BoundField DataField="Vlr" HeaderText="Valor" SortExpression="Vlr" >
								<ItemStyle HorizontalAlign="Right" />
								</asp:BoundField>
								<asp:BoundField DataField="VlrTot" HeaderText="Custo Geral" 
									SortExpression="VlrTot">
								<ItemStyle HorizontalAlign="Right" />
								</asp:BoundField>
								<asp:BoundField DataField="Pto" HeaderText="Pontos" SortExpression="Pto" 
									ReadOnly="True" >
								<ItemStyle HorizontalAlign="Center" />
								</asp:BoundField>
							</Columns>
							<FooterStyle Font-Bold="True" ForeColor="White" />
							<PagerTemplate>
								<div align="center" height="20">
									<asp:ImageButton ID="ImageButton1SolPendentes" runat="server" CommandArgument="First"
										ImageUrl="~/Images/seta1_1_on.gif" OnCommand="paginateGrdPto" />&nbsp;
									<asp:ImageButton ID="ImageButton2SolPendentes" runat="server" CommandArgument="Prev"
										ImageUrl="~/Images/seta1_2_on.gif" OnCommand="paginateGrdPto" />
									Página
									<asp:DropDownList ID="ddlGridPages" runat="server" AutoPostBack="True" CssClass="campo"
										OnSelectedIndexChanged="ddlGrdPtoPages_SelectedIndexChanged">
									</asp:DropDownList>
									de
									<asp:Label ID="lblPageCount" runat="server"></asp:Label>&nbsp;
									<asp:ImageButton ID="ImageButton3SolPendentes" runat="server" CommandArgument="Next"
										ImageUrl="~/Images/seta2_1_on.gif" OnCommand="paginateGrdPto" />&nbsp;
									<asp:ImageButton ID="ImageButton4SolPendentes" runat="server" CommandArgument="Last"
										ImageUrl="~/Images/seta2_2_on.gif" OnCommand="paginateGrdPto" />
								</div>
							</PagerTemplate>
						</asp:GridView>
						&nbsp; &nbsp;
						<asp:SqlDataSource ID="dtsPto" runat="server" CancelSelectOnNullParameter="False"
								ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" 
								
							SelectCommand="srAtz_AcePto" onselected="dtsPto_Selected" 
							SelectCommandType="StoredProcedure" UpdateCommandType="StoredProcedure" 
							ProviderName="<%$ ConnectionStrings:AppConnectionString.ProviderName %>">
							<SelectParameters>
								<asp:Parameter Name="DatIni" Type="DateTime" />
								<asp:Parameter Name="DatFim" Type="DateTime"/>
								<asp:Parameter Name="IdEsp" Type ="Int32" />
								<asp:Parameter Name="IdCtt" Type ="Int64" />
								<asp:Parameter Name="IdSit" Type="Int16" />
								<asp:Parameter Name="PrfMtr" Type="String" />
								<asp:Parameter Name="SitInd" Type="String" />
								<asp:Parameter Name="BnfMtr" Type="String" />
								<asp:Parameter Name="GiaCrt" Type="String" />
								<asp:Parameter Name="ParMed" Type="Decimal" />
								<asp:Parameter Name="ParQtd" Type="Decimal" />
								<asp:Parameter Name="ParVlr" Type="Decimal" />
								<asp:Parameter Direction="InputOutput" Name="OutTot" Type="Decimal" />
								<asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
							</SelectParameters>
						</asp:SqlDataSource>
						<div align="right">
							&nbsp; <a href="pes.aspx"></a>
						</div>
					</td>
				</tr>
				<tr>
					<td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px;
						height: 47px">
							&nbsp;</td>
				</tr>
			</table>
		</asp:View>
        <asp:View ID="vw7" runat="server">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td>
						<table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td align="left" style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px;
									padding-top: 0px; height: 37px" width="9">
									<img alt="" height="37" src="../Images/tit_left.gif" width="9" /></td>
								<td bgcolor="#f4f4f4" style="height: 37px">
									<h2>
										ACE Pontuado por Município - Resultado da Pesquisa</h2>
								</td>
								<td align="left" style="height: 37px" width="9">
									<img alt="" height="37" src="../Images/tit_right.gif" width="9" /></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="15">
						&nbsp;</td>
				</tr>
				<tr>
					<td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px;
						height: 47px">
						<div align="left">
							<asp:Label ID="Label3" runat="server"></asp:Label>
							&nbsp;&nbsp;<a href="pes.aspx"></a> &nbsp;</div>
						<br />
						<asp:GridView ID="grdPtoMun" runat="server" AutoGenerateColumns="False" 
							DataSourceID="dtsPtoMun" OnDataBound="grd_DataBound"
							Width="100%" AllowSorting="True">
							<Columns>
								<asp:BoundField DataField="Mun_Nme" HeaderText="Município" 
                                    SortExpression="Mun_Nme" />
								<asp:BoundField DataField="Esp_Dsc" HeaderText="Especialidade" 
									SortExpression="Esp_Dsc" />
								<asp:BoundField DataField="Prf_Mtr" HeaderText="Matrícula" 
									SortExpression="Prf_Mtr" />
								<asp:BoundField DataField="Prf_Nme" HeaderText="Profissional" 
									SortExpression="Prf_Nme" />
								<asp:BoundField DataField="QtdCon" HeaderText="Consultas" 
									SortExpression="QtdCon" >
								<ItemStyle HorizontalAlign="Right" />
								</asp:BoundField>
								<asp:BoundField DataField="VlrCon" HeaderText="Vlr.Con." 
									SortExpression="VlrCon">
								<ItemStyle HorizontalAlign="Right" />
								</asp:BoundField>
								<asp:BoundField DataField="MedCon" HeaderText="Med.Con." 
									SortExpression="MedCon">
								<ItemStyle HorizontalAlign="Right" />
								</asp:BoundField>
								<asp:BoundField DataField="QtdSol" HeaderText="Solicitações" 
									SortExpression="QtdSol" >
								<ItemStyle HorizontalAlign="Right" />
								</asp:BoundField>
								<asp:BoundField DataField="Ch_" HeaderText="CH Sol." 
									SortExpression="Ch_" >
								<ItemStyle HorizontalAlign="Right" />
								</asp:BoundField>
								<asp:BoundField DataField="MedSol" HeaderText="Med.Sol." 
									SortExpression="MedSol" >
								<ItemStyle HorizontalAlign="Right" />
								</asp:BoundField>
								<asp:BoundField DataField="QtdExaTot" HeaderText="Qtd. SADT Geral" 
									SortExpression="QtdExaTot" >
								<ItemStyle HorizontalAlign="Right" />
								</asp:BoundField>
								<asp:BoundField DataField="VlrExaTot" HeaderText="Vlr. SADT Geral" 
									SortExpression="VlrExaTot">
								<ItemStyle HorizontalAlign="Right" />
								</asp:BoundField>
								<asp:BoundField DataField="QtdExaPrf" HeaderText="Qtd. SADT Prof." 
									SortExpression="QtdExaPrf">
								<ItemStyle HorizontalAlign="Right" />
								</asp:BoundField>
								<asp:BoundField DataField="VlrExaPrf" HeaderText="Vlr. SADT Prof." 
									SortExpression="VlrExaPrf">
								<ItemStyle HorizontalAlign="Right" />
								</asp:BoundField>
								<asp:BoundField DataField="Eag" HeaderText="EAG" SortExpression="Eag" >
								<ItemStyle HorizontalAlign="Right" />
								</asp:BoundField>
								<asp:BoundField DataField="VlrEag" HeaderText="Vlr. EAG" 
                                    SortExpression="VlrEag" />
								<asp:BoundField DataField="Vlr" HeaderText="Valor" SortExpression="Vlr" >
								<ItemStyle HorizontalAlign="Right" />
								</asp:BoundField>
								<asp:BoundField DataField="VlrTot" HeaderText="Custo Geral" 
									SortExpression="VlrTot">
								<ItemStyle HorizontalAlign="Right" />
								</asp:BoundField>
								<asp:BoundField DataField="Pto" HeaderText="Pontos" SortExpression="Pto" 
									ReadOnly="True" >
								<ItemStyle HorizontalAlign="Center" />
								</asp:BoundField>
							</Columns>
							<FooterStyle Font-Bold="True" ForeColor="White" />
							<PagerTemplate>
								<div align="center" height="20">
									<asp:ImageButton ID="ImageButton1SolPendentes" runat="server" CommandArgument="First"
										ImageUrl="~/Images/seta1_1_on.gif" OnCommand="paginateGrdPtoMun" />&nbsp;
									<asp:ImageButton ID="ImageButton2SolPendentes" runat="server" CommandArgument="Prev"
										ImageUrl="~/Images/seta1_2_on.gif" OnCommand="paginateGrdPtoMun" />
									Página
									<asp:DropDownList ID="ddlGridPages" runat="server" AutoPostBack="True" CssClass="campo"
										OnSelectedIndexChanged="ddlGrdPtoMunPages_SelectedIndexChanged">
									</asp:DropDownList>
									de
									<asp:Label ID="lblPageCount" runat="server"></asp:Label>&nbsp;
									<asp:ImageButton ID="ImageButton3SolPendentes" runat="server" CommandArgument="Next"
										ImageUrl="~/Images/seta2_1_on.gif" OnCommand="paginateGrdPtoMun" />&nbsp;
									<asp:ImageButton ID="ImageButton4SolPendentes" runat="server" CommandArgument="Last"
										ImageUrl="~/Images/seta2_2_on.gif" OnCommand="paginateGrdPtoMun" />
								</div>
							</PagerTemplate>
						</asp:GridView>
						&nbsp; &nbsp;
						<asp:SqlDataSource ID="dtsPtoMun" runat="server" CancelSelectOnNullParameter="False"
								ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" 
								
							SelectCommand="srAtz_AcePtoMun" onselected="dtsPto_Selected" 
							SelectCommandType="StoredProcedure" UpdateCommandType="StoredProcedure" 
							ProviderName="<%$ ConnectionStrings:AppConnectionString.ProviderName %>">
							<SelectParameters>
								<asp:Parameter Name="DatIni" Type="DateTime" />
								<asp:Parameter Name="DatFim" Type="DateTime"/>
								<asp:Parameter Name="IdEsp" Type ="Int32" />
								<asp:Parameter Name="IdCtt" Type ="Int64" />
								<asp:Parameter Name="IdSit" Type="Int16" />
								<asp:Parameter Name="PrfMtr" Type="String" />
								<asp:Parameter Name="SitInd" Type="String" />
								<asp:Parameter Name="BnfMtr" Type="String" />
								<asp:Parameter Name="GiaCrt" Type="String" />
                                <asp:Parameter Name="IdMun" Type="Int32" />
								<asp:Parameter Name="ParMed" Type="Decimal" />
								<asp:Parameter Name="ParQtd" Type="Decimal" />
								<asp:Parameter Name="ParVlr" Type="Decimal" />
								<asp:Parameter Direction="InputOutput" Name="OutTot" Type="Decimal" />
							</SelectParameters>
						</asp:SqlDataSource>
						<div align="right">
							&nbsp; <a href="pes.aspx"></a>
						</div>
					</td>
				</tr>
				<tr>
					<td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px;
						height: 47px">
							&nbsp;</td>
				</tr>
			</table>
		</asp:View>
	</asp:MultiView>
    <br />
    <br />
	<asp:ImageButton ID="btnPgaIni" runat="server" ImageUrl="~/Images/bt_home.gif" OnClick="btnPgaIni_Click" />&nbsp;
	<asp:ImageButton ID="btnNewPsq" runat="server" ImageUrl="~/Images/bt_nova_pesquisa.gif"
				OnClick="btnNewPsq_Click" />
    <asp:SqlDataSource ID="dtsMun" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" 
        SelectCommand="SELECT [IdMun], [Mun_Nme] FROM [Atz_Mun] ORDER BY Mun_Nme">
    </asp:SqlDataSource>
</asp:Content>

