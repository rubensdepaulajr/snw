<%@ Page Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" CodeFile="atzprfesplcr.aspx.cs" Inherits="Ngc_atzprfesplcr" Title="Profissional Local Rede Especialidade" %>

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
                                Profissional Local Rede Especialidade</h2>
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
<div id="botoes"><asp:Button id="btnNew" onclick="btnNew_Click" runat="server" Text="Novo" CssClass="input7"></asp:Button> <IMG height=5 alt=" " src="../Images/spacer.gif" width=5 border=0 /> <asp:Button id="btnEdit" onclick="btnEdit_Click" runat="server" Text="Alterar" CssClass="input7"></asp:Button> <IMG height=5 alt=" " src="../Images/spacer.gif" width=5 border=0 /> <asp:Button id="btnDel" onclick="btnDel_Click" runat="server" Text="Excluir" CssClass="input7"></asp:Button> 
    <asp:Label id="lblToolbar" runat="server" CssClass="erro" Width="271px"></asp:Label> 
<hr />
</div><IMG height="7" alt="" src="../Images/spacer.gif" width=5 border=0 /> <asp:Panel id="pnlPsq" runat="server" Width="465px"><B>Pesquisar: </B><TABLE><TBODY><TR><TD style="WIDTH: 443px"><asp:RadioButtonList id="rblTipAco" runat="server" CssClass="azulescuropequeno" RepeatDirection="Horizontal"><asp:ListItem Value="Prf_Mtr">Matr&#237;cula</asp:ListItem>
<asp:ListItem Selected="True" Value="Prf_Nme">Nome</asp:ListItem>
<asp:ListItem Value="Prf_Cpf">CPF</asp:ListItem>
<asp:ListItem Value="Prf_NumCns">N&#186; Conselho</asp:ListItem>
<asp:ListItem Value="IdCtt">ID Contratado</asp:ListItem>
</asp:RadioButtonList> <asp:RequiredFieldValidator id="rqlTipoPesquisa" runat="server" 
                    ErrorMessage="* Selecione um tipo de pesquisa acima" 
                    ControlToValidate="rblTipAco" CssClass="erro"></asp:RequiredFieldValidator></TD></TR><TR><TD style="WIDTH: 443px"><asp:TextBox id="txtPsq" runat="server" CssClass="input2" Width="130px"></asp:TextBox> &nbsp; &nbsp;&nbsp; <asp:Button id="btnSearch" onclick="btnSearch_Click" runat="server" Text="Pesquisar" CssClass="input7" Width="100px"></asp:Button></TD></TR></TBODY></TABLE></asp:Panel> <IMG height=15 alt=" " src="../Images/spacer.gif" width=5 border=0 /> <asp:Panel id="pnlInf" runat="server"><TABLE><TBODY><TR><TD style="WIDTH: 83px; HEIGHT: 21px">ID:</TD><TD style="WIDTH: 494px; HEIGHT: 21px"><asp:TextBox id="txtIdPel" runat="server" CssClass="input3" Enabled="False"></asp:TextBox></TD></TR><TR><TD style="WIDTH: 83px; HEIGHT: 21px">Profissional:</TD><TD style="WIDTH: 494px; HEIGHT: 21px"><asp:TextBox id="txtPsqPrf" runat="server" CssClass="input2"></asp:TextBox> <asp:Button id="btnSearchPrf" onclick="btnSearchPrf_Click" runat="server" Text="Pesquisar" CssClass="input7" Width="100px"></asp:Button> <cc1:FilteredTextBoxExtender id="fteTxt_PsqPrf" runat="server" __designer:wfdid="w32" TargetControlID="txtPsqPrf" FilterType="Numbers"></cc1:FilteredTextBoxExtender></TD></TR><TR><TD style="HEIGHT: 21px" colSpan=2>
            <asp:GridView id="grdPrf" runat="server" Width="100%" PageSize="5" 
                Font-Size="X-Small" DataSourceID="dtsPrf" DataKeyNames="IdPrf" 
                AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True" SkinID="gridCRUD">
<Columns>
<asp:BoundField DataField="Prf_Mtr" HeaderText="Matr&#237;cula" ReadOnly="True" SortExpression="Prf_Mtr">
<ItemStyle Width="20%"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="Prf_Nme" HeaderText="Nome do Contratado" SortExpression="Prf_Nme">
<ItemStyle Width="80%"></ItemStyle>
</asp:BoundField>
<asp:CommandField SelectText="Selecionar" ShowSelectButton="True" />
</Columns>

