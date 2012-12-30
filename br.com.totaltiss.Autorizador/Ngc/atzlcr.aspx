<%@ Page Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" Inherits="Ngc_atzlcr" Title="Contratado Local Rede" Codebehind="atzlcr.aspx.cs" %>

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
                                Contratado Local Rede</h2>
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
<DIV id="botoes"><asp:Button id="btnNew" onclick="btnNew_Click" runat="server" Text="Novo" CssClass="input7"></asp:Button> <IMG height=5 alt=" " src="../Images/spacer.gif" width=5 border=0 /> <asp:Button id="btnEdit" onclick="btnEdit_Click" runat="server" Text="Alterar" CssClass="input7"></asp:Button> <IMG height=5 alt=" " src="../Images/spacer.gif" width=5 border=0 /> <asp:Button id="btnDel" onclick="btnDel_Click" runat="server" Text="Excluir" CssClass="input7"></asp:Button> 
    <asp:Label id="lblEditError" runat="server" Text="* Nenhum item selecionado" 
        CssClass="erro" Visible="False" Width="271px"></asp:Label> 
<hr />
</DIV><img height=7 alt="" src="../Images/spacer.gif" width=5 border=0 /> <asp:Panel id="pnlPsq" runat="server"><B>Pesquisar: </B><TABLE><TBODY><TR><TD><asp:RadioButtonList id="rblTipAco" runat="server" CssClass="azulescuropequeno" RepeatDirection="Horizontal">
           <asp:ListItem Value="Cte_IdCtt">C&#243;digo</asp:ListItem>
           <asp:ListItem Value="Ctt_Nme" Selected="True">Nome</asp:ListItem>
           <asp:ListItem Value="Ctt_NmeRsm">Nome Fantasia</asp:ListItem>
           <asp:ListItem Value="Ctt_Doc">CNPJ</asp:ListItem>
        </asp:RadioButtonList> <asp:RequiredFieldValidator id="rqlTipoPesquisa" runat="server" 
                    ErrorMessage="* Selecione um tipo de pesquisa acima" 
                    ControlToValidate="rblTipAco" CssClass="erro"></asp:RequiredFieldValidator></TD></TR><TR><TD style="HEIGHT: 40px"><asp:TextBox id="txtPsq" runat="server" CssClass="input2" Width="130px"></asp:TextBox> &nbsp; &nbsp;&nbsp; <asp:Button id="btnSearch" onclick="btnSearch_Click" runat="server" Text="Pesquisar" CssClass="input7" Width="100px"></asp:Button></TD></TR></TBODY></TABLE></asp:Panel> <IMG height=15 alt=" " src="../Images/spacer.gif" width=5 border=0 /> &nbsp;&nbsp;&nbsp; <asp:Panel id="pnlInfoPrf" runat="server" Width="591px"><DIV><B>Informação do local</B><TABLE><TBODY><TR><TD style="HEIGHT: 12px">Contratado:</TD><TD style="WIDTH: 494px; HEIGHT: 12px"><asp:TextBox id="txtPsqCtt" runat="server" CssClass="input2"></asp:TextBox> <asp:Button id="btnSearchCtt" onclick="btnSearchCtt_Click" runat="server" Text="Pesquisar" CssClass="input7" Width="100px"></asp:Button> <cc1:FilteredTextBoxExtender id="ftePsqCtt" runat="server" FilterType="Numbers" TargetControlID="txtPsqCtt" __designer:wfdid="w1"></cc1:FilteredTextBoxExtender></TD></TR><TR><TD></TD><TD style="WIDTH: 494px">
            <asp:GridView id="grdCtt" runat="server" Width="100%" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="IdCtt" 
                DataSourceID="dtsCtt2" PageSize="5" Font-Size="X-Small" SkinID="gridCRUD">
                        <Columns>
                            <asp:BoundField DataField="IdCtt" HeaderText="Matr&#237;cula" ReadOnly="True" SortExpression="IdCtt" >
                                <ItemStyle Width="20%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Ctt_Nme" HeaderText="Nome do Contratado" SortExpression="Ctt_Nme" >
                                <ItemStyle Width="80%" />
                            </asp:BoundField>
                            <asp:CommandField SelectText="Selecionar" ShowSelectButton="True" />
                        </Columns>
                    </asp:GridView> <asp:SqlDataSource id="dtsCtt2" runat="server" ConnectionString="<%$ ConnectionStrings:MedicallConnectionString %>" SelectCommand="SELECT DISTINCT Atz_Ctt.IdCtt, Atz_Ctt.Ctt_Nme FROM Atz_Ctt INNER JOIN Atz_CttEnd ON Atz_Ctt.IdCtt = Atz_CttEnd.Cte_IdCtt WHERE (Atz_Ctt.IdCtt = @IdCtt) ORDER BY Atz_Ctt.Ctt_Nme">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtPsqCtt" Name="IdCtt" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource> </TD></TR><TR><TD style="HEIGHT: 239px; TEXT-ALIGN: right">Local:</TD><TD style="WIDTH: 494px; HEIGHT: 239px" class="vermelhonormal">
                <asp:GridView id="grdCttEnd" runat="server" Width="100%" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" 
                    DataKeyNames="Cte_IdCtt,Cte_SeqEnd" DataSourceID="dtsCttEnd" 
                    OnSelectedIndexChanged="grdCttEnd_SelectedIndexChanged" PageSize="5" 
                    Font-Size="X-Small" SkinID="gridCRUD">
