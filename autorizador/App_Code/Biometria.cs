using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
//using NBioBSPCOMLib;
using NITGEN.SDK.NBioBSP;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for Biometria
/// </summary>
public class Biometrics
{
	public Biometrics()
	{
	}
    //private static string selectUser(int idBnf)
    //{
    //    string FIR = string.Empty;
    //    string[] outParam = { "@Out_Fir" };
    //    string[] outResult;

    //    DBASQL dba = new DBASQL();
    //    SqlParameter[] param = {
    //                                dba.MakeInParam("@IdBnf",SqlDbType.Int,4,idBnf),
    //                                dba.MakeOutParam("@Out_Fir",SqlDbType.VarChar,4000),
    //                           };
    //    outResult = dba.RunProc("ssSgn_BioBnf", param, outParam);
    //    FIR = outResult[0];
    //    dba.Dispose();
    //    return FIR;
    //}
    //public static bool saveDB(string FIR, int idBnf, int idUsr, int finger)
    //{
    //    bool ret;

    //    string[] outParam = { "@Out_Err" };
    //    string[] outResult;

    //    DBASQL dba = new DBASQL();
    //    SqlParameter[] param = {
    //                                dba.MakeInParam("@IdBnf",SqlDbType.Int,4,idBnf),
    //                                dba.MakeInParam("@IdUsr",SqlDbType.Int,4, idUsr),
    //                                dba.MakeInParam("@Bbf_Fir",SqlDbType.VarChar,4000,FIR),
    //                                dba.MakeInParam("@Bbf_Ded",SqlDbType.TinyInt,1,finger),
    //                                dba.MakeOutParam("@Out_Err",SqlDbType.Bit,1),
    //                           };
        
    //    outResult = dba.RunProc("stSgn_BioBnf", param, outParam);
    //    if (outResult[0] == "True")
    //        ret = false;
    //    else
    //        ret = true;
    //    dba.Dispose();

    //    return ret;
    //}
    //public static bool enrollUser(int idBnf, int idUsr, int finger)
    //{
    //    bool ret; 

    //    NBioBSP objNBioBSP;
    //    IDevice objDevice;
    //    IExtraction objExtraction;

    //    objNBioBSP = new NBioBSPClass();
    //    objDevice = (IDevice)objNBioBSP.Device;
    //    objExtraction = (IExtraction)objNBioBSP.Extraction;
    //    objNBioBSP.SetSkinResource("NBSP2Por.dll");

    //    //Abre o dispositivo
    //    objDevice.Open(255);
    //    //Decide qual dedo será exibido no pop-up
    //    objExtraction.set_DisableFingerForEnroll(0, NBioAPI.Type.TRUE);
    //    objExtraction.set_DisableFingerForEnroll(1, NBioAPI.Type.TRUE);
    //    objExtraction.set_DisableFingerForEnroll(2, NBioAPI.Type.TRUE);
    //    objExtraction.set_DisableFingerForEnroll(3, NBioAPI.Type.TRUE);
    //    objExtraction.set_DisableFingerForEnroll(4, NBioAPI.Type.TRUE);
    //    objExtraction.set_DisableFingerForEnroll(5, NBioAPI.Type.TRUE);
    //    objExtraction.set_DisableFingerForEnroll(6, NBioAPI.Type.TRUE);
    //    objExtraction.set_DisableFingerForEnroll(7, NBioAPI.Type.TRUE);
    //    objExtraction.set_DisableFingerForEnroll(8, NBioAPI.Type.TRUE);
    //    objExtraction.set_DisableFingerForEnroll(9, NBioAPI.Type.TRUE);
    //    // Habilitando o dedo que será exibido no pop-up
    //    objExtraction.set_DisableFingerForEnroll(finger, NBioAPI.Type.FALSE);

    //    //Faz a captura da impressão digital
    //    objExtraction.Enroll(null, null);
    //    //Fecha o dispositivo
    //    objDevice.Close(255);
    //    //A impressão capturada é retornada
    //    if (!string.IsNullOrEmpty(objExtraction.TextEncodeFIR))
    //        ret = saveDB(objExtraction.TextEncodeFIR, idBnf, idUsr, finger);
    //    else
    //        ret = false;
    //    return ret;
    //}
    //public static bool verifyUser(int idBnf)
    //{
    //    bool ret;
    //    string FIR;

    //    NBioBSP objNBioBSP;
    //    IDevice objDevice;
    //    IExtraction objExtraction;
    //    IMatching objMatching;

    //    objNBioBSP = new NBioBSPClass();
    //    objDevice = (IDevice)objNBioBSP.Device;
    //    objExtraction = (IExtraction)objNBioBSP.Extraction;
    //    objMatching = (IMatching)objNBioBSP.Matching;
    //    objNBioBSP.SetSkinResource("NBSP2Por.dll");

    //    //Abre o dispositivo
    //    objDevice.Open(255);
    //    //Faz a captura da impressão digital
    //    objExtraction.Capture(2);
    //    //Fecha o dispositivo
    //    objDevice.Close(255);
    //    //Chama a função para verificar se o ID existe no banco de dados
    //    FIR = selectUser(idBnf);
    //    //Compara a digital registrada no banco de dados com a digital capturada
    //    objMatching.VerifyMatch(FIR, objExtraction.TextEncodeFIR);

    //    //Se a comparação retornar 1, o usuário é identificado
    //    if (objMatching.MatchingResult != 0)
    //    {
    //        ret = true;
    //    }
    //    //Se retornar 0, o usuário não é identificado
    //    else
    //    {
    //        ret = false;
    //    }

    //    return ret;
    //}
}
