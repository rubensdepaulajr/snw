<%@ Page Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" Theme="Standard" Inherits="Atz_execon" Title="Execução de Consulta" Codebehind="execon.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
 
    <asp:MultiView ID="mvw" runat="server" ActiveViewIndex="0" EnableTheming="False">
        <asp:View ID="vw1" runat="server"> 
        <table border="0" cellpadding="0" cellspacing="0">
            <tbody>
                <tr style="padding-right: 0px; padding-left: 0px; padding-bottom: 0px; padding-top: 0px">
                    <td colspan="3" height="35" valign="middle">
                        <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td align="left" style="width: 9px">
                                    <img alt="" height="37" src="../Images/tit_left.gif" width="9" /></td>
                                <td bgcolor="#f4f4f4">
                                    <h2>Execução de consulta</h2>
                                </td>
                                <td align="left" style="width: 9px">
                                    <img alt="" height="37" src="../Images/tit_right.gif" width="9" /></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px">
                    <td colspan="3" height="35" valign="middle">
                        <asp:Image ID="ImgErr" runat="server" Width="25px"  Height="25px"  
                            ImageUrl="~/Images/ico_alert.gif" ImageAlign="AbsMiddle" Visible="False" />
                        <asp:Label ID="lblErr" runat="server" CssClass="erro"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" height="35px" valign="middle"><br />
                        <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="modalBackground"
                            DropShadow="true" PopupControlID="ModalPanel" TargetControlID="lbtBuscar">
                        </cc1:ModalPopupExtender>
                    </td></tr>
                <tr>
                    <td align="right"  style="padding: 0px 0 0 20px; width: 120px;">Beneficiário:</td>
                    <td width="5"></td>
                    <td align="left"><span class="cinza-escuro">
                        <asp:Label ID="lblBnf" runat="server"></asp:Label></span>
                    </td>																				
                </tr>	
                <tr>
                    <td colspan="3" height="10"></td>
                </tr>																					
                <tr>
                    <td  style="padding: 0px 0 0 20px; width: 120px;" align="right" >Procedimento:</td>
                    <td width="5" style="height: 15px"></td>
                    <td align="left" colspan="2" style="height: 15px"><span class="cinza-claro">
                        <asp:Label ID="lblPdm_Dsc" runat="server"></asp:Label></span>
                    </td>										
                </tr>
                <tr>
                    <td colspan="3" height="10"></td>
                </tr>
                <tr>
                    <td align="right" >Tipo de Doença:</td>
                    <td width="5"></td>
                    <td align="left">
                        <table>
                            <tr><td>
                                <asp:RadioButtonList ID="rblTipDoe" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="A">Aguda</asp:ListItem>
                                    <asp:ListItem Value="C">Crônica</asp:ListItem>
                                </asp:RadioButtonList>
                            </td><td>
                                <asp:ImageButton ID="imgAjuda" ImageUrl="~/Images/ico_ajuda_campos.gif" runat="server" />
                            </td></tr>
                        </table>
                    </td>
                </tr>	
                <tr>
                    <td colspan="3" height="10"></td>
                </tr>
                <tr>
                    <td align="right" >Tempo de Doença:</td>
                    <td width="5"></td>
                    <td align="left">
                            <table>
                                <tr><td>
                                    <asp:TextBox ID="txtTemDoe" runat="server" CssClass="campo" MaxLength="2"></asp:TextBox>
                                    <asp:DropDownList ID="ddlTemDoe" runat="server" CssClass="campo">
                                        <asp:ListItem Value="0">Selecione</asp:ListItem>
                                        <asp:ListItem Value="-D">Dias</asp:ListItem>
                                        <asp:ListItem Value="-M">Meses</asp:ListItem>
                                        <asp:ListItem Value="-A">Anos</asp:ListItem>
                                        </asp:DropDownList>
                                </td></tr>
                            </table>
                        <cc1:FilteredTextBoxExtender ID="fteTemDoe" runat="server" FilterType="numbers" TargetControlID="txtTemDoe">
                        </cc1:FilteredTextBoxExtender>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" height="10"><br /></td>
                </tr>
                <tr>
                    <td align="right" >CID:</td>
                    <td width="5" style="height: 44px"></td>
                    <td align="left" style="height: 44px">
                            <table>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtIdCid" runat="server" CssClass="campo"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:ImageButton ID="btnAdicionarCid" ImageUrl="~/Images/bt_adicionar.gif" 
                                            runat="server" OnClick="btnAdicionarCid_Click" style="height: 19px" />
                                    </td>
                                    <td>
                                        <asp:LinkButton ID="lbtBuscar" runat="server">Busca CID</asp:LinkButton>
                                    </td>
                                    <td>
                                        <asp:ImageButton ID="btnAjudaCid" ImageUrl="~/Images/ico_ajuda_campos.gif" runat="server" />
                                    </td>
                                </tr>
                            </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="height: 10px"><br /></td>
                </tr>
                <tr>
                    <td colspan="3" style="padding: 0px 0 0px 60px;">
                        <asp:GridView ID="grdCID" runat="server" BorderStyle="None" GridLines="None"
                             AutoGenerateColumns="False" CssClass="grid-view-left" onselectedindexchanged="grdCID_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField DataField="IdCid" HeaderText="CID" />
                                <asp:BoundField DataField="Cid_Dsc" HeaderText="Descri&#231;&#227;o" />
                                <asp:CommandField ButtonType="Button" SelectText="Remover" ShowSelectButton="True" >
                                    <ControlStyle CssClass="linkbutton" />
                                </asp:CommandField>
                            </Columns>
                        </asp:GridView>&nbsp;
                    </td>
                </tr>          
                <tr><td colspan="3">  <br /> </td></tr>   
                <tr><td colspan="3">  <br /> </td></tr>   
                <tr>
                    <td align="right" >Data/Hora</td>
                    <td style="height: 14px" width="5"></td>
                    <td align="left" style="height: 14px">
                        <asp:TextBox ID="txtDatRel" runat="server" BorderStyle="Groove" CssClass="campo"
                            Enabled="False" Width="89px"></asp:TextBox>
                            /
                        <asp:TextBox ID="txtHor" runat="server" CssClass="campo" Width="50px"></asp:TextBox>
                            :
                        <asp:TextBox ID="txtMin" runat="server" CssClass="campo" Width="50px"></asp:TextBox>
                        <cc1:NumericUpDownExtender ID="nudTxtHor" runat="server" Maximum="23" Minimum="0" TargetControlID="txtHor" Width="50">
                        </cc1:NumericUpDownExtender>
                        <cc1:NumericUpDownExtender ID="nudTxtMin" runat="server" Maximum="59" Minimum="0" TargetControlID="txtMin" Width="50">
                        </cc1:NumericUpDownExtender>
                        <cc1:FilteredTextBoxExtender ID="fteTxtHor" runat="server" FilterType="numbers" TargetControlID="txtHor">
                        </cc1:FilteredTextBoxExtender>
                        <cc1:FilteredTextBoxExtender ID="fteTxtMin" runat="server" FilterType="numbers" TargetControlID="txtMin">
                        </cc1:FilteredTextBoxExtender>
                    </td>
                </tr>
                <tr><td colspan="3" height="10"></td></tr>
                <tr>
			        <td align="right" style="height: 19px" >Tipo de Consulta:</td>
			        <td width="5" style="height: 19px"></td>
			        <td align="left" style="height: 19px"><span class="cinza-escuro">
                        <asp:DropDownList ID="ddlTipCon" runat="server" CssClass="campo" Width="95px">
                            <asp:ListItem Value="0">Selecione</asp:ListItem>
                            <asp:ListItem Value="1">Primeira</asp:ListItem>
                            <asp:ListItem Value="2">Seguimento</asp:ListItem>
                            <asp:ListItem Value="3">Pr&#233;-Natal</asp:ListItem>
                        </asp:DropDownList></span> <asp:ImageButton ID="ImageButton6" ImageUrl="~/Images/ico_ajuda_campos.gif" runat="server" />
                    </td>																				
		        </tr>	
		        <tr><td colspan="3" height="10"></td></tr>
                <tr>
			        <td align="right" >Tipo de Saída:</td>
			        <td width="5"></td>
			        <td align="left"><span class="cinza-escuro">
                        <asp:DropDownList ID="ddlTipSai" runat="server" CssClass="campo" Width="95px">
                            <asp:ListItem Value="0">Selecione</asp:ListItem>
                            <asp:ListItem Value="1">Retorno</asp:ListItem>
                            <asp:ListItem Value="2">Retorno SADT</asp:ListItem>
                            <asp:ListItem Value="3">Refer&#234;ncia</asp:ListItem>
                            <asp:ListItem Value="4">Interna&#231;&#227;o</asp:ListItem>
                            <asp:ListItem Value="5">Alta</asp:ListItem>
                        </asp:DropDownList></span> <asp:ImageButton ID="ImageButton5" ImageUrl="~/Images/ico_ajuda_campos.gif" runat="server" />
                    </td>																				
		        </tr>	
                <tr><td colspan="3">  <br /> </td></tr>   
                <tr><td colspan="3">  <br /> </td></tr>   
                <tr>
                    <td colspan="3" style="padding: 0px 0 0px 20px; height: 21px;" >
                        <asp:ImageButton ID="btnExe" ImageUrl="~/Images/bt_concluir.gif" runat="server" 
                            AlternateText="Concluir" OnClick="btnExe_Click" style="height: 19px" />&nbsp;&nbsp;
                        <asp:ImageButton ID="btnFhaPci" ImageUrl="~/Images/bt_ficha.gif" runat="server" AlternateText="Voltar à Ficha do Paciente" OnClick="btnFhaPci_Click" />&nbsp;&nbsp;
                        <asp:ImageButton ID="btnPgaIni" ImageUrl="~/Images/bt_home.gif" runat="server" AlternateText="Voltar à Página Inicial" OnClick="btnPgaIni_Click" />
                    </td>
                </tr>   								
            </tbody>
        </table>		 
	    <asp:Panel ID="ModalPanel" runat="server" BackColor="White" CssClass="modalPopup"
            Direction="LeftToRight" Width="830px">
