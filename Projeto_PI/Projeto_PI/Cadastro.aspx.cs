using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Projeto_PI.Models;
namespace Projeto_PI
{
    public partial class Cadastro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnCadastroOng_Click(object sender, EventArgs e)
        {
            EntidadesProjetoPI banco = new EntidadesProjetoPI();
            banco.setOngs(txtNomeOng.Text, txtEmailOng.Text, txtSenhaOng.Text, txtRazaoSocial.Text, txtCNPJ.Text, txtTelefone.Text, txtRepresentante.Text, txtCargo.Text, txtCEPOng.Text, txtNumeroOng.Text, txtNumeroOng.Text, txtEnderecoOng.Text, txtCidadeOng.Text, ddlEstadoOng.SelectedValue);
        }

        protected void btnCadastraDoador_Click(object sender, EventArgs e)
        {
            EntidadesProjetoPI banco = new EntidadesProjetoPI();
            banco.setDoadores(txtNomeDoador.Text, txtEmailDoador.Text, txtSenhaDoador.Text, txtCPFDoador.Text, txtCEPDoador.Text, txtNumeroDoador.Text, txtBairroDoador.Text, txtEnderecoDoador.Text, txtCidadeDoador.Text, ddlEstadoDoador.SelectedValue);
        }
    }
}