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
    public partial class Busca : System.Web.UI.Page
    {
        protected List<Projetos> projetos;
        protected List<Ongs> ongs;
        protected void Page_PreInit(object sender, EventArgs e)
        {
            Page.VerificaAcessoLogado();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            EntidadesProjetoPI bd = new EntidadesProjetoPI();
            if (Request["busca"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            string busca = Request["busca"].ToString();
            h1TituloBusca.InnerText += " \"" + busca + "\"";
            busca = busca.ToLower();
            projetos = bd.Projetos.Where(p => p.nome.ToLower().Contains(busca) || p.descricao.ToLower().Contains(busca) || p.tipo.ToLower()==busca).ToList();
            ongs = bd.Ongs.Where(o => o.Usuarios.nome.ToLower().Contains(busca) || o.Usuarios.frase.ToLower().Contains(busca) || o.Usuarios.Sobre.Where(s => s.titulo.ToLower().Contains(busca) || s.texto.ToLower().Contains(busca)).Count() > 0).ToList();
        }
    }
}