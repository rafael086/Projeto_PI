using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Projeto_PI.Apoio;
using Projeto_PI.Models;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;

namespace Projeto_PI
{
    public partial class PaginaProjeto : System.Web.UI.Page
    {
        /// <summary>
        /// referencia ao banco de dados
        /// </summary>
        private EntidadesProjetoPI bd = new EntidadesProjetoPI();
        /// <summary>
        /// referencia a entidade projetos
        /// </summary>
        public Projetos projeto;
        /// <summary>
        /// id do doador
        /// </summary>
        private int idDoador;
        protected void Page_PreInit(object sender, EventArgs e)
        {
            Page.VerificaAcessoLogado();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            //deixa o botao de apoiado invisivel e atribui um evento ServerClick
            modalApoio.ClientIDMode = ClientIDMode.Static;
            formComentario.ClientIDMode = ClientIDMode.Static;
            divConfiguraProjeto.Visible = false;
            aApoiado.Visible = false;
            h3Status.Visible = false;
            aApoiado.ServerClick += AApoiado_ServerClick;
            btnExcluir.ServerClick += btnExcluir_ServerClick;
            btnFinalizarProjeto.ServerClick += BtnFinalizarProjeto_ServerClick;
            try
            {
                //captura o id do projeto via url(get)
                int idProjeto = Convert.ToInt32(Request["projeto"].ToString());
                projeto = bd.Projetos.Where(p => p.id == idProjeto).Single();
                spanArrecadado.Visible = (projeto.tipo.TrimEnd() == "Doação") ? true : false;
                modalApoio.ClientIDMode = ClientIDMode.Static;
                //se o usuario for do tipo ONG deixa o botao apoiar invisivel
                if (Session["usuario"] != null && bd.Usuarios.OfType<Doadores>().AsEnumerable().Where(d => d.id == Convert.ToInt32(Session["usuario"].ToString())).SingleOrDefault() == null)
                {
                    aApoiar.Visible = false;
                }
                //se o usuario não estiver logado o botao de apoiar abre a modal de login
                if (Session["usuario"] == null)
                {
                    formComentario.Visible = false;
                    aApoiar.Attributes["data-target"] = "#modalLogin";
                    aApoiar.Attributes["onclick"] = "desativaFormsCadastro()";
                    modalApoio.Visible = false;
                }
                else
                {
                    //captura o id do Doador via Session(post)
                    idDoador = Convert.ToInt32(Session["usuario"].ToString());
                    //se o usuario não tiver apoiado o projeto configura o atribui propriedades ao elemento <a>
                    if (projeto.Apoios.Count(a => a.idDoador == idDoador) == 0 && projeto.tipo.TrimEnd() == "Doação")
                    {
                        aApoiar.Attributes["data-target"] = "#modalApoio";
                    }
                    //se o usuario não tiver apoioado o projeto e ele for um projeto do tipo 'Ação' inputa a tag<a/> um evento de click via servidor para que não seja necessario o aparecimento do form de cc e valor
                    else if (projeto.Apoios.Count(a => a.idDoador == idDoador) == 0 && projeto.tipo.TrimEnd() == "Ação")
                    {
                        aApoiar.Attributes.Remove("data-toggle");
                        aApoiar.ServerClick += btnApoiar_Click;
                        modalApoio.Visible = false;
                    }
                    else//caso contrario faz o botao de apoiado aparecer e deixa a modal de form de apoio e o botao de apoiar invisivel
                    {
                        aApoiado.Visible = true;
                        aApoiar.Visible = false;
                        modalApoio.Visible = false;
                    }
                    if (projeto.idUsuario == idDoador)
                    {
                        divConfiguraProjeto.Visible = true;
                        aApoiar.Visible = false;
                        modalApoio.Visible = false;
                    }
                }
                if (projeto.finalizado)//se o projeto ja estiver finalizado
                {
                    btnFinalizarProjeto.Visible = false;
                    h3Status.Visible = true;
                    modalApoio.Visible = false;
                    aApoiar.Visible = false;
                }
                //atribui os dados aos elementos
                h2NomeProjeto.InnerText = projeto.nome;
                spanArrecadado.InnerText = "Arrecadado: " + string.Format("{0:0.00}", projeto.arrecadado);
                spanMeta.InnerText = " Meta: " + projeto.meta;
                spanApoios.InnerText = string.Format("Apoiado por {0} pessoas", projeto.Apoios.Count(a => a.idProjeto == idProjeto).ToString());
                imgProjeto.ImageUrl = "Upload Imagens/" + projeto.Imagens.nome;
                pDescricao.InnerText = projeto.descricao;
            }
            catch (Exception)
            {
                //se ocorrer alguma excessao redireciona a pagina inicial
                Response.Redirect("Default.aspx");
            }
        }

