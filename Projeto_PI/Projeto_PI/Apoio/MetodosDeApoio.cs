using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Projeto_PI.Models;

namespace Projeto_PI.Apoio
{
    /// <summary>
    /// Classe criada para criacao de metodos de extensão
    /// </summary>
    public static class MetodosDeApoio
    {
        /// <summary>
        /// define o tipo de acesso a pagina
        /// </summary>
        public enum TipoAcesso{
            /// <summary>
            /// é um usuario que não esta logado
            /// </summary>
            Visitante,
            /// <summary>
            /// é um usuario logado mas que não é o "dono" da pagina
            /// </summary>
            UsuarioVisitante,
            /// <summary>
            /// é um usuario logado e dono da pagina
            /// </summary>
            Usuario
        };
        /// <summary>
        /// Retira Tudo que não for letra ou numero da string
        /// </summary>
        /// <param name="input">string com apenas letras ou numeros</param>
        /// <returns>string sem a mascara</returns>
        public static string TiraMascara(this string input)
        {
            return Regex.Replace(input, "[^a-zA-z0-9]","");
        }

        /// <summary>
        /// tira os espacoes excedentes entre as palavras, exemplo: "uma       coisa" vira "uma coisa"
        /// </summary>
        /// <param name="input">string a ser formatada</param>
        /// <returns>string com um espaco entre as palavras</returns>
        public static string TiraEspacoExcedente(this string input)
        {
            return Regex.Replace(input, "\\s{2,}", " ");
        }

        /// <summary>
        /// remove o tudo que não for uma letra
        /// </summary>
        /// <param name="input">string a ser formatada</param>
        /// <returns>apenas as letras da string</returns>
        public static string RemoveNaoLetras(this string input)
        {
            return Regex.Replace(input, "[^a-zA-ZáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]", "");
        }
        
        /// <summary>
        /// Verifica se a entrada é um email valido
        /// </summary>
        /// <param name="input">string a ser verificada</param>
        /// <returns>true se for um email valido, false se não for</returns>
        public static bool Email(this string input)
        {
            return Regex.IsMatch(input, "^[a-zA-Z][0-9a-zA-Z\\._-]+@([a-zA-Z0-9\\.]+\\.)[a-zA-A-09]+$");
        }

        /// <summary>
        /// verifica se a entrada é um telefone valido(dez caracteres numericos, não verifica se é um telefone existente)
        /// </summary>
        /// <param name="input">string a ser verificada</param>
        /// <returns>true se o telefone for valido, false se for invalido</returns>
        public static bool Telefone(this string input)
        {
            return Regex.IsMatch(input, "^\\d{10}$");
        }

        /// <summary>
        /// verifica se a entrada é um CEP valido(oito caracteres numericos, não verifica se é um CEP existente)
        /// </summary>
        /// <param name="input">string a ser validada</param>
        /// <returns>true se for um cep valido, false se nao for</returns>
        public static bool CEP(this string input) {
            return Regex.IsMatch(input, "^\\d{8}$");
        }

        /// <summary>
        /// Salva uma imagem no servidor e no banco de dados atravez de um objeto FileUpload e retorna o id da imagem
        /// </summary>
        /// <param name="fuImagem">O input da imagem</param>
        /// <param name="arquivo">Arquivo onde a imagem vai ser gravada</param>
        /// <returns>o id da imagem</returns>
        /// <example>O arquivo deve ser passado em sua forma "fisica" use <code>Server.MapPath("arquivo\\")</code> como parametro para o arquivo</example>
        public static int SalvaImagem(this FileUpload fuImagem, string arquivo)
        {
            if (!fuImagem.HasFile)
            {
                throw new Exception("Nenhum arquivo foi enviado");
            }
            string extensao = Path.GetExtension(fuImagem.FileName);
            string nomeImg = fuImagem.FileName;
            if (extensao != ".jpg" && extensao != ".png" && extensao != ".gif")
            {
                throw new Exception("Apenas arquivos .jpg, .gif ou .png");
            }
            //verifica se existe um arquivo com o mesmo nome no diretorio de upload de imagens, se existir coloca "(n)" depois do nome do arquivo
            int cont = 0;
            do
            {
                cont++;
                int tot = Directory.GetFiles(arquivo).Count(a => Path.GetFileName(a) == nomeImg);
                if (tot > 0)
                {
                    nomeImg = string.Format("{0}({1}){2}", Path.GetFileNameWithoutExtension(fuImagem.FileName), cont, extensao);
                    continue;
                }
                break;
            } while (true);
            fuImagem.SaveAs(arquivo + nomeImg);
            //adiciona a nova imagem ao banco
            EntidadesProjetoPI bd = new EntidadesProjetoPI();
            var img = bd.Imagens.Add(new Imagens { nome = nomeImg });
            bd.SaveChanges();
            return img.id;
        }

