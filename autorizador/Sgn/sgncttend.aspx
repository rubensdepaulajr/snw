<%@ Page Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" CodeFile="sgncttend.aspx.cs" Inherits="Sgn_sgncttend" Title="Usuário(s) do Contratado Local" %>
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
                                Usuário do Contratado Local</h2>
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
<img height="7" alt="" src="../Images/spacer.gif" width=5 border=0 /> <asp:Panel id="pnlPsq" runat="server"><B>Pesquisar contratado</B><br /><TABLE><TBODY><TR><TD><asp:RadioButtonList id="rblTipAco" runat="server" RepeatDirection="Horizontal" CssClass="azulescuropequeno">
           <asp:ListItem Value="Cte_IdCtt">C&#243;digo</asp:ListItem>
           <asp:ListItem Value="Ctt_Nme" Selected="True">Nome</asp:ListItem>
           <asp:ListItem Value="Ctt_NmeRsm">Nome Fantasia</asp:ListItem>
           <asp:ListItem Value="Ctt_Doc">CNPJ</asp:ListItem>
        </asp:RadioButtonList> <asp:RequiredFieldValidator id="rqlTipoPesquisa" runat="server" ForeColor CssClass="vermelhonormal" ControlToValidate="rblTipAco" ErrorMessage="* Selecione um tipo de pesquisa acima"></asp:RequiredFieldValidator></TD></TR><TR><TD><asp:TextBox id="txtPsq" runat="server" Width="130px" CssClass="input2"></asp:TextBox> &nbsp; &nbsp;&nbsp; <asp:Button id="btnSearch" onclick="btnSearch_Click" runat="server" Width="100px" CssClass="input7" Text="Pesquisar"></asp:Button></TD></TR></TBODY></TABLE></asp:Panel> <IMG height=15 alt=" " src="../Images/spacer.gif" width=5 border=0 />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Panel id="pnlInfoPrf" runat="server" Width="565px"><DIV><B>Informações do Contratado Local</B></DIV><DIV><TABLE><TBODY><TR><TD style="HEIGHT: 21px">Contratado:</TD><TD style="WIDTH: 347px; HEIGHT: 21px" class="vermelhonormal"><asp:TextBox id="txtCtt_Nme" runat="server" Width="355px" CssClass="input3" Enabled="False"></asp:TextBox></TD></TR><TR><TD style="HEIGHT: 21px">Código contratado:</TD><TD style="WIDTH: 347px; HEIGHT: 21px" class="vermelhonormal"><asp:TextBox id="txtCte_IdCtt" runat="server" CssClass="input3" Enabled="False"></asp:TextBox></TD></TR><TR><TD style="HEIGHT: 21px">Senquencial Endereço:</TD><TD style="WIDTH: 347px; HEIGHT: 21px"><asp:TextBox id="txtCte_SeqEnd" runat="server" CssClass="input3" Enabled="False"></asp:TextBox></TD></TR><TR><TD><asp:Label id="lblUsr" runat="server" Text="Usuário:"></asp:Label></TD><TD style="WIDTH: 347px" class="vermelhonormal"><asp:TextBox id="txtUsr_Nme" runat="server" Width="129px" CssClass="input3" Enabled="False" MaxLength="70"></asp:TextBox></TD></TR><TR><TD style="HEIGHT: 26px"><asp:Label id="lblSearchUsr" runat="server" Text="Pesquisar Usuário:"></asp:Label></TD><TD style="WIDTH: 347px; HEIGHT: 26px" class="vermelhonormal"><asp:TextBox id="txtUsr" runat="server" Visible="False"></asp:TextBox> <asp:Button id="btnSearchUsr" onclick="btnSearchUsr_Click" runat="server" Width="100px" CssClass="input7" Text="Pesquisar" Visible="False"></asp:Button></TD></TR><TR><TD style="HEIGHT: 6px" class="vermelhonormal" colSpan=2>
            <asp:GridView id="grdUsr" runat="server" PageSize="5" DataSourceID="dtsUsr" 
                DataKeyNames="IdUsr" AutoGenerateColumns="False" AllowSorting="True" 
                AllowPaging="True" SkinID="gridCRUD">
<Columns>
<asp:BoundField DataField="IdUsr" HeaderText="Id" ReadOnly="True" InsertVisible="False" SortExpression="IdUsr"></asp:BoundField>
<asp:BoundField DataField="UserName" HeaderText="Login" SortExpression="UserName"></asp:BoundField>
<asp:BoundField DataField="Usr_Nme" HeaderText="Nome do Usu&#225;rio" SortExpression="Usr_Nme"></asp:BoundField>
<asp:CommandField SelectText="Selecionar" ShowSelectButton="True" />
</Columns>

