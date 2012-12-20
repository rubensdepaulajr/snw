<%@ Page Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" CodeFile="atzgrp.aspx.cs" Inherits="Ngc_atzgrp" Title="Cadastro de Grupos" %>
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
                                Grupo de Procedimentos</h2>
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
            <img height=5 alt=" " src="../Images/spacer.gif" width=5 border=0 /> 
            <asp:Button id="btnEdit" onclick="btnEdit_Click" runat="server" CssClass="input7" Text="Alterar"></asp:Button> 
            <img height=5 alt=" " src="../Images/spacer.gif" width=5 border=0 />&nbsp; 
            <asp:Button id="btnDel" onclick="btnDel_Click" runat="server" CssClass="input7" Text="Excluir"></asp:Button> 
            <asp:Label id="lblEditError" runat="server" CssClass="erro" 
                Text="* Nenhum item selecionado" Width="271px" Visible="False"></asp:Label> 
            <hr />
        </div>
    <img height="15" alt="" src="../Images/spacer.gif" width="5" border="0" /> 
    <asp:Panel id="pnlPsq" runat="server">
        <b>Pesquisar grupo</b>
            <table>
                <tbody>
                    <tr>
                        <td style="width: 267px">
                            <asp:RadioButtonList id="rblTipAco" runat="server" CssClass="azulescuropequeno" RepeatDirection="Horizontal">
                               <asp:ListItem Value="IdGrp">C&#243;digo</asp:ListItem>
                               <asp:ListItem Value="Grp_Dsc">Nome</asp:ListItem>
                            </asp:RadioButtonList> 
                            <asp:RequiredFieldValidator id="rqlTipoPesquisa" runat="server" 
                                ControlToValidate="rblTipAco" 
                                ErrorMessage="* Selecione um tipo de pesquisa acima" CssClass="erro"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 267px">
                            <asp:TextBox id="txtNme" runat="server" CssClass="input2" Width="130px"></asp:TextBox> &nbsp; &nbsp;&nbsp; 
                            <asp:Button id="btnSearch" onclick="btnSearch_Click" runat="server" CssClass="input7" Text="Pesquisar" Width="100px"></asp:Button>
                        </td></tr>
                 </tbody>
             </table>
             </asp:Panel> 
                <img height="15" alt=" " src="../Images/spacer.gif" width="5" border="0" /> &nbsp;&nbsp; 
                <asp:Panel id="pnlInf" runat="server">
                    <div><b>Informações do grupo:</b> 
                        <table>
                            <tbody>
                                <tr>
                                    <td>Código:</td>
                                    <td><asp:TextBox id="txtIdGrp" runat="server" CssClass="input3"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>Descrição:</td>
                                    <td class="vermelhonormal">
                                        <asp:TextBox id="txtGrp_Dsc" runat="server" CssClass="input2" Width="400px" MaxLength="80"></asp:TextBox>*
                                    </td>
                                </tr>
                                <tr>
                                    <td>Quantidade CH:</td>
                                    <td class="vermelhonormal">
                                        <asp:TextBox id="txtGrp_QtdCh_" runat="server" CssClass="input2" Width="100px" 
                                            MaxLength="10"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="HEIGHT: 21px" align="center" colspan="2">
                                        <asp:Button id="btnSave" onclick="btnSave_Click" runat="server" CssClass="input7" Text="Gravar"></asp:Button> &nbsp; 
                                        <asp:Button id="btnCancel" onclick="btnCancel_Click" runat="server" CssClass="input7" Text="Cancelar"></asp:Button>
                                    </td>
                                </tr>
                            </TBODY>
                        </TABLE>
                    </DIV>
            <asp:Label id="lblMsg" runat="server" CssClass="erro" 
                Text="* Campos obrigatórios em branco" Width="271px" Visible="False"></asp:Label>
                </asp:Panel> <br />
            <asp:GridView id="grd" runat="server" Width="100%" Font-Size="X-Small" 
                PageSize="20" OnSelectedIndexChanged="grd_SelectedIndexChanged" 
                DataSourceID="dts" DataKeyNames="IdGrp" AutoGenerateColumns="False" 
                AllowSorting="True" AllowPaging="True" 
                OnPageIndexChanging="grd_PageIndexChanging" SkinID="gridCRUD">
        <Columns>
            <asp:BoundField DataField="IdGrp" HeaderText="ID" ReadOnly="True" SortExpression="IdGrp" >
                <HeaderStyle Width="100px" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Grp_Dsc" HeaderText="Descri&#231;&#227;o" SortExpression="Grp_Dsc" />
            <asp:BoundField DataField="Grp_QtdCh_" HeaderText="Qtd. CH" 
                SortExpression="Grp_QtdCh_" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:CommandField SelectText="Selecionar" ShowSelectButton="True" >
            <HeaderStyle Width="50px" />
            </asp:CommandField>
        </Columns>        
    </asp:GridView> <asp:SqlDataSource id="dts" runat="server" DeleteCommand="delete from atz_grp where idgrp = @idgrp" UpdateCommandType="StoredProcedure" UpdateCommand="stAtz_Grp" SelectCommandType="StoredProcedure" SelectCommand="ssAtz_Grp" InsertCommandType="StoredProcedure" InsertCommand="stAtz_Grp" ConnectionString="<%$ ConnectionStrings:MedicallConnectionString %>" CancelSelectOnNullParameter="False">
        <SelectParameters>
            <asp:Parameter Name="IdGrp" Type="Int16" />
            <asp:Parameter Name="Grp_Dsc" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="txtIdGrp" Name="IdGrp" PropertyName="Text" Type="Int16" />
            <asp:ControlParameter ControlID="txtGrp_Dsc" Name="Grp_Dsc" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtGrp_QtdCh_" Name="Grp_QtdCh_" PropertyName="Text" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="txtIdGrp" Name="IdGrp" PropertyName="Text" Type="Int16" />
            <asp:ControlParameter ControlID="txtGrp_Dsc" Name="Grp_Dsc" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtGrp_QtdCh_" Name="Grp_QtdCh_" PropertyName="Text" Type="Int32" />
        </InsertParameters>
        <DeleteParameters>
            <asp:ControlParameter ControlID="txtIdGrp" Name="idgrp" PropertyName="Text" />
        </DeleteParameters>
    </asp:SqlDataSource>
</contenttemplate>
    </asp:UpdatePanel>
    <br />
    &nbsp;<!-- Fim do content principal -->
    
    
  
</asp:Content>



