<%@ Page Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" CodeFile="exeqtd.aspx.cs" Inherits="Atz_exeqtd" Title="Relatório de resumo do fechamento de fatura" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">  
    <ContentTemplate>
        <table  border="0" cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td style="padding: 0px 0 0px 20px; height: 37px;">
					<table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td align="left" style="width: 8px"><img src="../images/tit_left.gif" width="9" height="37" 
                                    alt="" /></td>
							<td bgcolor="#f4f4f4"><h2>Relatório de resumo do fechamento de fatura</h2></td>
							<td align="left" width="9"><img src="../images/tit_right.gif" width="9" height="37" alt="" /></td>
						</tr>
					</table>
				</td>
			</tr>						
							    <tr>
								    <td align="left" valign="top" style="padding: 20px 0 0 20px;">
										    <table border="0" cellpadding="0" cellspacing="0" style="width: 600">
										    <tr><td colspan="3">
										    <asp:Image ID="imgMsg" runat="server" ImageUrl="../Images/ico_alert.gif" Visible="False" />
                                        &nbsp;<asp:Label ID="lblMsg" runat="server" class="erro"></asp:Label>
    										
										    </td></tr>
										    <tr><td colspan="3" height="25"></td></tr>
											    <tr>
												    <td align="right" width="100">&nbsp;</td>
												    <td width="5"></td>
												    <td align="left">
                                                        <asp:CheckBox ID="chkAll" runat="server" Text="Imprimir o resumo de todos os endereços" Width="250" />
                                                    </td>
    																							
											    </tr>					
                                                <tr>
												    <td colspan="3" height="10"></td>
                                                </tr>
                                                <tr>
												    <td align="right" width="100"><b></b></td>
												    <td width="5"><b></b></td>
												    <td align="left">
                                                        
                                                        <b>Selecione a&nbsp; competência</b></td>
    																							
											    </tr>	
    											<tr>
                                                    <td align="right" width="100">
                                                        &nbsp;</td>
                                                    <td width="5">
                                                        &nbsp;</td>
                                                    <td align="left">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td align="right" width="100">
                                                        &nbsp;</td>
                                                    <td width="5">
                                                    </td>
                                                    <td align="left">
                                                        <asp:GridView ID="grd" runat="server" AutoGenerateColumns="False" 
                                                            CssClass="grid-view-left" DataSourceID="dtsFch" 
                                                            SelectedRowStyle-ForeColor="#833701" AllowPaging="True" 
                                                            AllowSorting="True" PageSize="15">
                                                            <Columns>
                                                                <asp:BoundField DataField="Fch_Cpc" 
                                                                    HeaderText="Competência" SortExpression="Fch_Cpc" ReadOnly="True" >
                                                                <ItemStyle Width="120px" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="Fch_Ent" 
                                                                    HeaderText="Entrega" SortExpression="Fch_Ent" ReadOnly="True" 
                                                                    DataFormatString="{0:dd/MM/yyyy}" >
                                                                <ItemStyle Width="120px" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="Fch_DatIni" 
                                                                    HeaderText="Início" SortExpression="Fch_DatIni" ReadOnly="True" 
                                                                    DataFormatString="{0:dd/MM/yyyy}" >
                                                                <ItemStyle Width="120px" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="Fch_DatFim" HeaderText="Término" ReadOnly="True" 
                                                                    SortExpression="Fch_DatFim" DataFormatString="{0:dd/MM/yyyy}" >
                                                                <ItemStyle Width="120px" />
                                                                </asp:BoundField>
                                                                <asp:CommandField SelectText="Selecionar" ShowSelectButton="True" />
                                                            </Columns>                                                            
                                                            <SelectedRowStyle ForeColor="#833701" />
                                                        </asp:GridView>
                                                        <asp:SqlDataSource ID="dtsFch" runat="server" 
                                                            ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" 
                                                            
                                                            SelectCommand="ssFat_Fch" SelectCommandType="StoredProcedure" 
                                                            CancelSelectOnNullParameter="False">
                                                            <SelectParameters>
                                                                <asp:Parameter Name="IdOpe" Type="Int16" />
                                                                <asp:ProfileParameter Name="IdCtt" PropertyName="Local.IdCtt" Type="Int64" />
                                                                <asp:Parameter Name="IdTpd" Type="Byte" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </td>
                                                </tr>
    											<tr>
												    <td colspan="3" height="10"></td>
                                                </tr>
										    </table>
			<br />
        </table>									    
    </ContentTemplate>
	</asp:UpdatePanel>
	<br />
	<table border="0" cellpadding="0" cellspacing="0" style="width: 600">
		<tr>
		    <td colspan="3" height="10">					    
		    </td>
		</tr>	
		<tr>
			<td align="right" width="100">
                &nbsp;</td>
			<td width="5"></td>
			<td align="left">
                <asp:ImageButton ID="btnPrint" runat="server" 
                    ImageUrl="../Images/bt_imprimir.gif" OnClick="btnPrint_Click"/></td>
														
		</tr>
		<tr>
			<td colspan="3" height="10"></td>
		</tr>						
																													
	</table>
    									
</asp:Content>

