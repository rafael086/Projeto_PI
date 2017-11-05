using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Projeto_PI.Models;
using Projeto_PI.Apoio;
using System.Data.Entity;

namespace Projeto_PI
{
    public partial class EditarCadastro : System.Web.UI.Page
    {
        /// <summary>
        /// id do usuario
        /// </summary>
        int idUsuario;
        /// <summary>
        /// referencia ao bd
        /// </summary>
        EntidadesProjetoPI bd = new EntidadesProjetoPI();
        /// <summary>
        /// Referencia aos usuarios
        /// </summary>
        Usuarios usuario;
        /// <summary>
        /// referencia a entidade ongs
        /// </summary>
        Ongs ong;
        /// <summary>
        /// referencia a entidade doadores
        /// </summary>
        Doadores doador;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                idUsuario = Convert.ToInt32(Session["usuario"].ToString());
                usuario = bd.Usuarios.Where(d => d.id == idUsuario).Single();
                if (!Page.IsPostBack)
                {
                    txtNome.Text = usuario.nome;
                    txtCEP.Text = usuario.Enderecos.cep;
                    ddlEstado.SelectedValue = usuario.Enderecos.estado;
                    txtCidade.Text = usuario.Enderecos.cidade;
                    txtEndereco.Text = usuario.Enderecos.rua;
                    txtBairro.Text = usuario.Enderecos.bairro;
                    txtNumero.Text = usuario.Enderecos.numero;
                    txtEmail.Text = usuario.email;
                }
                if ((doador = bd.Usuarios.OfType<Doadores>().Where(d => d.id == idUsuario).SingleOrDefault()) != null)//se for um doador
                {
                    fgCargo.Visible = false;
                    fgCNPJ.Visible = false;
                    fgRazaoSocial.Visible = false;
                    fgRepresentante.Visible = false;
                    fgTelefone.Visible = false;
                    if (!Page.IsPostBack)
                        txtCPF.Text = doador.cpf;
                }
                else//se for ong
                {
                    ong = bd.Usuarios.OfType<Ongs>().Where(d => d.id == idUsuario).SingleOrDefault();
                    fgCPF.Visible = false;
                    txtCNPJ.Text = ong.cnpj;
                    txtRazaoSocial.Text = ong.razaoSocial;
                    txtTelefone.Text = ong.telefone;
                    txtRepresentante.Text = ong.representante;
                    txtRazaoSocial.Text = ong.razaoSocial;
                }
            }
            catch (Exception)
            {
                Response.Redirect("Default.aspx");
            }
        }

        private void SalvaModificacoes(Usuarios usuario)
        {
            bd.Entry(usuario).State = EntityState.Modified;
            bd.SaveChanges();
        }

        /// <summary>
        /// verifica se o endereco passado para a ong não esta cadastrado para outro usuario
        /// </summary>
        /// <exception cref="ArgumentException">se o endereco passado ja esta cadastrado em outro usuario</exception>
        private void EnderecoOngValido(string cep, string numero, string rua, string bairro, string cidade, string estado)
        {
            Enderecos end = bd.Enderecos.Where(e => e.cep == cep && e.numero == numero && e.rua == rua && e.bairro == bairro && e.cidade == cidade && e.estado == estado).SingleOrDefault();
            if (end != null && end.Usuarios.Count(u => u.id != usuario.id) > 0)//se o endereco ja esta cadastrado para outro usuario
                throw new ArgumentException("O endereco informado ja esta em uso");
            else
            {
                ong.Enderecos.cep = cep;
                ong.Enderecos.numero = numero;
                ong.Enderecos.rua = rua;
                ong.Enderecos.bairro = bairro;
                ong.Enderecos.cidade = cidade;
                ong.Enderecos.estado = estado;
            }
        }

        protected void btnEditaCadastro_Click(object sender, EventArgs e)
        {
            try
            {
                if (ong != null)//se for ong
                {

                    string nome = txtNome.Text,
                         email = txtEmail.Text,
                         senha = txtSenha.Text,
                         razaoSocial = txtRazaoSocial.Text,
                         cnpj = txtCNPJ.Text,
                         telefone = txtTelefone.Text,
                         representante = txtRepresentante.Text,
                         cargo = txtCargo.Text,
                         cep = txtCEP.Text,
                         numero = txtNumero.Text,
                         bairro = txtBairro.Text,
                         rua = txtEndereco.Text,
                         cidade = txtCidade.Text,
                         estado = ddlEstado.SelectedValue;
                    Verificadores.VerificaParametrosOngs(ref nome, ref email, ref senha, ref razaoSocial, ref cnpj, ref telefone, ref representante, ref cargo, ref cep, ref numero, ref bairro, ref rua, ref cidade, ref estado, true);
                    EnderecoOngValido(cep, numero, rua, bairro, cidade, estado);
                    ong.nome = nome;
                    ong.email = email;
                    ong.senha = senha;
                    ong.razaoSocial = razaoSocial;
                    ong.cnpj = cnpj;
                    ong.telefone = telefone;
                    ong.representante = representante;
                    ong.cargo = cargo;
                    SalvaModificacoes(ong);
                }
                else
                {
                    string nome = txtNome.Text,
                       email = txtEmail.Text,
                       senha = txtSenha.Text,
                       cpf = txtCPF.Text,
                       cep = txtCEP.Text,
                       numero = txtNumero.Text,
                       bairro = txtBairro.Text,
                       rua = txtEndereco.Text,
                       cidade = txtCidade.Text,
                       estado = ddlEstado.SelectedValue;
                    Verificadores.ValidaParametrosDoadores(ref nome, ref email, ref senha, ref cpf, ref cep, ref numero, ref bairro, ref rua, ref cidade, ref estado, true);
                    doador.nome = nome;
                    doador.email = email;
                    doador.senha = senha;
                    doador.cpf = cpf;
                    doador.Enderecos.cep = cep;
                    doador.Enderecos.numero = numero;
                    doador.Enderecos.bairro = bairro;
                    doador.Enderecos.rua = rua;
                    doador.Enderecos.cidade = cidade;
                    doador.Enderecos.estado = estado;
                    SalvaModificacoes(doador);
                }
            }
            catch (Exception ex)
            {
                lblErro.Text = ex.Message;
            }

        }
    }
}