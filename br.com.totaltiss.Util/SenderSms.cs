using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.IO;
using System.Net;
using System.Text;

/// <summary>
/// Summary description for SenderSms
/// </summary>
public class SenderSms
{
	public SenderSms()
	{
		
    }

    /// <summary>
    /// Método que envia a mensagem
    /// </summary>
    /// <param name="msg">texto a ser enviado</param>
    /// <param name="celular">celular de destino, sendo necessario colocar codPais codUF Telefone ex.: 552799991111 </param>
    public static void EnviaSMS(String msg, String celular)
    {
        String retorno = "";
        String returnCode = "";
        if (msg.Length > 115)
            msg = msg.Substring(0, 115);// tamanho máximo da msg é 142 somando o from, botei 115 pra garantir
        else
            msg = msg.TrimEnd();


        retorno = GetPage("http://system.human.com.br/GatewayIntegration/msgSms.do", "dispatch=send&account=wesley&code=txGPgzzHrX&from=552781110051&msg=" + msg + "&to=" + celular + "");

        returnCode = retorno.Substring(0, 3);

        switch (returnCode)
        {
            case "000":
                Console.Write("Mensagem Salva com Sucesso");
                break;
            case "990":
                Console.Write("Erro de Autenticação");
                break;
            // Aqui podem ser adicionados outros casos conforme descritos na Documentação de Integração
            default:
                Console.Write("Mensagem não foi Salva: " + retorno);
                break;
        }
    }

    private static string GetPage(String url, String query)
    {
        // Declarações necessárias 
        Stream requestStream = null;
        WebResponse response = null;
        StreamReader reader = null;
        String Dados = "";

        try
        {
            WebRequest request = WebRequest.Create(url);
            request.Method = WebRequestMethods.Http.Post;

            // Neste ponto, você está setando a propriedade ContentType da página 
            // para urlencoded para que o comando POST seja enviado corretamente 
            request.ContentType = "application/x-www-form-urlencoded";

            StringBuilder urlEncoded = new StringBuilder();

            // Separando cada parâmetro 
            Char[] reserved = { '?', '=', '&' };

            // alocando o bytebuffer 
            byte[] byteBuffer = null;

            // caso a URL seja preenchida 
            if (query != null)
            {
                int i = 0, j;
                // percorre cada caractere da url atraz das palavras reservadas para separação 
                // dos parâmetros 
                while (i < query.Length)
                {
                    j = query.IndexOfAny(reserved, i);
                    if (j == -1)
                    {
                        urlEncoded.Append(query.Substring(i, query.Length - i));
                        break;
                    }
                    urlEncoded.Append(query.Substring(i, j - i));
                    urlEncoded.Append(query.Substring(j, 1));
                    i = j + 1;
                }
                // codificando em UTF8 (evita que sejam mostrados códigos malucos em caracteres especiais 
                byteBuffer = Encoding.UTF8.GetBytes(urlEncoded.ToString());

                request.ContentLength = byteBuffer.Length;
                requestStream = request.GetRequestStream();
                requestStream.Write(byteBuffer, 0, byteBuffer.Length);
                requestStream.Close();
            }
            else
            {
                request.ContentLength = 0;
            }

            // Dados recebidos 
            response = request.GetResponse();
            Stream responseStream = response.GetResponseStream();

            // Codifica os caracteres especiais para que possam ser exibidos corretamente 
            System.Text.Encoding encoding = System.Text.Encoding.Default;

            // Preenche o reader 
            reader = new StreamReader(responseStream, encoding);

            Char[] charBuffer = new Char[256];
            int count = reader.Read(charBuffer, 0, charBuffer.Length);



            // Lê cada byte para preencher meu string
            while (count > 0)
            {
                Dados += new String(charBuffer, 0, count);
                count = reader.Read(charBuffer, 0, charBuffer.Length);
            }

            return Dados;

        }
        catch (Exception e)
        {
            // Ocorreu algum erro 
            Console.Write("Erro: " + e.Message);
        } // END: catch 

        finally
        {
            // Fecha tudo 
            if (requestStream != null) requestStream.Close();
            if (response != null) response.Close();
            if (reader != null) reader.Close();

        } // END: finally
        return Dados;
    }

}
