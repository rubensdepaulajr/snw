<%@ Page Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" CodeFile="sgnprf.aspx.cs" Inherits="Sgn_sgnprf" Title="Usuário do Profissional" %>
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
                                Usuário do Profissional</h2>
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
<img height="15" alt="" src="../Images/spacer.gif" width=5 border=0 /> <asp:Panel id="pnlPsq" runat="server"><B>Pesquisar Profissional</B><BR /><TABLE><TBODY><TR><TD><asp:RadioButtonList id="rblTipAco" runat="server" RepeatDirection="Horizontal" CssClass="azulescuropequeno">
           <asp:ListItem Value="IdPrf">C&#243;digo</asp:ListItem>
           <asp:ListItem Value="Prf_Nme">Nome</asp:ListItem>
           <asp:ListItem Value="Prf_Cpf">CPF</asp:ListItem>
           <asp:ListItem Value="Prf_NumCns">N&#186; Conselho</asp:ListItem>
        </asp:RadioButtonList> <asp:RequiredFieldValidator id="rqlTipoPesquisa" runat="server" ForeColor CssClass="vermelhonormal" ControlToValidate="rblTipAco" ErrorMessage="* Selecione um tipo de pesquisa acima"></asp:RequiredFieldValidator></TD></TR><TR><TD><asp:TextBox id="txtNme" runat="server" Width="130px" CssClass="input2"></asp:TextBox> &nbsp; &nbsp;&nbsp; <asp:Button id="btnSearch" onclick="btnSearch_Click" runat="server" Width="100px" CssClass="input7" Text="Pesquisar"></asp:Button></TD></TR></TBODY></TABLE></asp:Panel> <IMG height=15 alt=" " src="../Images/spacer.gif" width=5 border=0 /> &nbsp;&nbsp; <asp:Panel id="pnlInfoPrf" runat="server"><DIV><B>Informações do Profissional:</B> <TABLE><TBODY><TR><TD style="WIDTH: 70px">Código:</TD><TD style="WIDTH: 407px"><asp:TextBox id="txtIdPrf" runat="server" CssClass="input2" Enabled="False"></asp:TextBox></TD></TR><TR><TD style="WIDTH: 70px">Nome:</TD><TD style="WIDTH: 407px" class="vermelhonormal"><asp:TextBox id="txtPrf_Nme" runat="server" Width="400px" CssClass="input2" Enabled="False" MaxLength="70"></asp:TextBox></TD></TR><TR><TD style="WIDTH: 70px; HEIGHT: 21px"><asp:Label id="lblUsr" runat="server" Text="Usuário:" __designer:wfdid="w7"></asp:Label></TD><TD style="WIDTH: 407px; HEIGHT: 21px" class="vermelhonormal"><asp:TextBox id="txtUsr_Nme" runat="server" Width="129px" CssClass="input2" Enabled="False" MaxLength="70" __designer:wfdid="w11"></asp:TextBox></TD></TR><TR><TD style="HEIGHT: 21px; TEXT-ALIGN: left" align=center colSpan=2></TD></TR><TR><TD style="HEIGHT: 21px; TEXT-ALIGN: left" align=center colSpan=2>&nbsp;<asp:Label id="lblSearchUsr" runat="server" Text="Pesquisar Usuário:" __designer:wfdid="w7"></asp:Label> <asp:TextBox id="txtUsr" runat="server" __designer:wfdid="w3" Visible="False"></asp:TextBox> <asp:Button id="btnSearchUsr" onclick="btnSearchUsr_Click" runat="server" Width="100px" CssClass="input7" Text="Pesquisar" __designer:wfdid="w4" Visible="False"></asp:Button></TD></TR><TR><TD style="HEIGHT: 21px; TEXT-ALIGN: left" align=center colSpan=2>
<asp:GridView id="grdUsr" runat="server" PageSize="5" 
                OnSelectedIndexChanged="grdUsr_SelectedIndexChanged" DataSourceID="dtsUsr" 
                DataKeyNames="IdUsr" AutoGenerateColumns="False" 
            AllowSorting="True" AllowPaging="True" SkinID="gridCRUD">
<Columns>
<asp:BoundField DataField="IdUsr" HeaderText="Id" ReadOnly="True" InsertVisible="False" SortExpression="IdUsr"></asp:BoundField>
<asp:BoundField DataField="UserName" HeaderText="Login" SortExpression="UserName"></asp:BoundField>
<asp:BoundField DataField="Usr_Nme" HeaderText="Nome do Usu&#225;rio" SortExpression="Usr_Nme"></asp:BoundField>
<asp:BoundField DataField="Prf_Nme" HeaderText="Nome do Profissional" SortExpression="Prf_Nme"></asp:BoundField>
<asp:BoundField DataField="Prf_NumCns" HeaderText="N&#186; Cons." SortExpression="Prf_NumCns"></asp:BoundField>
<asp:BoundField DataField="Prf_EstCns" HeaderText="UF Cons." SortExpression="Prf_EstCns"></asp:BoundField>
<asp:CommandField SelectText="Selecionar" ShowSelectButton="True" />
</Columns>

