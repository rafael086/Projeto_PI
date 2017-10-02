using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Projeto_PI.Models;
using Projeto_PI.Apoio;
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
            banco.setOngs(txtNomeOng.Text.Trim(), txtEmailOng.Text.Trim(), txtSenhaOng.Text.Trim(), txtRazaoSocial.Text.Trim(), txtCNPJ.Text.TiraMascara(), txtTelefone.Text.TiraMascara(), txtRepresentante.Text.Trim(), txtCargo.Text.Trim(), txtCEPOng.Text.TiraMascara(), txtNumeroOng.Text.Trim(), txtNumeroOng.Text.Trim(), txtEnderecoOng.Text.Trim(), txtCidadeOng.Text.Trim(), ddlEstadoOng.SelectedValue.Trim());
        }

        protected void btnCadastraDoador_Click(object sender, EventArgs e)
        {
            EntidadesProjetoPI banco = new EntidadesProjetoPI();
            banco.setDoadores(txtNomeDoador.Text.Trim(), txtEmailDoador.Text.Trim(), txtSenhaDoador.Text.Trim(), txtCPFDoador.Text.TiraMascara(), txtCEPDoador.Text.TiraMascara(), txtNumeroDoador.Text.Trim(), txtBairroDoador.Text.Trim(), txtEnderecoDoador.Text.Trim(), txtCidadeDoador.Text.Trim(), ddlEstadoDoador.SelectedValue.Trim());
        }
    }
}