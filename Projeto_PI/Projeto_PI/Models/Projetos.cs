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
    
    public partial class Projetos
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Projetos()
        {
            this.finalizado = false;
            this.Apoios = new HashSet<Apoios>();
            this.Comentarios = new HashSet<Comentarios>();
        }
    
        public int id { get; set; }
        public string nome { get; set; }
        public string descricao { get; set; }
        public int banner { get; set; }
        public string meta { get; set; }
        public int idUsuario { get; set; }
        public string tipo { get; set; }
        public decimal arrecadado { get; set; }
        public bool finalizado { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Apoios> Apoios { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Comentarios> Comentarios { get; set; }
        public virtual Imagens Imagens { get; set; }
        public virtual Usuarios Usuarios { get; set; }
    }
}