<%--            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>--%>
                <table style="border-right: #ce5c09 thin double; border-top: #ce5c09 thin double;
                    border-left: #ce5c09 thin double; width: 100%; border-bottom: #ce5c09 thin double;
                    background-color: #ffffff">
                    <tbody>
                        <tr>
                            <td style="width: 937px; height: 45px">
                                <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tbody>
                                        <tr>
                                            <td align="left" style="width: 9px; height: 37px;">
                                                <img alt="" height="37" src="../Images/tit_left.gif" width="9" /></td>
                                            <td bgcolor="#f4f4f4" style="height: 37px">
                                                <h2>Busca de CID</h2>
                                            </td>
                                            <td align="left" style="width: 9px; height: 37px;">
                                                <img alt="" height="37" src="../Images/tit_right.gif" width="9" /></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td height="15" style="width: 937px">
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="padding-right: 10px; padding-left: 0px; padding-bottom: 0px;
                                width: 937px; padding-top: 0px; height: 47px" valign="middle">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tbody>
                                        <tr>
                                            <td align="right" style="height: 22px">
                                                Descrição:&nbsp;</td>
                                            <td align="right" style="width: 140px; height: 22px">
                                                <asp:TextBox ID="txtBnf_NmePop" runat="server" CssClass="campo" Width="140px"></asp:TextBox></td>
                                            <td align="left" style="height: 22px" valign="top" width="78">
                                            </td>
                                            <td align="right" style="width: 56px; height: 22px">
                                                Código:&nbsp;</td>
                                            <td align="right" style="height: 22px" width="140">
                                                <asp:TextBox ID="txtBnf_MtrPop" runat="server" Width="140px"></asp:TextBox></td>
                                            <td align="left" style="padding-right: 0px; padding-left: 5px; padding-bottom: 0px;
                                                padding-top: 0px; height: 22px" valign="top" width="78">
                                                <asp:ImageButton ID="btnBuscar" runat="server" ImageUrl="../Images/bt_buscar.gif"
                                                    OnClick="btnBuscar_Click" /></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="padding-right: 10px; padding-left: 0px; padding-bottom: 0px;
                                width: 937px; padding-top: 0px; height: 44px" valign="middle">
                                <asp:GridView ID="grd" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                    CssClass="grid-view" DataKeyNames="IdCid,Cid_Dsc" DataSourceID="dtsCID"
                                    OnDataBound="grd_DataBound" OnRowCreated="gvHover_RowCreated"
                                    OnSelectedIndexChanged="grd_SelectedIndexChanged" Width="644px" AllowSorting="True" OnSorted="grd_Sorted">
                                    <Columns>
                                        <asp:BoundField DataField="IdCid" HeaderText="CID" SortExpression="IdCid" >
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:ButtonField CommandName="Select" DataTextField="Cid_Dsc" HeaderText="Descri&#231;&#227;o"
                                            Text="Button" SortExpression="Cid_Dsc" >
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:ButtonField>
                                    </Columns>
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
                                </asp:GridView>
                                <asp:SqlDataSource ID="dtsCID" runat="server" CancelSelectOnNullParameter="False"
                                    ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" SelectCommand="ssAtz_Cid"
                                    SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:Parameter Name="IdCid" Type="String" />
                                        <asp:Parameter Name="Cid_Cod" Type="String" />
                                        <asp:Parameter Name="Cid_Dsc" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:Label ID="lblEmptyGrid" runat="server"></asp:Label>
                                <h2 align="right">
                                    &nbsp;<asp:ImageButton ID="btn_fechar" runat="server" ImageUrl="~/Images/bt_fecha.gif"
                                        OnClick="btn_fechar_Click" /></h2>
                            </td>
                        </tr>
                    </tbody>
                </table>
