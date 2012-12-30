<%@ Page Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" Inherits="Ngc_atzlcresp" Title="Contratado Local Rede Especialidade" Codebehind="atzlcresp.aspx.cs" %>

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
                                Contratado Local Rede Especialidade</h2>
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
<DIV id="botoes"><asp:Button id="btnNew" onclick="btnNew_Click" runat="server" CssClass="input7" Text="Novo"></asp:Button> <IMG height=5 alt=" " src="../Images/spacer.gif" width=5 border=0 /> <asp:Button id="btnEdit" onclick="btnEdit_Click" runat="server" CssClass="input7" Text="Alterar"></asp:Button> <IMG height=5 alt=" " src="../Images/spacer.gif" width=5 border=0 /> <asp:Button id="btnDel" onclick="btnDel_Click" runat="server" CssClass="input7" Text="Excluir"></asp:Button> 
    <asp:Label id="lblToolBar" runat="server" CssClass="erro" Width="271px"></asp:Label> 
<hr />
</DIV><img height=7 alt="" src="../Images/spacer.gif" width=5 border=0 /> <asp:Panel id="pnlPsq" runat="server"><B>Pesquisar: </B><TABLE><TBODY><TR><TD><asp:RadioButtonList id="rblTipAco" runat="server" CssClass="azulescuropequeno" RepeatDirection="Horizontal">
           <asp:ListItem Value="Cte_IdCtt">C&#243;digo</asp:ListItem>
           <asp:ListItem Value="Ctt_Nme" Selected="True">Nome</asp:ListItem>
           <asp:ListItem Value="Ctt_NmeRsm">Nome Fantasia</asp:ListItem>
           <asp:ListItem Value="Ctt_Doc">CNPJ</asp:ListItem>
        </asp:RadioButtonList> <asp:RequiredFieldValidator id="rqlTipoPesquisa" runat="server" 
                    ControlToValidate="rblTipAco" 
                    ErrorMessage="* Selecione um tipo de pesquisa acima" CssClass="erro"></asp:RequiredFieldValidator></TD></TR><TR><TD><asp:TextBox id="txtPsq" runat="server" CssClass="input2" Width="130px"></asp:TextBox> &nbsp; &nbsp;&nbsp; <asp:Button id="btnSearch" onclick="btnSearch_Click" runat="server" CssClass="input7" Text="Pesquisar" Width="100px"></asp:Button></TD></TR></TBODY></TABLE></asp:Panel> <IMG height=15 alt=" " src="../Images/spacer.gif" width=5 border=0 /> &nbsp;&nbsp;&nbsp; <asp:Panel id="pnlInf" runat="server" Width="100%"><DIV><IMG height=15 alt=" " src="../Images/spacer.gif" width=5 border=0 />&nbsp;</DIV><DIV><B>Especialidade:</B> <TABLE><TBODY><TR><TD>ID:</TD><TD style="WIDTH: 137px"><asp:TextBox id="txtIdLce" runat="server" CssClass="input3" Enabled="False"></asp:TextBox></TD></TR><TR><TD>Especialidade:</TD><TD style="WIDTH: 137px" class="vermelhonormal"><asp:DropDownList id="ddlEsp" runat="server" CssClass="input2" DataSourceID="dtsEsp" DataValueField="IdEsp" DataTextField="Esp_Dsc" AppendDataBoundItems="True"><asp:ListItem></asp:ListItem>
</asp:DropDownList><asp:SqlDataSource id="dtsEsp" runat="server" SelectCommand="SELECT [IdEsp], [Esp_Dsc] FROM [Atz_Esp] ORDER BY [Esp_Dsc]" ConnectionString="<%$ ConnectionStrings:MedicallConnectionString %>"></asp:SqlDataSource> </TD></TR><TR><TD>
    Tipo de Atendimento:</TD><TD style="WIDTH: 137px" class="vermelhonormal">
    <asp:RadioButtonList ID="rblTipAtd" runat="server" RepeatDirection="Horizontal">
        <asp:ListItem Value="E">Eletiva</asp:ListItem>
        <asp:ListItem Value="U">Urg&#234;ncia</asp:ListItem>
        <asp:ListItem Value="A">Ambos</asp:ListItem>
    </asp:RadioButtonList></TD></TR></TBODY></TABLE><BR /><STRONG>Local rede:</STRONG><BR /><TABLE width="100%"><TBODY><TR><TD style="HEIGHT: 21px" colSpan=2>Contratado:<asp:TextBox id="txtPsqCtt" runat="server" CssClass="input2"></asp:TextBox> <asp:Button id="btnSearchCtt" onclick="btnSearchCtt_Click" runat="server" CssClass="input7" Text="Pesquisar" Width="100px"></asp:Button> <cc1:FilteredTextBoxExtender id="ftePsqCtt" runat="server" TargetControlID="txtPsqCtt" FilterType="Numbers"></cc1:FilteredTextBoxExtender></TD></TR><TR><TD colSpan=2>
            <asp:GridView id="grdCtt" runat="server" Width="100%" Font-Size="X-Small" 
                PageSize="5" OnSelectedIndexChanged="grdCtt_SelectedIndexChanged" 
                DataSourceID="dtsCtt" DataKeyNames="Cte_IdCtt,Cte_SeqEnd" 
                AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True" 
                SkinID="gridCRUD">