</asp:GridView> <asp:SqlDataSource id="dtsPrf" runat="server" SelectCommandType="StoredProcedure" SelectCommand="ssAtz_Prf" ConnectionString="<%$ ConnectionStrings:MedicallConnectionString %>" CancelSelectOnNullParameter="False"><SelectParameters>
<asp:Parameter Name="IdPrf" Type="Int64"></asp:Parameter>
<asp:Parameter Name="Prf_Mtr" Type="String"></asp:Parameter>
<asp:Parameter Name="Prf_Nme" Type="String"></asp:Parameter>
<asp:Parameter Name="Prf_NumCns" Type="String"></asp:Parameter>
<asp:Parameter Name="Prf_Cpf" Type="String"></asp:Parameter>
</SelectParameters>
</asp:SqlDataSource> </TD></TR><TR><TD style="WIDTH: 83px; HEIGHT: 21px"></TD><TD style="WIDTH: 494px; HEIGHT: 21px"></TD></TR><TR><TD style="WIDTH: 83px; HEIGHT: 21px">Especialidade:</TD><TD style="WIDTH: 494px; HEIGHT: 21px"><asp:DropDownList id="ddlEsp" runat="server" CssClass="input2" OnSelectedIndexChanged="ddlEsp_SelectedIndexChanged" DataSourceID="dtsEsp" AppendDataBoundItems="True" AutoPostBack="True" DataValueField="IdEsp" DataTextField="Esp_Dsc"><asp:ListItem></asp:ListItem>
</asp:DropDownList><asp:SqlDataSource id="dtsEsp" runat="server" SelectCommand="SELECT [IdEsp], [Esp_Dsc] FROM [Atz_Esp] ORDER BY [Esp_Dsc]" ConnectionString="<%$ ConnectionStrings:MedicallConnectionString %>"></asp:SqlDataSource> </TD></TR><TR><TD style="WIDTH: 83px; HEIGHT: 21px"></TD><TD style="WIDTH: 494px; HEIGHT: 21px"></TD></TR><TR><TD style="WIDTH: 83px; HEIGHT: 21px">Contratado:</TD><TD style="WIDTH: 494px; HEIGHT: 21px"><asp:TextBox id="txtPsqCtt" runat="server" CssClass="input2"></asp:TextBox> <asp:Button id="btnSearchCtt" onclick="btnSearchCtt_Click" runat="server" Text="Pesquisar" CssClass="input7" Width="100px"></asp:Button> <cc1:FilteredTextBoxExtender id="fteTxt_SeachCtt" runat="server" __designer:wfdid="w31" TargetControlID="txtPsqCtt" FilterType="Numbers"></cc1:FilteredTextBoxExtender></TD></TR><TR><TD colSpan=2>
            <asp:GridView id="grdCtt" runat="server" Width="100%" PageSize="5" 
                OnSelectedIndexChanged="grdCtt_SelectedIndexChanged" Font-Size="X-Small" 
                DataSourceID="dtsCtt" DataKeyNames="Cte_IdCtt,Cte_SeqEnd" 
                AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True" SkinID="gridCRUD">
                        <Columns>
                            <asp:BoundField DataField="Ctt_Nme" HeaderText="Nome do Contratado" SortExpression="Ctt_Nme" />
                            <asp:BoundField DataField="Cte_SeqEnd" HeaderText="Seq.End." ReadOnly="True" SortExpression="Cte_SeqEnd" />
                            <asp:BoundField DataField="local" HeaderText="Local" ReadOnly="True" SortExpression="local" />
                            <asp:CommandField SelectText="Selecionar" ShowSelectButton="True" />
                        </Columns>
                    </asp:GridView> <asp:SqlDataSource id="dtsCtt" runat="server" SelectCommandType="StoredProcedure" SelectCommand="ssAtz_CttEnd" ConnectionString="<%$ ConnectionStrings:MedicallConnectionString %>" CancelSelectOnNullParameter="False">
                        <SelectParameters>
                            <asp:Parameter Name="Ctt_Nme" Type="String" />
                            <asp:Parameter Name="Cte_IdCtt" Type="Int64" />
                            <asp:Parameter Name="Cte_SeqEnd" Type="Byte" />
                            <asp:Parameter Name="Ctt_NmeRsm" Type="String" />
                            <asp:Parameter Name="Ctt_Doc" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource> </TD></TR><TR><TD style="HEIGHT: 241px" class="vermelhonormal" colSpan=2>&nbsp;<asp:GridView 
                    id="grdCttEnd" runat="server" Width="100%" PageSize="5" Font-Size="X-Small" 
                    DataKeyNames="IdLcr" AutoGenerateColumns="False" SkinID="gridCRUD">
                        <Columns>
                            <asp:TemplateField>
                                <EditItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" />
                                </EditItemTemplate>
                                <HeaderTemplate>
                                    <asp:CheckBox ID="chkSelectAll" runat="server" AutoPostBack="True" OnCheckedChanged="chkSelectAll_CheckedChanged" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkSelect" runat="server" />
                                </ItemTemplate>
                                <ItemStyle Width="15px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="IdLcr" HeaderText="ID">
                                <ItemStyle Width="15%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Rde_Nme" HeaderText="Rede">
                                <ItemStyle Width="25%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Ctt_LocRde" HeaderText="Contratado Local" SortExpression="Ctt_LocRde">
                                <ItemStyle Width="60%" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView> </TD></TR><TR><TD style="TEXT-ALIGN: center" colSpan=2>&nbsp;&nbsp; <asp:Button id="btnSave" onclick="btnSave_Click" runat="server" Text="Gravar" CssClass="input7"></asp:Button> &nbsp; <asp:Button id="btnCancel" onclick="btnCancel_Click" runat="server" Text="Cancelar" CssClass="input7"></asp:Button></TD></TR></TBODY></TABLE>
            <asp:Label id="lblMsg" runat="server" CssClass="erro" Width="271px"></asp:Label></asp:Panel> <BR />
            <asp:GridView id="grd" runat="server" Width="100%" PageSize="20" 
                OnSelectedIndexChanged="grd_SelectedIndexChanged" 
                OnPageIndexChanging="grd_PageIndexChanging" Font-Size="X-Small" 
                DataSourceID="dts" DataKeyNames="IdLcr,IdCtt,IdPrf,IdEsp,Cte_SeqEnd" 
                AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True" 
                SkinID="gridCRUD">
        <Columns>
            <asp:BoundField DataField="idpel" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                SortExpression="idpel">
                <ItemStyle Width="10px" />
            </asp:BoundField>
            <asp:BoundField DataField="esp_dsc" HeaderText="Especialidade" ReadOnly="True" SortExpression="esp_dsc">
                <ItemStyle Width="15%" />
            </asp:BoundField>
            <asp:BoundField DataField="rde_nme" HeaderText="Rede" SortExpression="rde_nme">
                <ItemStyle Width="15%" />
            </asp:BoundField>
            <asp:BoundField DataField="prf_nme" HeaderText="Nome do Profissional" SortExpression="prf_nme">
                <ItemStyle Width="25%" />
            </asp:BoundField>
            <asp:BoundField DataField="Ctt_Nme" HeaderText="Contratado" SortExpression="Ctt_Nme">
                <ItemStyle Width="25%" />
            </asp:BoundField>
            <asp:BoundField DataField="Lgr_Nme" HeaderText="Logradouro" SortExpression="Lgr_Nme">
                <ItemStyle Width="20%" />
            </asp:BoundField>
            <asp:CommandField SelectText="Selecionar" ShowSelectButton="True" />
        </Columns>
    </asp:GridView> <asp:SqlDataSource id="dts" runat="server" UpdateCommandType="StoredProcedure" UpdateCommand="stAtz_PrfEspLcr " SelectCommandType="StoredProcedure" SelectCommand="ssAtz_PrfEspLcr" InsertCommandType="StoredProcedure" InsertCommand="stAtz_PrfEspLcr " DeleteCommand="delete from Atz_PrfEspLcr where idpel = @idpel" ConnectionString="<%$ ConnectionStrings:MedicallConnectionString %>" CancelSelectOnNullParameter="False"><SelectParameters>
