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
    
    public partial class Voluntarios
    {
        public int idOng { get; set; }
        public int idDoador { get; set; }
        public string Situacao { get; set; }
    
        public virtual Doadores Doadores { get; set; }
        public virtual Ongs Ongs { get; set; }
    }
}