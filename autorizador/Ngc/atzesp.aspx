<%@ Page Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" CodeFile="atzesp.aspx.cs" Inherits="Ngc_atzesp" Title="Cadastro de Especialidades" %>

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
                                Especialidades</h2>
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
<div id="botoes"><asp:Button id="btnNew" onclick="btnNew_Click" runat="server" CssClass="input7" Text="Novo"></asp:Button> <IMG height=5 alt=" " src="../Images/spacer.gif" width=5 border=0 /> <asp:Button id="btnEdit" onclick="btnEdit_Click" runat="server" CssClass="input7" Text="Alterar"></asp:Button> <IMG height=5 alt=" " src="../Images/spacer.gif" width=5 border=0 />&nbsp; <asp:Button id="btnDel" onclick="btnDel_Click" runat="server" CssClass="input7" Text="Excluir"></asp:Button> 
    <asp:Label id="lblEditError" runat="server" CssClass="erro" 
        Text="* Nenhum item selecionado" Width="271px" Visible="False"></asp:Label> 
<hr />
</div><img height=15 alt="" src="../Images/spacer.gif" width=5 border=0 /> <asp:Panel id="pnlPsq" runat="server"><B>Pesquisar especialidade</B><BR /><TABLE><TBODY><TR><TD style="WIDTH: 267px"><asp:RadioButtonList id="rblTipAco" runat="server" CssClass="azulescuropequeno" RepeatDirection="Horizontal">
           <asp:ListItem Value="Esp_Cbo">CBO</asp:ListItem>
           <asp:ListItem Value="Esp_Dsc">Nome</asp:ListItem>
        </asp:RadioButtonList> <asp:RequiredFieldValidator id="rqlTipoPesquisa" runat="server" 
                    ControlToValidate="rblTipAco" 
                    ErrorMessage="* Selecione um tipo de pesquisa acima" CssClass="erro"></asp:RequiredFieldValidator></TD></TR><TR><TD style="WIDTH: 267px"><asp:TextBox id="txtNme" runat="server" CssClass="input2" Width="130px"></asp:TextBox> &nbsp; &nbsp;&nbsp; <asp:Button id="btnSearch" onclick="btnSearch_Click" runat="server" CssClass="input7" Text="Pesquisar" Width="100px"></asp:Button></TD></TR></TBODY></TABLE></asp:Panel> <IMG height=15 alt=" " src="../Images/spacer.gif" width=5 border=0 /> &nbsp;&nbsp; <asp:Panel id="pnlInf" runat="server">
        <DIV><B>Informações da especialidade:</B> 
        <TABLE>
        <TBODY>
        <TR>
        <TD style="HEIGHT: 21px; TEXT-ALIGN: right">Código:</TD>
        <TD style="HEIGHT: 21px"><asp:TextBox id="txtIdEsp" runat="server" CssClass="inputID" Width="129px" MaxLength="80"></asp:TextBox></TD></TR>
        <TR>
        <TD style="HEIGHT: 21px; TEXT-ALIGN: right">Descrição:</TD>
        <TD class="vermelhonormal"><asp:TextBox id="txtEsp_Dsc" runat="server" CssClass="input2" Width="400px" MaxLength="80"></asp:TextBox>*</TD></TR>
        <TR><TD style="HEIGHT: 21px; TEXT-ALIGN: right">CBO:</TD><TD style="HEIGHT: 21px" class="vermelhonormal"><asp:TextBox id="txtEsp_Cbo" runat="server" CssClass="input2" Width="129px" MaxLength="10"></asp:TextBox>*</TD></TR>
            <tr>
                <td style="height: 21px; text-align: right">
                    Cód. no Sis. de Gestão</td>
                <td class="vermelhonormal" style="height: 21px">
                    <asp:TextBox ID="txtEsp_SisGst" runat="server" CssClass="input2" MaxLength="10" Width="129px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="height: 34px" align="right">Alta complexidade:</td>
                <td style="width: 415px; height: 34px" class="vermelhonormal"><asp:CheckBox id="chkEspAltCpx" runat="server"></asp:CheckBox></td>
            </tr>
            <tr>
                <td align="right">Sexo:</td>
                <td style="WIDTH: 415px">
                        <asp:DropDownList ID="ddlEspSxo" runat="server" CssClass="input2">
                            <asp:ListItem Value="A">TODOS</asp:ListItem>
                            <asp:ListItem Value="F">FEMININO</asp:ListItem>
                            <asp:ListItem Value="M">MASCULINO</asp:ListItem>
                        </asp:DropDownList>
                        </td>
            </tr>
            <tr>
                <td align="right">Idade mínima:</td>
                <td style="WIDTH: 415px">
                        <asp:TextBox id="txtEspIddMin" runat="server" CssClass="input2" MaxLength="3"></asp:TextBox> 
                        <cc1:FilteredTextBoxExtender id="fteEspIddMin" runat="server" 
                            FilterType="Numbers" TargetControlID="txtEspIddMin">
                </cc1:FilteredTextBoxExtender> </td>
            </tr>
            <tr>
                <td align="right">Idade máxima:</td>
                <td style="WIDTH: 415px">
                        <asp:TextBox id="txtEspIddMax" runat="server" CssClass="input2" MaxLength="3"></asp:TextBox> 
                        <cc1:FilteredTextBoxExtender id="fteEspIddMax" runat="server" 
                            FilterType="Numbers" TargetControlID="txtEspIddMax">
                </cc1:FilteredTextBoxExtender> </td>
            </tr>
            <tr>
                <td align="right">Qtd. max solicitada:</td>
                <td style="WIDTH: 415px">
                        <asp:TextBox id="txtEspQtdMax" runat="server" CssClass="input2" MaxLength="5"></asp:TextBox> 
                        <cc1:FilteredTextBoxExtender id="fteEspQtdMax" runat="server" 
                            FilterType="Numbers" TargetControlID="txtEspQtdMax">
                </cc1:FilteredTextBoxExtender> </td>
            </tr>
            <tr>
                <td align="right">Qtd. max executada dia:</td>
                <td style="WIDTH: 415px">
                        <asp:TextBox id="txtEspQtdDia" runat="server" CssClass="input2" MaxLength="5"></asp:TextBox> 
                        <cc1:FilteredTextBoxExtender id="fteEspQtdDia" runat="server" 
                            FilterType="Numbers" TargetControlID="txtEspQtdDia">
                </cc1:FilteredTextBoxExtender> </td>
            </tr>
            <tr>
                <td align="right">Qtd. max executada mês:</td>
                <td style="WIDTH: 415px">
                        <asp:TextBox id="txtEspQtdMes" runat="server" CssClass="input2" MaxLength="5"></asp:TextBox> 
                        <cc1:FilteredTextBoxExtender id="fteEspQtdMes" runat="server" 
                            FilterType="Numbers" TargetControlID="txtEspQtdMes">
                </cc1:FilteredTextBoxExtender> </td>
            </tr>
            <tr>
                <td align="right">Qtd. max executada ano:</td>
                <td style="WIDTH: 415px">
                        <asp:TextBox id="txtEspQtdAno" runat="server" CssClass="input2" MaxLength="5"></asp:TextBox> 
                        <cc1:FilteredTextBoxExtender id="fteEspQtdAno" runat="server" 
                            FilterType="Numbers" TargetControlID="txtEspQtdAno">
                </cc1:FilteredTextBoxExtender> </td>
            </tr>
            <tr>
                <td align="right">Min. dias para repetir o 
                        procedimento:</td>
                <td style="WIDTH: 415px">
                    <asp:TextBox ID="txtEspRtn" runat="server" CssClass="input2" MaxLength="5"></asp:TextBox>
                    <cc1:FilteredTextBoxExtender ID="fteEspRtn" runat="server" FilterType="Numbers" 
                        TargetControlID="txtEspRtn">
                    </cc1:FilteredTextBoxExtender>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2" style="HEIGHT: 21px">
                    <asp:Button ID="btnSave" runat="server" CssClass="input7" 
                        onclick="btnSave_Click" Text="Gravar" />
                    &nbsp;
                    <asp:Button ID="btnCancel" runat="server" CssClass="input7" 
                        onclick="btnCancel_Click" Text="Cancelar" />
                </td>
            </tr>
        </tbody>
        </table></div><asp:Label id="lblMsg" runat="server" CssClass="erro" 
                Text="* Campos obrigatórios em branco" Width="271px" Visible="False"></asp:Label></asp:Panel> <BR />
            <asp:GridView id="grd" runat="server" Width="100%" Font-Size="X-Small" PageSize="20" 
                OnSelectedIndexChanged="grd_SelectedIndexChanged" DataSourceID="dts" 
                DataKeyNames="IdEsp" AutoGenerateColumns="False" AllowSorting="True" 
                AllowPaging="True" SkinID="gridCRUD" 
                onpageindexchanged="grd_PageIndexChanged">
        <Columns>
            <asp:BoundField DataField="IdEsp" HeaderText="ID" ReadOnly="True" SortExpression="IdEsp" >
                <ItemStyle Width="15%" />
            </asp:BoundField>
            <asp:BoundField DataField="Esp_Dsc" HeaderText="Descri&#231;&#227;o" SortExpression="Esp_Dsc" >
                <ItemStyle Width="55%" />
            </asp:BoundField>
            <asp:BoundField DataField="Esp_Cbo" HeaderText="CBO" SortExpression="Esp_Cbo">
                <ItemStyle Width="15%" />
            </asp:BoundField>
            <asp:BoundField DataField="Esp_SisGst" HeaderText="C&#243;d. Sis. Gest&#227;o" SortExpression="Esp_SisGst">
                <ItemStyle Width="15%" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Alta Compl." SortExpression="Esp_AltCpx"><EditItemTemplate>
                <asp:CheckBox runat="server" Checked='<%# Bind("Esp_AltCpx") %>' id="CheckBox1"></asp:CheckBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox id="chkAltCpx" runat="server" Enabled="false" Checked='<%# Bind("Esp_AltCpx") %>'></asp:CheckBox>
                </ItemTemplate>
            </asp:TemplateField>          
            <asp:BoundField DataField="Esp_Sxo" HeaderText="Sexo" SortExpression="Esp_Sxo">
            <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Esp_IddMin" HeaderText="Idade M&#237;nima" SortExpression="Esp_IddMin">
            <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Esp_IddMax" HeaderText="Idade M&#225;xima" SortExpression="Esp_IddMax">
            <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Esp_QtdMax" HeaderText="Qtd. Max Solicitada" SortExpression="Esp_QtdMax">
            <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Esp_QtdDia" HeaderText="Qtd. Max. Exec. Dia " SortExpression="Esp_QtdDia">
            <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Esp_QtdMes" HeaderText="Qtd. Max Exec. M&#234;s" SortExpression="Esp_QtdMes">
            <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Esp_QtdAno" HeaderText="Qtd. Max. Exec. Ano" SortExpression="Esp_QtdAno">
            <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Esp_Rtn" HeaderText="Qtd. Min. Dias. Repetir" SortExpression="Esp_Rtn">
            <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:CommandField SelectText="Selecionar" ShowSelectButton="True" />          
        </Columns>
    </asp:GridView> <asp:SqlDataSource id="dts" runat="server" 
                DeleteCommand="DELETE FROM dbo.Atz_Esp WHERE IdEsp = @IdEsp" 
                UpdateCommandType="StoredProcedure" UpdateCommand="stAtz_Esp" 
                SelectCommandType="StoredProcedure" SelectCommand="ssAtz_Esp" 
                InsertCommandType="StoredProcedure" InsertCommand="stAtz_Esp" 
                ConnectionString="<%$ ConnectionStrings:MedicallConnectionString %>" 
                CancelSelectOnNullParameter="False">
        <SelectParameters>
            <asp:Parameter Name="IdEsp" Type="Int16" />
            <asp:ControlParameter ControlID="txtEsp_Cbo" Name="Esp_Cbo" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtEsp_Dsc" Name="Esp_Dsc" PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="txtIdEsp" Name="IdEsp" PropertyName="Text" Type="Int16" />
            <asp:ControlParameter ControlID="txtEsp_Dsc" Name="Esp_Dsc" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtEsp_Cbo" Name="Esp_Cbo" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtEsp_SisGst" Name="Esp_SisGst" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="chkEspAltCpx" Name="Esp_AltCpx" 
                PropertyName="Checked" Type="Boolean" />
            <asp:ControlParameter ControlID="ddlEspSxo" Name="Esp_Sxo" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="txtEspIddMin" Name="Esp_IddMin" 
                PropertyName="Text" Type="Byte" />
            <asp:ControlParameter ControlID="txtEspIddMax" Name="Esp_IddMax" 
                PropertyName="Text" Type="Byte" />
            <asp:ControlParameter ControlID="txtEspQtdMax" Name="Esp_QtdMax" 
                PropertyName="Text" Type="Byte" />
            <asp:ControlParameter ControlID="txtEspQtdDia" Name="Esp_QtdDia" 
                PropertyName="Text" Type="Byte" />
            <asp:ControlParameter ControlID="txtEspQtdMes" Name="Esp_QtdMes" 
                PropertyName="Text" Type="Byte" />
            <asp:ControlParameter ControlID="txtEspQtdAno" Name="Esp_QtdAno" 
                PropertyName="Text" Type="Int16" />
            <asp:ControlParameter ControlID="txtEspRtn" Name="Esp_Rtn" PropertyName="Text" 
                Type="Int16" />
        </UpdateParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="txtIdEsp" Name="IdEsp" PropertyName="Text" Type="Int16" />
            <asp:ControlParameter ControlID="txtEsp_Dsc" Name="Esp_Dsc" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtEsp_Cbo" Name="Esp_Cbo" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtEsp_SisGst" Name="Esp_SisGst" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="chkEspAltCpx" Name="Esp_AltCpx" 
                PropertyName="Checked" Type="Boolean" />
            <asp:ControlParameter ControlID="ddlEspSxo" Name="Esp_Sxo" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="txtEspIddMin" Name="Esp_IddMin" 
                PropertyName="Text" Type="Byte" />
            <asp:ControlParameter ControlID="txtEspIddMax" Name="Esp_IddMax" 
                PropertyName="Text" Type="Byte" />
            <asp:ControlParameter ControlID="txtEspQtdMax" Name="Esp_QtdMax" 
                PropertyName="Text" Type="Byte" />
            <asp:ControlParameter ControlID="txtEspQtdDia" Name="Esp_QtdDia" 
                PropertyName="Text" Type="Byte" />
            <asp:ControlParameter ControlID="txtEspQtdMes" Name="Esp_QtdMes" 
                PropertyName="Text" Type="Byte" />
            <asp:ControlParameter ControlID="txtEspQtdAno" Name="Esp_QtdAno" 
                PropertyName="Text" Type="Int16" />
            <asp:ControlParameter ControlID="txtEspRtn" Name="Esp_Rtn" PropertyName="Text" 
                Type="Int16" />
        </InsertParameters>
        <DeleteParameters>
            <asp:ControlParameter ControlID="txtIdEsp" Name="IdEsp" PropertyName="Text" />
        </DeleteParameters>
    </asp:SqlDataSource> 
</contenttemplate>
    </asp:UpdatePanel>
    <br />
    &nbsp;<!-- Fim do content principal -->
    
    
  
</asp:Content>

