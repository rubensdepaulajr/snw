using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;
using System.Data.SqlClient;
using System.IO;

public partial class Adm_arqtxt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLayout2_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrWhiteSpace(txtCpc.Text))
            globall.showMessage(imgMsg, lblMsg, "A competência deve ser informada!.");
        else
        {
            globall.showMessage(imgMsg, lblMsg, string.Empty);
            int seqPdm = 1;
            string str = string.Empty;
            string cid = string.Empty;
            string idGia = string.Empty;
            string idCtt = string.Empty;
            bool flag = false;

            StringBuilder builder = new StringBuilder();

            DBASQL dba = new DBASQL();
            SqlParameter[] param = 
            {
                dba.MakeInParam("@FchCpc",SqlDbType.VarChar,6,txtCpc.Text),
                dba.MakeInParam("@IdTpd",SqlDbType.TinyInt,1,ddlTpd.SelectedValue),
            };
            SqlDataReader reader;
            reader = dba.runProcDataReader("ssFat_ArqTxt", param);
            while (reader.Read())
            {
                if (!string.IsNullOrEmpty(idCtt) && idCtt != reader["Gia_IdCtt"].ToString())
                {
                    // Terminador no arquivo do contratado
                    builder.Append("ZZ").AppendLine();
                    // O arquivo é salvo quando ocorre a mudançã de contratado no loop
                    StreamWriter sw = new StreamWriter(Server.MapPath("~/Arq/") + txtCpc.Text + "-" + idCtt + ".txt");
                    sw.Write(builder.ToString());
                    sw.Close();

                    builder.Length = 0;
                    // Caracteres iniciais no arquivo do contratado
                    builder.Append("AA").AppendLine();                    
                }

                if (idGia != reader["Idgia"].ToString())
                    seqPdm = 1;

                if (seqPdm == 1)
                {
                    // Tratamento para adicionar o registro inicial ao primeiro contratado
                    if (flag == false)
                    {
                        builder.Append("AA").AppendLine();
                        flag = true;
                    }
                    // Registro Mestre

                    // VERIFICAR USO
                    // string .PadRight(10, ' ');
                    // "Mauricio  "
                    // codigo = codigo.PadLeft(6, '0');
                    // "000123" 

                    str = string.Format("{0,2}{1,12}{2:dd/MM/yyyy}{3,-20}{4,-20}{5,-70}{6,-20}{7,-40}" +
                                        "{8,-20}{9,-70}{10,-20}{11,-70}{12,-7}{13,-15}{14,2}{15,-20}{16,-70}" +
                                                                                                    //{26,-20}
                                        "{17,-20}{18,-70}{19,-7}{20,-15}{21,2}{22,-7}{23,1}{24,1}{25,1}{26:00000000}",
                        "00",                                                   //00-Tipo de registro
                        reader["NumLot"].ToString(),                            //01-Número do lote
                        Convert.ToDateTime(reader["Gpd_DatRel"].ToString()),    //02-DataAux
                        reader["IdGia"].ToString(),                             //03-NumGuiaPrestador
                        reader["Gia_Snh"].ToString(),                           //04-SenhaAutorização
                        reader["Bnf_Nme"].ToString().removeAccents(),           //05-NomeBeneficiário
                        reader["Bnf_Mtr"].ToString().Replace(".", ""),          //06-Carteira
                        reader["Prd_Nme"].ToString().removeAccents(),           //07-NomePlano
                        reader["CodSol"].ToString(),                            //08-CodSolicitante
                        reader["Nme_Sol"].ToString().removeAccents(),           //09-NomeSolicitante
                        reader["Prf_MtrSol"].ToString(),                        //10-CodPROSolicitante
                        reader["Prf_NmeSol"].ToString().removeAccents(),        //11-NomePROSolicitante
                        reader["IdCnsSol"].ToString(),                          //12-SiglaConselhoSol
                        reader["Prf_NumCnsSol"].ToString(),                     //13-NumeroConselhoSol
                        reader["Prf_EstCnsSol"].ToString(),                     //14-UFConselhoSol
                        reader["CodExe"].ToString(),                            //15-CodExecutante
                        reader["Nme_Exe"].ToString().removeAccents(),           //16-NomeExecutante
                        reader["Prf_MtrExe"].ToString(),                        //17-CodPROExecutante
                        reader["Prf_NmeExe"].ToString().removeAccents(),        //18-NomePROSolicitante
                        reader["IdCnsExe"].ToString(),                          //19-SiglaConselhoExe
                        reader["Prf_NumCnsExe"].ToString(),                     //20-NumeroConselhoExe
                        reader["Prf_EstCnsExe"].ToString(),                     //21-UFConselhoExe
                        reader["Esp_SisGst"].ToString(),                        //22-CBOSExec
                        reader["Gia_Crt"].ToString(),                           //23-CaraterAtendimento
                        reader["Gia_IdSai"].ToString(),                         //24-TipoSaida
                        reader["Gia_IdTpa"].ToString(),                         //25-TipoAtendimento
                        Convert.ToInt64(reader["Gia_IdCtt"].ToString())         //26-Prestador
                        );
                    builder.Append(str).AppendLine();
                }

                str = string.Format("{0,2}{1,-10}{2:dd/MM/yyyy}{3:00000}00{4:00000.00}{5:2}{6:1}{7:1}",
                                    "01",                                                           //00-Tipo do Resgitro
                                    reader["Pdm_Cod"].ToString().Replace(".", "").Replace("-", ""), //01-CodigoSRV
                                    Convert.ToDateTime(reader["Gpd_DatRel"].ToString()),            //02-DataProced
                                    Convert.ToInt16(reader["Gpd_QtdAtz"].ToString()),               //03-QuantExecut
                                    Convert.ToDouble(reader["Ngc_Vlr"].ToString()),                 //04-Valor
                                    reader["Pdm_IdTab"].ToString(),                                 //05-TipoTabela
                                    reader["Via_Acs"].ToString(),                                   //06-Via_de_Acesso  
                                    reader["Tec_Utz"].ToString()                                    //07-Tecnica_Utilizada              
                                ).Replace(",", "");  // Replace para retirar a vírgula do valor da negociação

                builder.Append(str).AppendLine();
                idGia = reader["IdGia"].ToString();
                seqPdm += 1;
                idCtt = reader["Gia_IdCtt"].ToString();
            }

            // Terminador no arquivo do último contratado
            builder.Append("ZZ").AppendLine();
            // O arquivo é salvo quando ocorre a mudanção de contratado no loop
            StreamWriter sw2 = new StreamWriter(Server.MapPath("~/Arq/") + txtCpc.Text + "-" + idCtt + ".txt");
            sw2.Write(builder.ToString());
            sw2.Close();

            //TextBox1.Text = builder.ToString();
            dba.Dispose();

            globall.showMessage(imgMsg, lblMsg, "Arquivo gerado com sucesso!");

        }
    }
    protected void btnBuscar_Click(object sender, ImageClickEventArgs e)
    {
        grd.Visible = true;
    }
}
