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
            try
            {
                Verificadores.VerificaParametrosSetOngs(txtNomeOng.Text, txtEmailOng.Text, txtSenhaOng.Text, txtRazaoSocial.Text, txtCNPJ.Text, txtTelefone.Text, txtRepresentante.Text, txtCargo.Text, txtCEPOng.Text, txtNumeroOng.Text.Trim(), txtNumeroOng.Text, txtEnderecoOng.Text, txtCidadeOng.Text, ddlEstadoOng.SelectedValue);
            }
            catch (Exception ex)
            {
                lblErros.Text = ex.Message;
                lblErros.Visible = true; 
            }
        }

        protected void btnCadastraDoador_Click(object sender, EventArgs e)
        {
            EntidadesProjetoPI banco = new EntidadesProjetoPI();
            banco.setDoadores(txtNomeDoador.Text.Trim(), txtEmailDoador.Text.Trim(), txtSenhaDoador.Text.Trim(), txtCPFDoador.Text.TiraMascara(), txtCEPDoador.Text.TiraMascara(), txtNumeroDoador.Text.Trim(), txtBairroDoador.Text.Trim(), txtEnderecoDoador.Text.Trim(), txtCidadeDoador.Text.Trim(), ddlEstadoDoador.SelectedValue.Trim());
        }
    }
}