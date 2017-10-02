using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

namespace Projeto_PI.Apoio
{
    public static class MetodosDeApoio
    {
        public static string TiraMascara(this string input)
        {
            return Regex.Replace(input, "[^a-zA-z0-9]","");
        }
    }
}