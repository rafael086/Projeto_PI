using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Projeto_PI.Models;
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
        public static void VerificaParametrosSetOngs(string nome, string email, string senha, string razaoSocial, string cnpj, string telefone, string representante, string cargo, string cep, string numero, string bairro, string rua, string cidade, string estado)
        {
            ValidaParametrosUsuario(nome, email, senha);
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
                throw new Exception("informe um no de representante valido");
            }
            if ((cargo = cargo.TiraEspacoExcedente().RemoveNaoLetras()).Length == 0)
            {
                throw new Exception("informe um no de representante valido");
            }
            //CONTRUIR VALIDACAO PARA TELEFONE,CEP,NUMERO,BAIRRO,TELEFONE,CIDADE E ESTADO
            EntidadesProjetoPI bd = new EntidadesProjetoPI();
            var query = bd.Ongs.Count(ong => ong.razaoSocial == razaoSocial);
            if (query != 0)
            {
                throw new Exception("Razão social ja existe");
            }
            query = bd.Ongs.Count(ong => ong.cnpj == cnpj);
            if (query != 0)
            {
                throw new Exception("CNPJ já cadastrado");
            }
            //CONTRUIR VALIDACAO PARA TELEFONE,CEP,NUMERO,BAIRRO,TELEFONE,CIDADE E ESTADO
            EntidadesProjetoPI banco = new EntidadesProjetoPI();
            banco.setOngs(nome, email, senha, razaoSocial, cnpj, telefone, representante, cargo, cep, numero, bairro, rua, cidade, estado);

        }
        /// <summary>
        /// valida os parametros passados que são da entidade Usuarios
        /// </summary>
        private static void ValidaParametrosUsuario(string nome, string email, string senha)
        {
            if ((nome = nome.TiraEspacoExcedente().RemoveNaoLetras()).Length == 0)
            {
                throw new Exception("Digite um nome valido");
            }
            if (!email.Email())
            {
                throw new Exception("Digite um email valido");
            }
            if (senha.TiraEspacoExcedente().Length == 0)
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
        /// Fazer
        /// </summary>
        private static void ValidaParametrosEndereco()
        {

        }
    }
}