<%@ Page Title="" Language="C#" MasterPageFile="~/Atz.master" AutoEventWireup="true" 
Inherits="Ngc_CadPdmOrt" ValidateRequest="false" Codebehind="CadPdmOrt.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <script src="../Ngc/js/jquery-1.5.1.min.js" type="text/javascript"></script>
    <script src="../Ngc/js/com.remiya.jquery.codify.min.js" type="text/javascript"></script>
    <script src="../Ngc/js/htmlbox.colors.js" type="text/javascript"></script>
    <script src="../Ngc/js/htmlbox.styles.js" type="text/javascript"></script>
    <script src="../Ngc/js/htmlbox.syntax.js" type="text/javascript"></script>
    <script src="../Ngc/js/htmlbox.undoredomanager.js" type="text/javascript"></script>
    <script src="../Ngc/js/htmlbox.full.js" type="text/javascript"></script>
    
    <table  border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td style="padding: 0px 0 0px 20px; height: 37px;">
				<table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td align="left" style="width: 8px"><img src="../images/tit_left.gif" width="9" height="37" 
                                alt="" /></td>
						<td bgcolor="#f4f4f4"><h2>procedimento - informações para auditoria do procedimento</h2></td>
						<td align="left" width="9"><img src="../images/tit_right.gif" width="9" height="37" alt="" /></td>
					</tr>
				</table>
			</td>
		</tr>						
		<tr>
			<td align="left" valign="top" style="padding: 20px 0 0 20px;">
			    <table border="0" cellpadding="0" cellspacing="0">					
					<tr>
						<td align="right" width="150">&nbsp;</td>
						<td width="5"></td>
						<td align="left">&nbsp;</td>
				    </tr>
					<tr>
						<td colspan="3" style="height: 10px">
                            Procedimento:
                            <asp:Label ID="lblPdm" runat="server"></asp:Label>
                        </td>
					</tr>		
					
					<tr>
						<td colspan="3" style="height: 10px">&nbsp;</td>
					</tr>		
					
					<tr>
						<td colspan="3" style="height: 10px">
                            <asp:TextBox ID="htmlbox" runat="server" Columns="80" 
                                Rows="20" TextMode="MultiLine"></asp:TextBox>
                    </td>
					</tr>		
					
					<tr>
						<td colspan="3" style="height: 10px">&nbsp;</td>
					</tr>		
					
					<tr>
						<td align="right" width="150" style="height: 14px">
                            <asp:Button ID="btnSave" runat="server" Text="Gravar" onclick="btnSave_Click" />
                            <asp:Button ID="btnCancel" runat="server" onclick="btnCancel_Click" Text="Cancelar" />
                        </td>
						<td width="5" style="height: 14px"></td>
						<td align="left" style="height: 14px; width: 147px;">
                            &nbsp;</td>											
					</tr>
					<tr>
					    <td colspan="3">
					    <br />
					        <asp:Image ID="imgMsg" runat="server" ImageUrl="../Images/ico_alert.gif" Visible="False" />&nbsp;
                            <asp:Label ID="lblMsg" runat="server" class="erro"></asp:Label>
					
					    </td>
					</tr>
					<tr>
						<td colspan="3" height="10">    
                        </td>
					</tr>																	
				</table>
			    <br />
			</td>
		</tr>													
	</table>
	
    <asp:HiddenField ID="hdfIdPdm" runat="server" />

    <script  type="text/javascript">
        var hb_icon_set_blue;
        hb_icon_set_blue = $("[name$='htmlbox']").css("height", "350").css("width", "650").htmlbox({
            toolbars: [
                             ["cut", "copy", "paste", "separator_dots", "bold", "italic", "underline", "strike", "sub", "sup", "separator_dots", "undo", "redo", "separator_dots",
		                       "left", "center", "right", "justify", "separator_dots", "ol", "ul", "indent", "outdent", "separator_dots", "link", "unlink", "image"]
                    ],
                    icons: "silk",
                    skin: "blue"
        });
    </script>
</asp:Content>