</asp:GridView><asp:SqlDataSource id="dtsUsr" runat="server" UpdateCommandType="StoredProcedure" UpdateCommand="stSgn_UsrCttEnd" SelectCommandType="StoredProcedure" SelectCommand="ssSgn_UsrCttEnd" ConnectionString="<%$ ConnectionStrings:MedicallConnectionString %>" CancelSelectOnNullParameter="False"><SelectParameters>
<asp:Parameter Name="IdUsr" Type="Int32"></asp:Parameter>
<asp:Parameter Name="UserName" Type="String"></asp:Parameter>
</SelectParameters>
<UpdateParameters>
<asp:Parameter Name="Cte_IdCtt" Type="Int64"></asp:Parameter>
<asp:Parameter Name="Cte_SeqEnd" Type="Byte"></asp:Parameter>
<asp:Parameter Name="IdUsr" Type="Int32"></asp:Parameter>
<asp:Parameter Name="Tip_Aco" Type="String"></asp:Parameter>
</UpdateParameters>
</asp:SqlDataSource></TD></TR><TR><TD style="HEIGHT: 21px" align=center colSpan=2><asp:Button id="btnSave" onclick="btnSave_Click" runat="server" CssClass="input7" Text="Gravar"></asp:Button> &nbsp; <asp:Button id="btnCancel" onclick="btnCancel_Click" runat="server" CssClass="input7" Text="Cancelar"></asp:Button>&nbsp;&nbsp; </TD></TR></TBODY></TABLE></DIV><asp:Label id="lblMsg" runat="server" Width="100%" CssClass="vermelhonormal"></asp:Label></asp:Panel> <BR />
            <asp:GridView id="grd" runat="server" Width="100%" 
                OnPageIndexChanging="grd_PageIndexChanging" Font-Size="X-Small" PageSize="5" 
                OnSelectedIndexChanged="grd_SelectedIndexChanged" DataSourceID="dts" 
                DataKeyNames="Cte_IdCtt,Cte_SeqEnd,IdUsr,Usr_Nme" AutoGenerateColumns="False" 
                AllowSorting="True" AllowPaging="True" SkinID="gridCRUD">
<Columns>
<asp:BoundField DataField="Cte_IdCtt" HeaderText="ID" ReadOnly="True" SortExpression="Cte_IdCtt"></asp:BoundField>
<asp:BoundField DataField="Ctt_Nme" HeaderText="Nome do Contratado" SortExpression="Ctt_Nme"></asp:BoundField>
<asp:BoundField DataField="Cte_SeqEnd" HeaderText="Seq. Endere&#231;o" ReadOnly="True" SortExpression="Cte_SeqEnd"></asp:BoundField>
<asp:BoundField DataField="Usr_Nme" HeaderText="Usu&#225;rio" SortExpression="Usr_Nme"></asp:BoundField>
<asp:BoundField DataField="local" HeaderText="Local" ReadOnly="True" SortExpression="local"></asp:BoundField>
<asp:BoundField DataField="Cte_NumEnd" HeaderText="N&#186; End." SortExpression="Cte_NumEnd"></asp:BoundField>
<asp:BoundField DataField="Cte_Cpl" HeaderText="Complemento" SortExpression="Cte_Cpl"></asp:BoundField>
<asp:BoundField DataField="Cte_Cep" HeaderText="CEP" SortExpression="Cte_Cep"></asp:BoundField>
<asp:BoundField DataField="Cte_Tel" HeaderText="TEL" SortExpression="Cte_Tel"></asp:BoundField>
<asp:BoundField DataField="Cte_Tel2" HeaderText="Celular" SortExpression="Cte_Tel2"></asp:BoundField>
<asp:BoundField DataField="Cte_Fax" HeaderText="Fax" SortExpression="Cte_Fax"></asp:BoundField>
<asp:BoundField DataField="Cte_Eml" HeaderText="Email" SortExpression="Cte_Eml"></asp:BoundField>
<asp:BoundField DataField="Cte_NmeCto" HeaderText="Contato" SortExpression="Cte_NmeCto"></asp:BoundField>
<asp:CommandField SelectText="Selecionar" ShowSelectButton="True" />
</Columns>

