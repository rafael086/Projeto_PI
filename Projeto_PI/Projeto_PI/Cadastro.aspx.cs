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
                string nome = txtNomeOng.Text, 
                    email = txtEmailOng.Text, 
                    senha = txtSenhaOng.Text, 
                    razaoSocial = txtRazaoSocial.Text, 
                    cnpj = txtCNPJ.Text, 
                    telefone = txtTelefone.Text, 
                    representante = txtRepresentante.Text, 
                    cargo = txtCargo.Text, 
                    cep = txtCEPOng.Text, 
                    numero = txtNumeroOng.Text, 
                    bairro = txtBairroOng.Text, 
                    endereco = txtEnderecoOng.Text, 
                    cidade = txtCidadeOng.Text, 
                    estado = ddlEstadoOng.SelectedValue;
                Verificadores.VerificaParametrosOngs(ref nome, ref email, ref senha, ref razaoSocial, ref cnpj, ref telefone, ref representante, ref cargo, ref cep, ref numero, ref bairro, ref endereco, ref cidade, ref estado, false);
                EntidadesProjetoPI bd = new EntidadesProjetoPI();
                bd.setOngs(nome, email, senha, razaoSocial, cnpj, telefone, representante, cargo, cep, numero, bairro, endereco, cidade, estado);
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
                string nome = txtNomeDoador.Text,
                    email = txtEmailDoador.Text,
                    senha = txtSenhaDoador.Text,
                    cpf = txtCPF.Text,
                    cep = txtCEPDoador.Text,
                    numero = txtNumeroDoador.Text,
                    bairro = txtBairroDoador.Text,
                    endereco = txtEnderecoDoador.Text,
                    cidade = txtCidadeDoador.Text,
                    estado = ddlEstadoDoador.SelectedValue;
                Verificadores.ValidaParametrosDoadores(ref nome, ref email, ref senha, ref cpf, ref cep, ref numero, ref bairro, ref endereco, ref cidade, ref estado, false);
                EntidadesProjetoPI bd = new EntidadesProjetoPI();
                bd.setDoadores(nome, email, senha, cpf, cep, numero, bairro, endereco, cidade, estado);
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