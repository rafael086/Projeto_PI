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
        enum TipoUsuario { Ong, Doador};

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
        public Usuarios usuario;

        /// <summary>
        /// verifica se o acesso a pagina esta sendo via metodo POST ou GET
        /// </summary>
        /// <returns>true - se via POST, false - se via GET</returns>
        /// <exception cref="HttpException"></exception>
        private bool VerificaAcesso()
        {
            if (Session["usuario"] != null && Session["usuario"].ToString() == Request["usuario"].ToString())
            {
                return true;
            }
            else if (Request["usuario"] != null)
            {
                return false;
            }
            else
            {
                throw new HttpException("Nenhum dado foi enviado via HTTP");
            }
        }

        /// <summary>
        /// atualiza os campos da pagina
        /// </summary>
        private void AtualizaCampos()
        {
            hNomeUsuario.InnerText = usuario.nome;
            pTextoComplementar.InnerText = (string.IsNullOrEmpty(usuario.frase) ? "Coloque uma frase aqui" : usuario.frase);
            imgPerfil.ImageUrl = (usuario.Imagens == null) ? "imagens/imgDefault.png" : "Upload Imagens/" + usuario.Imagens.nome;
        }

        /// <summary>
        /// Salva a imagem no banco e na pasta
        /// </summary>
        /*
        private void SalvaImagem()
        {
            if (!fuImagem.HasFile)
            {
                throw new Exception("Nenhum arquivo foi enviado");
            }
            string extensao = Path.GetExtension(fuImagem.FileName);
            string arquivo = Server.MapPath("Upload Imagens\\");
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
            var img = bd.Imagens.Add(new Imagens { nome = nomeImg });
            idImg = img.id;
        }
        */
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
                if (VerificaAcesso())
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
            //captura o id passado
            id = (Session["usuario"] != null) ? Convert.ToInt32(Session["usuario"].ToString()) : Convert.ToInt32(Request["usuario"].ToString());

            usuario = bd.Usuarios.Where(u => u.id == id).Single();
            
            if (VerificaAcesso())
            {
                modalAlteracoes.Visible = true;
                if (usuario.Doadores != null)
                {
                    //sectionProjetos.Visible = false;
                    sectionPessoal.Visible = false;
                    sectionVoluntarios.Visible = false;
                }
            }
            else
            {
                btnAddConteudoSobre.Visible = false;
                btnAddConteudoPessoal.Visible = false;
                sectionVoluntarios.Visible = false;
                aEditarPerfil.Visible = false;
                modalAlteracoes.Visible = false;
            }
            AtualizaCampos();
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
            //da um update na ong
            bd.Entry(usuario).State = EntityState.Modified;
            bd.SaveChanges();
            AtualizaCampos();
        }
    }
}