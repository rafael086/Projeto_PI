using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Projeto_PI.Models;
using System.Text.RegularExpressions;
namespace Projeto_PI.Apoio
{
    /// <summary>
    /// classe que contem metodos verificadores para as os parametros passados as stored procedures do modelo de dados
    /// </summary>
    public static class Verificadores
    {
        /// <summary>
        /// Verifica se os parametros passados são consistentes de acordo com as regras do sistema e chama insere via stored procedure no banco de dados
        /// </summary>
        /// <exception cref="System.Exception">Se algum parametro for invalido</exception>
        public static void VerificaParametrosSetOngs(string nome, string email, string senha, string razaoSocial, string cnpj, string telefone, string representante, string cargo, string cep, string numero, string bairro, string rua, string cidade, string estado)
        {
            try
            {
                ValidaParametrosUsuario(nome = nome.TiraEspacoExcedente().RemoveNaoLetras(), email, senha = senha.TiraEspacoExcedente());
                ValidaParametrosEndereco(cep = cep.TiraMascara(), numero, bairro = bairro.RemoveNaoLetras().TiraEspacoExcedente(), rua = rua.RemoveNaoLetras().TiraEspacoExcedente(), cidade = cidade.RemoveNaoLetras().TiraEspacoExcedente(), estado = estado.RemoveNaoLetras().TiraEspacoExcedente());
            }
            catch (Exception e)
            {
                throw e;
            }
            if ((razaoSocial = razaoSocial.TiraEspacoExcedente().RemoveNaoLetras()).Length == 0)
            {
                throw new Exception("Digite uma razao social valida");
            }
            if (!(cnpj = cnpj.TiraMascara()).validaCNPJ())
            {
                throw new Exception("Informe um cnpj valido");
            }
            if ((representante = representante.TiraEspacoExcedente().RemoveNaoLetras()).Length == 0)
            {
                throw new Exception("informe um nome de representante valido");
            }
            if ((cargo = cargo.TiraEspacoExcedente().RemoveNaoLetras()).Length == 0)
            {
                throw new Exception("informe um cargo valido");
            }

            EntidadesProjetoPI bd = new EntidadesProjetoPI();
            var ongs = bd.Usuarios.OfType<Ongs>();
            var tot = ongs.Count(ong => ong.razaoSocial == razaoSocial);
            if (tot != 0)
            {
                throw new Exception("Razão social ja existe");
            }
            tot = ongs.Count(ong => ong.cnpj == cnpj);
            if (tot != 0)
            {
                throw new Exception("CNPJ já cadastrado");
            }
            telefone = telefone.TiraMascara();
            tot = ongs.Count(o => o.telefone == telefone);
            if (tot != 0)
            {
                throw new Exception("Este telefone ja esta em uso");
            }
            if (!telefone.Telefone())
            {
                throw new Exception("Informe um telefone valido");
            }

            bd.setOngs(nome, email, senha, razaoSocial, cnpj, telefone, representante, cargo, cep, numero, bairro, rua, cidade, estado);

        }

        /// <summary>
        /// Verifica se os parametros passados são consistentes de acordo com as regras do sistema e chama insere via stored procedure no banco de dados 
        /// </summary>
        /// 
        public static void ValidaParametrosSetDoadores(string nome, string email, string senha, string cpf, string cep, string numero, string bairro, string rua, string cidade, string estado)
        {
            try
            {
                ValidaParametrosUsuario(nome = nome.TiraEspacoExcedente().RemoveNaoLetras(), email, senha = senha.TiraEspacoExcedente());
                ValidaParametrosEndereco(cep = cep.TiraMascara(), numero, bairro = bairro.RemoveNaoLetras().TiraEspacoExcedente(), rua = rua.RemoveNaoLetras().TiraEspacoExcedente(), cidade = cidade.RemoveNaoLetras().TiraEspacoExcedente(), estado = estado.RemoveNaoLetras().TiraEspacoExcedente());
            }
            catch (Exception e)
            {
                throw e;
            }
            if (!(cpf = cpf.TiraMascara()).ValidaCPF())
            {
                throw new Exception("Informe um cpf valido");
            }
            EntidadesProjetoPI banco = new EntidadesProjetoPI();
            var tot = banco.Usuarios.OfType<Doadores>().Count(d => d.cpf == cpf);
            if (tot != 0)
            {
                throw new Exception("CPF ja cadastrado");
            }
            banco.setDoadores(nome, email, senha, cpf, cep, numero, bairro, rua, cidade, estado);
        }
        /// <summary>
        /// valida os parametros passados que são da entidade Usuarios
        /// </summary>
        /// <exception cref="System.Exception">Se algum parametro não for valido</exception>
        private static void ValidaParametrosUsuario(string nome, string email, string senha)
        {
            if (nome.Length == 0)
            {
                throw new Exception("Digite um nome valido");
            }
            if (!email.Email())
            {
                throw new Exception("Digite um email valido");
            }
            if (senha.Length == 0)
            {
                throw new Exception("Digite uma senha valida");
            }
            EntidadesProjetoPI bd = new EntidadesProjetoPI();
            var query = bd.Usuarios.Count(u => u.email == email);
            if (query != 0)
            {
                throw new Exception("O email ja esta em uso");
            }
        }
        /// <summary>
        /// Valida os parametros passados da entidade Enderecos
        /// </summary>
        /// <exception cref="System.Exception">Se algum parametro não for valido</exception>
        private static void ValidaParametrosEndereco(string cep, string numero, string bairro, string rua, string cidade, string estado)
        {
            if (!cep.CEP())
            {
                throw new Exception("Informe um cep valido");
            }
            if (!Regex.IsMatch(numero, "\\d+"))
            {
                throw new Exception("informe um numero valido");
            }
            if (bairro.Length == 0)
            {
                throw new Exception("Informe um bairro valido");
            }
            if (rua.Length == 0)
            {
                throw new Exception("informe uma rua valida");
            }
            if (cidade.Length == 0)
            {
                throw new Exception("informe uma cidade valida");
            }
            if (estado.Length == 0)
            {
                throw new Exception("informe um estado valido");
            }
            EntidadesProjetoPI banco = new EntidadesProjetoPI();
            var tot = banco.Enderecos.Count(e => e.cep == cep && e.bairro == bairro && e.cidade == cidade && e.estado == estado && e.numero == numero && e.rua == rua);
            if (tot != 0)
            {
                throw new Exception("Ja existe um cadastro neste endereco");
            }
        }
    }
}