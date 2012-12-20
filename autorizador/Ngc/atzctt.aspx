<%@ Page Title="" Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" CodeFile="atzctt.aspx.cs" Inherits="Cadastros_atzctt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="Titulo">
        <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td align="left" style="width: 8px">
                    <img alt="" height="37" src="../images/tit_left.gif" width="9" /></td>
                <td bgcolor="#f4f4f4">
                    <h2>
                        Contratados</h2>
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
    <div>
            <asp:Button ID="btnNew" runat="server" Text="Novo" 
                CssClass="button" onclick="btnNew_Click" />
            <asp:Button ID="btnEdit" runat="server" 
                Text="Alterar" CssClass="button" onclick="btnEdit_Click" />
            <asp:Button ID="btnDel" runat="server" Text="Excluir" 
                CssClass="button" Enabled="False" onclick="btnDel_Click" />
            <asp:Label id="lblError" runat="server" Text="* Nenhum item selecionado" 
                Visible="False" Width="271px" ForeColor="Red" CssClass="erro"></asp:Label>                
        </div> <hr />
         <!-- Início do Panel Pesquisar Contratado -->
        <asp:Panel ID="pnlPsq" runat="server">
            <br />
            <table class="htmltable" style="width:100%;">
                <tr>
                    <td class="caption" style="font-weight: bold">
                        Pesquisar Contratado</td>
                </tr>                
                <tr>
                    <td class="caption">
                        <asp:RadioButtonList ID="rblTipAco" runat="server" CssClass="azulescuropequeno" RepeatDirection="Horizontal">
                           <asp:ListItem Value="IdCtt">C&#243;digo</asp:ListItem>
                           <asp:ListItem Value="Ctt_Nme" Selected="True">Nome</asp:ListItem>
                           <asp:ListItem Value="Ctt_NmeRsm">Nome Fantasia</asp:ListItem>
                           <asp:ListItem Value="Ctt_Doc">CPF/CNPJ</asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ErrorMessage="* Selecione um tipo de pesquisa acima" 
                            ControlToValidate="rblTipAco" CssClass="erro"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="caption">
                        <asp:TextBox ID="txtPsq" runat="server" CssClass="input2"></asp:TextBox>
                        <asp:Button ID="btnSearch" runat="server" CssClass="button" Text="Pesquisar" 
                            onclick="btnSearch_Click" />
                    </td>
                </tr>                
            </table>
            <br />
        </asp:Panel> 
        <!--Inicio Painel informações do contratado -->
      <asp:Panel ID="pnlInfoPrf" runat="server" Height="500px" 
        Width="750px">
            <br />
            <table class="htmltable" style="width:100%;">
                <tr class="row">
                    <td class="caption" colspan="2" style="font-weight: bold">
                        Informações do contratado:</td>
                </tr>
                <tr class="alternaterow">
                    <td class="caption" style="width: 103px">
                        Código:</td>
                    <td>
                        <asp:TextBox ID="txtIdCtt" runat="server" CssClass="input2"></asp:TextBox>
                    </td>
                </tr>
                <tr class="row">
                    <td class="caption" style="width: 103px">
                        Nome:</td>
                    <td>
                        <asp:TextBox ID="txtCtt_Nme" runat="server" Width="400px" CssClass="input2"></asp:TextBox>
                    </td>
                </tr>
                <tr class="alternaterow">
                    <td class="caption" style="width: 103px">
                        Nome Fantasia:</td>
                    <td>
                       <asp:TextBox ID="txtCtt_NmeRsm" runat="server" Width="400px" CssClass="input2"></asp:TextBox>
                    </td>
                </tr>
                <tr class="row">
                    <td class="caption" style="width: 103px">
                    Tipo Contratado:</td>
                    <td>
                    <asp:DropDownList ID="ddlIdTpd" runat="server" CssClass="input2" Width="400px" DataSourceID="dtsAtz_Tpd" DataTextField="Tpd_Dsc" DataValueField="IdTpd" ></asp:DropDownList>
                        <asp:SqlDataSource ID="dtsAtz_Tpd" runat="server" ConnectionString="<%$ ConnectionStrings:AppConnectionString %>"
                    SelectCommand="SELECT [IdTpd], [Tpd_Dsc] FROM [Atz_Tpd]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr class="alternaterow">
                <td class="caption" style="width:103px">
                Tipo Pessoa:</td>
                <td>
                    <asp:DropDownList ID="ddlCtt_TipDoc" runat="server" CssClass="input2" >
                    <asp:ListItem Value="F">FISICA</asp:ListItem>
                    <asp:ListItem Value="J">JURIDICA</asp:ListItem>
                    </asp:DropDownList>
                </td>                
                </tr>
                <tr class="row"> <td class="caption" style="width: 103px"> CNPJ/CPF: </td><td >
                    <asp:TextBox ID="txtCtt_Doc" runat="server" CssClass="input2" MaxLength="16"></asp:TextBox></td>
                </tr>
                
                <tr class="alternaterow" ><td class="row" style="width: 103px"> Conselho:</td><td class="vermelhonormal" >
                     <asp:DropDownList ID="ddlCtt_IdCns" runat="server" CssClass="input2" DataSourceID="dtsDdl" DataTextField="Cns_Nme" DataValueField="IdCns">
                       </asp:DropDownList>
                     <asp:SqlDataSource ID="dtsDdl" runat="server" ConnectionString="<%$ ConnectionStrings:AppConnectionString %>"
                        SelectCommand="SELECT [IdCns], [Cns_Nme] FROM [Atz_Cns]"></asp:SqlDataSource>
                    </td>
                </tr>
                
                <tr class="row" ><td class="caption" style="width: 103px">NºConselho:</td><td  class="vermelhonormal">
                    <asp:TextBox ID="txtCtt_NumCns" runat="server" CssClass="input2" MaxLength="15"></asp:TextBox></td>
                </tr>
                
                <tr class="alternaterow"><td class="caption" style="width: 103px">Cod. CNES:</td><td  class="vermelhonormal">
                    <asp:TextBox ID="txtCtt_CodCne" runat="server" CssClass="input2" MaxLength="7"></asp:TextBox></td>
                </tr>
                
                <tr class="row"><td class="caption" style="width: 103px">UF Conselho:</td><td >
                   <asp:DropDownList ID="ddlCtt_EstCns" runat="server" CssClass="input2">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>AC</asp:ListItem>
                    <asp:ListItem>AL</asp:ListItem>
                    <asp:ListItem>AM</asp:ListItem>
                    <asp:ListItem>AP</asp:ListItem>
                    <asp:ListItem>BA</asp:ListItem>
                    <asp:ListItem>CE</asp:ListItem>
                    <asp:ListItem>DF</asp:ListItem>
                    <asp:ListItem>ES</asp:ListItem>
                    <asp:ListItem>GO</asp:ListItem>
                    <asp:ListItem>MA</asp:ListItem>
                    <asp:ListItem>MG</asp:ListItem>
                    <asp:ListItem>MS</asp:ListItem>
                    <asp:ListItem>MT</asp:ListItem>
                    <asp:ListItem>PA</asp:ListItem>
                    <asp:ListItem>PB</asp:ListItem>
                    <asp:ListItem>PE</asp:ListItem>
                    <asp:ListItem>PI</asp:ListItem>
                    <asp:ListItem>PR</asp:ListItem>
                    <asp:ListItem>RJ</asp:ListItem>
                    <asp:ListItem>RN</asp:ListItem>
                    <asp:ListItem>RO</asp:ListItem>
                    <asp:ListItem>RR</asp:ListItem>
                    <asp:ListItem>RS</asp:ListItem>
                    <asp:ListItem>SC</asp:ListItem>
                    <asp:ListItem>SE</asp:ListItem>
                    <asp:ListItem>SP</asp:ListItem>
                    <asp:ListItem>TO</asp:ListItem>
                   </asp:DropDownList></td>
                </tr>
                
                <tr class="alternaterow"><td class="caption" style="width: 103px">Situação:</td><td >
                    <asp:DropDownList ID="ddlCtt_Sit" runat="server" CssClass="input2" >
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem Value="A">ATIVO</asp:ListItem>
                        <asp:ListItem Value="I">INATIVO</asp:ListItem>
                    </asp:DropDownList></td>
                </tr>
                
                <tr class="row"><td class="caption" style="width: 103px">Email:</td><td >
                    <asp:TextBox ID="txtCtt_Eml" runat="server" CssClass="input2" MaxLength="50"></asp:TextBox></td>
                </tr>
                
                <tr class="alternaterow"><td class="caption" style="width: 103px">Telefone:</td><td >
                    <asp:TextBox ID="txtCtt_Tel" runat="server" CssClass="input2" MaxLength="20"></asp:TextBox></td>
                </tr>
                
                <tr class="row"><td class="caption" style="width: 103px">Celular:</td><td >
                    <asp:TextBox ID="txtCtt_Tel2" runat="server" CssClass="input2" MaxLength="20"></asp:TextBox></td>
                </tr>
                
                <tr class="alternaterow"><td class="caption" style="width: 103px; height: 21px;">Fax:</td>
                    <td style="height: 21px" >
                    <asp:TextBox ID="txtCtt_Tel3" runat="server" CssClass="input2" MaxLength="20"></asp:TextBox></td>
                </tr>
                
                <tr class="row"><td class="caption" style="width: 103px">Pessoa de Contato:</td><td >
                    <asp:TextBox ID="txtCtt_NmeCto" runat="server" CssClass="input2" MaxLength="70"></asp:TextBox></td>
                </tr>
                <!--botões-->
                <tr class="alternaterow">
                     <td class="caption" style="width: 63px">
                        &nbsp;</td>
                    <td >
                        <asp:Button ID="btnSave" runat="server" CssClass="button" Text="Gravar" 
                            onclick="btnSave_Click" />
                        <asp:Button ID="btnCancel" runat="server" CssClass="button" Text="Cancelar" 
                            onclick="btnCancel_Click" />
                     </td>
                </tr>
            </table>
            
            <asp:Label ID="lblMsg" runat="server" CssClass="erro" Text="* Campos obrigatórios em branco"
            Visible="False" Width="271px"></asp:Label>
        </asp:Panel>
         <!--Start Grid-->
        <asp:GridView ID="grd" runat="server" AllowPaging="True" AllowSorting="True" 
            AutoGenerateColumns="False" DataKeyNames="IdCtt" DataSourceID="dts" Width="100%" 
            onselectedindexchanged="grd_SelectedIndexChanged" SkinID="gridCRUD" 
        onpageindexchanged="grd_PageIndexChanged">
            <Columns>
                <asp:BoundField DataField="IdCtt" HeaderText="Matrícula" SortExpression="IdCtt" />
                <asp:BoundField DataField="Tpd_Dsc" HeaderText="Tipo" ReadOnly="True" SortExpression="Tpd_Dsc" />
                <asp:BoundField DataField="Cns_Nme" HeaderText="Conselho" ReadOnly="True" SortExpression="Cns_Nme" />
                <asp:BoundField DataField="Ctt_Nme" HeaderText="Nome" SortExpression="Ctt_Nme" />
                <asp:BoundField DataField="Ctt_NmeRsm" HeaderText="Nome Fantasia" SortExpression="Ctt_NmeRsm" />
                <asp:BoundField DataField="Ctt_TipDoc" HeaderText="Pessoa" SortExpression="Ctt_TipDoc" />
                <asp:BoundField DataField="Ctt_Doc" HeaderText="CPF/CNPJ" SortExpression="Ctt_Doc" />
                <asp:BoundField DataField="Ctt_CodCne" HeaderText="Cod. CNES" SortExpression="Ctt_CodCne" />
                <asp:BoundField DataField="Ctt_NumCns" HeaderText="N&#186; Conselho" SortExpression="Ctt_NumCns" />
                <asp:BoundField DataField="Ctt_EstCns" HeaderText="UF Conselho" SortExpression="Ctt_EstCns" />
                <asp:BoundField DataField="Ctt_Sit" HeaderText="Situa&#231;&#227;o" ReadOnly="True" SortExpression="Ctt_Sit" />
                <asp:BoundField DataField="Ctt_Tel" HeaderText="Telefone" SortExpression="Ctt_Tel" />
                <asp:BoundField DataField="Ctt_Tel2" HeaderText="Celular" SortExpression="Ctt_Tel2" />
                <asp:BoundField DataField="Ctt_Fax" HeaderText="Fax" SortExpression="Ctt_Fax" />
                <asp:BoundField DataField="Ctt_Eml" HeaderText="Email" SortExpression="Ctt_Eml" />
                <asp:BoundField DataField="Ctt_NmeCto" HeaderText="Contato" SortExpression="Ctt_NmeCto" />
                <asp:CommandField ShowSelectButton="True" SelectText="selecionar"/>
            </Columns>
        </asp:GridView>
    <asp:SqlDataSource ID="dts" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:AppConnectionString %>"
        InsertCommand="stAtz_Ctt" InsertCommandType="StoredProcedure" SelectCommand="ssAtz_Ctt"
        SelectCommandType="StoredProcedure" UpdateCommand="stAtz_Ctt" 
        UpdateCommandType="StoredProcedure" 
        DeleteCommand="delete from atz_ctt where idctt = @idctt">
        <SelectParameters>
            <asp:Parameter Name="IdCtt" Type="Int64" />
            <asp:Parameter Name="Ctt_Nme" Type="String" />
            <asp:Parameter Name="Ctt_NmeRsm" Type="String" />
            <asp:Parameter Name="Ctt_Doc" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="txtIdCtt" Name="IdCtt" PropertyName="Text" Type="Int64" />
            
            <asp:ControlParameter ControlID="ddlIdTpd" Name="Ctt_IdTpd" PropertyName="SelectedValue"
                Type="Byte" />
            <asp:ControlParameter ControlID="ddlCtt_IdCns" Name="Ctt_IdCns" PropertyName="SelectedValue"
                Type="String" />
            <asp:ControlParameter ControlID="txtCtt_Nme" Name="Ctt_Nme" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtCtt_NmeRsm" Name="Ctt_NmeRsm" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="ddlCtt_TipDoc" Name="Ctt_TipDoc" PropertyName="SelectedValue"
                Type="String" />
            <asp:ControlParameter ControlID="txtCtt_Doc" Name="Ctt_Doc" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtCtt_NumCns" Name="Ctt_NumCns" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="ddlCtt_EstCns" Name="Ctt_EstCns" PropertyName="SelectedValue"
                Type="String" />
            <asp:ControlParameter ControlID="txtCtt_CodCne" Name="Ctt_CodCne" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="ddlCtt_Sit" Name="Ctt_Sit" PropertyName="SelectedValue"
                Type="String" />
            <asp:ControlParameter ControlID="txtCtt_Tel" Name="Ctt_Tel" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtCtt_Tel2" Name="Ctt_Tel2" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="txtCtt_Tel3" Name="Ctt_Fax" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="txtCtt_Eml" Name="Ctt_Eml" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtCtt_NmeCto" Name="Ctt_NmeCto" PropertyName="Text"
                Type="String" />
        </UpdateParameters>
        <InsertParameters>
