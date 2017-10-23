using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Projeto_PI.Models
{
    public partial class Projetos
    {
        /// <summary>
        /// Calcula o progresso de conclusão do projeto
        /// </summary>
        /// <returns>Porcentagem da conclusão do projeto</returns>
        /// <exception cref="InvalidOperationException">Se o tipo de projeto não for doação</exception>
        public int ProgressoProjeto()
        {
            try
            {
                return Convert.ToInt32(arrecadado / Convert.ToDecimal(meta) * 100);
            }
            catch (FormatException)
            {
                throw new InvalidOperationException("O projeto não é do tipo doação");
            }
        }
        /// <summary>
        /// Escreve a porcentagem do projeto ëm % num limite de 0 a 100, em formato de CSS inline, para que a barra de progresso seja apresentada de forma correta para o usuario 
        /// </summary>
        /// <returns>a largura da barra Ex.(style="width:45%")</returns>
        public string EscreveProgresso()
        {
            int pctg = ProgressoProjeto();
            if (pctg > 100)
                pctg = 100;
            return string.Format("style=\"width:{0}%\"", pctg);
        }
    }
}