</asp:GridView> <asp:SqlDataSource id="dts" runat="server" DeleteCommand="delete from atz_cttend where Cte_IdCtt = @Cte_IdCtt and Cte_SeqEnd = @Cte_SeqEnd" UpdateCommandType="StoredProcedure" UpdateCommand="stAtz_CttEnd" SelectCommandType="StoredProcedure" SelectCommand="ssSgn_CttEnd" InsertCommandType="StoredProcedure" InsertCommand="stAtz_CttEnd" ConnectionString="<%$ ConnectionStrings:MedicallConnectionString %>" CancelSelectOnNullParameter="False"><SelectParameters>
<asp:Parameter Name="Ctt_Nme" Type="String"></asp:Parameter>
<asp:Parameter Name="Cte_IdCtt" Type="Int64"></asp:Parameter>
<asp:Parameter Name="Cte_SeqEnd" Type="Byte"></asp:Parameter>
<asp:Parameter Name="Ctt_NmeRsm" Type="String"></asp:Parameter>
<asp:Parameter Name="Ctt_Doc" Type="String"></asp:Parameter>
</SelectParameters>
<DeleteParameters>
<asp:ControlParameter ControlID="txtCte_IdCtt" PropertyName="Text" Name="Cte_IdCtt"></asp:ControlParameter>
<asp:ControlParameter ControlID="txtCte_SeqEnd" PropertyName="Text" Name="Cte_SeqEnd"></asp:ControlParameter>
</DeleteParameters>
<UpdateParameters>
<asp:ControlParameter ControlID="ddlIdCtt" PropertyName="SelectedValue" Name="Cte_IdCtt" Type="Int64"></asp:ControlParameter>
<asp:ControlParameter ControlID="txtCte_SeqEnd" PropertyName="Text" Name="Cte_SeqEnd" Type="Byte"></asp:ControlParameter>
<asp:ControlParameter ControlID="dtvCte_IdLgr" PropertyName="SelectedValue" Name="Cte_IdLgr" Type="Int32"></asp:ControlParameter>
<asp:ControlParameter ControlID="txtCte_Cpl" PropertyName="Text" Name="Cte_Cpl" Type="String"></asp:ControlParameter>
<asp:ControlParameter ControlID="TxtCte_NumEnd" PropertyName="Text" Name="Cte_NumEnd" Type="String"></asp:ControlParameter>
<asp:ControlParameter ControlID="txtCte_Tel" PropertyName="Text" Name="Cte_Tel" Type="String"></asp:ControlParameter>
<asp:ControlParameter ControlID="txtCte_Tel2" PropertyName="Text" Name="Cte_Tel2" Type="String"></asp:ControlParameter>
<asp:ControlParameter ControlID="txtCte_Fax" PropertyName="Text" Name="Cte_Fax" Type="String"></asp:ControlParameter>
<asp:ControlParameter ControlID="txtCte_Eml" PropertyName="Text" Name="Cte_Eml" Type="String"></asp:ControlParameter>
<asp:ControlParameter ControlID="txtCte_NmeCto" PropertyName="Text" Name="Cte_NmeCto" Type="String"></asp:ControlParameter>
</UpdateParameters>
<InsertParameters>
<asp:ControlParameter ControlID="ddlIdCtt" PropertyName="SelectedValue" Name="Cte_IdCtt" Type="Int64"></asp:ControlParameter>
<asp:ControlParameter ControlID="txtCte_SeqEnd" PropertyName="Text" Name="Cte_SeqEnd" Type="Byte"></asp:ControlParameter>
<asp:ControlParameter ControlID="dtvCte_IdLgr" PropertyName="SelectedValue" Name="Cte_IdLgr" Type="Int32"></asp:ControlParameter>
<asp:ControlParameter ControlID="txtCte_Cpl" PropertyName="Text" Name="Cte_Cpl" Type="String"></asp:ControlParameter>
<asp:ControlParameter ControlID="TxtCte_NumEnd" PropertyName="Text" Name="Cte_NumEnd" Type="String"></asp:ControlParameter>
<asp:ControlParameter ControlID="txtCte_Tel" PropertyName="Text" Name="Cte_Tel" Type="String"></asp:ControlParameter>
<asp:ControlParameter ControlID="txtCte_Tel2" PropertyName="Text" Name="Cte_Tel2" Type="String"></asp:ControlParameter>
<asp:ControlParameter ControlID="txtCte_Fax" PropertyName="Text" Name="Cte_Fax" Type="String"></asp:ControlParameter>
<asp:ControlParameter ControlID="txtCte_Eml" PropertyName="Text" Name="Cte_Eml" Type="String"></asp:ControlParameter>
<asp:ControlParameter ControlID="txtCte_NmeCto" PropertyName="Text" Name="Cte_NmeCto" Type="String"></asp:ControlParameter>
</InsertParameters>
</asp:SqlDataSource> <asp:GridView id="GridView1" runat="server" Width="100%" 
                OnPageIndexChanging="grd_PageIndexChanging" Font-Size="X-Small" PageSize="5" 
                OnSelectedIndexChanged="grd_SelectedIndexChanged" DataSourceID="dtsCttUsr" 
                DataKeyNames="IdUsr" AutoGenerateColumns="False" AllowSorting="True" 
                AllowPaging="True" SkinID="gridCRUD">
    <Columns>
        <asp:BoundField DataField="IdUsr" HeaderText="ID" InsertVisible="False" ReadOnly="True"
            SortExpression="IdUsr" />
        <asp:BoundField DataField="UserName" HeaderText="Login" SortExpression="UserName" />
        <asp:BoundField DataField="Usr_Nme" HeaderText="Nome do Usu&#225;rio" SortExpression="Usr_Nme" />
        <asp:CommandField SelectText="Selecionar" ShowSelectButton="True" />
    </Columns>
</asp:GridView>
            <asp:SqlDataSource ID="dtsCttUsr" runat="server" ConnectionString="<%$ ConnectionStrings:MedicallConnectionString %>"
                SelectCommand="ssSgn_CttEnd" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:Parameter Name="Uce_IdCtt" Type="Int64" />
                    <asp:Parameter Name="Uce_SeqEnd" Type="Byte" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
</contenttemplate>
    </asp:UpdatePanel>
    <br />

    <br />
    &nbsp;<!-- Fim do content principal -->

</asp:Content>


