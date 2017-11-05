using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Projeto_PI.Models;
using System.Data.Entity;
using System.IO;
using Projeto_PI.Apoio;

namespace Projeto_PI
{
    public partial class PaginaOng : System.Web.UI.Page
    {
        //enum TipoAcesso { Visitante, UsuarioVisitante, Usuario};
        /// <summary>
        /// Define o tipo de ação que esta sendo tomada pelo usuario
        /// </summary>
        private const string ALTERAR_PERFIL = "AlterarPerfil", ALTERAR_SOBRE = "AlterarSobre", ADICIONAR_SOBRE = "AdicionarSobre", ADICIONAR_PESSOAL = "AdicionarPessoal", ALTERAR_PESSOAL = "AlterarPessoal";

        /// <summary>
        /// referencia ao banco de dados
        /// </summary>
        private EntidadesProjetoPI bd = new EntidadesProjetoPI();

        /// <summary>
        /// id do usuario
        /// </summary>
        private int id;

        /// <summary>
        /// id da imagem
        /// </summary>
        private int idImg;

        /// <summary>
        /// Referancia a entidade Usuario
        /// </summary>
        protected Usuarios usuario;

        /// <summary>
        /// referencia a um voluntario
        /// </summary>
        private Doadores voluntario;

        /// <summary>
        /// referencia a entidade doador 
        /// </summary>
        protected Doadores doador;

        /// <summary>
        /// referencia a entidade Ongs
        /// </summary>
        protected Ongs ong;
        /// <summary>
        /// Verifica se o usuario esta sendo enviado por sessao ou via url
        /// caso seja passado por sessao carrega a master page de menu de usuarios
        /// caso seja passado por via url carrega o master page padrão
        /// caso nenhum dos dois seja passado volta a pagina default(inicial)
        /// </summary>
        protected void Page_PreInit(object sender, EventArgs e)
        {
            try
            {
                if (MetodosDeApoio.TipoAcesso.Usuario == Page.VerificaTipoAcesso() || MetodosDeApoio.TipoAcesso.UsuarioVisitante == Page.VerificaTipoAcesso())
                {
                    Page.MasterPageFile = "MenuLogado.master";
                }
                else
                {
                    Page.MasterPageFile = "Site.master";
                }
            }
            catch (Exception)
            {
                Response.Redirect("Default.aspx");
            }
        }
        /// <summary>
        /// faz as configurações nessessarias em tempo de carregamento da pagina
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {
            //torna os IDs dos controles HTML estaticos
            aExcluir.ServerClick += AExcluir_ServerClick;
            aExcluir.ClientIDMode = ClientIDMode.Static;
            btnAddConteudoPessoal.ClientIDMode = ClientIDMode.Static;
            btnAddConteudoSobre.ClientIDMode = ClientIDMode.Static;
            hNomeUsuario.ClientIDMode = ClientIDMode.Static;
            sectionVoluntarios.ClientIDMode = ClientIDMode.Static;
            pTextoComplementar.ClientIDMode = ClientIDMode.Static;
            hiddenAcao.ClientIDMode = ClientIDMode.Static;
            hiddenAlteracao.ClientIDMode = ClientIDMode.Static;
            modalAlteracoes.ClientIDMode = ClientIDMode.Static;
            sectionPessoal.ClientIDMode = ClientIDMode.Static;
            sectionProjetos.ClientIDMode = ClientIDMode.Static;
            sectionHistoricoDoacoes.ClientIDMode = ClientIDMode.Static;
            modalDetalhesVoluntarios.ClientIDMode = ClientIDMode.Static;
            hiddenVoluntario.ClientIDMode = ClientIDMode.Static;
            modalDetalhesVoluntarios.Visible = false;
            //captura o id passado
            id = Convert.ToInt32(Request["usuario"].ToString());

            usuario = bd.Usuarios.Where(u => u.id == id).Single();
            ong = bd.Usuarios.OfType<Ongs>().Where(o => o.id == id).SingleOrDefault();
            doador = bd.Usuarios.OfType<Doadores>().Where(d => d.id == id).SingleOrDefault();
            MetodosDeApoio.TipoAcesso acesso = Page.VerificaTipoAcesso();
            if (acesso == MetodosDeApoio.TipoAcesso.Usuario)
            {
                modalAlteracoes.Visible = true;
                sectionVoluntariar.Visible = false;
                if (doador != null)//se for um doador
                {
                    //sectionProjetos.Visible = false;
                    sectionPessoal.Visible = false;
                    sectionVoluntarios.Visible = false;
                    sectionVoluntariar.Visible = false;
                }
                else
                {
                    btnConfirmaVoluntario.ServerClick += BtnConfirmaVoluntario_ServerClick;
                    btnRejeitaVoluntario.ServerClick += BtnRejeitaVoluntario_ServerClick;
                    modalDetalhesVoluntarios.Visible = true;
                    sectionHistoricoDoacoes.Visible = false;
                }
            }
            else
            {
                if (doador != null)//se for um doador
                {
                    //sectionProjetos.Visible = false;
                    sectionPessoal.Visible = false;
                    sectionVoluntarios.Visible = false;
                    sectionVoluntariar.Visible = false;
                }
                else
                {
                    if (acesso == MetodosDeApoio.TipoAcesso.UsuarioVisitante && bd.Usuarios.OfType<Doadores>().AsEnumerable().Where(u => u.id == Convert.ToInt32(Session["usuario"].ToString())).SingleOrDefault() != null)//se for um usuario visitante e do tipo doador
                    {
                        voluntario = bd.Usuarios.OfType<Doadores>().AsEnumerable().Where(d => d.id == Convert.ToInt32(Session["usuario"].ToString())).Single();
                        if (ong.Voluntarios.Count(v => v.idDoador == voluntario.id) <= 0)
                        {
                            aDesvoluntariar.Visible = false;
                            aVoluntariar.ServerClick += AVoluntariar_ServerClick;
                        }
                        else
                        {
                            aVoluntariar.Visible = false;
                            aDesvoluntariar.ServerClick += ADesvoluntariar_ServerClick;
                        }
                    }
                    else if (acesso == MetodosDeApoio.TipoAcesso.UsuarioVisitante && bd.Usuarios.OfType<Ongs>().AsEnumerable().Where(u => u.id == Convert.ToInt32(Session["usuario"].ToString())).SingleOrDefault() != null)//se for um usuario visitante e do tipo ong
                    {
                        aVoluntariar.Visible = false;
                        aDesvoluntariar.Visible = false;
                    }
                    else
                    {
                        aVoluntariar.Attributes["data-toggle"] = "modal";
                        aVoluntariar.Attributes["data-target"] = "#modalLogin";
                        aDesvoluntariar.Visible = false;
                    }
                    sectionHistoricoDoacoes.Visible = false;
                }
                btnAddConteudoSobre.Visible = false;
                btnAddConteudoPessoal.Visible = false;
                sectionVoluntarios.Visible = false;
                aEditarPerfil.Visible = false;
                modalAlteracoes.Visible = false;
            }
            hNomeUsuario.InnerText = usuario.nome;
            pTextoComplementar.InnerText = (string.IsNullOrEmpty(usuario.frase) ? "Coloque uma frase aqui" : usuario.frase);
            imgPerfil.ImageUrl = "Upload Imagens/" + usuario.Imagens.nome;
        }

