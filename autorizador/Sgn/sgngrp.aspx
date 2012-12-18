<%@ Page Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" CodeFile="sgngrp.aspx.cs" Inherits="Sgn_sgngrp" Title="Grupos de Segurança" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
            <div id="Titulo">
                <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td align="left" style="width: 8px">
                            <img alt="" height="37" src="../images/tit_left.gif" width="9" /></td>
                        <td bgcolor="#f4f4f4">
                            <h2>
                                Grupos de Segurança</h2>
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
<asp:Button id="btnNew" onclick="btnNew_Click" runat="server" Text="Novo" CssClass="input7"></asp:Button>
<img alt=" " src="../Images/spacer.gif" width="5" height="5" border="0"  />
<asp:Button id="btnEdit" onclick="btnEdit_Click" runat="server" Text="Alterar" CssClass="input7"></asp:Button>
<img  alt=" " src="../Images/spacer.gif" width="5" height="5" border="0" />&nbsp;
    <asp:Button ID="btnDel" runat="server" CssClass="input7" OnClick="btnDel_Click" Text="Excluir" />
    <asp:Label ID="lblEditError" runat="server" CssClass="vermelhonormal" Text="* Nenhum item selecionado"
        Visible="False" Width="271px"></asp:Label>
<hr />
</div>
<img alt="" src="../Images/spacer.gif" width="5" height="15" border="0" />
    <asp:HiddenField ID="hdfAcao" runat="server" />
<div>
    <b></b>&nbsp;</div>
    
    


    
    <asp:Panel ID="pnlInfo" runat="server" >
    
<div>
<b>Informações do grupo:</b>
<table>
<tr>
<td style="height: 21px">
    Nome:</td><td style="height: 21px" >
    <asp:TextBox ID="txtIdGrp" runat="server" CssClass="input2"></asp:TextBox></td>
</tr>
<tr>
<td>Descrição:</td><td class="vermelhonormal">
    <asp:TextBox ID="txtGrp_Dsc" runat="server" CssClass="input2" Width="400px" MaxLength="70"></asp:TextBox>*</td>
</tr>

    <tr>
        <td>
            Operadora?</td>
        <td class="vermelhonormal">
            <asp:CheckBox ID="chkRolesIsOpe" runat="server" />
        </td>
    </tr>

<tr><td align=center colspan=2 style="height: 21px"><asp:Button id="btnSave" onclick="btnSave_Click" runat="server" Text="Gravar" CssClass="input7"></asp:Button>
&nbsp;
<asp:Button id="btnCancel" onclick="btnCancel_Click" runat="server" Text="Cancelar" CssClass="input7"></asp:Button></td></tr>

</table>

</div>   
        <asp:Label ID="lblMsg" runat="server" CssClass="vermelhonormal" Text="* Campos obrigatórios em branco"
            Visible="False" Width="271px"></asp:Label></asp:Panel> 
  
    <br />
    <asp:GridView ID="grd" runat="server" AllowPaging="True" AllowSorting="True" 
        AutoGenerateColumns="False" DataKeyNames="RoleName" DataSourceID="dts"
        OnSelectedIndexChanged="grd_SelectedIndexChanged" PageSize="5" 
        Font-Size="X-Small" Width="60%" SkinID="gridCRUD" 
        onpageindexchanging="grd_PageIndexChanging">
        <Columns>
            <asp:BoundField DataField="RoleName" HeaderText="Nome" ReadOnly="True" SortExpression="RoleName" >
                <ItemStyle Width="40%" />
            </asp:BoundField>
            <asp:BoundField DataField="Description" HeaderText="Descri&#231;&#227;o" SortExpression="Description" >
                <ItemStyle Width="80%" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Operadora?" SortExpression="IsOpe">
                <EditItemTemplate>
                    <asp:CheckBox ID="CheckBox4" runat="server" Checked='<%# Bind("IsOpe") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="chkIsOpe" runat="server" Checked='<%# Bind("IsOpe") %>' Enabled="false" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField SelectText="Selecionar" ShowSelectButton="True" />
        </Columns>
    </asp:GridView>
    &nbsp;&nbsp;<br />
    <asp:SqlDataSource ID="dts" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:MedicallConnectionString %>"
        SelectCommand="ssSgn_Grp" SelectCommandType="StoredProcedure" UpdateCommand="stSgn_Grp"
        UpdateCommandType="StoredProcedure" InsertCommand="stSgn_Grp" InsertCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter Name="RoleName" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="grd" Name="RoleName" PropertyName="SelectedValue"
                Type="String" />
            <asp:ControlParameter ControlID="txtIdGrp" Name="NewRoleName" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="txtGrp_Dsc" Name="Description" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="chkRolesIsOpe" Name="IsOpe" 
                PropertyName="Checked" Type="Boolean" />
        </UpdateParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="txtIdGrp" Name="RoleName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtIdGrp" Name="NewRoleName" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="txtGrp_Dsc" Name="Description" PropertyName="Text"
                Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    &nbsp;<br />
    &nbsp;<!-- Fim do content principal -->
    
    
  
</asp:Content>
