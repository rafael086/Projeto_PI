using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Projeto_PI.Apoio;
using Projeto_PI.Models;
namespace Projeto_PI
{
    public partial class Categoria : System.Web.UI.Page
    {
        /// <summary>
        /// usada para verificar o tipo de acesso
        /// </summary>
        protected const string ONGS = "ongs", PROJETOS = "projetos";
        /// <summary>
        /// limite de itens por pagina
        /// </summary>
        private const int LIMITE = 3;
        /// <summary>
        /// define de onde deve começar a capturar itens
        /// </summary>
        protected int inicio;
        /// <summary>
        ///define a ultima pagina
        /// </summary>
        protected int ultimo;
        /// <summary>
        /// referencia as entidades do banco de dados
        /// </summary>
        protected EntidadesProjetoPI bd = new EntidadesProjetoPI();

        /// <summary>
        /// objeto generico para que projetos e ongs possam ser exibidas da mesma maneira
        /// </summary>
        protected class Resultado
        {
            public Resultado(int id, string nome, string descricao, string imagem)
            {
                Id = id;
                Nome = nome;
                Descricao = descricao;
                Imagem = imagem;
            }
            public int Id { get; }
            public string Nome { get; }
            public string Descricao { get; }
            public string Imagem { get; set; }
        }

        /// <summary>
        /// lista com resultados provisorios para ser exibido na pagina 
        /// </summary>
        protected List<Resultado> resultados = new List<Resultado>();

        /// <summary>
        /// verifica se o tipo da consulta e para ongs ou para projetos
        /// </summary>
        /// <returns>true - se o acesso for para ongs, false - se o acesso for para projetos</returns>
        /// <exception cref="Exception">se for capturado algo invalido</exception>
        private bool VerificaTipoConsulta()
        {
            string tipo = (Request["tipo"] == null) ? string.Empty : Request["tipo"].ToString();
            if (tipo != ONGS && tipo != PROJETOS)
                throw new Exception("Ocorreu um erro");
            else if (tipo == ONGS)
                return true;
            else
                return false;
        }

        protected void Page_PreInit(object sender, EventArgs e)
        {
            try
            {
                if (VerificaTipoConsulta())
                {
                    Page.Title = "Ongs";
                }
                else
                {
                    Page.Title = "Projetos";
                }
                Page.VerificaAcessoLogado();
            }
            catch (Exception)
            {
                Response.Redirect("Default.aspx");
            }

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                int pagina = (Convert.ToInt32(Request["pagina"]) < 1) ? 1 : Convert.ToInt32((Request["pagina"]).ToString());
                inicio = (pagina - 1) * LIMITE;
                if (VerificaTipoConsulta())
                {
                    ultimo = Convert.ToInt32(Math.Ceiling(bd.Ongs.Count() / Convert.ToDouble(LIMITE)));
                    if (pagina > ultimo)
                        Response.Redirect(string.Format("Categoria.aspx?tipo={0}&pagina=1", Request["tipo"].ToString()));
                    h2Titulo.InnerText = "Ongs";
                    bd.Ongs.OrderByDescending(o => o.id).Skip(inicio).Take(LIMITE).ToList().ForEach(o => resultados.Add(new Resultado(o.id, o.Usuarios.nome, o.Usuarios.frase, o.Usuarios.Imagens.nome)));
                }
                else
                {
                    ultimo = Convert.ToInt32(Math.Ceiling(bd.Projetos.Count() / Convert.ToDouble(LIMITE)));
                    if (pagina > ultimo)
                        Response.Redirect(string.Format("Categoria.aspx?tipo={0}&pagina=1", Request["tipo"].ToString()));
                    h2Titulo.InnerText = "Projetos";
                    bd.Projetos.OrderByDescending(p => p.id).Skip(inicio).Take(LIMITE).ToList().ForEach(p => resultados.Add(new Resultado(p.id, p.nome, p.descricao, p.Imagens.nome)));
                }

            }
            catch (Exception)
            {
                Response.Redirect(string.Format("Categoria.aspx?tipo={0}&pagina=1", Request["tipo"].ToString()));
            }

        }
    }
}