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
        /// id do usuario
        /// </summary>
        int id;

        /// <summary>
        /// referencia ao banco de dados
        /// </summary>
        EntidadesProjetoPI bd = new EntidadesProjetoPI();

        /// <summary>
        /// referencia ao usuario
        /// </summary>
        Usuarios usuario;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
            {
                Response.Redirect("default.aspx");
            }
            else
            {
                id = Convert.ToInt32(Session["usuario"].ToString());
                usuario = bd.Usuarios.Where(u => u.id == id).Single();
                opcProjeto.Visible = (usuario.Doadores == null) ? true : false;
            }
        }

        protected void btnIniciarProjeto_Click(object sender, EventArgs e)
        {
            
            string nomeProjeto = txtNomeProjeto.Text;
            string descricaoProjeto = txtDescricaoProjeto.Text;
            string meta = txtMeta.Text;
            int idImg = fuBanner.SalvaImagem(Server.MapPath("Upload Imagens\\"));
            string tipoProjeto;
            if (!opcProjeto.Visible)
            {
                tipoProjeto = "Ação";
            }
            else
            {
                tipoProjeto = (radioDoacao.Checked) ? "Doacao" : "Ação";
            }
            usuario.Projetos.Add(new Projetos { nome = nomeProjeto, descricao = descricaoProjeto, meta = meta, banner = idImg, tipo = tipoProjeto });
            bd.Entry(usuario).State = EntityState.Modified;
            bd.SaveChanges();
            Response.Redirect("PaginaUsuario.aspx?usuario="+id);
        }
    }
}