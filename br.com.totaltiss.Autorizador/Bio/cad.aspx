<%@ Page Language="C#" AutoEventWireup="true" Inherits="Bio_cad" Codebehind="cad.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<link href="../estilo.css" rel="stylesheet" type="text/css" />


<!-- NBioBSP Component -->
<OBJECT classid="CLSID: F66B9251-67CA-4d78-90A3-28C2BFAE89BF"
    height="0" width="0"
    id="objNBioBSP"
    name="objNBioBSP">
</OBJECT>
<!-- ----------------- --
  -- JavaScript Sample --
  -- ----------------- -->
<script language="javascript">

    function submitForm() {
        document.MainForm.UserID.value = document.getElementById('lblBnfMtr').innerText;
        document.MainForm.ori.value = request.getParameter("ori");
        document.MainForm.submit();
    }
    // Obtendo o parâmetro via QueryString
    var request = { getParameter: _getParameter };
    function _getParameter(querystring) {
        var querystr = new Array();
        loc = window.location.search.substr(1).split('&');
        if ((loc != '') && (loc != null)) {
            for (var icnt = 0; icnt < loc.length; icnt++) {
                var q = loc[icnt].split('=');
                querystr[q[0]] = q[1];
            }
            return querystr[querystring];
        }
        else {
            return (null);
        }
    }

function regist()
{	
	var err, payload;
	var result = false;

	// Check ID is not NULL
//	if ( document.MainForm.UserID.value == '' )
//	{
//		alert('Please enter user id !');
//		return(false);
//	}

	try // Exception handling
	{
		DEVICE_AUTO_DETECT	= 255;
		
		var objNBioBSP = new ActiveXObject('NBioBSPCOM.NBioBSP.1');
		var objDevice = objNBioBSP.Device;
		var objExtraction = objNBioBSP.Extraction;

		//Decide qual dedo será exibido no pop-up
		//objExtraction.set_DisableFingerForEnrollw(0, NBioAPI.Type.TRUE);
		//objExtraction.set_DisableFingerForEnroll(1, NBioAPI.Type.FALSE);
		//objExtraction.set_DisableFingerForEnroll(2, NBioAPI.Type.TRUE);
		//objExtraction.set_DisableFingerForEnroll(3, NBioAPI.Type.TRUE);
		//objExtraction.set_DisableFingerForEnroll(4, NBioAPI.Type.TRUE);
		//objExtraction.set_DisableFingerForEnroll(5, NBioAPI.Type.TRUE);
		//objExtraction.set_DisableFingerForEnroll(6, NBioAPI.Type.TRUE);
		//objExtraction.set_DisableFingerForEnroll(7, NBioAPI.Type.TRUE);
		//objExtraction.set_DisableFingerForEnroll(8, NBioAPI.Type.TRUE);
		//objExtraction.set_DisableFingerForEnroll(9, NBioAPI.Type.TRUE);	

		// Open device. [AUTO_DETECT]
		// You must open device before enroll.
		objDevice.Open(DEVICE_AUTO_DETECT);

		err = objDevice.ErrorCode;	// Get error code	
		if ( err != 0 )		// Device open failed
		{
			alert('Device open failed !');
		}
		else
		{
			// Enroll user's fingerprint.
			objExtraction.Enroll(payload);
			err = objExtraction.ErrorCode;	// Get error code
		
			if ( err != 0 )		// Enroll failed
			{
				alert('Registration failed ! Error Number : [' + err + ']');
			}
			else	// Enroll success
			{
				// Get text encoded FIR data from NBioBSP module.
			    document.MainForm.FIRTextData.value = objExtraction.TextEncodeFIR;

			    document.MainForm.UserID.value = document.getElementById('lblBnfMtr').innerText;
//				alert('Registration success !');
				result = true;
			}
			
			// Close device. [AUTO_DETECT]
			objDevice.Close(DEVICE_AUTO_DETECT);
		}

		objExtraction = 0;
		objDevice = 0;
		objNBioBSP = 0;		
	}
	catch(e)
	{
		alert(e.message);
		return(false);
	}

	if (result) 
	{
	    document.MainForm.ori.value = request.getParameter("ori");
		// Submit main form
	    document.MainForm.submit();
	}
	return result;
}
</script>


<head runat="server">
    <title></title>
</head>
<body>
<center>
<hr>

    <form action="regist.aspx?aco=biocad" name="MainForm" method="post" OnSubmit="javascript:return false;" >
    
    <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td style="width: 929px">
                    <!-- TOPO LOGOMARCA -->
                    <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td align="left" width="126" style="height: 57px">
                                <img alt="" height="57" src="../Images/top_logo.gif" width="126" /></td>
                            <td style="padding-right: 0px; padding-left: 15px; padding-bottom: 0px; padding-top: 10px; height: 57px;">
                                &nbsp;</td>
                            <td align="right" width="100" style="height: 57px">
                                <img alt="" height="57" src="../Images/top_tiss.gif" width="100" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="height: 44px; width: 929px;">
                    <!-- TOPO SAUDAÇÃO -->
                    <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td align="left" height="30" width="10">
                                <img alt="" height="30" src="../Images/top_left_box_default.gif" /></td>
                            <td height="30" style="background: url(../Images/bg_top_middle.gif) repeat-x">
                                <h2>Cadastro da biometria</h2></td>
                            <td align="right" height="30" width="36">
                                <a href="#">
                                    <img alt="" border="0" height="30" src="../Images/top_right_ajuda_box_default.gif" /></a></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="width: 929px">
                    <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td colspan="2" style="padding-right: 0px; padding-left: 0px; padding-bottom: 0px;
                                padding-top: 0px" valign="top">
                                    <asp:Label ID="lblBnfMtr" runat="server"></asp:Label>
                                        -<asp:Label ID="lblBnfNme" runat="server"></asp:Label>
                                        <br />
                                        <br />
                                        <input type="hidden" name="FIRTextData"/><p/>
                                        <table>
                                            <tr><td>&nbsp;</td>
	                                        <td>
	                                            <input type="hidden" name="UserID"/>
	                                            <input type="hidden" name="ori"/>
	                                        </td></tr>
                                        </table>
                                        &nbsp;
                                        <input type="button" onclick="regist()" value="Cadastrar Digital"/>
                                        <input id="Submit1" type="submit" value="Voltar" onclick="submitForm()" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="width: 929px">
                    <!-- RODAPÉ -->
                    <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td align="left" height="30" style="width: 10px">
                                <img alt="" height="32" src="../Images/bottom_left_box_default.gif" width="10" /></td>
                            <td height="30" style="background: url(../Images/bg_bottom_middle.gif) repeat-x">
                                © 2009 SM Saúde. Todos os direitos reservados. <a href="../termo_uso.html"><span style="color: #0000ff">
                                    Termos de Uso</span></a> | <a href="../politica_privacidade.html"><span style="color: #0000ff">Política de Privacidade</span></a></td>
                            <td align="right" height="30" width="36">
                                <img alt="" border="0" height="32" src="../Images/bottom_right_box_default.gif" usemap="#a4ps"
                                    width="36" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
<p>
<%--<input type=button OnClick='regist()' value=' Click here to register your fingerprint '>--%>

</center>

<br/>

<br/>
<br/>

<hr>
<p align="right">
    &nbsp;</p>


</body>
</html>
