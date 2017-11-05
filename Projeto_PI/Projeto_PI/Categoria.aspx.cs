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
        private int inicio;
        /// <summary>
        ///define a ultima pagina
        /// </summary>
        private int ultimo;
        /// <summary>
        /// referencia as entidades do banco de dados
        /// </summary>
        private EntidadesProjetoPI bd = new EntidadesProjetoPI();


        /// <summary>
        /// objeto generico para que projetos e ongs possam ser exibidas da mesma maneira
        /// </summary>
        protected class Resultado
        {
            private Resultado(int id, string nome, string descricao, string imagem)
            {
                Id = id;
                Nome = nome;
                Descricao = descricao;
                Imagem = imagem;

            }
            public Resultado(int id, string nome, string descricao, string imagem, string tipo, int apoios, string meta, string estilo, int progresso) : this(id, nome, descricao, imagem)
            {
                Tipo = tipo;
                Apoios = apoios;
                Meta = meta;
                Estilo = estilo;
                Progresso = progresso;
            }
            public Resultado(int id, string nome, string descricao, string imagem, int projetos) : this(id, nome, descricao, imagem)
            {
                Projetos = projetos;
            }

            public int Id { get; }
            public string Nome { get; }
            public string Descricao { get; }
            public string Imagem { get; }
            public int Projetos { get; }
            public string Tipo { get; }
            public int Apoios { get; }
            public string Meta { get; }
            public string Estilo { get; }
            public int Progresso { get; }
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
                aAnterior.Visible = false;
                aProximo.Visible = false;
                int pagina = (Convert.ToInt32(Request["pagina"]) < 1) ? 1 : Convert.ToInt32((Request["pagina"]).ToString());     
                inicio = (pagina - 1) * LIMITE;
                if (VerificaTipoConsulta())//se o acesso for para ongs
                {
                    ultimo = Convert.ToInt32(Math.Ceiling(bd.Usuarios.OfType<Ongs>().Count() / Convert.ToDouble(LIMITE)));//define a ultima pagina
                    if (pagina > ultimo)//se, por um acaso, a pagina que deve ser exibida for maior que a ultima retorna para a primeira
                        Response.Redirect(string.Format("Categoria.aspx?tipo={0}&pagina=1", Request["tipo"].ToString()));
                    h2Titulo.InnerText = "Ongs";
                    bd.Usuarios.OfType<Ongs>().OrderByDescending(o => o.id).Skip(inicio).Take(LIMITE).ToList().ForEach(o => resultados.Add(new Resultado(o.id, o.nome, o.frase, o.Imagens.nome, o.Projetos.Count)));
                }
                else
                {
                    ultimo = Convert.ToInt32(Math.Ceiling(bd.Projetos.Count() / Convert.ToDouble(LIMITE)));//define a ultima pagina
                    if (pagina > ultimo)//se, por um acaso, a pagina que deve ser exibida for maior que a ultima retorna para a primeira
                        Response.Redirect(string.Format("Categoria.aspx?tipo={0}&pagina=1", Request["tipo"].ToString()));
                    h2Titulo.InnerText = "Projetos";
                    bd.Projetos.OrderByDescending(p => p.id).Skip(inicio).Take(LIMITE).ToList().ForEach(p =>
                    {
                        //neste caso o try catch serve para verificar se o projeto é acao ou doaçao, se for uma acao uma InvalidOperationException é lançada e esse projeto e incluido a lista de resultados
                        try
                        {
                            resultados.Add(new Resultado(p.id, p.nome, p.descricao, p.Imagens.nome, p.tipo.TrimEnd(), p.Apoios.Count, p.meta, p.EscreveProgresso(), p.ProgressoProjeto()));
                        }
                        catch (InvalidOperationException)
                        {
                            resultados.Add(new Resultado(p.id, p.nome, p.descricao, p.Imagens.nome, p.tipo.TrimEnd(), p.Apoios.Count, p.meta, null, 0));
                        }
                    });
                }
                if (pagina > 1)
                {
                    aAnterior.Visible = true;
                    aAnterior.Attributes["href"] = string.Format("Categoria.aspx?tipo={0}&pagina={1}", Request["tipo"].ToString(), pagina - 1);
                }
                if (pagina != ultimo)
                {
                    aProximo.Visible = true;
                    aProximo.Attributes["href"] = string.Format("Categoria.aspx?tipo={0}&pagina={1}", Request["tipo"].ToString(), pagina + 1);
                }
            }
            catch (Exception)
            {
                Response.Redirect(string.Format("Categoria.aspx?tipo={0}&pagina=1", Request["tipo"].ToString()));
            }
        }
    }
}