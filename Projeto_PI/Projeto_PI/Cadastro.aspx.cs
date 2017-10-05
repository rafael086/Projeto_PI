using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Projeto_PI.Models;
using Projeto_PI.Apoio;
using System.Web.Services;

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
                Verificadores.VerificaParametrosSetOngs(txtNomeOng.Text, txtEmailOng.Text, txtSenhaOng.Text, txtRazaoSocial.Text, txtCNPJ.Text, txtTelefone.Text, txtRepresentante.Text, txtCargo.Text, txtCEPOng.Text, txtNumeroOng.Text, txtNumeroOng.Text, txtEnderecoOng.Text, txtCidadeOng.Text, ddlEstadoOng.SelectedValue);
            }
            catch (Exception ex)
            {
                lblErros.Text = ex.Message;
                lblErros.Visible = true; 
            }
        }

        protected void btnCadastraDoador_Click(object sender, EventArgs e)
        {
            try
            {
                Verificadores.ValidaParametrosSetDoadores(txtNomeDoador.Text, txtEmailDoador.Text, txtSenhaDoador.Text, txtCPFDoador.Text, txtCEPDoador.Text, txtNumeroDoador.Text, txtBairroDoador.Text, txtEnderecoDoador.Text, txtCidadeDoador.Text, ddlEstadoDoador.SelectedValue);
            }
            catch (Exception ex)
            {
                lblErros.Text = ex.Message;
                lblErros.Visible = true;
            }
        }

        /// <summary>
        /// busca um endereco com base no cep informado
        /// </summary>
        /// <param name="cep">cep de base para busca</param>
        /// <returns>um array de string com os dados do endereco ou null se nada for encontrado(ou seja lançada uma exception)</returns>
        [WebMethod]
        public static string[] BuscaCep(string cep)
        {
            try
            {
                var correios = new WSCorreios.AtendeClienteClient();
                cep = cep.TiraMascara();
                var end = correios.consultaCEP(cep);
                string rua = end.end;
                string bairro = end.bairro;
                string cidade = end.cidade;
                string estado = end.uf;
                string[] vet = { rua, bairro, cidade, estado };
                return vet;
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message) ;
                return null;
            }
        }
    }
}