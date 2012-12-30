<%@ Page Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" Inherits="Sgn_sgnctt" Title="Contratado Local - Usuários" Codebehind="sgnctt.aspx.cs" %>
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
                                Contratado Local - Usuários</h2>
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
<div id="botoes"><asp:Button id="btnNew" onclick="btnNew_Click" runat="server" Text="Novo" CssClass="input7"></asp:Button> <IMG height=5 alt=" " src="../Images/spacer.gif" width=5 border=0 /> <asp:Button id="btnDel" onclick="btnDel_Click" runat="server" Text="Excluir" CssClass="input7"></asp:Button>&nbsp; <IMG height=5 alt=" " src="../Images/spacer.gif" width=5 border=0 />&nbsp; <asp:Label id="lblToolbar" runat="server" CssClass="vermelhonormal"></asp:Label> 
<hr />
</div><img height="7" alt="" src="../Images/spacer.gif" width=5 border=0 /> <asp:Panel id="pnlPsq" runat="server"><B>Pesquisar contratado</B><BR /><TABLE><TBODY><TR><TD><asp:RadioButtonList id="rblTipAco" runat="server" CssClass="azulescuropequeno" RepeatDirection="Horizontal">
           <asp:ListItem Value="Cte_IdCtt">C&#243;digo</asp:ListItem>
           <asp:ListItem Value="Ctt_Nme" Selected="True">Nome</asp:ListItem>
           <asp:ListItem Value="Ctt_NmeRsm">Nome Fantasia</asp:ListItem>
           <asp:ListItem Value="Ctt_Doc">CNPJ</asp:ListItem>
        </asp:RadioButtonList> <asp:RequiredFieldValidator id="rqlTipoPesquisa" runat="server" ErrorMessage="* Selecione um tipo de pesquisa acima" ControlToValidate="rblTipAco"></asp:RequiredFieldValidator></TD></TR><TR><TD><asp:TextBox id="txtPsq" runat="server" CssClass="input2" Width="130px"></asp:TextBox> &nbsp; &nbsp;&nbsp; <asp:Button id="btnSearch" onclick="btnSearch_Click" runat="server" Text="Pesquisar" CssClass="input7" Width="100px"></asp:Button></TD></TR></TBODY></TABLE></asp:Panel> <IMG height=15 alt=" " src="../Images/spacer.gif" width=5 border=0 />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Panel id="pnlInfoPrf" runat="server" Width="565px"><DIV><B>Informação Contratado</B> 
            <br />
            <IMG height=15 alt=" " src="../Images/spacer.gif" width=5 border=0 /><br />
            <table>
                <tbody>
                    <tr>
                        <td style="height: 21px">
                            Contratado:</td>
                        <td class="vermelhonormal" style="width: 347px; height: 21px">
                            <asp:TextBox ID="txtCtt_Nme" runat="server" CssClass="input3" Enabled="False" Width="355px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="height: 21px">
                            Código contratado:</td>
                        <td class="vermelhonormal" style="width: 347px; height: 21px">
                            <asp:TextBox ID="txtCte_IdCtt" runat="server" CssClass="input3" Enabled="False"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="height: 21px">
                            Senquencial Endereço:</td>
                        <td style="width: 347px; height: 21px">
                            <asp:TextBox ID="txtCte_SeqEnd" runat="server" CssClass="input3" Enabled="False"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="height: 26px">
                            <asp:Label ID="lblSearchUsr" runat="server" Text="Pesquisar Usuário:"></asp:Label></td>
                        <td class="vermelhonormal" style="width: 347px; height: 26px">
                            <asp:TextBox ID="txtUsr" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchUsr" runat="server" CssClass="input7"
                                Text="Pesquisar" Width="100px" OnClick="btnSearchUsr_Click" /></td>
                    </tr>
                    <tr>
                        <td class="vermelhonormal" colspan="2" style="height: 6px">
                            <asp:GridView ID="grdUsr" runat="server" AllowPaging="True" AllowSorting="True" 
                                AutoGenerateColumns="False" DataKeyNames="IdUsr" DataSourceID="dtsUsr" 
                                PageSize="5" SkinID="gridCRUD">
                                <Columns>
                                    <asp:BoundField DataField="IdUsr" HeaderText="Id" InsertVisible="False" ReadOnly="True"
                                        SortExpression="IdUsr" />
                                    <asp:BoundField DataField="UserName" HeaderText="Login" SortExpression="UserName" />
                                    <asp:BoundField DataField="Usr_Nme" HeaderText="Nome do Usu&#225;rio" SortExpression="Usr_Nme" />
                                    <asp:CommandField SelectText="Selecionar" ShowSelectButton="True" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="dtsUsr" runat="server" CancelSelectOnNullParameter="False"
                                ConnectionString="<%$ ConnectionStrings:MedicallConnectionString %>" SelectCommand="ssSgn_UsrCttEnd"
                                SelectCommandType="StoredProcedure" UpdateCommand="stSgn_UsrCttEnd" UpdateCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:Parameter Name="IdUsr" Type="Int32" />
                                    <asp:Parameter Name="UserName" Type="String" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Cte_IdCtt" Type="Int64" />
                                    <asp:Parameter Name="Cte_SeqEnd" Type="Byte" />
                                    <asp:Parameter Name="IdUsr" Type="Int32" />
                                    <asp:Parameter Name="Tip_Aco" Type="String" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2" style="height: 21px">
                            <asp:Button ID="btnSave" runat="server" CssClass="input7" OnClick="btnSave_Click"
                                Text="Gravar" />
                            &nbsp;
                            <asp:Button ID="btnCancel" runat="server" CssClass="input7" OnClick="btnCancel_Click"
                                Text="Cancelar" />
                            &nbsp;
                        </td>
                    </tr>
                </tbody>
            </table>
        </DIV><asp:Label id="lblMsg" runat="server" Text="* Campos obrigatórios em branco" CssClass="vermelhonormal" Visible="False" Width="271px"></asp:Label></asp:Panel> <BR />
            <asp:GridView id="grd" runat="server" Width="100%" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" 
                DataKeyNames="Cte_IdCtt,Cte_SeqEnd" DataSourceID="dts" 
                OnSelectedIndexChanged="grd_SelectedIndexChanged" 
                Font-Size="X-Small" SkinID="gridCRUD" 
                onpageindexchanged="grd_PageIndexChanged">
        <Columns>        
            <asp:BoundField DataField="Cte_IdCtt" HeaderText="ID" ReadOnly="True" SortExpression="Cte_IdCtt" />
            <asp:BoundField DataField="Cte_SeqEnd" HeaderText="Seq. Endere&#231;o" ReadOnly="True"
                SortExpression="Cte_SeqEnd" />
            <asp:BoundField DataField="CTT_NMERSM" HeaderText="Nome Fantasia" SortExpression="CTT_NMERSM" />
            <asp:BoundField DataField="local" HeaderText="Local" ReadOnly="True" SortExpression="local" />
            <asp:BoundField DataField="Cte_NumEnd" HeaderText="N&#186; End." SortExpression="Cte_NumEnd" />
            <asp:BoundField DataField="Cte_Cpl" HeaderText="Complemento" SortExpression="Cte_Cpl" />
            <asp:BoundField DataField="Cte_Cep" HeaderText="CEP" SortExpression="Cte_Cep" />
            <asp:BoundField DataField="Cte_Tel" HeaderText="TEL" SortExpression="Cte_Tel" />
            <asp:BoundField DataField="Cte_Tel2" HeaderText="Celular" SortExpression="Cte_Tel2" />
            <asp:BoundField DataField="Cte_Fax" HeaderText="Fax" SortExpression="Cte_Fax" />
            <asp:BoundField DataField="Cte_Eml" HeaderText="Email" SortExpression="Cte_Eml" />
            <asp:BoundField DataField="Cte_NmeCto" HeaderText="Contato" SortExpression="Cte_NmeCto" />
            <asp:BoundField DataField="CTT_DOC" HeaderText="CTT_DOC" SortExpression="CTT_DOC"
                Visible="False" />
            <asp:BoundField DataField="CTT_NME" HeaderText="CTT_NME" SortExpression="CTT_NME"
                Visible="False" />
            <asp:CommandField SelectText="Selecionar" ShowSelectButton="True" />
        </Columns>
    </asp:GridView> <asp:SqlDataSource id="dts" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:MedicallConnectionString %>" SelectCommand="ssAtz_CttEnd" SelectCommandType="StoredProcedure" DeleteCommand="delete from atz_cttend where Cte_IdCtt = @Cte_IdCtt and Cte_SeqEnd = @Cte_SeqEnd"><SelectParameters>
<asp:Parameter Name="Ctt_Nme" Type="String"></asp:Parameter>
<asp:Parameter Name="Cte_IdCtt" Type="String"></asp:Parameter>
<asp:Parameter Name="Ctt_NmeRsm" Type="String"></asp:Parameter>
<asp:Parameter Name="Ctt_Doc" Type="String"></asp:Parameter>
</SelectParameters>
<DeleteParameters>
<asp:ControlParameter ControlID="txtCte_IdCtt" PropertyName="Text" Name="Cte_IdCtt"></asp:ControlParameter>
<asp:ControlParameter ControlID="txtCte_SeqEnd" PropertyName="Text" Name="Cte_SeqEnd"></asp:ControlParameter>
</DeleteParameters>
</asp:SqlDataSource> <IMG height=15 alt=" " src="../Images/spacer.gif" width=5 border=0 />&nbsp;
            <asp:GridView 
                ID="grdCttUsr" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" DataKeyNames="IdUsr" DataSourceID="dtsCttUsr"
                Font-Size="X-Small" PageSize="5" Width="100%" SkinID="gridCRUD">
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
</contenttemplate>
    </asp:UpdatePanel>
    <br />

    <br />
    &nbsp;<!-- Fim do content principal -->

</asp:Content>