<Columns>
<asp:BoundField DataField="Cte_SeqEnd" HeaderText="Seq. End." ReadOnly="True" SortExpression="Cte_SeqEnd">
<ItemStyle Width="15%"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="local" HeaderText="Contratado Local" ReadOnly="True" SortExpression="local">
<ItemStyle Width="85%"></ItemStyle>
</asp:BoundField>
<asp:CommandField SelectText="Selecionar" ShowSelectButton="True" />
</Columns>

</asp:GridView> <asp:SqlDataSource id="dtsCttEnd" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:MedicallConnectionString %>" SelectCommand="ssAtz_CttEnd" SelectCommandType="StoredProcedure"><SelectParameters>
<asp:Parameter Name="Ctt_Nme" Type="String"></asp:Parameter>
<asp:ControlParameter ControlID="grdCtt" PropertyName="SelectedValue" Name="Cte_IdCtt" Type="Int64"></asp:ControlParameter>
<asp:Parameter Name="Cte_SeqEnd" Type="Byte"></asp:Parameter>
<asp:Parameter Name="Ctt_NmeRsm" Type="String"></asp:Parameter>
<asp:Parameter Name="Ctt_Doc" Type="String"></asp:Parameter>
</SelectParameters>
</asp:SqlDataSource>*</TD></TR><TR><TD colSpan=2 style="height: 18px"></TD></TR></TBODY></TABLE><IMG height=15 alt=" " src="../Images/spacer.gif" width=5 border=0 /></DIV><DIV><B>Informações da rede:</B> <TABLE><TBODY><TR><TD>ID:</TD><TD><asp:TextBox id="txtIdLcr" runat="server" CssClass="input3" Enabled="False"></asp:TextBox></TD></TR><TR><TD>Rede:</TD><TD class="vermelhonormal"><asp:DropDownList id="ddlRde" runat="server" CssClass="input2" DataSourceID="dtsRde" DataTextField="Rde_Nme" DataValueField="IdRde"></asp:DropDownList><asp:SqlDataSource id="dtsRde" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:MedicallConnectionString %>" SelectCommand="ssAtz_Rde" SelectCommandType="StoredProcedure"><SelectParameters>
<asp:Parameter Name="IdRde" Type="Int16"></asp:Parameter>
<asp:Parameter Name="Rde_Nme" Type="String"></asp:Parameter>
<asp:Parameter Name="Lcr_IdCtt"></asp:Parameter>
<asp:Parameter Name="Lcr_SeqEnd"></asp:Parameter>
</SelectParameters>
</asp:SqlDataSource> </TD></TR><TR><TD style="HEIGHT: 21px" align=center colSpan=2><asp:Button id="btnSave" onclick="btnSave_Click" runat="server" Text="Gravar" CssClass="input7"></asp:Button> &nbsp; <asp:Button id="btnCancel" onclick="btnCancel_Click" runat="server" Text="Cancelar" CssClass="input7"></asp:Button></TD></TR></TBODY></TABLE></DIV>
            <asp:Label id="lblMsg" runat="server" Text="* Campos obrigatórios em branco" 
                CssClass="erro" Visible="False" Width="271px"></asp:Label></asp:Panel> <BR />
            <asp:GridView id="grd" runat="server" Width="100%" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" 
                DataKeyNames="IdLcr,Lcr_IdRde,Lcr_IdCtt,Lcr_SeqEnd" DataSourceID="dts" 
                OnSelectedIndexChanged="grd_SelectedIndexChanged" PageSize="20" 
                Font-Size="X-Small" OnPageIndexChanging="grd_PageIndexChanging" 
                SkinID="gridCRUD">