        private void BtnRejeitaVoluntario_ServerClick(object sender, EventArgs e)
        {
            int idVoluntario = Convert.ToInt32(hiddenVoluntario.Value);
            Voluntarios voluntario = ong.Voluntarios.Where(v => v.idDoador == idVoluntario).Single();
            voluntario.situacao = "Negado";
            bd.Entry(voluntario).State = EntityState.Modified;
            bd.SaveChanges();
        }

        private void BtnConfirmaVoluntario_ServerClick(object sender, EventArgs e)
        {
            int idVoluntario = Convert.ToInt32(hiddenVoluntario.Value);
            Voluntarios voluntario = ong.Voluntarios.Where(v => v.idDoador == idVoluntario).Single();
            voluntario.situacao = "Confirmado";
            bd.Entry(voluntario).State = EntityState.Modified;
            bd.SaveChanges();
        }

        private void ADesvoluntariar_ServerClick(object sender, EventArgs e)
        {
            ong.Voluntarios.Remove(ong.Voluntarios.Where(v => v.idDoador == voluntario.id).Single());
            bd.SaveChanges();
            Response.Redirect(Request.RawUrl);
        }

        private void AVoluntariar_ServerClick(object sender, EventArgs e)
        {
            ong.Voluntarios.Add(new Voluntarios { idDoador = voluntario.id });
            bd.SaveChanges();
            Response.Redirect(Request.RawUrl);
        }

        private void AExcluir_ServerClick(object sender, EventArgs e)
        {
            Sobre sobre = usuario.Sobre.Where(s => s.id == Convert.ToInt32(hiddenAlteracao.Value)).Single();
            usuario.Sobre.Remove(sobre);
            bd.Entry(sobre).State = EntityState.Deleted;
            bd.SaveChanges();
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            string nome = txtNome.Text.RemoveNaoLetras().TiraEspacoExcedente();
            string frase = txtFrase.Text;
            if (string.IsNullOrEmpty(nome))
            {
                lblErro.Text = "Digite um nome valido";
                return;
            }
            try
            {
                switch (hiddenAcao.Value)
                {
                    case ALTERAR_PERFIL:
                        idImg = fuImagem.SalvaImagem(Server.MapPath("Upload Imagens\\"));
                        usuario.idImagem = idImg;
                        usuario.nome = nome;
                        usuario.frase = frase;
                        break;
                    case ALTERAR_SOBRE:
                        usuario.Sobre.Where(s => s.id == Convert.ToInt32(hiddenAlteracao.Value)).Single().titulo = nome;
                        usuario.Sobre.Where(s => s.id == Convert.ToInt32(hiddenAlteracao.Value)).Single().texto = frase;
                        break;
                    case ADICIONAR_SOBRE:
                        usuario.Sobre.Add(new Sobre { titulo = nome, texto = frase, idUsuario = usuario.id, idImagem = null });
                        break;
                    case ADICIONAR_PESSOAL:
                        idImg = fuImagem.SalvaImagem(Server.MapPath("Upload Imagens\\"));
                        usuario.Sobre.Add(new Sobre { titulo = nome, texto = frase, idUsuario = usuario.id, idImagem = idImg });
                        break;
                    case ALTERAR_PESSOAL:
                        idImg = fuImagem.SalvaImagem(Server.MapPath("Upload Imagens\\"));
                        usuario.Sobre.Where(s => s.id == Convert.ToInt32(hiddenAlteracao.Value)).Single().idImagem = idImg;
                        usuario.Sobre.Where(s => s.id == Convert.ToInt32(hiddenAlteracao.Value)).Single().titulo = nome;
                        usuario.Sobre.Where(s => s.id == Convert.ToInt32(hiddenAlteracao.Value)).Single().texto = frase;
                        break;
                }

            }
            catch (Exception ex)
            {
                lblErro.Text = ex.Message;
            }
            //da um update no usuario
            bd.Entry(usuario).State = EntityState.Modified;
            bd.SaveChanges();
            Response.Redirect(Request.RawUrl);
        }
    }
}