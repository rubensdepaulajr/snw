<%@ Page Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" Theme="Standard" Inherits="Mpv_cidconexe" Title="CID10 em Consultas Executadas" Codebehind="cidconexe.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
       
     <asp:UpdatePanel ID="UpdatePanel2" runat="server">
     <ContentTemplate>
<DIV style="PADDING-RIGHT: 0px; PADDING-LEFT: 20px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px" bgcolor="#f4f4f4"><TABLE cellSpacing=0 cellPadding=0 width="100%" align=left border=0><TBODY><TR><TD style="WIDTH: 9px" align=left><IMG height=37 alt="" src="../Images/tit_left.gif" width=9 /></TD><TD bgColor=#f4f4f4><H2>
    PESQUISA CID EM CONSULTAS
</H2></TD><TD style="WIDTH: 9px" align=left><IMG height=37 alt="" src="../Images/tit_right.gif" width=9 /></TD></TR></TBODY></TABLE></DIV>
<DIV style="PADDING-RIGHT: 0px; PADDING-LEFT: 20px; PADDING-BOTTOM: 0px; PADDING-TOP: 40px">&nbsp;</DIV>
<TABLE cellSpacing=0 cellPadding=0 border=0><TBODY><TR><TD colSpan=3 style="PADDING-RIGHT: 0px; PADDING-LEFT: 20px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px"><asp:Image id="ImgErro" runat="server" Visible="False" ImageAlign="AbsMiddle" ImageUrl="~/Images/ico_alert.gif" Height="25px" Width="25px"></asp:Image> <asp:Label id="lblErro" runat="server" CssClass="erro"></asp:Label></TD></TR><TR><TD colSpan=3></TD></TR><TR><TD style="PADDING-RIGHT: 0px; PADDING-LEFT: 40px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px; height: 35px;" vAlign=middle colSpan=3><STRONG>PERÍODO</STRONG></TD></TR><TR><TD align=right style="width: 150px; height: 14px">
    Data inicial:</TD><TD style="WIDTH: 5px; height: 14px;"></TD><TD style="WIDTH: 623px; height: 14px;" align=left><SPAN class="cinza-escuro">
    <asp:TextBox ID="txtDatIni" runat="server" CssClass="campo"></asp:TextBox></SPAN></TD></TR><TR><TD colSpan=3 height=10></TD></TR><TR><TD style="HEIGHT: 14px; width: 150px;" align=right>
        Data final:</TD><TD style="WIDTH: 5px; HEIGHT: 14px"></TD><TD style="HEIGHT: 14px" align=left colSpan=2><SPAN class="cinza-claro">
    <asp:TextBox ID="txtDatFim" runat="server" CssClass="campo"></asp:TextBox></SPAN></TD></TR><TR><TD colSpan=3 height=10></TD></TR>
    <tr>
        <TD style="HEIGHT: 14px; width: 150px;" align=right>
        </td>
        <TD style="WIDTH: 5px; HEIGHT: 14px">
        </td>
        <TD style="HEIGHT: 14px" align=left colSpan=2>
            <SPAN class="cinza-claro"><asp:ImageButton id="ibtBuscar" runat="server" ImageUrl="~/Images/bt_buscar.gif" OnClick="imgBtnAdicionar_Click"></asp:ImageButton></span></td>
    </tr>
    <TR><TD colSpan=3 style="height: 33px"><BR /></TD></TR><TR><TD style="PADDING-RIGHT: 0px; PADDING-LEFT: 40px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px" vAlign=middle colSpan=3 height=35><STRONG>CONSULTAS EXECUTADAS</STRONG></TD></TR><TR><TD style="PADDING-RIGHT: 0px; PADDING-LEFT: 60px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px" colSpan=3>
        &nbsp;<asp:GridView ID="grd" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" CssClass="grid-view-left" DataSourceID="dts" OnDataBound="grd_DataBound"
            OnRowCreated="gvHover_RowCreated" PageSize="15" Width="644px">
            <Columns>
                <asp:BoundField DataField="Gpd_DatRel" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Realiza&#231;&#227;o"
                    SortExpression="Gpd_DatRel" />
                <asp:BoundField DataField="Bnf_Mtr" HeaderText="Matr&#237;cula" SortExpression="Bnf_Mtr" />
                <asp:BoundField DataField="Bnf_Nme" HeaderText="Benefici&#225;rio" SortExpression="Bnf_Nme" />
                <asp:BoundField DataField="Bnf_Idd" HeaderText="Idade" SortExpression="Bnf_Idd" />
                <asp:BoundField DataField="Esp_Dsc" HeaderText="Especialidade" SortExpression="Esp_Dsc" />
                <asp:BoundField DataField="IdCid" HeaderText="CID" ReadOnly="True" SortExpression="IdCid" />
            </Columns>
            <PagerTemplate>
                <div align="center" height="20">
                    <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument="First" ImageUrl="~/Images/seta1_1_on.gif"
                        OnCommand="Paginategrd" />
                    &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CommandArgument="Prev" ImageUrl="~/Images/seta1_2_on.gif"
                        OnCommand="Paginategrd" />&#160;Página 
                    <asp:DropDownList ID="ddlPages" runat="server" AutoPostBack="True" CssClass="campo"
                        OnSelectedIndexChanged="ddlPages_SelectedIndexChanged">
                    </asp:DropDownList>&nbsp;de 
                    <asp:Label ID="lblPageCount" runat="server"></asp:Label>
                    <asp:ImageButton ID="ImageButton3" runat="server" CommandArgument="Next" ImageUrl="~/Images/seta2_1_on.gif"
                        OnCommand="Paginategrd" />
                    &nbsp;<asp:ImageButton ID="ImageButton4" runat="server" CommandArgument="Last" ImageUrl="~/Images/seta2_2_on.gif"
                        OnCommand="Paginategrd" /></div>
            </PagerTemplate>
        </asp:GridView>
        <asp:SqlDataSource id="dts" runat="server" SelectCommandType="StoredProcedure" SelectCommand="ssMpv_CidCon" ConnectionString="<%$ ConnectionStrings:AppConnectionString %>">
                                                    <SelectParameters>
                                                        <asp:Parameter DbType="DateTime" Name="DatIni" />
                                                        <asp:Parameter DbType="DateTime" Name="DatFim" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource> </TD></TR><TR><TD vAlign=top colSpan=3 height=35><BR /></TD></TR></TBODY></TABLE><DIV>

</DIV>
</ContentTemplate>
        </asp:UpdatePanel>
   
   
   
</asp:Content>