        private void BtnFinalizarProjeto_ServerClick(object sender, EventArgs e)
        {
            projeto.finalizado = true;
            bd.Entry(projeto).State = EntityState.Modified;
            bd.SaveChanges();
            Response.Redirect(Request.RawUrl);
        }

        private void btnExcluir_ServerClick(object sender, EventArgs e)
        {
            bd.Projetos.Remove(projeto);
            bd.Entry(projeto).State = EntityState.Deleted;
            bd.SaveChanges();
            Response.Redirect("PaginaUsuario.aspx?usuario=" + Session["usuario"].ToString());
        }

        /// <summary>
        /// Ocorre quando o botao de apoiado é clicado, remove o apoio
        /// </summary>
        private void AApoiado_ServerClick(object sender, EventArgs e)
        {
            Apoios apoio = projeto.Apoios.Where(a => a.idDoador == idDoador).Single();
            if (projeto.tipo.TrimEnd() == "Doação")
                projeto.arrecadado -= apoio.valor;
            projeto.Apoios.Remove(apoio);
            bd.Entry(projeto).State = EntityState.Modified;
            bd.SaveChanges();
            Response.Redirect(Request.RawUrl);
        }

        protected void btnApoiar_Click(object sender, EventArgs e)
        {
            CreditCardAttribute valida = new CreditCardAttribute();
            try
            {
                decimal valor = 0m;
                if (projeto.tipo.TrimEnd() == "Doação")
                {
                    string cartao = txtCartaoCredito.Text;
                    valor = Convert.ToDecimal(txtValor.Text);
                    //ESTOU SEM NET ENTÃO VOU DEIXAR PASSAR PARA FIM DE TESTES, MAS DEPOIS MUDAR PARA !valida.IsValid(txtCartaoCredito.Text)
                    if (valida.IsValid(txtCartaoCredito.Text))
                    {
                        lblErro.Text = "Cartão de credito invalido";
                        lblErro.Visible = true;
                        return;
                    }
                    if (valor <= 0)
                    {
                        lblErro.Text = "Um valor invalido foi passado como doacao";
                        lblErro.Visible = true;
                        return;
                    }
                    projeto.arrecadado += valor;
                }
                projeto.Apoios.Add(new Apoios { idDoador = idDoador, idProjeto = projeto.id, valor = valor });
                bd.Entry(projeto).State = EntityState.Modified;
                bd.SaveChanges();
                Response.Redirect(Request.RawUrl);
            }
            catch (FormatException)
            {
                lblErro.Text = "um valor invalido foi passado como doacao";
                lblErro.Visible = true;
                return;
            }
            catch (Exception ex)
            {
                lblErro.Text = ex.InnerException.ToString();
                lblErro.Visible = true;
                return;
            }
        }

        protected void btnEnviarComentario_Click(object sender, EventArgs e)
        {
            string comentario = txtComentario.Text;
            bd.Comentarios.Add(new Comentarios { comentario = comentario, idProjeto = projeto.id, idUsuario = Convert.ToInt32(Session["usuario"].ToString()) });
            bd.SaveChanges();
            Response.Redirect(Request.RawUrl);
        }
    }
}