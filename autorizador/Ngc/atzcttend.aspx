<%@ Page Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" CodeFile="atzcttend.aspx.cs" Inherits="Ngc_atzcttend" Title="Contratado Local" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <%--<asp:UpdatePanel id="UpdatePanel1" runat="server">
        <contenttemplate>--%>

            <div id="Titulo">
                <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td align="left" style="width: 8px">
                            <img alt="" height="37" src="../images/tit_left.gif" width="9" /></td>
                        <td bgcolor="#f4f4f4">
                            <h2>
                                Contratado Local</h2>
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
            </DIV>
            <DIV id="botoes">
            <asp:Button id="btnNew" onclick="btnNew_Click" runat="server" Text="Novo" CssClass="input7"></asp:Button> <IMG height=5 alt=" " src="../Images/spacer.gif" width=5 border=0 /> <asp:Button id="btnEdit" onclick="btnEdit_Click" runat="server" Text="Alterar" CssClass="input7"></asp:Button> <IMG height=5 alt=" " src="../Images/spacer.gif" width=5 border=0 /> <asp:Button id="btnDel" onclick="btnDel_Click" runat="server" Text="Excluir" CssClass="input7"></asp:Button>&nbsp; <IMG height=5 alt=" " src="../Images/spacer.gif" width=5 border=0 />&nbsp; 
                <asp:Label id="lblToolbar" runat="server" CssClass="erro"></asp:Label> 
            <hr />
</DIV><img height=7 alt="" src="../Images/spacer.gif" width=5 border=0 /> <asp:Panel id="pnlPsq" runat="server"><B>Pesquisar contratado</B><BR /><TABLE><TBODY><TR><TD><asp:RadioButtonList id="rblTipAco" runat="server" CssClass="azulescuropequeno" RepeatDirection="Horizontal">
           <asp:ListItem Value="Cte_IdCtt">C&#243;digo</asp:ListItem>
           <asp:ListItem Value="Ctt_Nme" Selected="True">Nome</asp:ListItem>
           <asp:ListItem Value="Ctt_NmeRsm">Nome Fantasia</asp:ListItem>
           <asp:ListItem Value="Ctt_Doc">CNPJ</asp:ListItem>
        </asp:RadioButtonList> <asp:RequiredFieldValidator id="rqlTipoPesquisa" runat="server" 
                    ErrorMessage="* Selecione um tipo de pesquisa acima" 
                    ControlToValidate="rblTipAco" CssClass="erro"></asp:RequiredFieldValidator>
                    </TD></TR><TR><TD><asp:TextBox id="txtPsq" runat="server" CssClass="input2" Width="130px"></asp:TextBox> &nbsp; &nbsp;&nbsp; <asp:Button id="btnSearch" onclick="btnSearch_Click" runat="server" Text="Pesquisar" CssClass="input7" Width="100px"></asp:Button></TD></TR></TBODY></TABLE></asp:Panel> <IMG height=15 alt=" " src="../Images/spacer.gif" width=5 border=0 />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Panel id="pnlInfoPrf" runat="server" Width="565px"><DIV><B>Informação Contratado</B> <TABLE><TBODY><TR><TD>Contratado:</TD><TD><asp:DropDownList id="ddlIdCtt" runat="server" CssClass="input2" DataSourceID="dtsCtt" OnSelectedIndexChanged="ddlIdCtt_SelectedIndexChanged" AppendDataBoundItems="True" DataTextField="Ctt_Nme" DataValueField="IdCtt" AutoPostBack="True"><asp:ListItem Selected="True"></asp:ListItem>
