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
    public partial class Default : System.Web.UI.Page
    {
        protected List<Ongs> ongs = new EntidadesProjetoPI().Usuarios.OfType<Ongs>().OrderByDescending(o => o.id).Take(3).ToList();
        protected List<Projetos> projetos = new EntidadesProjetoPI().Projetos.OrderByDescending(p => p.id).Take(3).ToList();
        protected void Page_PreInit(object sender, EventArgs e)
        {
            Page.VerificaAcessoLogado();
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}