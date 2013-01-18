<%@ Page Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" Inherits="Adm_arqtxt" Title="Geração de arquivo texto - Procedimentos executados" Codebehind="arqtxt.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <table  border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td style="padding: 0px 0 0px 20px; height: 37px;">
				<table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td align="left" style="width: 8px"><img src="../images/tit_left.gif" width="9" height="37" 
                                alt="" /></td>
						<td bgcolor="#f4f4f4"><h2>Exportação arquivo texto</h2></td>
						<td align="left" width="9"><img src="../images/tit_right.gif" width="9" height="37" alt="" /></td>
					</tr>
				</table>
			</td>

        </tr>

        <tr>
			<td align="left" valign="top" style="padding: 20px 0 0 20px;">
				<table border="0" cellpadding="0" cellspacing="0" style="width: 600">
				    <tr>
                        <td colspan="3">
				            <asp:Image ID="imgMsg" runat="server" ImageUrl="../Images/ico_alert.gif" 
                                Visible="False" />
                                &nbsp;<asp:Label ID="lblMsg" runat="server" class="erro"></asp:Label>    										
				        </td>
                    </tr>
				    <tr>
                        <td colspan="3" height="25"></td>
                    </tr>
                    <tr>
						<td colspan="3" height="10"></td>
                    </tr>
                    <tr>
						<td align="right" width="100">Competência:</td>
						<td width="5">&nbsp;</td>
						<td align="left">                                                        
                            <asp:TextBox ID="txtCpc" runat="server" MaxLength="6"></asp:TextBox>
                        </td>    																							
					</tr>	
                    <tr>
						<td align="right" width="100">&nbsp;</td>
						<td width="5">&nbsp;</td>
						<td align="left">                                                        
                            &nbsp;</td>    																							
					</tr>	
                    <tr>
						<td align="right" width="100">Grupo de Contrado</td>
						<td width="5">&nbsp;</td>
						<td align="left">                                                        
                            <asp:DropDownList ID="ddlTpd" runat="server" DataSourceID="edsTpd" 
                                DataTextField="Tpd_Dsc" DataValueField="IdTpd">
                            </asp:DropDownList>
                            <asp:EntityDataSource ID="edsTpd" runat="server" 
                                ConnectionString="name=AppEntities" DefaultContainerName="AppEntities" 
                                EnableFlattening="False" EntitySetName="Atz_Tpd">
                            </asp:EntityDataSource>
                        </td>    																							
					</tr>	
                    <tr>
						<td align="right" width="100">&nbsp;</td>
						<td width="5">&nbsp;</td>
						<td align="left">                                                        
                            &nbsp;</td>    																							
					</tr>	
                    <tr>
						<td align="right" width="100"><b></b></td>
						<td width="5"><b></b></td>
						<td align="left">                                                        
                <asp:ImageButton ID="btnBuscar" runat="server" 
                    ImageUrl="../Images/bt_buscar.gif" onclick="btnBuscar_Click" /></td>    																							
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
                                AllowSorting="True" PageSize="15" Visible="False">
                                <Columns>
                                    <asp:BoundField DataField="Fch_Cpc" 
                                        HeaderText="Competência" SortExpression="Fch_Cpc" ReadOnly="True" >
                                    </asp:BoundField>
                                    <asp:BoundField DataField="IdCtt" HeaderText="Matrícula" 
                                        SortExpression="IdCtt" />
                                    <asp:BoundField DataField="Ctt_Nme" HeaderText="Contratado" 
                                        SortExpression="Ctt_Nme" />
                                    <asp:BoundField DataField="Fch_DatIni" 
                                        HeaderText="Início" SortExpression="Fch_DatIni" ReadOnly="True" 
                                        DataFormatString="{0:dd/MM/yyyy}" >
                                    <ItemStyle Width="80px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Fch_DatFim" HeaderText="Término" ReadOnly="True" 
                                        SortExpression="Fch_DatFim" DataFormatString="{0:dd/MM/yyyy}" >
                                    <ItemStyle Width="80px" />
                                    </asp:BoundField>
                                </Columns>                                                            
                                <SelectedRowStyle ForeColor="#833701" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="dtsFch" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" 
                                                            
                                SelectCommand="ssFat_Fch" SelectCommandType="StoredProcedure" 
                                CancelSelectOnNullParameter="False">
                                <SelectParameters>
                                    <asp:Parameter Name="IdOpe" Type="Int16" />
                                    <asp:Parameter Name="IdCtt" Type="Int64" />
                                    <asp:ControlParameter ControlID="ddlTpd" Name="IdTpd" 
                                        PropertyName="SelectedValue" Type="Byte" />
                                    <asp:ControlParameter ControlID="txtCpc" Name="FchCpc" PropertyName="Text" 
                                        Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
    				<tr>
						<td colspan="3" height="10"></td>
                    </tr>
				</table>
			</td>
	    </tr>
    </table>
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
    <asp:Button ID="btnLayout2" runat="server" onclick="btnLayout2_Click" 
        Text="Gerar" />
            </td>
														
		</tr>
		<tr>
			<td colspan="3" height="10">&nbsp;</td>
		</tr>						
																													
	</table>




    <br />
    <br />
    </asp:Content>