</asp:GridView>
<asp:SqlDataSource id="dtsUsr" runat="server" SelectCommandType="StoredProcedure" SelectCommand="ssSgn_UsrPrf" ConnectionString="<%$ ConnectionStrings:MedicallConnectionString %>" CancelSelectOnNullParameter="False" __designer:wfdid="w6" UpdateCommandType="StoredProcedure" UpdateCommand="stSgn_UsrPrf"><SelectParameters>
<asp:Parameter Name="IdUsr" Type="Int32"></asp:Parameter>
<asp:Parameter Name="UserName" Type="String"></asp:Parameter>
</SelectParameters>
<UpdateParameters>
<asp:Parameter Name="IdPrf" Type="Int32"></asp:Parameter>
<asp:Parameter Name="IdUsr" Type="Int32"></asp:Parameter>
<asp:Parameter Name="Tip_Aco" Type="String"></asp:Parameter>
</UpdateParameters>
</asp:SqlDataSource> </TD></TR><TR><TD style="HEIGHT: 21px" align=center colSpan=2><asp:Button id="btnSave" onclick="btnSave_Click" runat="server" CssClass="input7" Text="Gravar"></asp:Button> &nbsp; <asp:Button id="btnCancel" onclick="btnCancel_Click" runat="server" CssClass="input7" Text="Cancelar"></asp:Button></TD></TR></TBODY></TABLE></DIV><asp:Label id="lblMsg" runat="server" Width="100%" CssClass="vermelhonormal"></asp:Label></asp:Panel> <BR />

<asp:GridView id="grd" runat="server" Font-Size="X-Small" PageSize="15" 
                OnSelectedIndexChanged="grd_SelectedIndexChanged" DataSourceID="dts" 
                DataKeyNames="IdPrf,Usr_Nme" AutoGenerateColumns="False" 
AllowSorting="True" AllowPaging="True" OnPageIndexChanging="grd_PageIndexChanging" 
                Width="100%" SkinID="gridCRUD">
<Columns>
<asp:BoundField DataField="IdPrf" HeaderText="ID" ReadOnly="True" SortExpression="IdPrf"></asp:BoundField>
<asp:BoundField DataField="Prf_Nme" HeaderText="Nome" SortExpression="Prf_Nme"></asp:BoundField>
<asp:BoundField DataField="Usr_Nme" HeaderText="Usu&#225;rio" SortExpression="Usr_Nme"></asp:BoundField>
<asp:BoundField DataField="Prf_Sit" HeaderText="Situa&#231;&#227;o" SortExpression="Prf_Sit">
<ItemStyle HorizontalAlign="Center"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="Prf_Tel" HeaderText="Tel" SortExpression="Prf_Tel"></asp:BoundField>
<asp:BoundField DataField="Prf_Tel2" HeaderText="Celular" SortExpression="Prf_Tel2"></asp:BoundField>
<asp:BoundField DataField="Prf_Fax" HeaderText="Fax" SortExpression="Prf_Fax"></asp:BoundField>
<asp:BoundField DataField="Prf_Eml" HeaderText="Email" SortExpression="Prf_Eml"></asp:BoundField>
<asp:BoundField DataField="Prf_NumCns" HeaderText="N&#186; Conselho" SortExpression="Prf_NumCns"></asp:BoundField>
<asp:BoundField DataField="Prf_EstCns" HeaderText="UF Cons." SortExpression="Prf_EstCns"></asp:BoundField>
<asp:CommandField SelectText="Selecionar" ShowSelectButton="True" />
</Columns>
</asp:GridView> 
<asp:SqlDataSource id="dts" runat="server" SelectCommandType="StoredProcedure" SelectCommand="ssSgn_Prf" ConnectionString="<%$ ConnectionStrings:MedicallConnectionString %>" CancelSelectOnNullParameter="False"><SelectParameters>
<asp:Parameter DefaultValue="" Name="IdPrf" Type="Int64"></asp:Parameter>
<asp:Parameter DefaultValue="" Name="Prf_Nme" Type="String"></asp:Parameter>
<asp:Parameter DefaultValue="" Name="Prf_NumCns" Type="String"></asp:Parameter>
<asp:Parameter DefaultValue="" Name="Prf_Cpf" Type="String"></asp:Parameter>
</SelectParameters>
</asp:SqlDataSource> 
</contenttemplate>
    </asp:UpdatePanel>
    <br />
    <br />
    &nbsp;<!-- Fim do content principal -->
    
    
  
</asp:Content>

