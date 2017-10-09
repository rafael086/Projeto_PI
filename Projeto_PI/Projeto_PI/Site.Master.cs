using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Projeto_PI.Models;

namespace Projeto_PI
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEntrar_Click(object sender, EventArgs e)
        {

            string email = txtEmail.Text;
            string senha = txtSenha.Text;
            EntidadesProjetoPI bd = new EntidadesProjetoPI();
            try
            {
                int id = bd.Usuarios.Where(u => u.email == email && u.senha == senha).Select(u => u.id).Single();
                Session["usuario"] = id;
                Response.Redirect("PaginaUsuario.aspx?usuario=" + id, false);
            }
            catch (Exception)
            {
                lblErro.Visible = true;
            }
        }
    }
}