<%--            </ContentTemplate>
            </asp:UpdatePanel>--%>
            </asp:Panel>		 
        </asp:View>
        <asp:View ID="vw2" runat="server">
            <div bgcolor="#f4f4f4" style="padding: 0px 0 0 20px;" >
                <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td align="left" style="width: 9px">
                            <img alt="" height="37" src="../Images/tit_left.gif" width="9" /></td>
                        <td bgcolor="#f4f4f4">
                            <h2>Execução de consulta</h2>
                        </td>
                        <td align="left" style="width: 9px">
                            <img alt="" height="37" src="../Images/tit_right.gif" width="9" /></td>
                    </tr>
                </table>
            </div>
            <div style="padding: 40px 0 0px 20px;">
                <table>
                    <tr>
		                <td valign="middle">
                            <asp:Image ID="Image1" runat="server" Width="25px"  Height="25px"  
                                ImageUrl="~/Images/ico_alert.gif" ImageAlign="AbsMiddle" Visible="False" />
                            <asp:Label
                                ID="Label1" runat="server" CssClass="erro"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
           <asp:Panel runat="server" ID="pnlAtz">
               <table align="center" border="0" cellpadding="20" cellspacing="0" width="95%">
		            <tr bgcolor="#f4f4f4">
			            <td >
				            <table border="0" cellpadding="0" cellspacing="0" >
					            <tr>
						            <td>
                                        <asp:Image ID="imgAutorizada" runat="server" ImageUrl="~/Images/ico_autorizada.gif" />
                                    </td>
						            <td><strong>
                                        <asp:Label ID="lblExeAut" runat="server" Text="EXECUÇÃO AUTORIZADA -"></asp:Label> 
                                     </strong>
                                     <span class="numero-solicitacao">
                                            <asp:Label ID="lblGia_Snh" runat="server"></asp:Label></span></td>
					            </tr>
				            </table>
			            </td>
		            </tr>            																															
                </table>
            </asp:Panel> <br />
            <table align="left" border="0" cellpadding="0" cellspacing="20">
                <tr>
                    <td  height="35px"  >&nbsp;
                        <asp:ImageButton ID="btnImprimeGia" runat="server" ImageUrl="~/Images/bt_imprimir_guia.gif" OnClick="btnImprimeGia_Click"  />
                    </td>
                    <td> &nbsp;<asp:ImageButton ID="ImageButton7" runat="server" ImageUrl="~/Images/bt_ficha.gif" OnClick="btnFhaPci_Click"  /></td>
                    <td> &nbsp;<asp:ImageButton ID="btnPgnIni" runat="server" ImageUrl="~/Images/bt_home.gif" OnClick="btnPgnIni_Click"  /></td>
                </tr>                                 								                                                                                								
            </table>
        </asp:View>
    </asp:MultiView><br />
    <asp:HiddenField ID="hdfIdCid" runat="server" />
    <asp:HiddenField ID="hdfCid_Dsc" runat="server" />
    <asp:HiddenField ID="hdfIdGia" runat="server" />
    <asp:HiddenField ID="hdfIdBnf" runat="server" />
</asp:Content>