        /// <summary>
        /// Valida um cnpj, referencia: http://www.geradorcnpj.com/javascript-validar-cnpj.htm
        /// </summary>
        /// <param name="input">CNPJ a ser validado</param>
        /// <returns>false se o CNPJ for invalido. true se for valido</returns>
        public static bool validaCNPJ(this string cnpj)
        {
            //retira tudo o que não for digito
            cnpj = Regex.Replace(cnpj, "[^\\d]+", "");

            //elimina cnpjs invalidos
            if (cnpj.Length != 14 || cnpj == "00000000000000" || cnpj == "11111111111111" || cnpj == "22222222222222" || cnpj == "33333333333333" || cnpj == "44444444444444" || cnpj == "55555555555555" || cnpj == "66666666666666" || cnpj == "77777777777777" || cnpj == "88888888888888" || cnpj == "99999999999999")
                return false;

            //valida DVs
            int tamanho = cnpj.Length - 2;
            string numeros = cnpj.Substring(0, tamanho);
            string digitos = cnpj.Substring(tamanho);
            int soma = 0;
            int pos = tamanho - 7;
            for (int i = tamanho; i >= 1; i--)
            {
                soma += Convert.ToInt32(numeros[tamanho - i].ToString()) * pos--;
                if (pos < 2)
                    pos = 9;
            }
            int resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
            if (resultado != Convert.ToInt32(digitos[0].ToString()))
                return false;
            tamanho++;
            numeros = cnpj.Substring(0, tamanho);
            soma = 0;
            pos = tamanho - 7;
            for (int i = tamanho; i >= 1; i--)
            {
                soma += Convert.ToInt32(numeros[tamanho - i].ToString()) * pos--;
                if (pos < 2)
                    pos = 9;
            }
            resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
            if (resultado != Convert.ToInt32(digitos[1].ToString()))
                return false;
            return true;
        }

        /// <summary>
        /// Valida um cpf, referencia: http://www.geradorcpf.com/javascript-validar-cpf.htm
        /// </summary>
        /// <param name="cpf">CPF a ser validado</param>
        /// <returns>true se for valido, false se for invalido</returns>
        public static bool ValidaCPF(this string cpf)
        {
            // Elimina CPFs invalidos conhecidos    
            if (cpf.Length != 11 || cpf == "00000000000" || cpf == "11111111111" || cpf == "22222222222" || cpf == "33333333333" || cpf == "44444444444" || cpf == "55555555555" || cpf == "66666666666" || cpf == "77777777777" || cpf == "88888888888" || cpf == "99999999999")
                return false;
            //valida o 1 digito
            int add = 0;
            for (int i = 0; i < 9; i++)
                add += Convert.ToInt32(cpf[i].ToString()) * (10-i);
            int rev = 11 - (add % 11);
            if (rev == 10 || rev == 11)
                rev = 0;
            if (rev != Convert.ToInt32(cpf[9].ToString()))
                return false;
            //valida o segundo digito
            add = 0;
            for (int i = 0; i < 10; i++)
                add += Convert.ToInt32(cpf[i].ToString()) * (11 - i);
            rev = 11 - (add % 11);
            if (rev == 10 || rev == 11)
                rev = 0;
            if (rev != Convert.ToInt32(cpf[10].ToString()))
                return false;
            return true;
        }

        /// <summary>
        /// verifica se o acesso a pagina é por um usuario logado ou nao e carrega a master page que é de acordo
        /// </summary>
        /// <param name="pagina"></param>
        public static void VerificaAcessoLogado(this Page pagina)
        {
            if (pagina.Session["usuario"] != null)
            {
                pagina.MasterPageFile = "MenuLogado.master";
            }
            else
            {
                pagina.MasterPageFile = "Site.master";
            }
        }

        /// <summary>
        /// Verifica se o tipo de acesso a pagina, usar este metodo quando é passado via url um usuario
        /// </summary>
        /// <returns>TipoAcesso.Usuario - se o acesso a pagina esta sendo por um usuario logado e ele é o "dono da pagina"
        /// TipoAcesso.Visitante- se o acesso a pagina esta sendo feito por usuario não logado
        /// TipoAcesso.UsuarioVisitante - se o acesso a pagina esta sendo feito por um usuario logado mas, que não é o "dono" da pagina</returns>
        /// <exception cref="HttpException">se houver algum erro ao verificar o acesso</exception>
        public static TipoAcesso VerificaTipoAcesso(this Page pagina)
        {
            if (pagina.Session["usuario"] != null && pagina.Session["usuario"].ToString() == pagina.Request["usuario"].ToString())
            {
                return TipoAcesso.Usuario;
            }
            else if (pagina.Session["usuario"] != null && pagina.Request["usuario"] != null)
            {
                return TipoAcesso.UsuarioVisitante;
            }
            else if (pagina.Request["usuario"] != null)
            {
                return TipoAcesso.Visitante;
            }
            else
            {
                throw new HttpException("Nenhum dado foi enviado via HTTP");
            }
        }
    }
}