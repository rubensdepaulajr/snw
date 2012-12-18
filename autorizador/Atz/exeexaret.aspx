<%@ Page Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" CodeFile="exeexaret.aspx.cs" Theme="Standard"  Inherits="Atz_exeexaret" Title="Execução de SADT - Retorno" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <%-- (F5)--%>
    <script type="text/jscript">
        function checkKeyCode(evt) {

            var evt = (evt) ? evt : ((event) ? event : null);
            var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null);
            if (event.keyCode == 116) {
                evt.keyCode = 0;
                return false
            }
        }
        document.onkeydown = checkKeyCode;
    </script>
    <%-- (rigth mouse)--%>
    <script type="text/jscript">

                function Disable() {
                    if (event.button == 2) {
                        alert("Atenção utilize somente os botões para navegação no sistema!")
                    }
                }
                document.onmousedown = Disable; 
    </script> 

      <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td style="width: 1002px">
                <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td align="left" width="9">
                            <img alt="" height="37" src="../Images/tit_left.gif" width="9" /></td>
                        <td bgcolor="#f4f4f4">
                            <h2>
                                Execução de SADT</h2>
                        </td>
                        <td align="left" width="9">
                            <img alt="" height="37" src="../Images/tit_right.gif" width="9" /></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td height="15" style="width: 1002px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 1002px; height: 27px;" valign="middle">
                <span class="erro">
                    <asp:Image ID="imgMsg" runat="server" ImageUrl="../Images/ico_alert.gif" Visible="False" />
                    <asp:Label ID="lblMsg" runat="server"></asp:Label>&nbsp;</span></td>
        </tr>
        <tr>
            <td align="left" style="width: 1002px" valign="top">
                <!-- SOLICITAÇÃO AUTORIZADA -->
                <br />
                <br />
                <asp:Panel ID="pnlAtz" runat="server">
                <table align="center" border="0" cellpadding="20" cellspacing="0" width="95%">
                    <tr bgcolor="#f4f4f4">
                        <td width="1%" style="height: 77px">
                            <table border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="height: 23px" valign="top">
                                        <img alt="" height="23" src="../Images/ico_autorizada.gif" style="float: left" width="25" />
                                        &nbsp;</td>
                                    <td style="height: 23px">
                                        <strong>
                                        EXECUÇÃO AUTORIZADA<br /><br />
                                        Senha:
                                        <asp:Label ID="lblSnh" runat="server" Text=""></asp:Label> </strong>
                                        <asp:GridView ID="grdSolAut" runat="server" AutoGenerateColumns="False" 
                                            DataSourceID="dtsGiaAut" GridLines="None">
                                            <Columns>
                                                <asp:BoundField DataField="Pdm_Cod" />
                                                <asp:TemplateField>
                                                    <ItemStyle Width="5px" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="Pdm_DscRsm" />
                                            </Columns>
                                        </asp:GridView>
                                  
                                         <asp:SqlDataSource ID="dtsGiaAut" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:MedicallConnectionString %>" 
                                            SelectCommand="ssAtz_GiaPdmAtz" SelectCommandType="StoredProcedure">
                                             <SelectParameters>
                                                 <asp:QueryStringParameter Name="IdGia" QueryStringField="Gia" Type="String" />
                                             </SelectParameters>
                                        </asp:SqlDataSource>
                                         </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr bgcolor="#ffffff">
                        <td align="left">
                            <asp:ImageButton ID="bntPrint" runat="server" 
                                ImageUrl="~/Images/bt_imprimir.gif" onclick="bntPrint_Click" 
                                Visible="False" />
                            &nbsp;<asp:ImageButton ID="btnPrintGuia" runat="server" 
                                ImageUrl="~/Images/bt_imprimir_guia.gif" OnClick="btnPrintGuia_Click" 
                                Height="19px" Visible="False" />
                            &nbsp;<asp:ImageButton ID="btnNewSol" runat="server" 
                                ImageUrl="~/Images/bt_nova_execucao.gif" OnClick="btnNewSol_Click" />
                            &nbsp;<asp:ImageButton ID="btnFhaPci" runat="server" 
                                ImageUrl="~/Images/bt_ficha.gif" OnClick="btnFhaPci_Click" Visible="False" />
                           &nbsp; <asp:ImageButton ID="btnPgaIni" runat="server" 
                                ImageUrl="~/Images/bt_home.gif" OnClick="btnPgaIni_Click" />
                            </td>
                    </tr>
                </table>
                </asp:Panel>
                <!-- SOLICITAÇÃO NEGADA -->
                <br />
                <br />
                <asp:Panel ID="pnlPen" runat="server">
                <table align="center" border="0" cellpadding="20" cellspacing="0" width="95%">
                    <tr bgcolor="#f4f4f4">
                        <td width="1%">
                            <table border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td valign="top">
                                        <img alt="" height="23" src="../Images/ico_negada.gif" style="float: left" width="25" />
                                        &nbsp;</td>
                                    <td style="padding-right: 0px; padding-left: 0px; padding-bottom: 0px; padding-top: 5px"
                                        valign="top">
                                        <strong>EXECUÇÃO PENDENTE - BENEFICIÁRIO DEVE BUSCAR AUTORIZAÇÃO NO SM SAÚDE<br />
                                        </strong><br />
                                        <asp:GridView ID="grdSolExa" runat="server" AutoGenerateColumns="False" 
                                            CssClass="grid-view" DataSourceID="dtsGiaMsg"                 >
                                            <FooterStyle Font-Bold="True" ForeColor="White" />
                                            <Columns>
                                                <asp:TemplateField>
                                                    <EditItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Pdm_Dsc") %>'></asp:Label>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <table style="width: 100%">
                                                            <tr>
                                                                <td align="left" valign="middle" bgcolor="#666666">
                                                                    &nbsp;&nbsp;<asp:Label ID="Label2"  runat="server" Text='<%# Bind("Pdm_Dsc") %>' 
                                                                        Visible="True" ForeColor="White"></asp:Label>                                                                   
                                                                   </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left" style="height: 18px" >
                                                                    &nbsp;- 
                                                                    <asp:Label ID="Label3"  runat="server" Text='<%# Bind("Msg_DscAtz") %>' 
                                                                        Visible="True" ></asp:Label> 
                                                                    </td>
                                                            </tr>
                                                        </table>
                                                    </ItemTemplate>
                                                </asp:TemplateField>                                               
                                            </Columns>
                                            
                                        </asp:GridView>
                                        <br />
                                        <br />
                                        <asp:SqlDataSource ID="dtsGiaMsg" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:MedicallConnectionString %>" 
                                            SelectCommand="ssAtz_GiaPdmMsg" SelectCommandType="StoredProcedure" CancelSelectOnNullParameter="False">
                                          <SelectParameters>
                                              <asp:Parameter Name="IdGia" Type="Int32" />
                                              <asp:Parameter Name="IdPdm" Type="Int32" />
                                              <asp:QueryStringParameter Name="IdGiaSdt" QueryStringField="Gia" Type="String" />
                                             </SelectParameters>
                                        </asp:SqlDataSource>
                                        <br />
                                       
                                        <br />
                                       
                                       
                                       
                                        <strong>Entre em contato com a Central SM Saúde no telefone 0800 286 3320</strong></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr bgcolor="#ffffff">
                        <td align="left"><asp:ImageButton ID="btnNewSol2" runat="server" ImageUrl="../Images/bt_nova_execucao.gif" OnClick="btnNewSol_Click" /></td>
                    </tr>
                </table>
                </asp:Panel>
                <asp:HiddenField ID="hdfIdGia" runat="server" />
            </td>
        </tr>
    </table>


</asp:Content>

