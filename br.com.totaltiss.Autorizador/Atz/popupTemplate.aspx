<%@ Page Language="C#" AutoEventWireup="true" Theme="Standard" Inherits="Atz_popupTemplate" Codebehind="popupTemplate.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
<link href="../estilo.css" rel="stylesheet" type="text/css" />
    <title>Popuptemplate</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
       <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
        campo de teste <asp:TextBox ID="txtTeste" runat="server" CssClass="campo"></asp:TextBox>
                <br />
                campo de teste2
                <asp:TextBox ID="txtTeste2" runat="server" CssClass="campo"></asp:TextBox>
                &nbsp;
    </ContentTemplate>
    </asp:UpdatePanel>
    <br />
    <h2>
        
                <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="modalBackground"
                    DropShadow="true" PopupControlID="ModalPanel"
                    TargetControlID="btn1">
                </cc1:ModalPopupExtender>
                &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
                <asp:Panel ID="ModalPanel" runat="server" CssClass="modalPopup" 
            Width="830px" BackColor="White" Direction="LeftToRight">
                    <%--<asp:Panel ID="pnlClient" runat="server" CssClass="modalPopup" Width="830px" BackColor="White">--%>
            <%--<table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">--%>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
            <table style="border-right: #ce5c09 thin double; border-top: #ce5c09 thin double;
                border-left: #ce5c09 thin double; width: 100%; border-bottom: #ce5c09 thin double;
                background-color: #ffffff">
                <tr>
                    <td style="width: 937px; height: 45px;">
                        <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td align="left" style="width: 9px">
                                    <img alt="" height="37" src="../Images/tit_left.gif" width="9" /></td>
                                <td bgcolor="#f4f4f4">
                                    <h2>
                                        Busca de Beneficiário</h2>
                                </td>
                                <td align="left" style="width: 9px">
                                    <img alt="" height="37" src="../Images/tit_right.gif" width="9" /></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td height="15" style="width: 937px">
                    </td>
                </tr>
                <tr>
                    <td align="center" style="padding-right: 10px; padding-left: 0px; padding-bottom: 0px;
                        width: 937px; padding-top: 0px; height: 47px;" valign="middle">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="right" style="height: 22px">
                                    Nome:&nbsp;</td>
                                <td align="right" style="height: 22px; width: 140px;">
                                    <asp:TextBox ID="txtBnf_Nme" runat="server" CssClass="campo" Width="140px"></asp:TextBox></td>
                                <td align="left" style="height: 22px" valign="top" width="78">
                                </td>
                                <td align="right" style="height: 22px">
                                    Matrícula:&nbsp;</td>
                                <td align="right" style="height: 22px" width="140">
                                    <asp:TextBox ID="txtBnf_Mtr" runat="server" Width="140px"></asp:TextBox></td>
                                <td align="left" style="padding-right: 0px; padding-left: 5px; padding-bottom: 0px;
                                    padding-top: 0px; height: 22px" valign="top" width="78">
                                    <asp:ImageButton ID="btnBuscar" runat="server" ImageUrl="../Images/bt_buscar.gif" OnClick="btnBuscar_Click" /></td>
                            </tr>
                        </table>
                        <br />
                    </td>
                </tr>
                <!-- REGISTROS -->
                <tr>
                    <td align="center" style="padding-right: 10px; padding-left: 0px; padding-bottom: 0px;
                        width: 937px; padding-top: 0px; height: 47px" valign="middle">
               <asp:GridView ID="grd" runat="server" AllowPaging="True"  
                OnRowCreated="gvHover_RowCreated" AutoGenerateColumns="False" 
                
                DataKeyNames="IdBnf" DataSourceID="dtsBnf"
                Width="644px" CssClass="grid-view" 
                ondatabound="grd_DataBound" onselectedindexchanged="grd_SelectedIndexChanged">
               
                
                    <Columns>
		                                <asp:CommandField ShowSelectButton="True" SelectText="Selecione" />
		                                <asp:BoundField DataField="Bnf_Mtr" HeaderText="Matr&#237;cula" SortExpression="Bnf_Mtr" />
		                                <asp:BoundField DataField="Bnf_Nme" HeaderText="Nome do Beneficiario" />
                           
                
                </Columns><PagerTemplate><div height="20"><asp:ImageButton ID="ImageButton1" runat="server"
                ImageUrl="~/Images/seta1_1_on.gif" CommandArgument="First" oncommand="Paginategrd" />&#160;&nbsp;<asp:ImageButton ID="ImageButton2" runat="server"
            ImageUrl="~/Images/seta1_2_on.gif"  CommandArgument="Prev" oncommand="Paginategrd" />&#160;Página <asp:DropDownList ID="ddlPages" runat="server" CssClass="campo"
                AutoPostBack="True" onselectedindexchanged="ddlPages_SelectedIndexChanged">
                </asp:DropDownList>&nbsp;de <asp:Label ID="lblPageCount"
                runat="server"></asp:Label> &nbsp;<asp:ImageButton ID="ImageButton3" runat="server"
                ImageUrl="~/Images/seta2_1_on.gif"  CommandArgument="Next" oncommand="Paginategrd" />&#160;&nbsp;<asp:ImageButton ID="ImageButton4" runat="server"
                ImageUrl="~/Images/seta2_2_on.gif"  CommandArgument="Last" oncommand="Paginategrd" /></div>
                </PagerTemplate>
               </asp:GridView>
               
                        
                        
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" CancelSelectOnNullParameter="False"
                            ConnectionString="<%$ ConnectionStrings:MedicallConnectionString %>" SelectCommand="ssAtz_Bnf"
                            SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:Parameter Name="Bnf_Mtr" Type="String" />
                                <asp:Parameter Name="Bnf_Nme" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        
                        <h2 align=right>&nbsp;<asp:ImageButton ID="btn_fechar" runat="server" 
                                ImageUrl="~/Images/bt_fecha.gif" onclick="btn_fechar_Click" /></h2>
                    </td>
                </tr>
                <!-- ============================= -->
                <!-- PAGINAÇÃO -->
            </table>
              </ContentTemplate>
        </asp:UpdatePanel>
      <%--  </asp:Panel>--%></asp:Panel>
                <br />
                <asp:SqlDataSource ID="dtsBnf" runat="server" 
                    CancelSelectOnNullParameter="False" 
                    ConnectionString="<%$ ConnectionStrings:MedicallConnectionString %>" 
                    SelectCommand="ssAtz_Bnf" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter Name="Bnf_Mtr" Type="String" />
                        <asp:Parameter Name="Bnf_Nme" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:HiddenField ID="hdfIdBnf" runat="server" />
                <br />
                <br />
                <br />
                <asp:Button ID="btn1" runat="server" Text="Popup" 
            CssClass="linkbutton" />
                <br />
                <br />
          
        &nbsp;</h2>
    
    
    
    </div>
    </form>
</body>
</html>
