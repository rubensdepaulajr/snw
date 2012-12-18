<%@ Page Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" CodeFile="execonqtd.aspx.cs" Theme="Standard" Inherits="Mpv_execonqtd" Title="CID10 em Consultas Executadas" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
       
     <asp:UpdatePanel ID="UpdatePanel2" runat="server">
     <ContentTemplate>
<DIV style="PADDING-RIGHT: 0px; PADDING-LEFT: 20px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px" bgcolor="#f4f4f4"><TABLE cellSpacing=0 cellPadding=0 width="100%" align=left border=0><TBODY><TR><TD style="WIDTH: 9px" align=left><IMG height=37 alt="" src="../Images/tit_left.gif" width=9 /></TD><TD bgColor=#f4f4f4><H2>
    PESQUISA CID EM CONSULTAS
</H2></TD><TD style="WIDTH: 9px" align=left><IMG height=37 alt="" src="../Images/tit_right.gif" width=9 /></TD></TR></TBODY></TABLE></DIV><DIV style="PADDING-RIGHT: 0px; PADDING-LEFT: 20px; PADDING-BOTTOM: 0px; PADDING-TOP: 40px">&nbsp;</DIV><TABLE cellSpacing=0 cellPadding=0 border=0><TBODY><TR><TD colSpan=3 style="PADDING-RIGHT: 0px; PADDING-LEFT: 20px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px"><asp:Image id="ImgErro" runat="server" Visible="False" ImageAlign="AbsMiddle" ImageUrl="~/Images/ico_alert.gif" Height="25px" Width="25px"></asp:Image> <asp:Label id="lblErro" runat="server" CssClass="erro"></asp:Label></TD></TR><TR><TD colSpan=3></TD></TR><TR><TD style="PADDING-RIGHT: 0px; PADDING-LEFT: 40px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px" vAlign=middle colSpan=3 height=35><STRONG>CONSULTAS EXECUTADAS POR BENEFICIÁRIO NO PERÍODO</STRONG></TD></TR><TR><TD style="PADDING-RIGHT: 0px; PADDING-LEFT: 60px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px" colSpan=3>
        &nbsp;<asp:GridView ID="grd" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" CssClass="grid-view-left" DataSourceID="dts" OnDataBound="grd_DataBound"
            OnRowCreated="gvHover_RowCreated" PageSize="15" Width="644px">
            <Columns>
                <asp:BoundField DataField="Per_Exe" HeaderText="Per&#237;odo" SortExpression="Per_Exe" />
                <asp:BoundField DataField="Bnf_Mtr" HeaderText="Matr&#237;cula" SortExpression="Bnf_Mtr" />
                <asp:BoundField DataField="Bnf_Nme" HeaderText="Benefici&#225;rio" SortExpression="Bnf_Nme" />
                <asp:BoundField DataField="Qtd_Con" HeaderText="Qtd." SortExpression="Qtd_Con" />
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
        <asp:SqlDataSource id="dts" runat="server" SelectCommand="SELECT Per_Exe, IdBnf, Bnf_Mtr, Bnf_Nme, Qtd_Con &#13;&#10;FROM dbo.fxMpv_ExeConQtd(@Dat_Ref) &#13;&#10;ORDER BY Qtd_Con DESC" ConnectionString="<%$ ConnectionStrings:AppConnectionString %>">
                                                    <SelectParameters>
                                                        <asp:Parameter Name="Dat_Ref" Type="DateTime" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource> </TD></TR><TR><TD vAlign=top colSpan=3 height=35><BR /></TD></TR></TBODY></TABLE><DIV><%-- inicio do bloco do popup --%>
                                                    &nbsp;
                                                </DIV>
</ContentTemplate>
        </asp:UpdatePanel>
   
   
   
</asp:Content>

