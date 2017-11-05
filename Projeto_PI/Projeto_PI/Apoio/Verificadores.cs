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
        private static bool edicao;
        /// <summary>
        /// Verifica se os parametros passados são consistentes de acordo com as regras do sistema
        /// </summary>
        /// <exception cref="System.Exception">Se algum parametro for invalido</exception>
        public static void VerificaParametrosOngs(ref string nome, ref string email, ref string senha, ref string razaoSocial, ref string cnpj, ref string telefone, ref string representante, ref string cargo, ref string cep, ref string numero, ref string bairro, ref string rua, ref string cidade, ref string estado, bool edicao)
        {
            try
            {
                Verificadores.edicao = edicao;
                ValidaParametrosUsuario(nome = nome.TiraEspacoExcedente().RemoveNaoLetras(), email, senha = senha.TiraEspacoExcedente());
                ValidaParametrosEndereco(cep = cep.TiraMascara(), numero, bairro = bairro.RemoveNaoLetras().TiraEspacoExcedente(), rua = rua.RemoveNaoLetras().TiraEspacoExcedente(), cidade = cidade.RemoveNaoLetras().TiraEspacoExcedente(), estado = estado.RemoveNaoLetras().TiraEspacoExcedente(),true);
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
            string cRazaoSocial = razaoSocial;
            var tot = ongs.Count(ong => ong.razaoSocial == cRazaoSocial);
            if (tot != 0 && !edicao)
            {
                throw new Exception("Razão social ja existe");
            }
            string cCnpj = cnpj;
            tot = ongs.Count(ong => ong.cnpj == cCnpj);
            if (tot != 0 && !edicao)
            {
                throw new Exception("CNPJ já cadastrado");
            }
            telefone = telefone.TiraMascara();
            string cTelefone = telefone;
            tot = ongs.Count(o => o.telefone == cTelefone);
            if (!telefone.Telefone())
            {
                throw new Exception("Informe um telefone valido");
            }
            if (tot != 0 && !edicao)
            {
                throw new Exception("Este telefone ja esta em uso");
            }
        }

        /// <summary>
        /// Verifica se os parametros passados são consistentes de acordo com as regras do sistema 
        /// </summary>
        public static void ValidaParametrosDoadores(ref string nome, ref string email, ref string senha, ref string cpf, ref string cep, ref string numero, ref string bairro, ref string rua, ref string cidade, ref string estado, bool edicao)
        {
            try
            {
                Verificadores.edicao = edicao;
                ValidaParametrosUsuario(nome = nome.TiraEspacoExcedente().RemoveNaoLetras(), email, senha = senha.TiraEspacoExcedente());
                ValidaParametrosEndereco(cep = cep.TiraMascara(), numero, bairro = bairro.RemoveNaoLetras().TiraEspacoExcedente(), rua = rua.RemoveNaoLetras().TiraEspacoExcedente(), cidade = cidade.RemoveNaoLetras().TiraEspacoExcedente(), estado = estado.RemoveNaoLetras().TiraEspacoExcedente(), false);
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
            string cCpf = cpf;
            var tot = banco.Usuarios.OfType<Doadores>().Count(d => d.cpf == cCpf);
            if (tot != 0 && !edicao)
            {
                throw new Exception("CPF ja cadastrado");
            }
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
            if (query != 0 && !edicao)
            {
                throw new Exception("O email ja esta em uso");
            }
        }
        /// <summary>
        /// Valida os parametros passados da entidade Enderecos
        /// </summary>
        /// <exception cref="System.Exception">Se algum parametro não for valido</exception>
        private static void ValidaParametrosEndereco(string cep, string numero, string bairro, string rua, string cidade, string estado, bool ong)
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
            var ends = banco.Enderecos.Where(e => e.cep == cep && e.bairro == bairro && e.cidade == cidade && e.estado == estado && e.numero == numero && e.rua == rua).SingleOrDefault();
            if ((ends != null && ong && !edicao) || (ends != null && ends.Usuarios.OfType<Ongs>().Count() > 0 && !edicao))
            {
                throw new Exception("Ja existe um cadastro neste endereco");
            }
        }
    }
}