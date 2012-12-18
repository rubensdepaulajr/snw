<%@ Page Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" CodeFile="atzprf.aspx.cs" Inherits="Ngc_atzprf" Title="Cadastro de Profissionais" %>
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
                                Profissionais</h2>
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
<div id="botoes"><asp:Button id="btnNew" onclick="btnNew_Click" runat="server" Text="Novo" CssClass="input7"></asp:Button> <IMG height=5 alt=" " src="../Images/spacer.gif" width=5 border=0 /> <asp:Button id="btnEdit" onclick="btnEdit_Click" runat="server" Text="Alterar" CssClass="input7"></asp:Button> <IMG height=5 alt=" " src="../Images/spacer.gif" width=5 border=0 />&nbsp; <asp:Button id="btnDel" onclick="btnDel_Click" runat="server" Text="Excluir" CssClass="input7"></asp:Button> 
    <asp:Label id="lblToolbar" runat="server" CssClass="erro" Width="271px"></asp:Label> 
<hr />
</div><img height="15" alt="" src="../Images/spacer.gif" width=5 border=0 /> <asp:Panel id="pnlPsq" runat="server"><B>Pesquisar profissional</B><BR /><TABLE><TBODY><TR><TD><asp:RadioButtonList id="rblTipAco" runat="server" CssClass="azulescuropequeno" RepeatDirection="Horizontal"><asp:ListItem Value="Prf_Mtr">C&#243;digo</asp:ListItem>
<asp:ListItem Value="Prf_Nme">Nome</asp:ListItem>
<asp:ListItem Value="Prf_Cpf">CPF</asp:ListItem>
<asp:ListItem Value="Prf_NumCns">N&#186; Conselho</asp:ListItem>
</asp:RadioButtonList> <asp:RequiredFieldValidator id="rqlTipoPesquisa" runat="server" 
                    ErrorMessage="* Selecione um tipo de pesquisa acima" 
                    ControlToValidate="rblTipAco" CssClass="erro"></asp:RequiredFieldValidator></TD></TR><TR><TD><asp:TextBox id="txtNme" runat="server" CssClass="input2" Width="130px"></asp:TextBox> &nbsp; &nbsp;&nbsp; <asp:Button id="btnSearch" onclick="btnSearch_Click" runat="server" Text="Pesquisar" CssClass="input7" Width="100px"></asp:Button></TD></TR></TBODY></TABLE></asp:Panel> <IMG height=15 alt=" " src="../Images/spacer.gif" width=5 border=0 /> &nbsp;&nbsp; <asp:Panel id="pnlInfoPrf" runat="server"><DIV><B>Informações do profissional:</B> <TABLE><TBODY><TR><TD>Código:</TD><TD><asp:TextBox id="txtIdPrf" runat="server" CssClass="input2"></asp:TextBox></TD></TR><TR><TD>Nome:</TD><TD class="vermelhonormal"><asp:TextBox id="txtPrf_Nme" runat="server" CssClass="input2" Width="400px" MaxLength="70"></asp:TextBox>*</TD></TR><TR><TD>Matrícula:</TD><TD class="vermelhonormal"><asp:TextBox id="txtPrf_Mtr" runat="server" CssClass="input2" __designer:wfdid="w1"></asp:TextBox>*</TD></TR><TR><TD>Nome Resumido:</TD><TD class="vermelhonormal"><asp:TextBox id="txtPrf_NmeRsm" runat="server" CssClass="input2" Width="400px" MaxLength="35"></asp:TextBox>*</TD></TR><TR><TD>Conselho:</TD><TD class="vermelhonormal"><asp:DropDownList id="ddlPrf_IdCns" runat="server" CssClass="input2" DataSourceID="dtsDdl" DataTextField="Cns_Nme" DataValueField="IdCns">
    </asp:DropDownList>*<asp:SqlDataSource id="dtsDdl" runat="server" ConnectionString="<%$ ConnectionStrings:MedicallConnectionString %>" SelectCommand="SELECT [IdCns], [Cns_Nme] FROM [Atz_Cns]"></asp:SqlDataSource> </TD></TR><TR><TD>NºConselho:</TD><TD class="vermelhonormal"><asp:TextBox id="txtPrf_NumCns" runat="server" CssClass="input2" MaxLength="15"></asp:TextBox>*</TD></TR><TR><TD>UF Conselho:</TD><TD><asp:DropDownList id="ddlPrf_EstCns" runat="server" CssClass="input2">
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
    </asp:DropDownList></TD></TR><TR><TD>CPF:</TD><TD><asp:TextBox id="txtPrf_Cpf" runat="server" CssClass="input2" MaxLength="11"></asp:TextBox></TD></TR><TR><TD>Situação:</TD><TD><asp:DropDownList id="ddlPrf_Sit" runat="server" CssClass="input2">
        <asp:ListItem></asp:ListItem>
        <asp:ListItem Value="A">ATIVO</asp:ListItem>
        <asp:ListItem Value="I">INATIVO</asp:ListItem>
    </asp:DropDownList></TD></TR><TR><TD>Email:</TD><TD><asp:TextBox id="txtPrf_Eml" runat="server" CssClass="input2" MaxLength="50"></asp:TextBox></TD></TR><TR><TD>Telefone:</TD><TD><asp:TextBox id="txtPrf_Tel" runat="server" CssClass="input2" MaxLength="20"></asp:TextBox></TD></TR><TR><TD>Celular:</TD><TD><asp:TextBox id="txtPrf_Tel2" runat="server" CssClass="input2" MaxLength="20"></asp:TextBox></TD></TR><TR><TD>Fax:</TD><TD><asp:TextBox id="txtPrf_Tel3" runat="server" CssClass="input2" MaxLength="20"></asp:TextBox></TD></TR><TR>
            <TD>Pode Solicitar Internação?</TD>
            <td>
                <asp:CheckBox ID="chkPrfItn" runat="server" />
            </td>
            </TR>
            <tr>
                <td align="center" colspan="2" style="HEIGHT: 21px">
                    <asp:Button ID="btnSave" runat="server" CssClass="input7" 
                        onclick="btnSave_Click" Text="Gravar" />
                    &nbsp;
                    <asp:Button ID="btnCancel" runat="server" CssClass="input7" 
                        onclick="btnCancel_Click" Text="Cancelar" />
                </td>
            </tr>
            </TBODY></TABLE></DIV>
            <asp:Label id="lblMsg" runat="server" Text="* Campos obrigatórios em branco" 
                CssClass="erro" Visible="False" Width="271px"></asp:Label></asp:Panel> <BR />
            <asp:GridView id="grd" runat="server" Width="100%" 
                OnPageIndexChanging="grd_PageIndexChanging" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="IdPrf" 
                DataSourceID="dts" OnSelectedIndexChanged="grd_SelectedIndexChanged" 
                PageSize="20" Font-Size="X-Small" SkinID="gridCRUD">
                <Columns>
                    <asp:BoundField DataField="IdPrf" HeaderText="ID" ReadOnly="True" SortExpression="IdPrf"></asp:BoundField>
                    <asp:BoundField DataField="Prf_Mtr" HeaderText="Matr&#237;cula" SortExpression="Prf_Mtr"></asp:BoundField>
                    <asp:BoundField DataField="Prf_Nme" HeaderText="Nome" SortExpression="Prf_Nme"></asp:BoundField>
                    <asp:BoundField DataField="Prf_NmeRsm" HeaderText="Nome Resumido" SortExpression="Prf_NmeRsm"></asp:BoundField>
                    <asp:BoundField DataField="Cns_Nme" HeaderText="Conselho" SortExpression="Cns_Nme"></asp:BoundField>
                    <asp:BoundField DataField="Prf_NumCns" HeaderText="N&#186; Conselho" SortExpression="Prf_NumCns">
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Prf_EstCns" HeaderText="UF Conselho" SortExpression="Prf_EstCns">
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Prf_Cpf" HeaderText="CPF" SortExpression="Prf_Cpf"></asp:BoundField>
                    <asp:BoundField DataField="Prf_Sit" HeaderText="Situa&#231;&#227;o" SortExpression="Prf_Sit">
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Prf_Tel" HeaderText="Tel" SortExpression="Prf_Tel"></asp:BoundField>
                    <asp:BoundField DataField="Prf_Tel2" HeaderText="Celular" SortExpression="Prf_Tel2"></asp:BoundField>
                    <asp:BoundField DataField="Prf_Fax" HeaderText="Fax" SortExpression="Prf_Fax"></asp:BoundField>
                    <asp:BoundField DataField="Prf_Eml" HeaderText="Email" SortExpression="Prf_Eml"></asp:BoundField>
                    <asp:TemplateField HeaderText="Internação" SortExpression="Prf_Itn"><EditItemTemplate>
                        <asp:CheckBox runat="server" Checked='<%# Bind("Prf_Itn") %>' id="CheckBox5"></asp:CheckBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:CheckBox id="ChkItn" runat="server" Enabled="false" Checked='<%# Bind("Prf_Itn") %>'></asp:CheckBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField SelectText="Selecionar" ShowSelectButton="True" />
                </Columns>

