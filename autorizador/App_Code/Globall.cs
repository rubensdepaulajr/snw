using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using rptViewer;
using System.Text.RegularExpressions;
using System.Text;
using System.Globalization;

/// <summary>
/// Summary description for MetodosPrw
/// </summary>
public class setReport
{
    public static reportViewer Rpt = new reportViewer(); //Objeto que contém todas as informações para o relatório
  
}
    public class globall
    {
        //TODO: pesquisar no banco
        public static bool papelDaOperadora(Int32 idPpl)
        {
            if ((idPpl == 1) || (idPpl > 6))
                return true;
            else
                return false;
        }
        /// <summary>
        /// Testa se a data é válida
        /// </summary>
        /// <param name="value">Data a ser testada</param>
        /// <returns>[False-Não|True-Sim]</returns>
        public static bool isDate(string value)
        {
            DateTime tmpDate;
            try
            {
                tmpDate = DateTime.Parse(value);
            }
            catch
            {
                return false;
            }

            return true;
        }
        /// <summary>
        /// Verifica se o número é inteiro
        /// </summary>
        /// <param name="strNumber">Número a ser verificado</param>
        /// <returns>[False-Não|True-Sim]</returns> 
        public static bool isInteger(string strNumber)
        {
            Regex objNotWholePattern = new Regex("[^0-9]");
            return !objNotWholePattern.IsMatch(strNumber);
        }
        /// <summary>
        /// Verifica se o número informado é um CPF válido
        /// </summary>
        /// <param name="vrCPF">Número a ser validado</param>
        /// <returns></returns>
        public static bool isCPF(string vrCPF)
        {
            try
            {
                string valor = vrCPF.Replace(".", "");

                valor = valor.Replace("-", "");

                if (valor.Length != 11)
                    return false;

                bool igual = true;

                for (int i = 1; i < 11 && igual; i++)
                    if (valor[i] != valor[0])
                        igual = false;

                if (igual || valor == "12345678909")
                    return false;

                int[] numeros = new int[11];

                for (int i = 0; i < 11; i++)
                    numeros[i] = int.Parse(valor[i].ToString());

                int soma = 0;

                for (int i = 0; i < 9; i++)
                    soma += (10 - i) * numeros[i];

                int resultado = soma % 11;

                if (resultado == 1 || resultado == 0)
                {
                    if (numeros[9] != 0)
                        return false;
                }
                else if (numeros[9] != 11 - resultado)
                    return false;

                soma = 0;

                for (int i = 0; i < 10; i++)
                    soma += (11 - i) * numeros[i];

                resultado = soma % 11;

                if (resultado == 1 || resultado == 0)
                {
                    if (numeros[10] != 0)
                        return false;
                }
                else
                    if (numeros[10] != 11 - resultado)
                        return false;
                return true;
            }
            catch
            {
                return false;
            }
        }
        /// <summary>
        /// Verifica se o número informado é um CNPJ
        /// </summary>
        /// <param name="vrCNPJ">Número a ser validado</param>
        /// <returns></returns>
        public static bool isCNPJ(string vrCNPJ)
        {
            string CNPJ = vrCNPJ.Replace(".", "");
            CNPJ = CNPJ.Replace("/", "");
            CNPJ = CNPJ.Replace("-", "");

            int[] digitos, soma, resultado;
            int nrDig;
            string ftmt;
            bool[] CNPJOk;

            ftmt = "6543298765432";
            digitos = new int[14];
            soma = new int[2];
            soma[0] = 0;
            soma[1] = 0;
            resultado = new int[2];
            resultado[0] = 0;
            resultado[1] = 0;
            CNPJOk = new bool[2];
            CNPJOk[0] = false;
            CNPJOk[1] = false;
            try
            {
                for (nrDig = 0; nrDig < 14; nrDig++)
                {
                    digitos[nrDig] = int.Parse(CNPJ.Substring(nrDig, 1));
                    if (nrDig <= 11)
                        soma[0] += (digitos[nrDig] * int.Parse(ftmt.Substring(nrDig + 1, 1)));
                    if (nrDig <= 12)
                        soma[1] += (digitos[nrDig] * int.Parse(ftmt.Substring(nrDig, 1)));
                }
                for (nrDig = 0; nrDig < 2; nrDig++)
                {
                    resultado[nrDig] = (soma[nrDig] % 11);
                    if ((resultado[nrDig] == 0) || (resultado[nrDig] == 1))
                        CNPJOk[nrDig] = (digitos[12 + nrDig] == 0);
                    else
                        CNPJOk[nrDig] = (digitos[12 + nrDig] == (11 - resultado[nrDig]));
                }
                return (CNPJOk[0] && CNPJOk[1]);
            }
            catch
            {
                return false;
            }
        }
        /// <summary>
        /// Caracteres que são permitidos na senha de autorização,
        /// alguns são removidos para evitar dúvidas. Ex.: zero(0) e o(O)
        /// </summary>
        private static string[] caracteresPermitidos = new string[] 
        {
            "A", "B", "C", "D", "E", "F", "H", "J", "K", "L", "M", "N",  "P", "Q", "R", 
            "T", "U", "V", "X", "Z", "W", "Y", "1", "2", "3", "4", "5", "6", "7", "8", "9"
        };
        /// <summary>
        /// Geração de String randômica para compor a senha da autorização
        /// </summary>
        /// <param name="qtdCaracteres">Quantidade de caracteres que a string randômica possuirá</param>
        /// <returns>String randômica</returns>
        public static string gerarStringRandomica(Int32 qtdCaracteres)
        {
            // Cria Objetos
            Random randomEngine;
            string randomicString = string.Empty;

            // Inicializa a Engine
            randomEngine = new Random((((DateTime.Now.Second + caracteresPermitidos.Length) * DateTime.Now.Hour * DateTime.Now.Millisecond) -
            DateTime.Now.DayOfYear) + DateTime.Now.Millisecond + DateTime.Now.Second);

            // Gera a string Randomica
            for (Int32 countTMP = 0; countTMP < qtdCaracteres; countTMP++)
            {
                randomicString += caracteresPermitidos[randomEngine.Next(0, caracteresPermitidos.Length)];
            }

            // Retorna
            return randomicString;
        }
        public static void showMessage(Image imgMsg, Label lblMsg, String message)
        {
            if (string.IsNullOrEmpty(message))
            {
                imgMsg.Visible = false;
                lblMsg.Text = string.Empty;
            }
            else
            {
                imgMsg.Visible = true;
                lblMsg.Text = message;
            }
        }
        public static void selectPageGrid(GridView grd)
        {
            GridViewRow gvrPager = grd.BottomPagerRow;
            DropDownList ddlPages = (DropDownList)gvrPager.Cells[0].FindControl("ddlGridPages");
            grd.PageIndex = ddlPages.SelectedIndex;
            grd.DataBind();
        }
        public static void getCurrentPageGrid(GridView grd, string command)
        {
            // get the current page selected
            int intCurIndex = grd.PageIndex;
            switch (command.ToLower())
            {
                case "first":
                    grd.PageIndex = 0;
                    break;
                case "prev":
                    if (intCurIndex > 0)
                        grd.PageIndex = intCurIndex - 1;
                    break;
                case "next":
                    if (intCurIndex <= grd.PageCount - 1)
                        grd.PageIndex = intCurIndex + 1;
                    break;
                case "last":
                    grd.PageIndex = grd.PageCount;
                    break;
            }
            // popultate the gridview control
            grd.DataBind();
        }

    }
    /// <summary>
    /// Método para extensão da classe string
    /// </summary>
    public static class Extensao
    {
        /// <summary>
        /// Remove acentos de string
        /// </summary>
        /// <param name="text">String a ser processada</param>
        /// <returns>String sem acentos</returns>
        public static string removeAccents(this string text)
        {
            text = text.Normalize(NormalizationForm.FormD);
            StringBuilder sb = new StringBuilder();

            foreach (char c in text.ToCharArray())
            {
                if (CharUnicodeInfo.GetUnicodeCategory(c) != UnicodeCategory.NonSpacingMark)
                {
                    sb.Append(c);
                }
            }
            return sb.ToString();
        }
    }





