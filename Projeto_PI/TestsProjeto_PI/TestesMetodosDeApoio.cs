using System;
using Projeto_PI.Apoio;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace TestsProjeto_PI
{
    [TestClass]
    public class TestesMetodosDeApoio
    {
        [TestMethod]
        public void TiraEspacoExcedenteTest()
        {
            string atual = "rafael             santos";
            string esperado = "rafael santos";
            atual = atual.tiraEspacoExcedente();
            Assert.AreEqual(esperado, atual,"Espaco não removido");
        }
        [TestMethod]
        public void TiraMascaraTest()
        {
            string atual = "43.222.222/2222-22";
            string esperado = "43222222222222";
            atual = atual.TiraMascara();
            Assert.AreEqual(esperado, atual, "Mascara não removida");
        }

        [TestMethod]
        public void ValidaCNPJTest()
        {
            string cnpj = "42108335000178";
            Assert.IsTrue(cnpj.validaCNPJ());
        }
        [TestMethod]
        public void ValidaCPFTest()
        {
            string cpf = "48437020808";
            Assert.IsTrue(cpf.ValidaCPF());
        }
    }
}