<Columns>
<asp:BoundField DataField="Ctt_Nme" HeaderText="Nome do Contratado" SortExpression="Ctt_Nme">
<ItemStyle Width="35%"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="Cte_SeqEnd" HeaderText="Seq.End." ReadOnly="True" SortExpression="Cte_SeqEnd">
<ItemStyle Width="15%"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="local" HeaderText="Local" ReadOnly="True" SortExpression="local">
<ItemStyle Width="50%"></ItemStyle>
</asp:BoundField>
<asp:CommandField SelectText="Selecionar" ShowSelectButton="True" />
</Columns>

</asp:GridView>&nbsp;<BR /><asp:SqlDataSource id="dtsCtt" runat="server" SelectCommandType="StoredProcedure" SelectCommand="ssAtz_CttEnd" ConnectionString="<%$ ConnectionStrings:MedicallConnectionString %>" CancelSelectOnNullParameter="False"><SelectParameters>
<asp:Parameter Name="Ctt_Nme" Type="String"></asp:Parameter>
<asp:Parameter Name="Cte_IdCtt" Type="Int64"></asp:Parameter>
<asp:Parameter Name="Cte_SeqEnd" Type="Byte"></asp:Parameter>
<asp:Parameter Name="Ctt_NmeRsm" Type="String"></asp:Parameter>
<asp:Parameter Name="Ctt_Doc" Type="String"></asp:Parameter>
</SelectParameters>
</asp:SqlDataSource><asp:GridView id="grdCttEnd" runat="server" Width="100%" 
                Font-Size="X-Small" PageSize="5" DataKeyNames="IdLcr" 
                AutoGenerateColumns="False" SkinID="gridCRUD">
<Columns>
<asp:TemplateField><EditItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" />
                                
</EditItemTemplate>
<HeaderTemplate>
                                    <asp:CheckBox ID="chkSelectAll" runat="server" AutoPostBack="True" OnCheckedChanged="chkSelectAll_CheckedChanged" />
                                
</HeaderTemplate>
<ItemTemplate>
                                    <asp:CheckBox ID="chkSelect" runat="server" />
                                
</ItemTemplate>

<ItemStyle Width="15px"></ItemStyle>
</asp:TemplateField>
<asp:BoundField DataField="IdLcr" HeaderText="ID">
<ItemStyle Width="15%"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="Rde_Nme" HeaderText="Rede">
<ItemStyle Width="25%"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="Ctt_LocRde" HeaderText="Contratado Local" SortExpression="Ctt_LocRde">
<ItemStyle Width="60%"></ItemStyle>
</asp:BoundField>
</Columns>

</asp:GridView><BR />* </TD></TR><TR><TD style="TEXT-ALIGN: center" colSpan=2><asp:Button id="btnSave" onclick="btnSave_Click" runat="server" CssClass="input7" Text="Gravar"></asp:Button> &nbsp; <asp:Button id="btnCancel" onclick="btnCancel_Click" runat="server" CssClass="input7" Text="Cancelar"></asp:Button></TD></TR></TBODY></TABLE><BR /></DIV>
            <asp:Label id="lblMsg" runat="server" CssClass="erro" 
                Text="* Campos obrigatórios em branco" Width="271px" Visible="False"></asp:Label></asp:Panel> <BR /><!-- 
    
    <asp:CommandField ButtonType="Image" SelectText="" ShowSelectButton="True" SelectImageUrl="~/Img/btn/btnPqnAdicionar2.gif" />
    --><asp:GridView id="grd" runat="server" Width="100%" 
                OnPageIndexChanging="grd_PageIndexChanging" Font-Size="X-Small" PageSize="20" 
                OnSelectedIndexChanged="grd_SelectedIndexChanged" DataSourceID="dts" 
                DataKeyNames="IdLcr,IdCtt,Cte_SeqEnd,Lce_IdEsp,Lce_TipAtd" 
                AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True" 
                SkinID="gridCRUD">
