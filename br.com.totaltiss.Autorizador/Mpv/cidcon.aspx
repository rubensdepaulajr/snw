<%@ Page Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" Theme="Standard" Inherits="Mpv_cidcon" Title="CID10 consulta" Codebehind="cidcon.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
       
     <asp:UpdatePanel ID="UpdatePanel2" runat="server">
     <ContentTemplate>
<DIV style="PADDING-RIGHT: 0px; PADDING-LEFT: 20px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px" bgcolor="#f4f4f4"><TABLE cellSpacing=0 cellPadding=0 width="100%" align=left border=0><TBODY><TR><TD style="WIDTH: 9px" align=left><IMG height=37 alt="" src="../Images/tit_left.gif" width=9 /></TD><TD bgColor=#f4f4f4><H2>
    CID10 CONSULTA</H2></TD><TD style="WIDTH: 9px" align=left><IMG height=37 alt="" src="../Images/tit_right.gif" width=9 /></TD></TR></TBODY></TABLE></DIV><DIV style="PADDING-RIGHT: 0px; PADDING-LEFT: 20px; PADDING-BOTTOM: 0px; PADDING-TOP: 40px">&nbsp;</DIV><TABLE cellSpacing=0 cellPadding=0 border=0><TBODY><TR><TD colSpan=3 style="PADDING-RIGHT: 0px; PADDING-LEFT: 20px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px"><asp:Image id="imgErr" runat="server" Visible="False" ImageAlign="AbsMiddle" ImageUrl="~/Images/ico_alert.gif" Height="25px" Width="25px"></asp:Image> <asp:Label id="lblErr" runat="server" CssClass="erro"></asp:Label></TD></TR><TR><TD colSpan=3></TD></TR><TR><TD vAlign=middle align=right style="width: 150px; height: 24px;">
    CID:</TD><TD style="WIDTH: 5px; height: 24px;"></TD><TD style="WIDTH: 623px; height: 24px;" align=left valign="middle"><asp:TextBox id="txtIdCid" runat="server" CssClass="campo"></asp:TextBox> &nbsp;<asp:ImageButton id="btnAddCid" onclick="imgBtnAdicionar_Click" runat="server" ImageUrl="~/Images/bt_adicionar.gif"></asp:ImageButton> <asp:Button id="lbtPsqCid" onclick="btnPsq_Click" runat="server" CssClass="linkbutton" Font-Underline="False" Text="Buscar CID"></asp:Button> <asp:Image id="Image1" runat="server" ImageUrl="~/Images/ico_ajuda_campos.gif"></asp:Image> </TD></TR><TR><TD colSpan=3><BR />
    <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="modalBackground"
        DropShadow="true" PopupControlID="ModalPanel" TargetControlID="lbtPsqCid">
    </cc1:ModalPopupExtender>
</TD></TR><TR><TD style="PADDING-RIGHT: 0px; PADDING-LEFT: 40px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px" vAlign=middle colSpan=3 height=35><STRONG>CID10 MONITORADOS</STRONG></TD></TR><TR><TD style="PADDING-RIGHT: 0px; PADDING-LEFT: 60px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px" colSpan=3>
    &nbsp;<asp:GridView ID="grdCID" runat="server" AutoGenerateColumns="False" BorderStyle="None"
        CssClass="grid-view-left" DataSourceID="dts" GridLines="None" OnSelectedIndexChanged="grdCID_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="IdCid" HeaderText="CID" />
            <asp:BoundField DataField="Cid_Dsc" HeaderText="Descri&#231;&#227;o" />
            <asp:CommandField ButtonType="Button" SelectText="Remover" ShowSelectButton="True">
                <ControlStyle CssClass="linkbutton" />
            </asp:CommandField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource id="dts" runat="server" SelectCommandType="StoredProcedure" SelectCommand="ssAtz_Cid" ConnectionString="<%$ ConnectionStrings:AppConnectionString %>" CancelSelectOnNullParameter="False" DeleteCommand="UPDATE dbo.Atz_Cid&#13;&#10;SET Cid_Aud = 0&#13;&#10;WHERE IdCid = @IdCid" InsertCommand="UPDATE dbo.Atz_Cid&#13;&#10;SET Cid_Aud = 1&#13;&#10;WHERE IdCid = @IdCid">
                                                    <SelectParameters>
                                                        <asp:Parameter Name="IdCid" Type="String" />
                                                        <asp:Parameter Name="Cid_Cod" Type="String" />
                                                        <asp:Parameter Name="Cid_Dsc" Type="String" />
                                                        <asp:Parameter DefaultValue="True" Name="Cid_Aud" Type="Boolean" />
                                                    </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="IdCid" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="IdCid" />
        </InsertParameters>
                                                </asp:SqlDataSource> </TD></TR><TR><TD vAlign=top colSpan=3 height=35><BR /></TD></TR><TR><TD style="PADDING-RIGHT: 0px; PADDING-LEFT: 40px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px" vAlign=top colSpan=3 height=35><asp:ImageButton id="btnPgaIni" onclick="btnPgaIni_Click" runat="server" ImageUrl="~/Images/bt_home.gif"></asp:ImageButton></TD></TR></TBODY></TABLE><DIV><%-- inicio do bloco do popup --%>
                                                    &nbsp;
                                                    <%-- fim do bloco do popup --%></DIV>