<asp:ControlParameter ControlID="txtIdCtt" Name="IdCtt" PropertyName="Text" Type="Int64" />
            
            <asp:ControlParameter ControlID="ddlIdTpd" Name="Ctt_IdTpd" PropertyName="SelectedValue"
                Type="Byte" />
            <asp:ControlParameter ControlID="ddlCtt_IdCns" Name="Ctt_IdCns" PropertyName="SelectedValue"
                Type="String" />
            <asp:ControlParameter ControlID="txtCtt_Nme" Name="Ctt_Nme" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtCtt_NmeRsm" Name="Ctt_NmeRsm" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="ddlCtt_TipDoc" Name="Ctt_TipDoc" PropertyName="SelectedValue"
                Type="String" />
            <asp:ControlParameter ControlID="txtCtt_Doc" Name="Ctt_Doc" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtCtt_NumCns" Name="Ctt_NumCns" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="ddlCtt_EstCns" Name="Ctt_EstCns" PropertyName="SelectedValue"
                Type="String" />
            <asp:ControlParameter ControlID="txtCtt_CodCne" Name="Ctt_CodCne" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="ddlCtt_Sit" Name="Ctt_Sit" PropertyName="SelectedValue"
                Type="String" />
            <asp:ControlParameter ControlID="txtCtt_Tel" Name="Ctt_Tel" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtCtt_Tel2" Name="Ctt_Tel2" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="txtCtt_Tel3" Name="Ctt_Fax" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="txtCtt_Eml" Name="Ctt_Eml" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtCtt_NmeCto" Name="Ctt_NmeCto" PropertyName="Text"
                Type="String" />        
        
        </InsertParameters>
        <DeleteParameters>
            <asp:ControlParameter ControlID="txtIdCtt" Name="idctt" PropertyName="Text" />
        </DeleteParameters>
    </asp:SqlDataSource>
        <!--End grid view-->
</asp:Content>

