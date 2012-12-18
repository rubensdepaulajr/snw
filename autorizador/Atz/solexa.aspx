<%@ Page Language="C#" MasterPageFile="~/atz.master" AutoEventWireup="true" CodeFile="solexa.aspx.cs"  Theme="Standard" Inherits="Atz_solexa" Title="Solicitação SP/SADT" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            &nbsp;
            <table cellspacing="0" cellpadding="0" width="100%" border="0">
                <tbody>
                    <tr>
                        <td style="width: 9px" align="left"><img height="37" alt="" src="../Images/tit_left.gif" width="9" /></td>
                        <td bgColor="#f4f4f4"><h2>Solicitação de SP/SADT</h2></td>
                        <td style="width: 9px" align="left"><img height="37" alt="" src="../Images/tit_right.gif" width="9" /></td>
                    </tr>
                </tbody>
            </table>
            <br />
        <table cellspacing="0" cellpadding="0" align="left" border="0">
        <tbody>
            <tr>
                <td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px" valign="middle" colspan="3" height="35"><strong>GERAL</srtong></td>
            </tr>
            <tr>
                <td align="right" width="150" height="10">Beneficiário:</td>
                <td style="width: 5px"></td>
                <td align="left"><span class="cinza-escuro"><asp:Label id="lblBnf_Mtr" runat="server"></asp:Label>-<asp:Label id="lblBnf_Nme" runat="server"></asp:Label></span></td>
            </tr>
            <tr>
                <td colspan="3" height="10"></td>
            </tr>
            <tr>
                <td align="right" width="150" height="10">Profissional:</td>
                <td style="width: 5px"></td>
                <td align="left"><asp:Label id="lblIdPrf" runat="server" Height="14px"></asp:Label> - <asp:Label id="lblPrf_Nme" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td colspan="3" height="10"></td>
            </tr>
            <tr>
                <td style="height: 14px" align="right" width="150">Especialidade:</td>
                <td style="width: 5px; height: 14px"></td>
                <td style="height: 14px" align="left"><asp:Label id="lblIdEsp" runat="server"></asp:Label>-<asp:Label id="lblEsp_Dsc" runat="server" Height="14px"></asp:Label></td>
            </tr>
            <tr>
                <td valign="middle" colspan="3" height="35"><br /></td>
            </tr>
            <tr>
                <td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px" valign="middle" colspan="3" height="35"><strong>DADOS DA SOLICITAÇÃO</strong></td>
            </tr>
            <tr>
                <td valign="top" align="right" width="150" height="10">Indicação Clínica:</td>
                <td width="5"></td>
                <td align="left"><asp:TextBox id="txtIndCln" runat="server" CssClass="campo" Height="89px" MaxLength="500" TextMode="MultiLine" Rows="7" Width="356px"></asp:TextBox> </td>
            </tr>
            <tr>
                <td align="right">CID:</td>
                <td style="width: 5px"></td>
                <td height="10">&nbsp; <asp:Label id="lblCid_Dsc" runat="server" Text="Label"></asp:Label> </td>
            </tr>
            <tr>
                <td colspan="3" height="10"></td>
            </tr>
            <tr>
                <td colspan="3" height="25"></td>
            </tr>
            <tr>
                <td valign="top" align="right" width="150" height="10">Procedimento:</td>
                <td style="width: 5px"></td>
                <td align="left"><asp:TextBox id="txtPsqPdm" runat="server" CssClass="campo"></asp:TextBox> &nbsp;<asp:ImageButton id="imgBtnAdicionar" onclick="imgBtnAdicionar_Click" runat="server" ImageUrl="~/Images/bt_adicionar.gif"></asp:ImageButton> <asp:Button id="btnPsqPdm" onclick="btnPsqPdm_Click" runat="server" CssClass="linkbutton" Text="Buscar Procedimento"></asp:Button> <asp:Image id="Image1" runat="server" ImageUrl="~/Images/ico_ajuda_campos.gif"></asp:Image></td>
            </tr>
            <tr>
                <td colspan="3" height="25"></td>
            </tr>
            <tr>
                <td style="padding-right: 0pt; padding-left: 150px; padding-bottom: 0pt; padding-top: 0pt" colspan="3">
                    <asp:GridView id="grdPdm" runat="server" CssClass="grid-view" Width="100%" onselectedindexchanged="grdPdm_SelectedIndexChanged" AutoGenerateColumns="False">
                        <RowStyle CssClass="resultado-beneficiario" />
                        <Columns>
                            <asp:BoundField DataField="Pdm_Cod" HeaderText="C&#243;digo" />
                            <asp:BoundField DataField="Pdm_Dsc" HeaderText="Descri&#231;&#227;o do Procedimento" />
                            <asp:BoundField DataField="Atz" HeaderText="Atz" Visible="False" />
                            <asp:TemplateField HeaderText="Quantidade">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtQtd_Pdm" runat="server" CssClass="campo" Width="35px" 
                                        Text='<%# Bind("Qtd") %>'></asp:TextBox>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:CommandField ButtonType="Button" SelectText="Remover" 
                                ShowSelectButton="True" >
                                <ControlStyle CssClass="linkbutton" />
                            </asp:CommandField>
                        </Columns>
                    </asp:GridView> 
                </td>
            </tr>
            <tr>
                <td colspan="3" height="10"></td>
            </tr>
            <tr>
                <td colspan="3" height="25"></td>
            </tr>
            <tr>
                <td align="right">Data da solicitação: </td>
                <td style="width: 5px"></td>
                <td>
                    <asp:Label id="txtDatEms" runat="server" Width="111px" Enabled="False"></asp:Label> &nbsp; Hora: <asp:TextBox id="txtHor" runat="server" CssClass="campo" Width="35px"></asp:TextBox> &nbsp;:&nbsp; <asp:TextBox id="txtMin" runat="server" CssClass="campo" Width="35px"></asp:TextBox> <cc1:NumericUpDownExtender id="nudTxtHor" runat="server" Width="50" TargetControlID="txtHor" Minimum="0" Maximum="23">
                                                                    </cc1:NumericUpDownExtender> <cc1:NumericUpDownExtender id="nudTxtMin" runat="server" Width="50" TargetControlID="txtMin" Minimum="0" Maximum="59">
                                                                    </cc1:NumericUpDownExtender> <cc1:FilteredTextBoxExtender id="fteTxtHor" runat="server" TargetControlID="txtHor" FilterType="numbers">
                                                                    </cc1:FilteredTextBoxExtender> <cc1:FilteredTextBoxExtender id="fteTxtMin" runat="server" TargetControlID="txtMin" FilterType="numbers">
                                                                    </cc1:FilteredTextBoxExtender> &nbsp;<asp:Image id="imgAjudaDatHorSolExa" runat="server" ImageUrl="~/Images/ico_ajuda_campos.gif"></asp:Image>
                </td>
            </tr>
            <tr>
                <td colspan="3" height="15"></td>
            </tr>
            <tr>
                <td colspan="3" height="20"><asp:Image id="ImgErr" runat="server" Height="25px" Width="25px" ImageUrl="~/Images/ico_alert.gif" Visible="False" ImageAlign="AbsMiddle"></asp:Image> <asp:Label id="lblErr" runat="server" CssClass="erro"></asp:Label></td>
            </tr>
            <tr>
                <td colSpan="3" height="15"></td>
            </tr>
            <tr>
                <td style="padding-right: 0px; padding-left: 20px; padding-bottom: 0px; padding-top: 0px; height: 42px" valign="middle" colspan="3">
                    <asp:ImageButton id="btnSol_Aut" onclick="btnSol_Aut_Click" runat="server" 
                        ImageUrl="~/Images/bt_solicitar_autorizacao.gif" style="height: 19px"></asp:ImageButton>&nbsp;&nbsp; <asp:ImageButton id="btnFhaPci" onclick="btnFhaPci_Click" runat="server" ImageUrl="~/Images/bt_ficha.gif"></asp:ImageButton> &nbsp;&nbsp; <asp:ImageButton id="btnPgaIni" onclick="btnPgaIni_Click" runat="server" ImageUrl="~/Images/bt_home.gif"></asp:ImageButton> </td>
            </tr>
            <tr>
                <td colspan="3" height="15"><br /></td>
            </tr>
            <tr>
                <td colspan="3">
            <%-- inicio do bloco do popup --%>
            <cc1:ModalPopupExtender id="ModalPopupExtender1" runat="server" TargetControlID="btnPsqPdm" PopupControlID="ModalPanel" DropShadow="true" BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender> 
                <asp:Panel id="ModalPanel" runat="server" CssClass="modalPopup" Width="830px" Direction="LeftToRight" BackColor="White">
                    <table style="border-right: #ce5c09 thin double; border-top: #ce5c09 thin double; border-left: #ce5c09 thin double; width: 100%; border-bottom: #ce5c09 thin double; background-color: #ffffff">
                        <tbody>
                            <tr>
                                <td style="width: 937px; height: 45px">
                                    <table cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
                                        <tbody>
                                            <tr>
                                                <td style="width: 9px; height: 37px" align="left"><img height="37" alt="" src="../Images/tit_left.gif" width="9" /></td>
                                                <td style="height: 37px" bgcolor="#f4f4f4"><h2>Busca de procedimento</h2></td>
                                                <td style="width: 9px; height: 37px" align="left"><img height="37" alt="" src="../Images/tit_right.gif" width="9" /></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 937px" height="15"></td>
                            </tr>
                            <tr>
                                <td style="padding-right: 10px; padding-left: 0px; padding-bottom: 0px; width: 937px; padding-top: 0px; height: 47px" vAlign=middle align=center>
                                    <table cellspacing="0" cellpadding="0" border="0">
                                        <tbody>
                                            <tr>
                                                <td style="height: 22px" align="right">Descrição:&nbsp;</td>
                                                <td style="width: 140px; height: 22px" align="right"><asp:TextBox id="txtBnf_NmePop" runat="server" CssClass="campo" Width="140px"></asp:TextBox></td>
                                                <td style="height: 22px" valign="top" align="left" width="78"></td>
                                                <td style="width: 56px; height: 22px" align="right">Código:&nbsp;</td>
                                                <td style="height: 22px" align="right" width="140"><asp:TextBox id="txtBnf_MtrPop" runat="server" Width="140px"></asp:TextBox></td>
                                                <td style="padding-right: 0px; padding-left: 5px; padding-bottom: 0px; padding-top: 0px; height: 22px" vAlign=top align=left width=78><asp:ImageButton id="btnBuscar" onclick="btnBuscar_Click" runat="server" ImageUrl="../Images/bt_buscar.gif"></asp:ImageButton></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-right: 4px; padding-left: 4px; padding-bottom: 0px; padding-top: 0px; " 
                                    valign="middle" align="center">
                                    <asp:GridView id="grd" runat="server" CssClass="grid-view" 
                                        DataSourceID="dtsPdm" Width="100%" AutoGenerateColumns="False" 
                                        DataKeyNames="Pdm_Cod,Pdm_Dsc,IdPdm,Pdm_QtdCh_,Pdm_IdGrp,Grp_QtdCh_" 
                                        OnSelectedIndexChanged="grd_SelectedIndexChanged" 
                                        OnRowCreated="gvHover_RowCreated" OnDataBound="grd_DataBound" 
                                        AllowPaging="True" AllowSorting="True" OnSorted="grd_Sorted" PageSize="6">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Código" SortExpression="Pdm_Cod">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Pdm_Cod") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Pdm_Cod") %>'></asp:Label>
                                                    <br />
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Pdm_CodAmb") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Left" />
                                                <ItemStyle HorizontalAlign="Left" Width="10%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Descrição" ShowHeader="False" 
                                                SortExpression="Pdm_Dsc">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" 
                                                        CommandName="Select" Text='<%# Eval("Pdm_Dsc") %>'></asp:LinkButton>
                                                    <br />
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Pdm_DscAmb") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Left" />
                                                <ItemStyle HorizontalAlign="Left" Width="40%" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Pdm_DscRsm" HeaderText="Apelido" SortExpression="Pdm_DscRsm">
                                                <HeaderStyle HorizontalAlign="Left" />
                                                <ItemStyle HorizontalAlign="Left" Width="28%" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Grp_Dsc" HeaderText="Grupo" SortExpression="Grp_Dsc">
                                                <HeaderStyle HorizontalAlign="Left" />
                                                <ItemStyle HorizontalAlign="Left" Width="22%" />
                                            </asp:BoundField>
                                        </Columns>
                                        <PagerTemplate>
                                            <div height="20">
                                                <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument="First" ImageUrl="~/Images/seta1_1_on.gif"
                                                    OnCommand="Paginategrd" />&nbsp;
                                                <asp:ImageButton ID="ImageButton2" runat="server" CommandArgument="Prev" ImageUrl="~/Images/seta1_2_on.gif"
                                                    OnCommand="Paginategrd" />
                                                Página
                                                <asp:DropDownList ID="ddlPages" runat="server" AutoPostBack="True" CssClass="campo"
                                                    OnSelectedIndexChanged="ddlPages_SelectedIndexChanged">
                                                </asp:DropDownList>de
                                                <asp:Label ID="lblPageCount" runat="server"></asp:Label>&nbsp;
                                                <asp:ImageButton ID="ImageButton3" runat="server" CommandArgument="Next" ImageUrl="~/Images/seta2_1_on.gif"
                                                    OnCommand="Paginategrd" />&nbsp;
                                                <asp:ImageButton ID="ImageButton4" runat="server" CommandArgument="Last" ImageUrl="~/Images/seta2_2_on.gif"
                                                    OnCommand="Paginategrd" />
                                            </div>                                                            
                                        </PagerTemplate>
                                    </asp:GridView> 
                                    <asp:SqlDataSource id="dtsPdm" runat="server" SelectCommandType="StoredProcedure" SelectCommand="ssAtz_Pdm" ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" CancelSelectOnNullParameter="False">
                                        <SelectParameters>
                                            <asp:Parameter Name="IdPdm" Type="Int32" />
                                            <asp:Parameter Name="Pdm_Cod" Type="String" />
                                            <asp:Parameter Name="Pdm_IdGrp" Type="Int16" />
                                            <asp:Parameter Name="Pdm_Dsc" Type="String" />
                                            <asp:Parameter Name="Grp_Dsc" Type="String" />
                                            <asp:Parameter DefaultValue="True" Name="Pdm_Atv" Type="Boolean" />
                                        </SelectParameters>
                                    </asp:SqlDataSource> 
                                    <asp:Label id="lblEmptyGrid" runat="server" Text=""></asp:Label> 
                                    <h2 align=right>&nbsp;
                                    <asp:ImageButton id="btn_fechar" onclick="btn_fechar_Click" runat="server" ImageUrl="~/Images/bt_fecha.gif"></asp:ImageButton></H2>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </asp:Panel>
            <%-- fim do bloco do popup --%>
            <asp:HiddenField id="hdfIdGia" runat="server"></asp:HiddenField>
            <asp:HiddenField id="hdfIdBnf" runat="server"></asp:HiddenField>
        
                    <asp:HiddenField ID="hdfGiaCrt" runat="server" />
        
                </td>
            </tr>
        </tbody>

        </table>
        <br />
        <br />
        </contenttemplate>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="updateProgessTb1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <div id="OuterTableCellOverlay" class="updateProgress">
                <div id="InnerTableCellOverlay" class="updateProgressMessage">                                    
                    <asp:Image ID="LoadImage" runat="server" ImageUrl="~/Images/ajax-loader.gif" />
                    <br />
                    <b>Aguarde, processando ...</b>                                    
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>
	            
