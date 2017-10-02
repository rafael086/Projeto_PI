using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

namespace Projeto_PI.Apoio
{
    /// <summary>
    /// Classe criada para criacao de metodos de extensão
    /// </summary>
    public static class MetodosDeApoio
    {
        /// <summary>
        /// Retira a mascara dos valores que vem da mascara dos formularios
        /// </summary>
        /// <param name="input">string que vai ter a mascara retirada</param>
        /// <returns>string sem a mascara</returns>
        public static string TiraMascara(this string input)
        {
            return Regex.Replace(input, "[^a-zA-z0-9]","");
        }
    }
}