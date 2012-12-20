<%@ Page Language="C#" MasterPageFile="~/Atz2.master" AutoEventWireup="true" CodeFile="pesres.aspx.cs" Theme="Standard" Inherits="Atz_pesres" Title="Resultado da Pesquisa" %>
<%@ PreviousPageType VirtualPath="~/atz/pes.aspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div>
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
	            <td>
		            <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
			            <tr>
				            <td align="left" width="9" style="padding: 0px 0 0px 20px;height: 37px;"><img src="../Images/tit_left.gif" width="9" height="37" alt="" /></td>
				            <td bgcolor="#f4f4f4" style="height: 37px"><h2>Resultado da Pesquisa</h2></td>
				            <td align="left" width="9" style="height: 37px"><img src="../Images/tit_right.gif" width="9" height="37" alt="" /></td>
			            </tr>
		            </table>
	            </td>
            </tr>
	        <tr>
		        <td height="15">&nbsp;</td>
	        </tr>
	        <tr>
		        <td valign="middle" style="height: 14px"><span class="erro">
                    <asp:Image ID="imgMsg" runat="server" ImageUrl="../Images/ico_alert.gif" Visible="False" />
                    &nbsp;<asp:Label ID="lblMsg" runat="server"></asp:Label></span></td>
	        </tr>								
            <tr>
                <td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px;
                    height: 47px">&nbsp;
                    <asp:ImageButton ID="btnPgaIni" runat="server" ImageUrl="~/Images/bt_home.gif" OnClick="btnPgaIni_Click" />&nbsp;
                    <asp:ImageButton ID="btnNewPsq" runat="server" ImageUrl="~/Images/bt_nova_pesquisa.gif" OnClick="btnNewPsq_Click" />&nbsp;
                    <asp:ImageButton ID="btnPrint" runat="server" ImageUrl="~/Images/bt_imprimir.gif" onclick="btnPrint_Click" />&nbsp;
                    Destino Impressão: 
                    <asp:RadioButtonList ID="rblDestino" runat="server" 
                        RepeatDirection="Horizontal" RepeatLayout="Flow">
                        <asp:ListItem Value="Excel">Excel</asp:ListItem>
                        <asp:ListItem Selected="True">PDF</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
	            <td style="padding: 0px 0 0px 20px;height: 47px;">
		            <div align="right">
                        &nbsp;&nbsp;<a href="pes.aspx"></a> &nbsp;</div>
		            <br />
                    <asp:GridView ID="grd" runat="server" AllowPaging="True" CssClass="grid-view-left"
                        DataSourceID="dts" OnDataBound="grd_DataBound" 
                        OnRowCreated="gvHover_RowCreated" AutoGenerateColumns="False" 
                        
                        DataKeyNames="Gia_DatEms,IdCtt,Prf_Mtr,Bnf_Mtr,Gia_Tip,Gpd_QtdSol,Gpd_QtdAtz,Gia_Snh,Prf_Sol,Usr_Nme,Sit_Dsc,Bnf_Nme,Pdm_Cod,Pdm_Dsc,Prf_Exe,Esp_Sol,Esp_Exe,Gia_Crt,Pdm_QtdCh_" 
                        Width="100%" EmptyDataText="Nenhum registro encontrado!" PageSize="15" 
                        AllowSorting="True">
                        <PagerTemplate>
                            <div height="20" align="center">
                                <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument="First" ImageUrl="~/Images/seta1_1_on.gif"
                                    OnCommand="Paginategrd" />
                                &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CommandArgument="Prev" ImageUrl="~/Images/seta1_2_on.gif"
                                    OnCommand="Paginategrd" />
                                Página
                                <asp:DropDownList ID="ddlPages" runat="server" AutoPostBack="True" CssClass="campo"
                                    OnSelectedIndexChanged="ddlPages_SelectedIndexChanged">
                                </asp:DropDownList>
                                de 
                                <asp:Label ID="lblPageCount" runat="server"></asp:Label>
                                &nbsp;<asp:ImageButton ID="ImageButton3" runat="server" CommandArgument="Next" ImageUrl="~/Images/seta2_1_on.gif"
                                    OnCommand="Paginategrd" />
                                &nbsp;<asp:ImageButton ID="ImageButton4" runat="server" CommandArgument="Last" ImageUrl="~/Images/seta2_2_on.gif"
                                    OnCommand="Paginategrd" /></div>
                        </PagerTemplate>
                        <Columns>
                            <asp:BoundField DataField="Gia_DatEms" HeaderText="Data/Hora" 
                                SortExpression="Gia_DatEms" />
                            <asp:TemplateField HeaderText="Beneficiário" ShowHeader="False" 
                                SortExpression="Bnf_Nme">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandName="Select"
                                        PostBackUrl="~/Atz/pesresdet.aspx" Text='<%# Eval("Bnf_Nme") %>'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Gia_Tip" HeaderText="Tipo" SortExpression="Gia_Tip" ReadOnly="True" />
                            <asp:BoundField DataField="Gia_Crt" HeaderText="Caráter" 
                                SortExpression="Gia_Crt" ReadOnly="True" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Procedimento" SortExpression="Pdm_Cod">
                                <ItemTemplate>
                                    <asp:Label ID="lblPdmCod" runat="server" Text='<%# Bind("Pdm_Cod") %>' Font-Bold="True"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblPdmDsc" runat="server" Text='<%# Bind("Pdm_Dsc") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Gpd_QtdSol" HeaderText="Qtd." 
                                SortExpression="Gpd_QtdSol" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Pdm_QtdCh_" HeaderText="CH" 
                                SortExpression="Pdm_QtdCh_" >
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Ngc_Vlr" HeaderText="Valor" 
                                SortExpression="Ngc_Vlr" >
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Sit_Dsc" HeaderText="Situação" SortExpression="Sit_Dsc" />
                            <asp:BoundField DataField="Sit_Ind" HeaderText="Ind.Sit." 
                                SortExpression="Sit_Ind" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Prf_Sol" HeaderText="Profissional Solicitante" ReadOnly="True" SortExpression="Prf_Sol" />
                            <asp:BoundField DataField="Prf_Exe" HeaderText="Profissional Executante" SortExpression="Prf_Exe" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="dts" runat="server" ConnectionString="<%$ ConnectionStrings:AppConnectionString %>"
                        SelectCommand="ssAtz_Pes" SelectCommandType="StoredProcedure" CancelSelectOnNullParameter="False">
                        <SelectParameters>
                            <asp:Parameter Type="DateTime" Name="Gia_DatIni" />
                            <asp:Parameter Type="DateTime" Name="Gia_DatFim" />
                            <asp:Parameter Name="IdEsp" Type="Int16" />
                            <asp:Parameter Name="Gia_Tip" Type="Byte" />
                            <asp:Parameter Name="IdSit" Type="Byte" />
                            <asp:Parameter Name="Sit_Ind" Type="String" />
                            <asp:Parameter Name="Pdm_Cod" Type="String" />
                            <asp:Parameter Name="Gia_Snh" Type="String" />
                            <asp:Parameter Name="Bnf_Mtr" Type="String" />
                            <asp:Parameter Name="IdCtt" Type="Int64" />
                            <asp:Parameter Name="Prf_Mtr" Type="String" />
                            <asp:Parameter Name="IdPpl" Type="Int16" />
                            <asp:Parameter Name="Ord" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
		            <asp:HiddenField ID="hdfPapelOperadora" runat="server"  />
		            <br />
		            <div align="right">
                        &nbsp; <a href="pes.aspx"></a></div>
	            </td>
            </tr>																																															
        </table>
	</div>
</asp:Content>