//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Projeto_PI.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Apoios
    {
        public int idProjeto { get; set; }
        public int idDoador { get; set; }
        public decimal valor { get; set; }
    
        public virtual Doadores Doadores { get; set; }
        public virtual Projetos Projetos { get; set; }
    }
}