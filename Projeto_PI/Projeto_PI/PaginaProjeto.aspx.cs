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
    public partial class PaginaProjeto : System.Web.UI.Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
            Page.VerificaAcessoLogado();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            EntidadesProjetoPI bd = new EntidadesProjetoPI();
            try
            {
                int id = Convert.ToInt32(Request["projeto"].ToString());
                Projetos projeto = bd.Projetos.Where(p => p.id == id).Single();
                h2NomeProjeto.InnerHtml = projeto.nome;
                imgProjeto.ImageUrl = "Upload Imagens/"+projeto.Imagens.nome;
                pDescricao.InnerHtml = projeto.descricao;
            }
            catch (Exception)
            {
                Response.Redirect("Default.aspx");
            }
        }
    }
}