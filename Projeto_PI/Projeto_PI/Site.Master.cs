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
            try
            {
                string email = txtEmail.Text;
                string senha = txtSenha.Text;
                EntidadesProjetoPI bd = new EntidadesProjetoPI();
                int id = bd.Usuarios.Where(u => u.email == email && u.senha == senha).Select(u => u.id).Single();
                int ong = bd.Ongs.Count(u => u.id == id);
                int doador = bd.Ongs.Count(u => u.id == id);
                if (ong == 1)
                {
                    Session["usuario"] = id;
                    Response.Redirect("PaginaOng.aspx?usuario=" + id, false);
                }
                else
                {

                }
            }
            catch (Exception ex)
            {
                lblErro.Visible = true;
            }
        }
    }
}