<asp:Parameter Name="Prf_Nme" Type="String"></asp:Parameter>
<asp:Parameter Name="IdPrf" Type="Int64"></asp:Parameter>
<asp:Parameter Name="Prf_Cpf" Type="String"></asp:Parameter>
<asp:Parameter Name="Prf_NumCns" Type="String"></asp:Parameter>
<asp:Parameter Name="IdCtt" Type="Int64"></asp:Parameter>
<asp:Parameter Name="Prf_Mtr" Type="String"></asp:Parameter>
</SelectParameters>
<DeleteParameters>
<asp:ControlParameter ControlID="txtIdPel" PropertyName="Text" Name="idpel"></asp:ControlParameter>
</DeleteParameters>
<UpdateParameters>
<asp:ControlParameter ControlID="txtIdPel" PropertyName="Text" Name="IdPel" Type="Int32"></asp:ControlParameter>
<asp:ControlParameter ControlID="grdPrf" PropertyName="SelectedValue" Name="Pel_IdPrf" Type="Int64"></asp:ControlParameter>
<asp:ControlParameter ControlID="ddlEsp" PropertyName="SelectedValue" Name="Pel_IdEsp" Type="Int16"></asp:ControlParameter>
<asp:ControlParameter ControlID="grdCttEnd" PropertyName="SelectedValue" Name="Pel_IdLcr" Type="Int32"></asp:ControlParameter>
</UpdateParameters>
<InsertParameters>
<asp:ControlParameter ControlID="txtIdPel" PropertyName="Text" Name="IdPel" Type="Int32"></asp:ControlParameter>
<asp:ControlParameter ControlID="grdPrf" PropertyName="SelectedValue" Name="Pel_IdPrf" Type="Int64"></asp:ControlParameter>
<asp:ControlParameter ControlID="ddlEsp" PropertyName="SelectedValue" Name="Pel_IdEsp" Type="Int16"></asp:ControlParameter>
<asp:ControlParameter ControlID="grdCttEnd" PropertyName="SelectedValue" Name="Pel_IdLcr" Type="Int32"></asp:ControlParameter>
</InsertParameters>
</asp:SqlDataSource> 
</contenttemplate>
    </asp:UpdatePanel>
</asp:Content>