<Columns>
<asp:BoundField DataField="IdLce" HeaderText="ID" InsertVisible="False" SortExpression="IdLce"></asp:BoundField>
<asp:BoundField DataField="Esp_Dsc" HeaderText="Especialidade" ReadOnly="True" SortExpression="Esp_Dsc">
<ItemStyle Width="20%"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="Rde_Nme" HeaderText="Rede" SortExpression="Rde_Nme">
<ItemStyle Width="20%"></ItemStyle>
</asp:BoundField>
    <asp:BoundField DataField="Lce_TipAtdDsc" HeaderText="Tipo Atendimento" SortExpression="Lce_TipAtdDsc" />
<asp:BoundField DataField="IdCtt" HeaderText="Matr&#237;cula" SortExpression="IdCtt">
<ItemStyle Width="10%"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="CttLocal" HeaderText="Local" ReadOnly="True" SortExpression="CttLocal">
<ItemStyle Width="40%"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="Cte_SeqEnd" HeaderText="Seq.End." SortExpression="Cte_SeqEnd">
<ItemStyle Width="10%"></ItemStyle>
</asp:BoundField>
<asp:CommandField SelectText="Selecionar" ShowSelectButton="True" />
</Columns>

</asp:GridView> <asp:SqlDataSource id="dts" runat="server" DeleteCommand="delete from atz_lcresp where idlce = @idlce" UpdateCommandType="StoredProcedure" UpdateCommand="stAtz_Lce" SelectCommandType="StoredProcedure" SelectCommand="ssAtz_Lce" InsertCommandType="StoredProcedure" InsertCommand="stAtz_Lce" ConnectionString="<%$ ConnectionStrings:MedicallConnectionString %>" CancelSelectOnNullParameter="False"><SelectParameters>
<asp:Parameter Name="Ctt_Nme" Type="String"></asp:Parameter>
<asp:Parameter Name="Cte_IdCtt" Type="String"></asp:Parameter>
<asp:Parameter Name="Ctt_NmeRsm" Type="String"></asp:Parameter>
<asp:Parameter Name="Ctt_Doc" Type="String"></asp:Parameter>
</SelectParameters>
<DeleteParameters>
<asp:ControlParameter ControlID="txtIdLce" PropertyName="Text" Name="idlce"></asp:ControlParameter>
</DeleteParameters>
<UpdateParameters>
<asp:ControlParameter ControlID="txtIdLce" PropertyName="Text" Name="IdLce" Type="Int32"></asp:ControlParameter>
<asp:ControlParameter ControlID="grdCttEnd" PropertyName="SelectedValue" Name="Lce_IdLcr" Type="Int32"></asp:ControlParameter>
<asp:ControlParameter ControlID="ddlEsp" PropertyName="SelectedValue" Name="Lce_IdEsp" Type="Int16"></asp:ControlParameter>
    <asp:ControlParameter ControlID="rblTipAtd" Name="Lce_TipAtd" PropertyName="SelectedValue"
        Type="String" />
</UpdateParameters>
<InsertParameters>
<asp:ControlParameter ControlID="txtIdLce" PropertyName="Text" Name="IdLce" Type="Int32"></asp:ControlParameter>
<asp:ControlParameter ControlID="grdCttEnd" PropertyName="SelectedValue" Name="Lce_IdLcr" Type="Int32"></asp:ControlParameter>
<asp:ControlParameter ControlID="ddlEsp" PropertyName="SelectedValue" Name="Lce_IdEsp" Type="Int16"></asp:ControlParameter>
    <asp:ControlParameter ControlID="rblTipAtd" Name="Lce_TipAtd" PropertyName="SelectedValue"
        Type="String" />
</InsertParameters>
</asp:SqlDataSource> 
</contenttemplate>
    </asp:UpdatePanel>
    <br />
    &nbsp;<!-- Fim do content principal -->
    
    
  
</asp:Content>