</asp:GridView> <asp:SqlDataSource id="dts" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:MedicallConnectionString %>" InsertCommand="stAtz_Prf" InsertCommandType="StoredProcedure" SelectCommand="ssAtz_Prf" SelectCommandType="StoredProcedure" UpdateCommand="stAtz_Prf" UpdateCommandType="StoredProcedure" DeleteCommand="delete from atz_prf where idprf = @idprf"><SelectParameters>
<asp:Parameter DefaultValue="" Name="IdPrf" Type="Int32"></asp:Parameter>
<asp:Parameter DefaultValue="" Name="Prf_Mtr" Type="String"></asp:Parameter>
<asp:Parameter DefaultValue="" Name="Prf_Nme" Type="String"></asp:Parameter>
<asp:Parameter DefaultValue="" Name="Prf_NumCns" Type="String"></asp:Parameter>
<asp:Parameter DefaultValue="" Name="Prf_Cpf" Type="String"></asp:Parameter>
</SelectParameters>
    <DeleteParameters>
    <asp:ControlParameter ControlID="txtIdPrf" PropertyName="Text" Name="idprf"></asp:ControlParameter>
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32"></asp:Parameter>
        <asp:ControlParameter ControlID="txtIdPrf" PropertyName="Text" Name="IdPrf" Type="Int64"></asp:ControlParameter>
        <asp:ControlParameter ControlID="ddlPrf_IdCns" PropertyName="SelectedValue" Name="Prf_IdCns" Type="String"></asp:ControlParameter>
        <asp:ControlParameter ControlID="txtPrf_Mtr" PropertyName="Text" Name="Prf_Mtr" Type="String"></asp:ControlParameter>
        <asp:ControlParameter ControlID="txtPrf_Nme" PropertyName="Text" Name="Prf_Nme" Type="String"></asp:ControlParameter>
        <asp:ControlParameter ControlID="txtPrf_NmeRsm" PropertyName="Text" Name="Prf_NmeRsm" Type="String"></asp:ControlParameter>
        <asp:ControlParameter ControlID="txtPrf_NumCns" PropertyName="Text" Name="Prf_NumCns" Type="String"></asp:ControlParameter>
        <asp:ControlParameter ControlID="ddlPrf_EstCns" PropertyName="SelectedValue" Name="Prf_EstCns" Type="String"></asp:ControlParameter>
        <asp:ControlParameter ControlID="txtPrf_Cpf" PropertyName="Text" Name="Prf_Cpf" Type="String"></asp:ControlParameter>
        <asp:ControlParameter ControlID="txtPrf_Tel" PropertyName="Text" Name="Prf_Tel" Type="String"></asp:ControlParameter>
        <asp:ControlParameter ControlID="txtPrf_Tel2" PropertyName="Text" Name="Prf_Tel2" Type="String"></asp:ControlParameter>
        <asp:ControlParameter ControlID="txtPrf_Tel3" PropertyName="Text" Name="Prf_Fax" Type="String"></asp:ControlParameter>
        <asp:ControlParameter ControlID="txtPrf_Eml" PropertyName="Text" Name="Prf_Eml" Type="String"></asp:ControlParameter>
        <asp:ControlParameter ControlID="ddlPrf_Sit" PropertyName="SelectedValue" Name="Prf_Sit" Type="String"></asp:ControlParameter>
        <asp:ControlParameter ControlID="chkPrfItn" PropertyName="Checked" Name="Prf_Itn" Type="Boolean"></asp:ControlParameter>
    </UpdateParameters>
    <InsertParameters>
        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32"></asp:Parameter>
        <asp:Parameter Name="IdPrf" Type="Int64"></asp:Parameter>
        <asp:ControlParameter ControlID="ddlPrf_IdCns" PropertyName="SelectedValue" Name="Prf_IdCns" Type="String"></asp:ControlParameter>
        <asp:ControlParameter ControlID="txtPrf_Mtr" PropertyName="Text" Name="Prf_Mtr" Type="String"></asp:ControlParameter>
        <asp:ControlParameter ControlID="txtPrf_Nme" PropertyName="Text" Name="Prf_Nme" Type="String"></asp:ControlParameter>
        <asp:ControlParameter ControlID="txtPrf_NmeRsm" PropertyName="Text" Name="Prf_NmeRsm" Type="String"></asp:ControlParameter>
        <asp:ControlParameter ControlID="txtPrf_NumCns" PropertyName="Text" Name="Prf_NumCns" Type="String"></asp:ControlParameter>
        <asp:ControlParameter ControlID="ddlPrf_EstCns" PropertyName="SelectedValue" Name="Prf_EstCns" Type="String"></asp:ControlParameter>
        <asp:ControlParameter ControlID="txtPrf_Cpf" PropertyName="Text" Name="Prf_Cpf" Type="String"></asp:ControlParameter>
        <asp:ControlParameter ControlID="txtPrf_Tel" PropertyName="Text" Name="Prf_Tel" Type="String"></asp:ControlParameter>
        <asp:ControlParameter ControlID="txtPrf_Tel2" PropertyName="Text" Name="Prf_Tel2" Type="String"></asp:ControlParameter>
        <asp:ControlParameter ControlID="txtPrf_Tel3" PropertyName="Text" Name="Prf_Fax" Type="String"></asp:ControlParameter>
        <asp:ControlParameter ControlID="txtPrf_Eml" PropertyName="Text" Name="Prf_Eml" Type="String"></asp:ControlParameter>
        <asp:ControlParameter ControlID="ddlPrf_Sit" PropertyName="SelectedValue" Name="Prf_Sit" Type="String"></asp:ControlParameter>
        <asp:ControlParameter ControlID="chkPrfItn" PropertyName="Checked" Name="Prf_Itn" Type="Boolean"></asp:ControlParameter>
    </InsertParameters>
</asp:SqlDataSource> 
</contenttemplate>
    </asp:UpdatePanel>
    <br />
    <br />
    &nbsp;<!-- Fim do content principal -->
    
    
  
</asp:Content>

