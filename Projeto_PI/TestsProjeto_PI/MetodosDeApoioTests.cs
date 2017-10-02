using System;
using Projeto_PI.Apoio;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace TestsProjeto_PI
{
    [TestClass]
    public static class MetodosDeApoioTests
    {
        [TestMethod]
        public static void TiraEspacoExcedenteTest()
        {
            string x = "rafael             santos";
            Console.WriteLine(x.tiraEspacoExcedente());
        }
        [TestMethod]
        public static void TiraMascaraTest()
        {
            string x = "43.222.222/2222-22";
            Console.WriteLine(x.TiraMascara());
        } 
    }
}