<Columns>
<asp:BoundField DataField="IDLCR" HeaderText="ID" ReadOnly="True" InsertVisible="False" SortExpression="IDLCR">
<ItemStyle Width="10%"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="RDE_NME" HeaderText="Rede" SortExpression="RDE_NME">
<ItemStyle Width="20%"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="Lcr_SeqEnd" HeaderText="Seq. End." SortExpression="Lcr_SeqEnd">
<ItemStyle Width="10%"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="CTTLOCAL" HeaderText="Contratado/Local" ReadOnly="True" SortExpression="CTTLOCAL">
<ItemStyle Width="60%"></ItemStyle>
</asp:BoundField>
<asp:CommandField SelectText="Selecionar" ShowSelectButton="True" />
</Columns>

</asp:GridView> <asp:SqlDataSource id="dts" runat="server" CancelSelectOnNullParameter="False" ConnectionString="<%$ ConnectionStrings:MedicallConnectionString %>" InsertCommand="stAtz_Lcr" InsertCommandType="StoredProcedure" SelectCommand="ssAtz_Lcr" SelectCommandType="StoredProcedure" UpdateCommand="stAtz_Lcr" UpdateCommandType="StoredProcedure" DeleteCommand="delete from atz_lcr where idlcr = @idlcr"><SelectParameters>
<asp:Parameter Name="IdLcr" Type="Int32"></asp:Parameter>
<asp:Parameter Name="Ctt_Nme" Type="String"></asp:Parameter>
<asp:Parameter Name="Cte_IdCtt" Type="String"></asp:Parameter>
<asp:Parameter Name="Ctt_NmeRsm" Type="String"></asp:Parameter>
<asp:Parameter Name="Ctt_Doc" Type="String"></asp:Parameter>
</SelectParameters>
<DeleteParameters>
<asp:ControlParameter ControlID="txtIdLcr" PropertyName="Text" Name="idlcr"></asp:ControlParameter>
</DeleteParameters>
<UpdateParameters>
<asp:ControlParameter ControlID="txtIdLcr" PropertyName="Text" Name="IdLcr" Type="Int32"></asp:ControlParameter>
<asp:Parameter Name="Lcr_IdCtt" Type="Int64"></asp:Parameter>
<asp:Parameter Name="Lcr_SeqEnd" Type="Byte"></asp:Parameter>
<asp:ControlParameter ControlID="ddlRde" PropertyName="SelectedValue" Name="Lcr_IdRde" Type="Int16"></asp:ControlParameter>
</UpdateParameters>
<InsertParameters>
<asp:ControlParameter ControlID="txtIdLcr" PropertyName="Text" Name="IdLcr" Type="Int32"></asp:ControlParameter>
<asp:Parameter Name="Lcr_IdCtt" Type="Int64"></asp:Parameter>
<asp:Parameter Name="Lcr_SeqEnd" Type="Byte"></asp:Parameter>
<asp:ControlParameter ControlID="ddlRde" PropertyName="SelectedValue" Name="Lcr_IdRde" Type="Int16"></asp:ControlParameter>
</InsertParameters>
</asp:SqlDataSource> 
</contenttemplate>
    </asp:UpdatePanel>
    <!-- Fim do content principal -->
    
    
  
</asp:Content>


