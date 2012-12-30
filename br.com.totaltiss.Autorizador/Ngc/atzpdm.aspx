<%@ Page Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" 
    Inherits="Ngc_atzpdm" Title="Cadastro de Procedimentos" Codebehind="atzpdm.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:UpdatePanel id="UpdatePanel1" runat="server">
        <contenttemplate>
            <div id="Titulo">
                <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td align="left" style="width: 8px">
                            <img alt="" height="37" src="../images/tit_left.gif" width="9" /></td>
                        <td bgcolor="#f4f4f4">
                            <h2>
                                Procedimentos</h2>
                        </td>
                        <td align="left" width="9">
                            <img alt="" height="37" src="../images/tit_right.gif" width="9" /></td>
                    </tr>
                </table>        
            </div>            
            <br />
            <br />
            <br />
            <hr />
            <div id="botoes">
                <asp:Button id="btnNew" onclick="btnNew_Click" runat="server" CssClass="input7" Text="Novo"></asp:Button> 
                <img height="5" alt=" " src="../Images/spacer.gif" width="5" border="0" /> 
                <asp:Button id="btnEdit" onclick="btnEdit_Click" runat="server" CssClass="input7" Text="Alterar"></asp:Button> 
                <img height="5" alt=" " src="../Images/spacer.gif" width="5" border="0" /> 
                <asp:Button id="btnDel" onclick="btnDel_Click" runat="server" CssClass="input7" Text="Excluir"></asp:Button>
                <img height="5" alt=" " src="../Images/spacer.gif" width="5" border="0" /> 
                <asp:Button id="btn" onclick="btnOrt_Click" runat="server" Text="Orientações"></asp:Button>
                &nbsp;&nbsp;&nbsp;
                <asp:Label id="lblToolBar" runat="server" CssClass="erro"></asp:Label> 
            <hr />
            </div>
            <img height="15" alt="" src="../Images/spacer.gif" width="5" border="0" /> 
            <asp:Panel id="pnlPsq" runat="server"><b>Pesquisar procedimento</b><br />
            <table>
            <tbody>
            <tr>
            <td>
                <asp:RadioButtonList id="rblTipAco" runat="server" CssClass="azulescuropequeno" RepeatDirection="Horizontal">
                    <asp:ListItem Value="Pdm_Cod">C&#243;digo</asp:ListItem>
                    <asp:ListItem Selected="True" Value="Pdm_Dsc">Nome</asp:ListItem>
                    <asp:ListItem Value="Grp_Dsc">Grupo</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator id="rqlTipoPesquisa" runat="server" ControlToValidate="rblTipAco" ErrorMessage="* Selecione um tipo de pesquisa acima"></asp:RequiredFieldValidator>
            </td>
            </tr>
            <tr>
            <td>
            <asp:TextBox id="txtPsq" runat="server" CssClass="input2" Width="130px"></asp:TextBox> &nbsp; &nbsp;&nbsp; <asp:Button id="btnSearch" onclick="btnSearch_Click" runat="server" CssClass="input7" Text="Pesquisar" Width="100px"></asp:Button></TD></TR></TBODY></TABLE></asp:Panel> 
            <img height="15" alt=" " src="../Images/spacer.gif" width="5" border="0" /> &nbsp;&nbsp; 
            <asp:Panel id="pnlInfoPdm" runat="server">
                <div id="divInf">
                    <b>Informações do procedimento:</b> 
                    <table>
                    <tbody>
                        <tr>
                            <td align="right">Id:</td>
                            <td colspan="3">
                                <asp:TextBox id="txtIdPdm" runat="server" Enabled="False"></asp:TextBox>
                            </td></tr>
                        <tr>
                            <td align="right">Código TUSS:</td>
                            <td colspan="3">
                                <asp:TextBox id="txtPdmCod" runat="server" MaxLength="20"></asp:TextBox>*</TD>
                        </tr>
                        <tr>
                            <td align="right">Descrição TUSS:</td>
                            <td colspan="3">
                                <asp:TextBox id="txtPdmDsc" runat="server" MaxLength="80" Width="450px"></asp:TextBox>&nbsp; </td>
                        </tr>
                        <tr>
                            <td align="right">Código AMB:</td>
                            <td style="width: 415px"colspan="3">
                                <asp:TextBox id="txtPdmCodAmb" runat="server"></asp:TextBox></TD>
                        </tr>
                        <tr>
                            <td align="right">Descrição AMB:</td>
                            <td colspan="3">
                                <asp:TextBox id="txtPdmDscAmb" runat="server" MaxLength="80" Width="450px"></asp:TextBox>&nbsp; </td>
                        </tr>    
                        <tr>
                            <td align="right">Apelido:</td>
                            <td colspan="3">
                                <asp:TextBox id="txtPdmDscRsm" runat="server" MaxLength="35" Width="450px"></asp:TextBox>&nbsp; </td>
                        </tr>
                        <tr>
                            <td align="right" style="height: 27px">
                                Sexo:</td>
                            <td colspan="3" style="height: 27px">
                                <asp:DropDownList ID="ddlPdmSxo" runat="server">
                                    <asp:ListItem Value="A">TODOS</asp:ListItem>
                                    <asp:ListItem Value="F">FEMININO</asp:ListItem>
                                    <asp:ListItem Value="M">MASCULINO</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">Ativo?
                            </td>
                            <td>
                                <asp:CheckBox ID="chkPdmAtv" runat="server" />
                            </td>
                            <td align="right">Alta complexidade?
                            </td>
                            <td>
                                <asp:CheckBox id="chkPdmAltCpx" runat="server"></asp:CheckBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">Especial?
                            </td>
                            <td>
                                <asp:CheckBox id="chkPdmEsp" runat="server"></asp:CheckBox>
                            </td>
                            <td align="right">Requer profissional?
                            </td>
                            <td>
                                <asp:CheckBox id="chkPdmPrf" runat="server"></asp:CheckBox>
                            </td>
                        </tr>  
                        <tr>
                            <td align="right">Bloqueado para urgência?
                            </td>
                            <td>
                                <asp:CheckBox ID="chkPdmBlqUrg" runat="server" />
                            </td>
                            <td align="right">
                            </td>
                            <td>            
                            </td>
                        </tr>  
                        <tr>
                            <td align="right">Tabela:
                            </td>
                            <td colspan="3">
                                <asp:DropDownList id="ddlPdmIdTab" runat="server" 
                                        DataSourceID="dtsPdm_IdTab" DataValueField="IdTab" DataTextField="Tab_Dsc">
                                </asp:DropDownList> <asp:SqlDataSource id="dtsPdm_IdTab" runat="server" 
                                                SelectCommand="SELECT [Tab_Dsc], [IdTab] FROM [Atz_Tab]" 
                                                ConnectionString="<%$ ConnectionStrings:AppConnectionString %>"></asp:SqlDataSource> 
                            </td>
                        </tr>  
                        <tr>
                            <td align="right">Tipo de procedimento:
                            </td>
                            <td>
                                <asp:DropDownList id="ddlPdmIdTpp" runat="server" 
                                            DataSourceID="dtsAtz_Tpp" DataValueField="IdTpp" DataTextField="Tpp_Dsc">
                                </asp:DropDownList> <asp:SqlDataSource id="dtsAtz_Tpp" runat="server" 
                                                    SelectCommand="SELECT [IdTpp], [Tpp_Dsc] FROM [Atz_Tpp]" 
                                                    ConnectionString="<%$ ConnectionStrings:AppConnectionString %>"></asp:SqlDataSource>
                            </td>
                            <td align="right">Grupo de procedimento:
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlPdmIdGrp" runat="server" 
                                            DataSourceID="dtsPdm_IdGrp" DataTextField="Grp_Dsc" DataValueField="IdGrp">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="dtsPdm_IdGrp" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" 
                                    SelectCommand="SELECT [IdGrp], [Grp_Dsc] FROM [Atz_Grp]">
                                </asp:SqlDataSource>
                            </td>
                        </tr>  
                        <tr>
                            <td align="right">
                                Quantidade de CH:</td><td>
                                <asp:TextBox ID="txtPdmQtdCh_" runat="server" MaxLength="9"></asp:TextBox><%--<cc1:FilteredTextBoxExtender ID="txtPdmQtdCh__FilteredTextBoxExtender" 
                                        runat="server" FilterType="Custom, Numbers" ValidChars="," TargetControlID="txtPdmQtdCh_">
                                    </cc1:FilteredTextBoxExtender>--%>
                            </td>
                            <td align="right">
                                Quantidade de filme:</td><td>
                                <asp:TextBox ID="txtPdmQtdFlm" runat="server" MaxLength="9"></asp:TextBox><%--<cc1:FilteredTextBoxExtender ID="txtPdmQtdFlm_FilteredTextBoxExtender" 
                                    runat="server" FilterType="Custom, Numbers" ValidChars="," TargetControlID="txtPdmQtdFlm">
                                </cc1:FilteredTextBoxExtender>--%>
                            </td>
                        </tr>  
                        <tr>
                            <td align="right">
                                Idade mínima:</td><td>
                                <asp:TextBox ID="txtPdmIddMin" runat="server" MaxLength="3"></asp:TextBox><%--<cc1:FilteredTextBoxExtender id="ftePdmIddMin" runat="server" 
                                        FilterType="Numbers" TargetControlID="txtPdmIddMin">
                            </cc1:FilteredTextBoxExtender>--%> </td>
                            </td>
                            <td align="right">
                                Idade máxima:</td><td>
                                <asp:TextBox ID="txtPdmIddMax" runat="server" MaxLength="3"></asp:TextBox><%--<cc1:FilteredTextBoxExtender id="ftePdmIddMax" runat="server" 
                                        FilterType="Numbers" TargetControlID="txtPdmIddMax">
                                </cc1:FilteredTextBoxExtender>--%> 
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Qtd. máx solicitada:</td><td>
                                <asp:TextBox ID="txtPdmQtdMax" runat="server" MaxLength="5"></asp:TextBox><%--<cc1:FilteredTextBoxExtender id="ftePdmQtdMax" runat="server" 
                                        FilterType="Numbers" TargetControlID="txtPdmQtdMax">
                                </cc1:FilteredTextBoxExtender>--%>
                            </td>
                            <td align="right" style="height: 17px">
                                Qtd. máx executada dia:</td><td>
                                <asp:TextBox ID="txtPdmQtdDia" runat="server" MaxLength="5"></asp:TextBox><%--<cc1:FilteredTextBoxExtender id="ftePdmQtdDia" runat="server" 
                                        FilterType="Numbers" TargetControlID="txtPdmQtdDia">
                                </cc1:FilteredTextBoxExtender>--%> 
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Qtd. máx executada mês:</td><td>
                                <asp:TextBox ID="txtPdmQtdMes" runat="server" MaxLength="5"></asp:TextBox><%--<cc1:FilteredTextBoxExtender id="ftePdmQtdMes" runat="server" 
                                        FilterType="Numbers" TargetControlID="txtPdmQtdMes">
                                </cc1:FilteredTextBoxExtender>--%>
                            </td>
                            <td align="right">
                                Qtd. máx executada ano:</td><td>
                                <asp:TextBox ID="txtPdmQtdAno" runat="server" MaxLength="5"></asp:TextBox><%--<cc1:FilteredTextBoxExtender id="ftePdmQtdAno" runat="server" 
                                        FilterType="Numbers" TargetControlID="txtPdmQtdAno">
                                </cc1:FilteredTextBoxExtender>--%>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Min. dias para repetir o procedimento:</td><td>
                                <asp:TextBox ID="txtPdmRtn" runat="server" MaxLength="5"></asp:TextBox><%--<cc1:FilteredTextBoxExtender ID="ftePdmRtn" runat="server" FilterType="Numbers" 
                                    TargetControlID="txtPdmRtn">
                                </cc1:FilteredTextBoxExtender>--%>
                            </td>
                            <td align="right">
                                &nbsp;</td><td>
                                &nbsp;</td>
                        </tr>
                       <tr>
                            <td align="center" colspan="4" style="HEIGHT: 21px">
                                <asp:Button ID="btnSave" runat="server" CssClass="input7" 
                                    onclick="btnSave_Click" Text="Gravar" style="height: 26px" />
                                &nbsp;
                                <asp:Button ID="btnCancel" runat="server" CssClass="input7" 
                                    onclick="btnCancel_Click" Text="Cancelar" />
                            </td>
                        </tr>
                    </tbody>
                    </table>
                </div>
                <asp:Label id="lblMsg" runat="server" CssClass="erro" 
                    Text="* Campos obrigatórios em branco" Width="271px" Visible="False"></asp:Label>
            </asp:Panel>
            &nbsp;&nbsp;
            <br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
            <asp:GridView id="grd" runat="server" Width="100%" Font-Size="X-Small" PageSize="20" 
                OnSelectedIndexChanged="grd_SelectedIndexChanged" DataSourceID="dts" 
                DataKeyNames="IdPdm,Pdm_IdTab,Pdm_IdTpp,Pdm_IdGrp" AutoGenerateColumns="False" AllowSorting="True" 
                AllowPaging="True" OnPageIndexChanging="grd_PageIndexChanging" SkinID="gridCRUD">
                <Columns>                    
                    <asp:BoundField DataField="IdPdm" HeaderText="ID" ReadOnly="True" InsertVisible="False" SortExpression="IdPdm">
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Pdm_Cod" HeaderText="C&#243;digo TUSS" SortExpression="Pdm_Cod"></asp:BoundField>
                    <asp:BoundField DataField="Tab_Dsc" HeaderText="Tabela" SortExpression="Tab_Dsc">
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Tpp_Dsc" HeaderText="Tipo" ReadOnly="True" SortExpression="Tpp_Dsc"></asp:BoundField>
                    <asp:BoundField DataField="Grp_Dsc" HeaderText="Grupo" ReadOnly="True" SortExpression="Grp_Dsc"></asp:BoundField>
                    <asp:BoundField DataField="Pdm_Dsc" HeaderText="Descri&#231;&#227;o TUSS" SortExpression="Pdm_Dsc"></asp:BoundField>
                    <asp:BoundField DataField="Pdm_DscRsm" HeaderText="Apelido" SortExpression="Pdm_DscRsm"></asp:BoundField>
                    <asp:BoundField DataField="Pdm_CodAmb" HeaderText="C&#243;digo AMB" SortExpression="Pdm_CodAmb"></asp:BoundField>
                    <asp:BoundField DataField="Pdm_DscAmb" HeaderText="Descri&#231;&#227;o AMB" SortExpression="Pdm_DscAmb"></asp:BoundField>
                    <asp:BoundField DataField="Pdm_QtdCh_" HeaderText="Qtd.CH" SortExpression="Pdm_QtdCh_">
                        <ItemStyle HorizontalAlign="Right"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Pdm_QtdFlm" HeaderText="Qtd.Filme" SortExpression="Pdm_QtdFlm">
                        <ItemStyle HorizontalAlign="Right"></ItemStyle>
                    </asp:BoundField>
                        <asp:TemplateField HeaderText="Ativo" SortExpression="Pdm_Atv">
                            <EditItemTemplate>
                                <asp:CheckBox ID="CheckBox4" runat="server" Checked='<%# Bind("Pdm_Atv") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkAtv" runat="server" Checked='<%# Bind("Pdm_Atv") %>' Enabled="false" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Alta Compl." SortExpression="Pdm_AltCpx"><EditItemTemplate>
                            <asp:CheckBox runat="server" Checked='<%# Bind("Pdm_AltCpx") %>' id="CheckBox1"></asp:CheckBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:CheckBox id="chkAltCpx" runat="server" Enabled="false" Checked='<%# Bind("Pdm_AltCpx") %>'></asp:CheckBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Especial" SortExpression="Pdm_Esp"><EditItemTemplate>
                            <asp:CheckBox runat="server" Checked='<%# Bind("Pdm_Esp") %>' id="CheckBox2"></asp:CheckBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:CheckBox id="ChkEsp" runat="server" Enabled="false" Checked='<%# Bind("Pdm_Esp") %>'></asp:CheckBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Requer Prf." SortExpression="Pdm_Prf"><EditItemTemplate>
                            <asp:CheckBox runat="server" Checked='<%# Bind("Pdm_Prf") %>' id="CheckBox3"></asp:CheckBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:CheckBox id="ChkPrf" runat="server" Enabled="false" Checked='<%# Bind("Pdm_Prf") %>'></asp:CheckBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Bloqueado Urg." SortExpression="Pdm_BlqUrg"><EditItemTemplate>
                            <asp:CheckBox runat="server" Checked='<%# Bind("Pdm_BlqUrg") %>' id="CheckBox4"></asp:CheckBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:CheckBox id="ChkBlqUrg" runat="server" Enabled="false" Checked='<%# Bind("Pdm_BlqUrg") %>'></asp:CheckBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                    <asp:BoundField DataField="Pdm_Sxo" HeaderText="Sexo" SortExpression="Pdm_Sxo">
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Pdm_IddMin" HeaderText="Idade M&#237;nima" SortExpression="Pdm_IddMin">
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Pdm_IddMax" HeaderText="Idade M&#225;xima" SortExpression="Pdm_IddMax">
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Pdm_QtdMax" HeaderText="Qtd. Max Solicitada" SortExpression="Pdm_QtdMax">
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Pdm_QtdDia" HeaderText="Qtd. Max. Exec. Dia " SortExpression="Pdm_QtdDia">
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Pdm_QtdMes" HeaderText="Qtd. Max Exec. M&#234;s" SortExpression="Pdm_QtdMes">
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Pdm_QtdAno" HeaderText="Qtd. Max. Exec. Ano" SortExpression="Pdm_QtdAno">
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Pdm_Rtn" HeaderText="Qtd. Min. Dias. Repetir" SortExpression="Pdm_Rtn">
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:CommandField SelectText="Selecionar" ShowSelectButton="True" />                    
                </Columns>                
            </asp:GridView> 
            <asp:SqlDataSource id="dts" runat="server" DeleteCommand="delete from atz_pdm where idpdm = @idpdm" 
                UpdateCommandType="StoredProcedure" UpdateCommand="stAtz_Pdm" InsertCommandType="StoredProcedure" 
                InsertCommand="stAtz_Pdm" SelectCommandType="StoredProcedure" SelectCommand="ssAtz_Pdm" 
                ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" 
                CancelSelectOnNullParameter="False">
            <SelectParameters>
            <asp:Parameter Name="IdPdm" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Pdm_Cod" Type="String"></asp:Parameter>
            <asp:Parameter Name="Pdm_IdGrp" Type="Byte"></asp:Parameter>
            <asp:Parameter Name="Pdm_Dsc" Type="String"></asp:Parameter>
            <asp:Parameter Name="Grp_Dsc" Type="String"></asp:Parameter>
            </SelectParameters>
            <DeleteParameters>
            <asp:ControlParameter ControlID="txtIdPdm" PropertyName="Text" Name="idpdm"></asp:ControlParameter>
            </DeleteParameters>
            <UpdateParameters>
            <asp:ControlParameter ControlID="txtIdPdm" PropertyName="Text" Name="IdPdm" Type="Int32"></asp:ControlParameter>
            <asp:ControlParameter ControlID="txtPdmCod" PropertyName="Text" Name="Pdm_Cod" Type="String"></asp:ControlParameter>
            <asp:ControlParameter ControlID="ddlPdmIdTab" PropertyName="SelectedValue" Name="Pdm_IdTab" Type="Byte"></asp:ControlParameter>
            <asp:ControlParameter ControlID="ddlPdmIdTpp" PropertyName="SelectedValue" Name="Pdm_IdTpp" Type="Byte"></asp:ControlParameter>
            <asp:ControlParameter ControlID="ddlPdmIdGrp" PropertyName="SelectedValue" Name="Pdm_IdGrp" Type="Byte"></asp:ControlParameter>
            <asp:ControlParameter ControlID="txtPdmDsc" PropertyName="Text" Name="Pdm_Dsc" Type="String"></asp:ControlParameter>
            <asp:ControlParameter ControlID="chkPdmAltCpx" PropertyName="Checked" Name="Pdm_AltCpx" Type="Boolean"></asp:ControlParameter>
            <asp:ControlParameter ControlID="txtPdmDscRsm" PropertyName="Text" Name="Pdm_DscRsm" Type="String"></asp:ControlParameter>
            <asp:ControlParameter ControlID="ddlPdmSxo" PropertyName="SelectedValue" Name="Pdm_Sxo" Type="String"></asp:ControlParameter>
            <asp:ControlParameter ControlID="txtPdmIddMin" PropertyName="Text" Name="Pdm_IddMin" Type="Byte"></asp:ControlParameter>
            <asp:ControlParameter ControlID="txtPdmIddMax" PropertyName="Text" Name="Pdm_IddMax" Type="Byte"></asp:ControlParameter>
            <asp:ControlParameter ControlID="txtPdmQtdMax" PropertyName="Text" Name="Pdm_QtdMax" Type="Byte"></asp:ControlParameter>
            <asp:ControlParameter ControlID="txtPdmQtdDia" PropertyName="Text" Name="Pdm_QtdDia" Type="Byte"></asp:ControlParameter>
            <asp:ControlParameter ControlID="txtPdmQtdMes" PropertyName="Text" Name="Pdm_QtdMes" Type="Byte"></asp:ControlParameter>
            <asp:ControlParameter ControlID="txtPdmQtdAno" PropertyName="Text" Name="Pdm_QtdAno" Type="Byte"></asp:ControlParameter>
            <asp:ControlParameter ControlID="txtPdmRtn" PropertyName="Text" Name="Pdm_Rtn" Type="Int16"></asp:ControlParameter>
            <asp:ControlParameter ControlID="chkPdmEsp" PropertyName="Checked" Name="Pdm_Esp" Type="Boolean"></asp:ControlParameter>
            <asp:ControlParameter ControlID="chkPdmPrf" PropertyName="Checked" Name="Pdm_Prf" Type="Boolean"></asp:ControlParameter>
            <asp:ControlParameter ControlID="chkPdmAtv" Name="Pdm_Atv" PropertyName="Checked" Type="Boolean" />
            <asp:ControlParameter ControlID="chkPdmBlqUrg" Name="Pdm_BlqUrg" 
                    PropertyName="Checked" Type="Boolean" />
                <asp:ControlParameter ControlID="txtPdmQtdCh_" Name="Pdm_QtdCh_" 
                    PropertyName="Text" Type="Decimal" />
                <asp:ControlParameter ControlID="txtPdmQtdFlm" Name="Pdm_QtdFlm" 
                    PropertyName="Text" Type="Decimal" />
                <asp:ControlParameter ControlID="txtPdmCodAmb" Name="Pdm_CodAmb" 
                    PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtPdmDscAmb" Name="Pdm_DscAmb" 
                    PropertyName="Text" Type="String" />
            </UpdateParameters>
            <InsertParameters>
            <asp:ControlParameter ControlID="txtIdPdm" PropertyName="Text" Name="IdPdm" Type="Int32"></asp:ControlParameter>
            <asp:ControlParameter ControlID="txtPdmCod" PropertyName="Text" Name="Pdm_Cod" Type="String"></asp:ControlParameter>
            <asp:ControlParameter ControlID="ddlPdmIdTab" PropertyName="SelectedValue" Name="Pdm_IdTab" Type="Byte"></asp:ControlParameter>
            <asp:ControlParameter ControlID="ddlPdmIdTpp" PropertyName="SelectedValue" Name="Pdm_IdTpp" Type="Byte"></asp:ControlParameter>
            <asp:ControlParameter ControlID="ddlPdmIdGrp" PropertyName="SelectedValue" Name="Pdm_IdGrp" Type="Byte"></asp:ControlParameter>
            <asp:ControlParameter ControlID="txtPdmDsc" PropertyName="Text" Name="Pdm_Dsc" Type="String"></asp:ControlParameter>
            <asp:ControlParameter ControlID="chkPdmAltCpx" PropertyName="Checked" Name="Pdm_AltCpx" Type="Boolean"></asp:ControlParameter>
            <asp:ControlParameter ControlID="txtPdmDsc" PropertyName="Text" Name="Pdm_DscRsm" Type="String"></asp:ControlParameter>
            <asp:ControlParameter ControlID="ddlPdmSxo" PropertyName="SelectedValue" Name="Pdm_Sxo" Type="String"></asp:ControlParameter>
            <asp:ControlParameter ControlID="txtPdmIddMin" PropertyName="Text" Name="Pdm_IddMin" Type="Byte"></asp:ControlParameter>
            <asp:ControlParameter ControlID="txtPdmIddMax" PropertyName="Text" Name="Pdm_IddMax" Type="Byte"></asp:ControlParameter>
            <asp:ControlParameter ControlID="txtPdmQtdMax" PropertyName="Text" Name="Pdm_QtdMax" Type="Byte"></asp:ControlParameter>
            <asp:ControlParameter ControlID="txtPdmQtdDia" PropertyName="Text" Name="Pdm_QtdDia" Type="Byte"></asp:ControlParameter>
            <asp:ControlParameter ControlID="txtPdmQtdMes" PropertyName="Text" Name="Pdm_QtdMes" Type="Byte"></asp:ControlParameter>
            <asp:ControlParameter ControlID="txtPdmQtdAno" PropertyName="Text" Name="Pdm_QtdAno" Type="Byte"></asp:ControlParameter>
            <asp:ControlParameter ControlID="txtPdmRtn" PropertyName="Text" Name="Pdm_Rtn" Type="Int16"></asp:ControlParameter>
            <asp:ControlParameter ControlID="chkPdmEsp" PropertyName="Checked" Name="Pdm_Esp" Type="Boolean"></asp:ControlParameter>
            <asp:ControlParameter ControlID="chkPdmPrf" PropertyName="Checked" Name="Pdm_Prf" Type="Boolean"></asp:ControlParameter>
            <asp:ControlParameter ControlID="chkPdmAtv" Name="Pdm_Atv" PropertyName="Checked" Type="Boolean" />
            <asp:ControlParameter ControlID="chkPdmBlqUrg" Name="Pdm_BlqUrg" PropertyName="Checked" Type="Boolean" />
            <asp:ControlParameter ControlID="txtPdmQtdCh_" Name="Pdm_QtdCh_" PropertyName="Text" Type="Decimal" />
            <asp:ControlParameter ControlID="txtPdmQtdFlm" Name="Pdm_QtdFlm" PropertyName="Text" Type="Decimal" />
            <asp:ControlParameter ControlID="txtPdmCodAmb" Name="Pdm_CodAmb" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtPdmDscAmb" Name="Pdm_DscAmb" PropertyName="Text" Type="String" />
            </InsertParameters>
            </asp:SqlDataSource> 
        </contenttemplate>
    </asp:UpdatePanel> 
    <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel1" runat="server" DisplayAfter="0">
        <ProgressTemplate>
	        <br />
	        <img src="../Images/ActivityIndicator.gif" alt="" /> Processing your request.  Please wait....
        </ProgressTemplate>
    </asp:UpdateProgress> 
</asp:Content>


