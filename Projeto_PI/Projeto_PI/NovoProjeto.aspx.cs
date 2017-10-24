using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Projeto_PI.Apoio;
using Projeto_PI.Models;
using System.Data.Entity;

namespace Projeto_PI
{
    public partial class NovoProjeto : System.Web.UI.Page
    {
        /// <summary>
        /// referencia ao banco de dados
        /// </summary>
        EntidadesProjetoPI bd = new EntidadesProjetoPI();

        /// <summary>
        /// referencia ao usuario
        /// </summary>
        private Usuarios usuario;
        protected Doadores doador;
        protected Projetos projeto;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(Session["usuario"].ToString());
                usuario = bd.Usuarios.Where(u => u.id == id).Single();
                doador = bd.Usuarios.OfType<Doadores>().Where(u => u.id == id).SingleOrDefault();
                if (Request["acao"].ToString() == "criar")
                {
                    opcProjeto.Visible = (doador == null) ? true : false;
                }
                else if (Request["acao"].ToString() == "editar")
                {
                    opcProjeto.Visible = false;
                    btnEditarProjeto.Visible = true;
                    btnIniciarProjeto.Visible = false;
                    int idProjeto = Convert.ToInt32(Request["projeto"].ToString());
                    projeto = bd.Projetos.Where(p => p.id == idProjeto).Single();
                    txtNomeProjeto.Attributes["value"] = projeto.nome;
                    txtDescricaoProjeto.Attributes["value"] = projeto.descricao;//NÃO FUNFA, Consertar
                    txtMeta.Attributes["value"] = (projeto.tipo.TrimEnd() == "Doação") ? Convert.ToDecimal(projeto.meta).ToString("0.00") : projeto.meta;
                }
                else
                {
                    Response.Redirect("default.aspx");
                }
            }
            catch (Exception)
            {
                Response.Redirect("default.aspx");
            }
        }

        protected void btnIniciarProjeto_Click(object sender, EventArgs e)
        {
            string nomeProjeto = txtNomeProjeto.Text;
            string descricaoProjeto = txtDescricaoProjeto.Text;
            string meta;
            int idImg = fuBanner.SalvaImagem(Server.MapPath("Upload Imagens\\"));
            string tipoProjeto;
            if (!opcProjeto.Visible)
            {
                tipoProjeto = "Ação";
                meta = txtMeta.Text;
            }
            else
            {
                meta = (radioDoacao.Checked) ? Convert.ToDouble(txtMeta.Text).ToString() : txtMeta.Text;
                tipoProjeto = (radioDoacao.Checked) ? "Doação" : "Ação";
            }
            usuario.Projetos.Add(new Projetos { nome = nomeProjeto, descricao = descricaoProjeto, meta = meta, banner = idImg, tipo = tipoProjeto });
            bd.SaveChanges();
            Response.Redirect("PaginaUsuario.aspx?usuario=" + usuario.id);
        }

        protected void btnEditarProjeto_Click(object sender, EventArgs e)
        {
            projeto.nome = txtNomeProjeto.Text;
            projeto.descricao = txtDescricaoProjeto.Text;
            projeto.meta = (projeto.tipo.TrimEnd() == "Doação") ? Convert.ToDouble(txtMeta.Text).ToString() : txtMeta.Text;
            projeto.banner = fuBanner.SalvaImagem(Server.MapPath("Upload Imagens\\"));
            bd.Entry(projeto).State = EntityState.Modified;
            bd.SaveChanges();
            Response.Redirect("PaginaUsuario.aspx?usuario=" + usuario.id);
        }
    }
}