</ContentTemplate>
        </asp:UpdatePanel>
    <asp:Panel ID="ModalPanel" runat="server" BackColor="White" CssClass="modalPopup"
        Direction="LeftToRight" Width="830px">
        <%--<asp:Panel ID="pnlClient" runat="server" CssClass="modalPopup" Width="830px" BackColor="White">--%>
        <%--<table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">--%>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table style="border-right: #ce5c09 thin double; border-top: #ce5c09 thin double;
                    border-left: #ce5c09 thin double; width: 100%; border-bottom: #ce5c09 thin double;
                    background-color: #ffffff">
                    <tbody>
                        <tr>
                            <td style="width: 937px; height: 45px">
                                <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tbody>
                                        <tr>
                                            <td align="left" style="width: 9px; height: 37px">
                                                <img alt="" height="37" src="../Images/tit_left.gif" width="9" /></td>
                                            <td bgcolor="#f4f4f4" style="height: 37px">
                                                <h2>
                                                    Busca de CID</h2>
                                            </td>
                                            <td align="left" style="width: 9px; height: 37px">
                                                <img alt="" height="37" src="../Images/tit_right.gif" width="9" /></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td height="15" style="width: 937px">
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="padding-right: 10px; padding-left: 0px; padding-bottom: 0px;
                                width: 937px; padding-top: 0px; height: 47px" valign="middle">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tbody>
                                        <tr>
                                            <td align="right" style="height: 22px">
                                                Descrição:&nbsp;</td>
                                            <td align="right" style="width: 140px; height: 22px">
                                                <asp:TextBox ID="txtBnf_NmePop" runat="server" CssClass="campo" Width="140px"></asp:TextBox></td>
                                            <td align="left" style="height: 22px" valign="top" width="78">
                                            </td>
                                            <td align="right" style="width: 56px; height: 22px">
                                                Código:&nbsp;</td>
                                            <td align="right" style="height: 22px" width="140">
                                                <asp:TextBox ID="txtBnf_MtrPop" runat="server" Width="140px"></asp:TextBox></td>
                                            <td align="left" style="padding-right: 0px; padding-left: 5px; padding-bottom: 0px;
                                                padding-top: 0px; height: 22px" valign="top" width="78">
                                                <asp:ImageButton ID="btnBuscar" runat="server" ImageUrl="../Images/bt_buscar.gif"
                                                    OnClick="btnBuscar_Click" /></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <br />
                            </td>
                        </tr>
                        <!-- REGISTROS -->
                        <tr>
                            <td align="center" style="padding-right: 10px; padding-left: 0px; padding-bottom: 0px;
                                width: 937px; padding-top: 0px; height: 44px" valign="middle">
                                <asp:GridView ID="grd" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
                                    CssClass="grid-view" DataKeyNames="IdCid,Cid_Dsc" DataSourceID="dtsCID" OnDataBound="grd_DataBound"
                                    OnRowCreated="gvHover_RowCreated" OnSelectedIndexChanged="grd_SelectedIndexChanged"
                                    OnSorted="grd_Sorted" Width="644px">
                                    <Columns>
                                        <asp:BoundField DataField="IdCid" HeaderText="CID" SortExpression="IdCid">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:ButtonField CommandName="Select" DataTextField="Cid_Dsc" HeaderText="Descri&#231;&#227;o"
                                            SortExpression="Cid_Dsc" Text="Button">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:ButtonField>
                                    </Columns>
                                    <PagerTemplate>
                                        <div align="center" height="20">
                                            <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument="First" ImageUrl="~/Images/seta1_1_on.gif"
                                                OnCommand="Paginategrd" />
                                            &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CommandArgument="Prev" ImageUrl="~/Images/seta1_2_on.gif"
                                                OnCommand="Paginategrd" />
                                            Página
                                            <asp:DropDownList ID="ddlPages" runat="server" AutoPostBack="True" CssClass="campo"
                                                OnSelectedIndexChanged="ddlPages_SelectedIndexChanged">
                                            </asp:DropDownList>
                                            de
                                            <asp:Label ID="lblPageCount" runat="server"></asp:Label>
                                            &nbsp;<asp:ImageButton ID="ImageButton3" runat="server" CommandArgument="Next" ImageUrl="~/Images/seta2_1_on.gif"
                                                OnCommand="Paginategrd" />
                                            &nbsp;<asp:ImageButton ID="ImageButton4" runat="server" CommandArgument="Last" ImageUrl="~/Images/seta2_2_on.gif"
                                                OnCommand="Paginategrd" /></div>
                                    </PagerTemplate>
                                </asp:GridView>
                                <asp:SqlDataSource ID="dtsCID" runat="server" CancelSelectOnNullParameter="False"
                                    ConnectionString="<%$ ConnectionStrings:MedicallConnectionString %>" SelectCommand="ssAtz_Cid"
                                    SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:Parameter Name="IdCid" Type="String" />
                                        <asp:Parameter Name="Cid_Cod" Type="String" />
                                        <asp:Parameter Name="Cid_Dsc" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:Label ID="lblEmptyGrid" runat="server"></asp:Label>
                                <h2 align="right">
                                    &nbsp;<asp:ImageButton ID="btn_fechar" runat="server" ImageUrl="~/Images/bt_fecha.gif"
                                        OnClick="btn_fechar_Click" /></h2>
                            </td>
                        </tr>
                        <!-- ============================= --><!-- PAGINAÇÃO -->
                    </tbody>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
   
   
   
</asp:Content>