</asp:DropDownList>
    <asp:SqlDataSource id="dtsCtt" runat="server" ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" 
        SelectCommand="SELECT [IdCtt], [Ctt_Nme], [Ctt_NmeRsm] FROM [Atz_Ctt] ORDER BY [Ctt_Nme], [Ctt_NmeRsm]">
    </asp:SqlDataSource> 
    </TD></TR></TBODY></TABLE><img height=15 alt=" " src="../Images/spacer.gif" width=5 border=0 /></DIV><DIV>
    <B>Informações do local atendimento:</B> 
    <table>
        <tbody>
            <tr>
                <td style="HEIGHT: 21px">Código contratado:</td>
                <td style="WIDTH: 347px; HEIGHT: 21px" class="vermelhonormal">
                    <asp:TextBox id="txtCte_IdCtt" runat="server" CssClass="input3" Enabled="False"></asp:TextBox> * </td>
            </tr>
            <tr>
                <td style="HEIGHT: 21px">Senquencial Endereço:</td>
                <td style="WIDTH: 347px; HEIGHT: 21px">
                    <asp:TextBox id="txtCte_SeqEnd" runat="server" CssClass="input3" Enabled="False"></asp:TextBox></td>
            </tr>
            <tr>
                <td>CEP</td>
                <td style="WIDTH: 347px" class="vermelhonormal">
                    <asp:TextBox id="txtCte_Cep" runat="server" CssClass="input2" MaxLength="10"></asp:TextBox>
                    <asp:Button id="btnSearchLgr" onclick="btnSearchLgr_Click" runat="server" Text="Pesquisar" CssClass="input7"></asp:Button>
                </td>
            </tr>
            <tr>
                <td>Local:</td>
                <td style="width: 347px" class="vermelhonormal">&nbsp;
                    <asp:DetailsView id="dtvCte_IdLgr" runat="server" Width="100%" AllowPaging="True" 
                            CellPadding="3" DataKeyNames="IdLgr" DataSourceID="dtsLgr" 
                            AutoGenerateRows="False" GridLines="Vertical" Height="50px" BackColor="White" 
                            BorderColor="#999999" BorderStyle="None" BorderWidth="1px">
                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <Fields>
                            <asp:BoundField DataField="IdLgr" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                                SortExpression="IdLgr" />
                            <asp:BoundField DataField="Tpl_Dsc" HeaderText="Tipo Log." SortExpression="Tpl_Dsc" />
                            <asp:BoundField DataField="Lgr_Nme" HeaderText="Logradouro" SortExpression="Lgr_Nme" />
                            <asp:BoundField DataField="Brr_Nme" HeaderText="Bairro" SortExpression="Brr_Nme" />
                            <asp:BoundField DataField="Mun_Nme" HeaderText="Munic&#237;pio" SortExpression="Mun_Nme" />
                            <asp:BoundField DataField="Lgr_Cep" HeaderText="CEP" SortExpression="Lgr_Cep" />
                        </Fields>
                        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                    </asp:DetailsView> *<br />
                    <asp:SqlDataSource id="dtsLgr" runat="server" CancelSelectOnNullParameter="False" 
                            ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" SelectCommand="ssAtz_Lgr" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:Parameter Name="IdLgr" Type="Int32" />
                            <asp:Parameter Name="IdMun" Type="Int16" />
                            <asp:Parameter Name="Lgr_IdBrr" Type="Int32" />
                            <asp:Parameter Name="Lgr_Nme" Type="String" />
                            <asp:ControlParameter ControlID="txtCte_Cep" Name="Lgr_Cep" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>Complemento:</td>
                <td style="width: 347px" class="vermelhonormal">
                    <asp:TextBox id="txtCte_Cpl" runat="server" CssClass="input2" Width="150px" MaxLength="15"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="height: 21px">Número</td>
                <td style="width: 347px; height: 21px" class="vermelhonormal">
                    <asp:TextBox id="txtCte_NumEnd" runat="server" CssClass="input2" Width="150px" MaxLength="5"></asp:TextBox> *</td>
            </tr>
            <tr>
                <td>Telefone:</td>
                <td style="width: 347px" class="vermelhonormal">
                    <asp:TextBox id="txtCte_Tel" runat="server" CssClass="input2" Width="180px" MaxLength="20"></asp:TextBox> *</td>
            </tr>
            <tr>
                <td>Celular:</td>
                <td style="width: 347px">
                    <asp:TextBox id="txtCte_Tel2" runat="server" CssClass="input2" Width="180px" MaxLength="20"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Fax:</td>
                <td style="width: 347px">
                    <asp:TextBox id="txtCte_Fax" runat="server" CssClass="input2" Width="180px" MaxLength="20"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="height: 21px">Email:</td><td style="width: 347px; height: 21px">
                    <asp:TextBox id="txtCte_Eml" runat="server" CssClass="input2" Width="340px" MaxLength="50"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="height: 21px">Contato:</TD><TD style="width: 347px; height: 21px">
                    <asp:TextBox id="txtCte_NmeCto" runat="server" CssClass="input2" Width="340px" MaxLength="70"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="height: 21px">
                    Ativar Biometria em Consulta:</td>
                <td style="width: 347px; height: 21px">
                    <asp:CheckBox ID="chkCteBioCon" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="HEIGHT: 21px">
                    Ativar Biometria em SP/SADT:</td>
                <td style="WIDTH: 347px; HEIGHT: 21px">
                    <asp:CheckBox ID="chkCteBioExe" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="height: 21px">
                    Exclusão:</td>
                <td style="width: 347px; height: 21px">
                    <asp:TextBox ID="txtCte_DatFim" runat="server" CssClass="input2" MaxLength="10" 
                        Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr align="center" colspan="2" style="height: 21px">
                <td class="caption" style="width: 63px">
                        &nbsp;</td>
                    <td >
                        <asp:Button ID="btnSave" runat="server" CssClass="button" Text="Gravar" 
                            onclick="btnSave_Click" />
                        <asp:Button ID="btnCancel" runat="server" CssClass="button" Text="Cancelar" 
                            onclick="btnCancel_Click" />
                     </td>
            </tr>
        </tody>
    </table>
            </div>
            <asp:Label id="lblMsg" runat="server" Text="* Campos obrigatórios em branco" 
                CssClass="erro" Visible="False" Width="271px"></asp:Label></asp:Panel> <BR />
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
            <asp:BoundField DataField="Ctt_NmeRsm" HeaderText="Nome Fantasia" SortExpression="Ctt_NmeRsm" />
            <asp:BoundField DataField="local" HeaderText="Local" ReadOnly="True" SortExpression="local" />
            <asp:BoundField DataField="Cte_NumEnd" HeaderText="N&#186; End." SortExpression="Cte_NumEnd" />
            <asp:BoundField DataField="Cte_Cpl" HeaderText="Complemento" SortExpression="Cte_Cpl" />
            <asp:BoundField DataField="Cte_Cep" HeaderText="CEP" SortExpression="Cte_Cep" />
            <asp:BoundField DataField="Cte_Tel" HeaderText="Tel." SortExpression="Cte_Tel" />
            <asp:BoundField DataField="Cte_Tel2" HeaderText="Celular" SortExpression="Cte_Tel2" />
            <asp:BoundField DataField="Cte_Fax" HeaderText="Fax" SortExpression="Cte_Fax" />
            <asp:BoundField DataField="Cte_Eml" HeaderText="Email" SortExpression="Cte_Eml" />
            <asp:BoundField DataField="Cte_NmeCto" HeaderText="Contato" SortExpression="Cte_NmeCto" />
            <asp:BoundField DataField="Ctt_Doc" HeaderText="Ctt_Doc" SortExpression="Ctt_Doc" Visible="False" />
            <asp:BoundField DataField="Ctt_Nme" HeaderText="Ctt_Nme" SortExpression="Ctt_Nme" Visible="False" />
            <asp:TemplateField HeaderText="Bio. Consulta" SortExpression="Cte_BioCon"><EditItemTemplate>
                <asp:CheckBox runat="server" Checked='<%# Bind("Cte_BioCon") %>' id="chkGrdBioCon"></asp:CheckBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox id="chkGrdBioCon" runat="server" Enabled="false" Checked='<%# Bind("Cte_BioCon") %>'></asp:CheckBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Bio. SP/SADT" SortExpression="Cte_BioExe"><EditItemTemplate>
                <asp:CheckBox runat="server" Checked='<%# Bind("Cte_BioExe") %>' id="chkGrdBioExe"></asp:CheckBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox id="chkGrdBioExe" runat="server" Enabled="false" Checked='<%# Bind("Cte_BioExe") %>'></asp:CheckBox>
                </ItemTemplate>
            </asp:TemplateField> 
            <asp:BoundField DataField="Cte_DatFim" DataFormatString="{0:dd/MM/yyyy}" 
                HeaderText="Exclusão" SortExpression="Cte_DatFim" />
            <asp:CommandField SelectText="Selecionar" ShowSelectButton="True" />       
        </Columns>
    </asp:GridView> 
    <asp:SqlDataSource id="dts" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" 
        InsertCommand="stAtz_CttEnd" InsertCommandType="StoredProcedure" SelectCommand="ssAtz_CttEnd" 
        SelectCommandType="StoredProcedure" UpdateCommand="stAtz_CttEnd" UpdateCommandType="StoredProcedure" 
        DeleteCommand="delete from atz_cttend where Cte_IdCtt = @Cte_IdCtt and Cte_SeqEnd = @Cte_SeqEnd">
        <SelectParameters>
            <asp:Parameter Name="Ctt_Nme" Type="String"></asp:Parameter>
            <asp:Parameter Name="Cte_IdCtt" Type="String"></asp:Parameter>
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
            <asp:ControlParameter ControlID="txtCte_NumEnd" PropertyName="Text" Name="Cte_NumEnd" Type="String"></asp:ControlParameter>
            <asp:ControlParameter ControlID="txtCte_Tel" PropertyName="Text" Name="Cte_Tel" Type="String"></asp:ControlParameter>
            <asp:ControlParameter ControlID="txtCte_Tel2" PropertyName="Text" Name="Cte_Tel2" Type="String"></asp:ControlParameter>
            <asp:ControlParameter ControlID="txtCte_Fax" PropertyName="Text" Name="Cte_Fax" Type="String"></asp:ControlParameter>
            <asp:ControlParameter ControlID="txtCte_Eml" PropertyName="Text" Name="Cte_Eml" Type="String"></asp:ControlParameter>
            <asp:ControlParameter ControlID="txtCte_NmeCto" PropertyName="Text" Name="Cte_NmeCto" Type="String"></asp:ControlParameter>
            <asp:ControlParameter ControlID="chkCteBioCon" PropertyName="Checked" Name="Cte_BioCon" Type="Boolean"></asp:ControlParameter>
            <asp:ControlParameter ControlID="chkCteBioExe" PropertyName="Checked" Name="Cte_BioExe" Type="Boolean"></asp:ControlParameter>
            <asp:ControlParameter ControlID="txtCte_DatFim" Name="Cte_DatFim" 
                PropertyName="Text" Type="DateTime" />
        </UpdateParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="ddlIdCtt" PropertyName="SelectedValue" Name="Cte_IdCtt" Type="Int64"></asp:ControlParameter>
            <asp:ControlParameter ControlID="txtCte_SeqEnd" PropertyName="Text" Name="Cte_SeqEnd" Type="Byte"></asp:ControlParameter>
            <asp:ControlParameter ControlID="dtvCte_IdLgr" PropertyName="SelectedValue" Name="Cte_IdLgr" Type="Int32"></asp:ControlParameter>
            <asp:ControlParameter ControlID="txtCte_Cpl" PropertyName="Text" Name="Cte_Cpl" Type="String"></asp:ControlParameter>
            <asp:ControlParameter ControlID="txtCte_NumEnd" PropertyName="Text" Name="Cte_NumEnd" Type="String"></asp:ControlParameter>
            <asp:ControlParameter ControlID="txtCte_Tel" PropertyName="Text" Name="Cte_Tel" Type="String"></asp:ControlParameter>
            <asp:ControlParameter ControlID="txtCte_Tel2" PropertyName="Text" Name="Cte_Tel2" Type="String"></asp:ControlParameter>
            <asp:ControlParameter ControlID="txtCte_Fax" PropertyName="Text" Name="Cte_Fax" Type="String"></asp:ControlParameter>
            <asp:ControlParameter ControlID="txtCte_Eml" PropertyName="Text" Name="Cte_Eml" Type="String"></asp:ControlParameter>
            <asp:ControlParameter ControlID="txtCte_NmeCto" PropertyName="Text" Name="Cte_NmeCto" Type="String"></asp:ControlParameter>
            <asp:ControlParameter ControlID="chkCteBioCon" PropertyName="Checked" Name="Cte_BioCon" Type="Boolean"></asp:ControlParameter>
            <asp:ControlParameter ControlID="chkCteBioExe" PropertyName="Checked" Name="Cte_BioExe" Type="Boolean"></asp:ControlParameter>
            <asp:ControlParameter ControlID="txtCte_DatFim" Name="Cte_DatFim" 
                PropertyName="Text" Type="DateTime" />
        </InsertParameters>
    </asp:SqlDataSource> 
<%--</contenttemplate>
</asp:UpdatePanel>--%>
</asp:Content>
