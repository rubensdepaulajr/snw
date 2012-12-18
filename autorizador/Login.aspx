<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>SM Saúde - Login</title>
    <link href="estilo.css" rel="stylesheet" type="text/css" />
    <link id="Link1" runat="server" rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
    <link id="Link2" runat="server" rel="icon" href="favicon.ico" type="image/ico" />
</head>
<body>
    <form id="form1" runat="server">

<table border="0" cellpadding="0" cellspacing="0" align="center"  width="100%" height="100%">
<tr><td height="50px"></td></tr>
<tr><td valign="middle" align="center">

	<table border="0" cellpadding="0" cellspacing="0" align="center"  width="100%" height="100%">
		<tr>
			<td valign="middle" align="center">
				<table border="0" cellpadding="0" cellspacing="0" width="700">
				  <TR>
				    <TD width="207"><img src="Images/login_1.gif" width="207" height="115" alt="" border="0" /></TD>
					<TD bgcolor="#f4f4f4" width="393">
					
					  <table border="0" cellpadding="0" cellspacing="5">
					    <tr>
						  <td align="right">Login:</td>
						  <td align="left">
                              <asp:TextBox ID="txtUsr" runat="server" AutoPostBack="True" OnTextChanged="txtUsr_TextChanged"
                                  Width="193px" CssClass="campo" MaxLength="30"></asp:TextBox></td>
						  <td align="right">Senha:</td>
						  <td align="left">
                              <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" CssClass="campo" 
                                  Width="174px" MaxLength="30" AUTOCOMPLETE="off" ></asp:TextBox></td>
						</tr>
						<tr>
						  <td align="right" style="height: 22px">Local:</td>
						  <td colspan="3" style="height: 22px" align="left">
                              <asp:DropDownList ID="ddlLoc" runat="server" Width="428px" CssClass="campo">
                              </asp:DropDownList></td>
						</tr>
						<tr>
						  <TD colspan="2"><a href="#">Esqueci minha senha!</a></TD>
						  <td colspan="2" align="right">
                              <asp:ImageButton ID="btnOK" runat="server" ImageUrl="Images/bt_ok_login.gif" 
                                  OnClick="btnOk_Click" style="height: 19px" /></td>
						</tr>			
						<tr>
							<td valign="middle" colspan="4" ><span class="erro">
                                <asp:Image ID="imgErr" runat="server" ImageUrl="Images/ico_alert.gif" Visible="False" />
                                &nbsp;<asp:Label ID="lblErr" runat="server"></asp:Label></span></td>
						</tr>																			 
					  </table>
					</TD>
					<TD width="10"><img src="Images/login_2.gif" width="10" height="115" alt="" border="0" /></TD>
				  </TR>
				  <TR>
				    <TD colspan="3"><img src="Images/login_3.gif" width="700" height="46" alt="" border="0" /></TD>
				  </TR>
				  <TR>
				    <TD colspan="3" style="padding:10px; color:#FFFFFF; background-color:#c3c3c3; text-align:left;">Utilize o TISS SM Saúde de forma segura. Não divulgue seu login ou senha e evite anotá-los em locais que possam facilmente ser descobertos.<br /><br />
							Lembre-se que todas as ações realizadas no sistema com o seu login são de responsabilidade sua.<br /><br />
							Caso tenha esquecido seus dados de acesso, entre em contato com o SAC no telefone 0800 286 3320.</TD>
				  </TR>
				  <TR>
				    <TD colspan="3"><img src="Images/login_4.gif" width="700" height="11" alt="" border="0" /></TD>
				  </TR>
				</table>
				
				
				<div id="box-login">
					
					<div id="rodape-login">
						© 2009 SM Saúde. Todos os direitos reservados.<br />
						<a href="termo_uso.html">Termos de Uso</a>  |  <a href="politica_privacidade.html">Política de Privacidade</a><br />
						<a href="#"><img src="Images/4ps_box_login.gif" border="0" width="19" height="17" alt="" /></a>
					</div>		
				</div>
				</td>
			</tr>
		</table>
		
		</td></tr>
</table>
	
    </form>
    <script type="text/javascript">
        var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
        document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
        </script>
        <script type="text/javascript">
        try {
        var pageTracker = _gat._getTracker("UA-7238071-3");
        pageTracker._trackPageview();
        } catch(err) {}
    </script>
</body>
</html>
